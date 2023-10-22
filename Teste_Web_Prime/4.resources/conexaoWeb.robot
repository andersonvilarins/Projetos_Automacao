*** Settings ***
Library    SeleniumLibrary

*** Keywords ***

### Iniciando a conexão com o Site https://opensource-demo.orangehrmlive.com/

Iniciar conexão com o Site
    Log    Iniciando conexão...    
    Log To Console   Iniciando a conexão...

    Create Webdriver    Chrome
    Go To    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

    Maximize Browser Window


Finalizar Conexão
    Log To Console    ....Finalizando aplicação
    Capture Page Screenshot       closed.png         
    Close Browser
