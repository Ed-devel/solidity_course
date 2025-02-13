// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Vídeo 31 - Solidity Structs | Como usar e criar Solidity Structs

/* Struct é um conceito  muito importante em  contratos  inteligentes
pois permitirá criar dados relacionados . É possível criar uma Struct
em um arquivo separado e depois importá-lo em um contrato inteligente.
*/

contract Todos{
    struct Todo{
        string texto;
        bool concluido;
    }

    /* Quando  uma  estrutura é definida ,  é necessário defivir  uma Array
    pois todos os dados que forem criados nessa estrutura serão armazenados
    nessa Array.  */
    Todo[] public todos;

    function create(string calldata _texto)public  {
        // Existem 3 maneiras para inicializar uma struct
        // - chamando-a como uma função através do método push()
        todos.push(Todo(_texto, false));

        // mapeamento de valor-chave
        // todos.push(Todo({texto:_texto, concluido: false}));

        // // inicializar uma struct vazia e então atualizá-la
        // Todo memory todo;
        // todo.texto = _texto; // todo.concluido inicializado como falso

        // todos.push(todo);

        /*OBSERVAÇÃO:  haverá um erro caso esses três métodos fiquem
        implementados nessa mesma função. O exemplo acima foi apenas
        para fins de aprendizado . Sendo assim é necessário comentar
        dois desses métodos e deixar apenas um no escopo da função*/
    }

    // O Solidity cria automaticamente um getter para 'todos', então
    // você não precisa realmente se preocupar em criar essa função.
    function get(uint _index)public view returns(string memory texto, bool concluido) {
        Todo storage todo = todos[_index];
        return (todo.texto, todo.concluido);
    }

    //update texto
    function updateTexto(uint _indice, string calldata _texto )public  {
        Todo storage todo = todos[_indice];
        todo.texto = _texto;
    }

    // update concluido
    function alternarParaConcluido(uint _indice, bool _concluido )public  {
        Todo storage todo = todos[_indice];
        todo.concluido = _concluido;
    }
}
