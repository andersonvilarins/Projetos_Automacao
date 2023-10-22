*** Settings ***

Resource    ../4.resources/conexaoWeb.robot
Resource    ../2.steps/abrirSite._steps.robot

Test Setup    Iniciar conexão com o Site
Test Teardown    Finalizar Conexão


*** Test Cases ***
Caso de teste 1 - Realizar a alteração de informações do cadastro
    Dado que o usuário esteja no site "Open Source Demo"
    E clicar em “My Info”
    E Realizar o preenchimento do campos com dados aleatórios 
    E Realizar a add de um anexo 
    Quando clicar em “Save” de cada etapa 
    Então o sistema deve apresentar a mensagem “Success – Successfully save"