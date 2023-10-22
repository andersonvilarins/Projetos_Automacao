*** Settings ***

Library    SeleniumLibrary
Resource    ../3.metodos/metodo_abrirSite.robot
*** Keywords ***

################## MENU ##################
######     1. Validação de tela     ######
######     2. Cenario de testes     ######
##########################################

################################################## 1. Validação de tela  ##################################################
Validação de tela do site Open Source Demo
    Log To Console    
    ...    Iniciando Validação de tela do site Open Source Demo
    Wait Until Page Contains    Login                              30
    Wait Until Page Contains    Username                           30
    Wait Until Page Contains    Password                           30
    Capture Page Screenshot     telaInicial.png
    Log To Console              Validação concluída!

Validação de tela do Dashboard do site Open Source Demo
    Log To Console    
    ...    Iniciando Validação de tela do Dashboard do site Open Source Demo
    Wait Until Page Contains    Admin                             30
    Wait Until Page Contains    Leave                             30
    Wait Until Page Contains    My Info                           30
    Capture Page Screenshot     darsboard.png
    Log To Console              Validação concluída!

Validação de tela do formulário Personal Details
    Log To Console    
    ...    Iniciando Validação de tela do formulário Personal Details
    Wait Until Page Contains    Personal Details                      30
    Wait Until Page Contains    Employee Full Name                    30
    Capture Page Screenshot     PersonalDetails.png
    Log To Console              Validação concluída!

################################################## 2. Cenários de Testes  ##################################################

###Caso de teste 1 - Realizar a alteração de informações do cadastro
Dado que o usuário esteja no site "Open Source Demo"
    Validação de tela do site Open Source Demo
    Informo um usuário e senha válidos 
    E clico no botão Login
E clicar em “My Info”
    Validação de tela do Dashboard do site Open Source Demo
    E clico no menu "My Info"    
E Realizar o preenchimento do campos com dados aleatórios
    Validação de tela do formulário Personal Details
    Inserir primeiro nome
    Inserir nome do meio
    Inserir último nome
    Inserir apelido
    Inserir código do empregado
    Inserir número da carteira de habilitação
    Inserir data de vailidade da habilitação
    Inserir número do Ssn
    Inserir número do Sin
    Inserir nacionalidade
    Inserir estado civil
    Inserir data de nascimento
    Selecionar check do gênero
    Inserir número da reservista
    Selecionar check de fumante
    Selecionar a opção do tipo sanguíneo
    
    
E Realizar a add de um anexo
    Inserir anexo
Quando clicar em “Save” de cada etapa
    Clicar na opção salvar  
    Clicar na opção salvar(2)  
Então o sistema deve apresentar a mensagem “Success – Successfully save"
    Confirmação da mensagem “Success – Successfully save"