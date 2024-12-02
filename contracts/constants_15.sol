// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Vídeo 15 - Constants no Solidity
contract Constants {

    /* Endereço da minha primeira conta.
    execution cost = 71666 gas | é o custo da execução que foi pago para
    implantar o contrato. */
    // address public myAdd = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    // Por convenção as constantes são definidas com letras maiúsculas.
    // execution cost - 47099
    address public constant MY_ADD = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    /* Quando se usa uma 'construction' onde o valor é constante, isso não
    vai mudar no contexto do contrato, esse é o endereço definido no contrato.
    As fontes recebidas nesse endereço não serão alteradas. */


    /* Ao analizar o log da execução, podemos observar o parâmetro execution const:
    Execução do contrato COM constante:
    execution cost 59911 gas 
    execution cost   386 gas
    Execução do contrato SEM constante:
    execution cost gas  90684 gas
    execution cost gas   2522 gas   */
    function getConstant()public view returns(address) {
        //return myAdd;
        return MY_ADD;
    }

    /* No exemplo acima podemos notar que com o uso de constante na
    variável de estados gastamos MENOS gas comparando-se com variáveis
    de estado que NÃO são contantes. Então sempre que for usar variáveis
    em que seu conteúdo não irá mudar, é interessante usar contante
    para economizar tokens. */
}