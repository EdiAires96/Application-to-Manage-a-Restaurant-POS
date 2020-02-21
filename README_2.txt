MANUAL DE INSTRUÇÕES DO UTILIZADOR

1. Introdução

Esta aplicação tem como objectivo representar o funcionamento de um restaurante, e divide-se
em 4 pequenas aplicações: MESA, BAR, COZINHA e POS.


2. Aplicações

2.1 MESA
É apresentado um menu com 5 opções: Abrir Mesa, Inserir Pedidos,Pedir Conta, Fechar Mesa, Marcar Mesa.

Abrir Mesa:
Nesta  opção, aparece uma listagem das mesas disponiveis os seus lugares na sua respectiva área funcional.
De seguida é pedido ao utilizador para introduzir o qual o número de mesa a introduzia e a sua área.

Inserir Pedidos:
Ao executar esta opção irá aparecer um sub-menu com 2 opções:Listar Produtos, Inserir Pedido
Listar Produtos:
Listagem de todos os produtos existentes na base de dados.
Inserir Pedido:
É pedido ao utilizador que introduza o id do colaborador.
Listagem das mesas abertas e é pedido para inserir a mesa e respectiva área.
É feita uma pergunta ao utilizador se deseja que o pedido seja servido em separado(SS) ou em Conjunto (SC).
Introdução dos vários produtos e respectiva quantidade e observação para o pedido.
Para concluir o pedido, é preciso introduzir 0.

Pedir Conta:
Listagem das devidas mesas com pedidos por pagar.
É pedido ao utilizador para introduzir a mesa e área.
É gerado um "talão"com as informações e o preço a pagar.

Fechar Conta:
Listagem das mesas por fechar.
Escolha da mesa e respectiva area.
Caso os pedidos da mesa estiverem pagos a mesa é marcada como fechada, caso contrario, 
surge um aviso a informar que a mesa não pode ser fechada sem que os pedidos sejam todos pagos.

Marcar Mesa:
Escolha da mesa e da respectiva área.
Mesa selecionada como pronta para que possa ser usada para outros clientes.



2.2 BAR
É apresentado ao utilizador uma listagem consecutiva (feita pedido a pedido) dos produtos referentes ao bar.
Cada pedido apresenta o seu número, o número do produto associado ao pedido o seu nome e quantidade, a mesa, area e colaborador referente ao pedido.
Para cada pedido é apresentado uma pergunta ao utilizador se o pedido está pronto ou não(valores de resposta 1 ou 0).
Qualquer outro número introduzido será um número invalido.
OBS: Se um pedido apresentar mais do que um produto, a apresentação deste será listada individualmente.

2.3 COZINHA
Esta aplicação é semalhante ao Bar.
É apresentado uma listagem feita pedido a pedido dos produtos(Pratos) referentes à Cozinha.
Para cada pedido é apresentado uma pergunta ao utilizador se o pedido está pronto ou não(valores de resposta 1 ou 0).
Qualquer outro número introduzido será um número invalido.

2.4 POS
É apresentado um menu ao utilizador que dispões de duas opções: Listar Pedidos e Fechar Conta.

Listar Pedidos:
Aparece uma listagem de todos os pedidos que estão por pagar.
Se o Cliente decidir que quer pagar algum pedido, então seleciona-se a segunda opção.

Fechar Conta:
Introdução dos pedidos que o cliente quer pagar.
OBS: Para concluir o pagamento e imprimir uma fatura como os dados dos pedidos,produtos e preço total da conta, insere-se 0 para imprimir a fatura.
