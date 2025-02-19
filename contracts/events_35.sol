// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/* Vídeo 35 - Solidity Eventos - Como Criar Eventos em Smart Contracts
   Solidity */

/* Eventos permitem o registro no blockchain Ethereum.
   Alguns casos de uso para eventos são:

   - Ouvir eventos e atualizar a interface do usuário
   - Uma forma barata de armazenamento */

/* Ao atualizar dados nas blockchains é possível armazenar dados nelas,
 assim o  custo é menor em comparação  com o uso de armazenamento real.
 Ao usar as variáveis de estados para armazenar dados, consequentemente
 custará  uma quantia muito maior , mas ao usar eventos, então  custará
 bem mais barato.  */

contract Event{

 /* Declaração de evento:
    - Até 3 parâmetros podem ser indexados.
    - Parâmetros indexados ajudam você a filtrar os logs pelo parâmetro
      indexado

    É possível  ter vários dados no evento , mas apenas  três indexações.
    Suponhamos que há dados na blockchain Ethereum e queremos indexar com
    base  no endereço, ou com base no  ID do token. Então são  permitidas
    três indexações.  */
    event Log(address indexed remetente, string mensagem);
    event OutroLog();

    function teste()public {
        emit Log(msg.sender, "Ola Mundo !"); //Endereço do Remetente, mensagem
        emit Log(msg.sender, "Ola EVM !");   //Endereço do Remetente, mensagem
        emit OutroLog();
    }
}

/* OUTPUT

logs	[
	{
		"from": "0xd74C37B729D34dB56Dd549b5E792f9F6509a0a18",
		"topic": "0x0738f4da267a110d810e6e89fc59e46be6de0c37b1d5cd559b267dc3688e74e0",
		"event": "Log",
		"args": {
			"0": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
			"1": "Ola Mundo !",
			"remetente": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
			"mensagem": "Ola Mundo !"
		}
	},
	{
		"from": "0xd74C37B729D34dB56Dd549b5E792f9F6509a0a18",
		"topic": "0x0738f4da267a110d810e6e89fc59e46be6de0c37b1d5cd559b267dc3688e74e0",
		"event": "Log",
		"args": {
			"0": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
			"1": "Ola EVM !",
			"remetente": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
			"mensagem": "Ola EVM !"
		}
	},
	{
		"from": "0xd74C37B729D34dB56Dd549b5E792f9F6509a0a18",
		"topic": "0x415131ace172c80566b4fc61bd80d5e42e89500da2d777cccea8a9e17bbc4f58",
		"event": "OutroLog",
		"args": {}
	}
]
*/