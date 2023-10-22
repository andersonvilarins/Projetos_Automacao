*** Settings ***
Documentation    Criação de DBD com os Seguintes Parametros: Cenário com criação de DBD com Status Certidão disponivel para posterior reprocessamento de certidão
Resource    ../Resources/Login_Resource.robot
Resource    ../Resources/Requests_API.robot

#Suite Teardown    Fechar navegador

*** Test Cases ***
Acessando conta ITCD - Conta gov
    Obter Valores json

#------------------------- Acesso usuario externos -----------------------------------

Tela 01 - Logar como usuario externo
    DADO que estou na tela de login do servidor
    E digito o usuário e a senha e clico em Entrar Perfil Gestor

Tela 02 - Consulta
    DADO que estou na tela inicial do ITCD versão usuario interno
    E acesso o menu lateral CONSULTA - CT25
    E realizo a pesquisa da DBD e seleciono o tipo de servico - CT28
    E clico na DBD para verificar detalhes do preenchimento

Tela 03 - Detalhes da DBD
    DADO que estou na tela dos detalhes da DBD
    E clico em Certidao e em seguida em Reprocessamento de certidao

Tela 04 - Reprocessamento de Certidao 
    E Verifico se estou na tela de Reprocessamento de certidao
    ENTAO informo a justificativa do reprocessamento
    E anexo o Documento para reprocessamentno da certidao
    E o sistema habilita o botão salvar


#Cancelando DBD via Endpoint
    #Buscar declaracao pelo CPF
    #Cancelar DBD