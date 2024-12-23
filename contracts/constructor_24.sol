// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Vídeo 24 - Construtor Solidity | Como usar Função Contrutor Solidity.

// Base contract X
contract X {

    string public name;

    constructor(string memory _name) {
        name = _name;
    }    
}

// Base contract Y
contract Y {

    string public text;

    constructor(string memory _text) {
        text = _text;
    }    
}
 
// Existem 2 maneiras de inicializar o contrato pai com parâmetros.

// A ordem é muito importante quando se herda um contrato.
// Passe os parâmetros aqui na lista de herança.
contract B is X("Entre com valor para X"), Y("Entre com valor para Y") {
    
}

contract C is X, Y{
    // Passe os parâmetros aqui no construtor,
    // semelhante aos modificadores de função.
    constructor(string memory _name, string memory _text) X(_name) Y(_text) {        
    }
}

// Os construtores pais são sempre chamados na ordem de herança,
// independentemente da ordem dos contratos pais listados no construtor
// do contrato filho.

// Ordem dos construtores chamados:
// 1. X
// 2. Y
// 3. D
contract D is X, Y {

    constructor() X("X foi chamado") Y("Y foi chamado"){        
    }    
}

// Ordem dos contrutores chamados:
// 1. X
// 2. Y
// 3. E
contract E is X, Y {

    constructor() Y("Y foi chamado") X("X foi chamado"){        
    }    
}