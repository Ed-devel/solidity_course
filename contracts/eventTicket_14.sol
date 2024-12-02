// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Vídeo 14 - Event Tickets Smart Contract in Solidity 

/* O objetivo desse código é gerar um ticket(ingresso) para quem quiser
participar de um evendo */
contract EventTicket {

    /* As variáveis de estado não podem ser visualizadas nos testes Deploy
    porque NÃO estão declaradas como 'public'. Porém elas podem ser acessadas
    pelas funções que NÃO estejam declaradas como 'pure'. */
    uint256 numberOfTicket;    
    uint256 ticketPrice;
    uint256 totalAmount;
    uint256 startAt;
    uint256 endAt;
    uint256 timesRange; // Intervalo de tempo
    string  message = "Compre seu primeiro ingresso para o evento";

    /* Ao iniciar o contrato deve-se informar o preço do ticket para preencher
    o valor da variável 'ticketPrice'. As variáveis 'startAt' e 'endAt' serão
    atualizadas e a variável 'timesRange' será atualizada com o o cálculo do
    intervalos de tempo e depois convertido em segundos. */
    constructor(uint256 _ticketprice) {
        ticketPrice = _ticketprice;
        startAt = block.timestamp;
        endAt = block.timestamp + 7 days;
        timesRange = (endAt - startAt) / 60 / 60 / 24;        
    }
    
    /* Função recebe o valor do preço do ticket e retorna o número de
    identificação do ticket. A variável 'numberOfTicket' terá seu valor
    incrementado sempre que essa função for chamada. Cada bilhete terá
    um ID único. O montante total também será atualizando com incremento
    do volar atual da variável 'totalAmount' como o valor do ticket
    informado no contrutor. */
    function byTicket(uint256 _value )public returns(uint256 ticketId) {
        numberOfTicket++;
        totalAmount+= _value;
        ticketId = numberOfTicket;
        return (ticketId);
    }

    /* Função mostra o montante total, já que a variável que guarda esses
    valores não pode ser vista nos testes Deploy pois NÃO está declarada
    como public. */
    function getAmount() public view returns(uint256){
        return totalAmount;
    }
}