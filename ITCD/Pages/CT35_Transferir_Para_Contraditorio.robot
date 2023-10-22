*** Settings ***
Documentation    Criação de DBD e Enviar para o contraditório
Resource    ../Resources/Login_Resource.robot
Resource    ../Resources/Requests_API.robot

Suite Teardown    Fechar navegador

*** Test Cases ***
Acessando conta ITCD - Conta gov
    Obter Valores json
    Dado que acesso o sistema pelo ambiente TST
    Verifico se estou na pagina de login
    Digito o cpf e senha
    E clico na logo da SEF para acessar o perfil usuario externo
    Verificar se estou na pagina principal do ITCD

Tela inicial - Criação de DBD
    Dado que estou na pagina inicial do ITCD
    Então clico em "CRIAR NOVA DBD"
    E verifico se estou na pagina para escolha do tipo de transmissão
    E na tela seguinte clico em "CAUSA MORTIS"

Tela 03 - Dados Basicos
    Dado que estou na tela de Dados Basicos
    ENTÂO digito o CPF do falecido
    E Verifico se o sistema vai trazer o nome dele
    E verifico se habilitou o campo da data do obito
    E digito a data do obito    
    E verifico se apresentou a opção de escolha de testamento
    E verifico se apresentou a opção de uniao estavel
    E verifico se apresentou o campo de selecao e campo de anexo da uniao estavel - CT03
    E seleciono o tipo de regime de bens
    E seleciono o tipo de uniao estavel nao formalizada
    E seleciono o tipo de Inventario
    E seleciono o local da comarca ou forum do inventario
    E seleciono o estado aonde esta sendo realizado o inventario
    E seleciono a cidade aonde esta sendo realizado o inventario - RIO CASCA
    E clico em avançar na tela de Dados Basicos

Tela 04 - Dados do Responsavel
    Dado que estou na tela de Dados do Responsavel
    ENTAO verifico se a situacao da DBD e: "AGUARDANDO O PREENCHIMENTO DA DBD"
    ENTÃO verifico se os dados do responsavel vieram preenchidos
    E digito o email do responsavel
    E o sistema pergunta se o responsavel pela declaracao e o inventariante NÂO
    E informo os dados do cpf do responsavel pela declaracao
    E o sistema habilita o botão avançar
    Pegando o numero do protocolo DBD para cancelamento posterior

Tela 05 - Beneficiario e Meeiro
    Dado que estou na tela de beneficiario e Meeiro
    E clico no botao adicionar para incluir um beneficiario conjuge
    E preecho o cpf do beneficiario conjuge
    E clico no botao adicionar para incluir um beneficiario filho
    E preencho o cpf do beneficiario filho
    ENTAO selecionamos se o beneficiario renuncia sua parte NAO
    E aciono o proximo menu lateral
    #------------------Bug ainda em ajuste, aguardando resolução para excluir linha anterior-----------------------
    #E o sistema habilita o botão avançar

Tela 06 - Bens Direitos e Dividas
    Dado que estou na tela de Bens Direitos e Dividas   
    E clico no botao para adicionar o bem 
    E clico em imovel urbano no Brasil
    E verifico se estou na tela de inclusao do imovel urbano no Brasil
    E preencho os campos para inclusao do imovel
    E o sistema habilita o botão salvar
    E clico em salvar para salvar todos os bens

Tela 07 - Partilha    
    Dado que estou na tela de Partilha
    E o sistema habilita o botão avançar

Tela 08 - Documentos anexos
    Dado que estou na tela de documentos anexos  
    E o sistema solicita a inclusão do documento do responsavel  
    E o sistema habilita o botão avançar
    
Tela 09 - Envio
    Dado que estou na tela de Envio
    ENTAO verifico se o sistema gerou o documento para envio da DBD
    E clico em Enviar DBD
    ENTAO vamos marcar o aceite e clicar em sim na tela de confirmacao

Tela 10 - Documento de arrecadacao estadual
    DADO que estou na tela da DAE
    #E verifico se a situacao e EM ANALISE
    E verifico se a situacao e AGUARDANDO PAGAMENTO DE DAE
    #ENTAO o sistema permite clicar no botao VISUALIZAR DAE    

#------------------------- Acesso usuario externos -----------------------------------


Tela 01 - Logar como usuario externo
    DADO que estou na tela de login do servidor
    E digito o usuário e a senha e clico em Entrar Perfil Analista - Rio Casca

Tela 02 - Meus processos    
    DADO que estou na tela inicial do ITCD versão usuario interno
    E acesso o menu lateral CONSULTA - CT25
    E realizo a pesquisa da DBD e seleciono o tipo de servico
    E seleciono a DBD para obter maiores informações

Tela 03 - Detalhes da DBD
    DADO que estou na tela dos detalhes da DBD
    E clico em Transferir para o contraditório

Tela 04 - Transferencia para o Contraditorio   
    E Verifico se esta na tela de Transferencia de contraditorio
    E seleciono o bem que desejo solicitar a ANALISE
    ENTÂO clico em Solicitar avaliação contraditoria
    ENTÂO clico em Avançar para confirmar a operação


Cancelando DBD via Endpoint
    #Buscar declaracao pelo CPF
    Cancelar DBD