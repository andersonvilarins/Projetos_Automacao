*** Settings ***
Library     selenium
Library     RPA.Browser.Selenium
Library     DateTime
Library     OperatingSystem
Library     pyautogui
# Library    Browser
Library     String
Resource    LerDadosJson.robot


*** Variables ***
${BOTAO_CRIAR_NOVA_DBD}                     //span[@class='mat-button-wrapper'][contains(.,'CRIAR NOVA DBD')]
${BOTAO_ATIVAR_MODO_DARK}                   //mat-icon[@role='img'][contains(.,'light_mode')]
${CHECK_TELA_ESCOLHA_TRANSMISSAO}           //h4[contains(.,'Escolha o tipo de transmissão.')]
${BOTAO_CAUSA_MORTIS}                       //span[@class='mat-button-wrapper'][contains(.,'Causa Mortis')]
${CHECK_TELA_DADOS_BASICOS}                 //div[@class='header-title'][contains(.,'Dados Básicos')]
${BOTAO_ADICIONA_BENEFICIARIO_MEEIRO}       //mat-icon[contains(@class, 'mat-icon notranslate material-icons mat-ligature-font mat-icon-no-color ng-star-inserted')]
${BOTAO_INCLUIR_BENEFICIARIO_MEEIRO}        //span[contains(.,'INCLUIR BENEFICIÁRIO')]
${INPUT_CPF_BENEFICIARIO_MEEIRO}            //input[contains(@placeholder,'000.000.000-00')]
${CAMPO_NOME_BENEFICIARIO_MEEIRO}           //*[@formcontrolname="nome"]
${BOTAO_ADICIONAR_BEM}                      //button[contains(@class,'add-btn-bem-direito-divida ng-star-inserted')]
${BOTAO_SALVAR_BEM}                         //span[@class='mat-button-wrapper'][contains(.,'SALVAR')]
${ANEXO_EXTRATO_ACOES}                      ${EXECDIR}\\doc\\Extrato.pdf
${ANEXO_CRV_VEICULO}                        ${EXECDIR}\\doc\\Carro.pdf
${ICONE_SELECAO_DATA_CALENDARIO}            //button[contains(@aria-haspopup,'dialog')]
${SELECAO_DIA_PRIMEIRO_CALENDARIO}          (//div[contains(text(),'1')])[1]
${BOTAO_AVANCAR}                            //button[@color='primary']
${BOTAO_FINALIZAR_EDICAO}                   //span[contains(text(), 'FINALIZAR EDIÇÃO')]
${BOTAO_ALTERAR_PARTILHA}                   (//span[@class='mat-button-wrapper'][contains(.,'ALTERAR PARTILHA')])[1]


*** Keywords ***
Obter Valores json
######### -------- Definindo a variavel para obter informações da massa -------- ###########

    Set Suite Variable    ${NOMEMASSADEDADOS}    massaCasoITCD01

######### ---- Pegando Valores do Arquivo JSON --------- ###########

    ${URL_TST}    Ler dado JSON    url_tst
    Set Global Variable    ${URL_TST}
    ${USUARIO_CPF}    Ler dado JSON    usuario_cpf
    Set Global Variable    ${USUARIO_CPF}
    ${SENHA}    Ler dado JSON    senha
    Set Global Variable    ${SENHA}
    ${CPF_FALECIDO}    Ler dado JSON    cpf_falecido
    Set Global Variable    ${CPF_FALECIDO}
    ${CPF_FALECIDO2}    Ler dado JSON    cpf_falecido2
    Set Global Variable    ${CPF_FALECIDO2}
    ${CPF_CONJUGE}    Ler dado JSON    cpf_conjuge
    Set Global Variable    ${CPF_CONJUGE}
    ${CPF_FILHO}    Ler dado JSON    cpf_filho
    Set Global Variable    ${CPF_FILHO}
    ${EMAIL_RESPONSAVEL}    Ler dado JSON    email_responsavel
    Set Global Variable    ${EMAIL_RESPONSAVEL}
    ${CPF_TESTAMENTARIO}    Ler dado JSON    cpf_testamentario
    Set Global Variable    ${CPF_TESTAMENTARIO}
    ${CPF_FILHO_2}    Ler dado JSON    cpf_filho_2
    Set Global Variable    ${CPF_FILHO_2}
    ${CPF_AVOS}    Ler dado JSON    cpf_avo
    Set Global Variable    ${CPF_AVOS}
    ${CPF_PAIS}    Ler dado JSON    cpf_pais
    Set Global Variable    ${CPF_PAIS}
    ${CPF_NETO}    Ler dado JSON    cpf_neto
    Set Global Variable    ${CPF_NETO}
    ${CPF_FILHOUNILATERAL}    Ler dado JSON    cpf_filhounilateral
    Set Global Variable    ${CPF_FILHOUNILATERAL}
    ${CPF_OUTRO}    Ler dado JSON    cpf_outro
    Set Global Variable    ${CPF_OUTRO}
    ${CNPJ_EMPRESA}    Ler dado JSON    cnpj_empresa
    Set Global Variable    ${CNPJ_EMPRESA}
    ${USUARIO_ANALISTA}    Ler dado JSON    usuario_analista
    Set Global Variable    ${USUARIO_ANALISTA}
    ${USUARIO_ANALISTA_ALMENARA}    Ler dado JSON    usuario_analista_almenara
    Set Global Variable    ${USUARIO_ANALISTA_ALMENARA}
    ${USUARIO_ANALISTA_RIOCASCA}    Ler dado JSON    usuario_analista_riocasca
    Set Global Variable    ${USUARIO_ANALISTA_RIOCASCA}
    ${USUARIO_ANALISTA_GESTOR}    Ler dado JSON    usuario_analista_gestor
    Set Global Variable    ${USUARIO_ANALISTA_GESTOR}

Tirando print para evidencias
    ${DATA_ATUAL}    Get Current Date    result_format=%Y.%m.%d_%H%M
    Set Suite Variable    ${DATA_ATUAL}
    Create Directory    ${EXECDIR}\\Evidencias\\${DATA_ATUAL}
    Set Screenshot Directory    ${EXECDIR}\\Evidencias\\${DATA_ATUAL}
    Capture Page Screenshot

Dado que acesso o sistema pelo ambiente TST
    RPA.Browser.Selenium.Open Browser    ${URL_TST}    firefox
    Maximize Browser Window

DADO que estou na tela de login do servidor
    builtin.Sleep    2s
    RPA.Browser.Selenium.Open Browser    ${URL_TST}    firefox
    Maximize Browser Window

Verifico se estou na pagina de login
    Wait Until Element Is Visible    //input[contains(@formcontrolname,'username')]
    builtin.Sleep    3s

Digito o cpf e senha
    Input Text    //input[contains(@formcontrolname,'username')]    ${USUARIO_CPF}
    Input Password    //input[contains(@formcontrolname,'password')]    ${SENHA}
    builtin.Sleep    2s
    Click Element    //button[@color='primary'][contains(.,'Entrar')]

E digito o usuário e a senha e clico em Entrar
    Input Text    //input[contains(@formcontrolname,'username')]    ${USUARIO_ANALISTA}
    Input Password    //input[contains(@formcontrolname,'password')]    ${SENHA}
    builtin.Sleep    2s
    Click Element    //button[@color='primary'][contains(.,'Entrar')]

E digito o usuário e a senha e clico em Entrar Perfil Gestor
    Input Text    //input[contains(@formcontrolname,'username')]    ${USUARIO_ANALISTA_GESTOR}
    Input Password    //input[contains(@formcontrolname,'password')]    ${SENHA}
    builtin.Sleep    2s
    Click Element    //button[@color='primary'][contains(.,'Entrar')]

E digito o usuário e a senha e clico em Entrar Perfil Analista - Rio Casca
    Input Text    //input[contains(@formcontrolname,'username')]    ${USUARIO_ANALISTA_RIOCASCA}
    Input Password    //input[contains(@formcontrolname,'password')]    ${SENHA}
    builtin.Sleep    2s
    Click Element    //button[@color='primary'][contains(.,'Entrar')]

E clico na logo da SEF para acessar o perfil usuario externo
    builtin.Sleep    2s
    Click Element When Visible    //img[@alt='avatar']
    # Click Element    //img[@src='../assets/img/LogoSEF-dark.svg']
    builtin.Sleep    2s

Dado que autorizo o o uso de dados pessoais
    Wait Until Element Is Visible    //*[@id="authorize-info"]/div[2]/button[2]
    builtin.Sleep    2s
    Click Element    //*[@id="authorize-info"]/div[2]/button[2]

Verificar se estou na pagina principal do ITCD
    builtin.Sleep    4s
    Wait Until Element Is Visible    //div[contains(@class, 'welcome d-none d-sm-block ng-star-inserted')]
    Tirando print para evidencias

### ------------------- TELA 02 - TELA INICIAL --------------------- ###

Dado que estou na pagina inicial do ITCD
    Wait Until Element Is Visible    ${BOTAO_CRIAR_NOVA_DBD}
    Wait Until Element Is Enabled    ${BOTAO_CRIAR_NOVA_DBD}
    builtin.Sleep    5s
    Click Element    ${BOTAO_ATIVAR_MODO_DARK}

Então clico em "CRIAR NOVA DBD"
    builtin.Sleep    3s
    Click Element    ${BOTAO_CRIAR_NOVA_DBD}

E verifico se estou na pagina para escolha do tipo de transmissão
    builtin.Sleep    2s
    Wait Until Element Is Visible    ${CHECK_TELA_ESCOLHA_TRANSMISSAO}

E na tela seguinte clico em "CAUSA MORTIS"
    Wait Until Element Is Enabled    ${BOTAO_CAUSA_MORTIS}
    builtin.Sleep    1s
    Click Element    ${BOTAO_CAUSA_MORTIS}

### ----------------- TELA 03 - DADOS BASICOS ---------------------- ###

Dado que estou na tela de Dados Basicos
    Wait Until Element Is Visible    ${CHECK_TELA_DADOS_BASICOS}
    builtin.Sleep    2s

ENTÂO digito o CPF do falecido
    Input Text    //input[contains(@placeholder,'000.000.000-00')]    ${CPF_FALECIDO2}
    builtin.Sleep    4s

ENTÂO digito o CPF do falecido 2
    Input Text    //input[contains(@placeholder,'000.000.000-00')]    ${CPF_FALECIDO}
    builtin.Sleep    4s

E Verifico se o sistema vai trazer o nome dele
    Wait Until Element Is Visible    //input[contains(@formcontrolname,'nome')]
    Click Element    //input[contains(@formcontrolname,'nome')]
    builtin.Sleep    2s

E verifico se habilitou o campo da data do obito
    builtin.Sleep    2s
    Wait Until Element Is Visible    ${ICONE_SELECAO_DATA_CALENDARIO}

E digito a data do obito
    builtin.Sleep    2s
    Click Element    ${ICONE_SELECAO_DATA_CALENDARIO}
    builtin.Sleep    3s
    Click Element    ${SELECAO_DIA_PRIMEIRO_CALENDARIO}

E verifico se apresentou a opção de escolha de testamento
    builtin.Sleep    2s
    Wait Until Element Is Visible    //mat-label[contains(.,'Falecido deixou testamento?')]
    builtin.Sleep    2s
    Click Element    //span[@class='mat-radio-label-content'][contains(.,'Não')]
    builtin.Sleep    2s

E verifico se apresentou a opção de escolha de testamento - Sim
    Wait Until Element Is Visible    //mat-label[contains(.,'Falecido deixou testamento?')]
    builtin.Sleep    2s
    Click Element    //span[@class='mat-radio-label-content'][contains(.,'Sim')]
    builtin.Sleep    2s

E anexo o testamento
    Wait Until Element Is Visible    //span[@class='mat-button-wrapper'][contains(.,'attachmentANEXAR DOCUMENTO')]
    Click Element    //span[@class='mat-button-wrapper'][contains(.,'attachmentANEXAR DOCUMENTO')]

    pyautogui.Write    ${EXECDIR}\\doc\\Testamento.pdf
    builtin.Sleep    2s
    Press    Enter

E verifico se apresentou a opção de uniao estavel
    Wait Until Element Is Visible
    ...    //mat-label[@class='required'][contains(.,'Era casado ou vivia em união estável na data do óbito?')]
    builtin.Sleep    2s
    Click Element    (//span[@class='mat-radio-label-content'][contains(.,'Sim')])[2]
    builtin.Sleep    2s

E verifico se apresentou o campo de selecao e campo de anexo da uniao estavel
    # Wait Until Element Is Visible    //div[@class='mat-form-field-flex ng-tns-c57-21'][contains(.,'Regime de bens')]
    Wait Until Element Is Visible
    ...    //p[contains(.,'Anexe - Certidão de casamento ou instrumento formal de união estável')]
    Wait Until Element Is Visible    //button[@type='button'][contains(.,'attachmentANEXAR DOCUMENTO')]

E seleciono o tipo de regime de bens
    Click Element    (//div[contains(.,'Regime de bens')])[14]
    Click Element    //span[@class='mat-option-text'][contains(.,'Comunhão Parcial de Bens')]
    builtin.Sleep    2s

E seleciono o tipo de uniao estavel nao formalizada
    Wait Until Element Is Visible    //span[contains(text(), 'TRATA-SE DE UNIÃO ESTÁVEL NÃO FORMALIZADA')]
    Click Element    //span[contains(text(), 'TRATA-SE DE UNIÃO ESTÁVEL NÃO FORMALIZADA')]
    builtin.Sleep    2s

E seleciono o tipo de Inventario
    Wait Until Element Is Visible    //mat-label[contains(.,'Tipo de inventário')]
    Click Element    //span[@class='mat-radio-label-content'][contains(.,'Judicial')]
    builtin.Sleep    2s

E seleciono o tipo de Inventario Extrajudicial
    Wait Until Element Is Visible    //mat-label[contains(.,'Tipo de inventário')]
    Click Element    //span[@class='mat-radio-label-content'][contains(.,'Extrajudicial')]
    builtin.Sleep    2s

E seleciono o local da comarca ou forum do inventario
    Wait Until Element Is Visible
    ...    //mat-label[@class='iradio-group ng-star-inserted'][contains(.,'Local da comarca/fórum')]
    Click Element    //span[@class='mat-radio-label-content'][contains(.,'No Brasil')]
    builtin.Sleep    2s

E seleciono o local da comarca ou forum do inventario no exterior
    Wait Until Element Is Visible
    ...    //mat-label[@class='iradio-group ng-star-inserted'][contains(.,'Local do cartório')]
    Click Element    //span[@class='mat-radio-label-content'][contains(.,'No exterior')]
    builtin.Sleep    2s

E seleciono o estado aonde esta sendo realizado o inventario
    Wait Until Element Is Visible    //input[@name='municipio']
    Click Element    (//div[contains(.,'MG')])[15]
    Click Element    //span[@class='mat-option-text'][contains(.,'MG')]
    builtin.Sleep    3s

E seleciono o estado aonde esta sendo realizado o inventario (AM)
    Wait Until Element Is Visible    //input[@name='municipio']
    Click Element    (//div[contains(.,'MG')])[15]
    Click Element    //span[@class='mat-option-text'][contains(.,'AM')]
    builtin.Sleep    3s

E seleciono a cidade aonde esta sendo realizado o inventario
    Wait Until Element Is Visible    //input[@name='municipio']
    builtin.Sleep    2s
    Click Element    //input[@name='municipio']
    Click Element    //span[@class='mat-option-text'][contains(.,'ABADIA DOS DOURADOS')]
    builtin.Sleep    2s

E seleciono a cidade aonde esta sendo realizado o inventario - RIO CASCA
    Wait Until Element Is Visible    //input[@name='municipio']
    builtin.Sleep    2s
    Input Text    //input[@name='municipio']    RIO CASCA
    # Click Element    //input[@name='municipio']
    Click Element    //span[@class='mat-option-text'][contains(.,'RIO CASCA')]
    builtin.Sleep    2s

E seleciono a cidade aonde esta sendo realizado o inventario - ALMENARA
    Wait Until Element Is Visible    //input[@name='municipio']
    builtin.Sleep    2s
    Input Text    //input[@name='municipio']    ALMENARA
    # Click Element    //input[@name='municipio']
    Click Element    //span[@class='mat-option-text'][contains(.,'ALMENARA')]
    builtin.Sleep    2s

E seleciono a cidade aonde esta sendo realizado o inventario (AM)
    Wait Until Element Is Visible    //input[@name='municipio']
    builtin.Sleep    2s
    Click Element    //input[@name='municipio']
    Click Element    //span[@class='mat-option-text'][contains(.,'ALVARAES')]
    builtin.Sleep    2s

E verifico se apresentou o campo de selecao e campo de anexo da uniao estavel - CT03
    # Wait Until Element Is Visible    //div[@class='mat-form-field-flex ng-tns-c57-21'][contains(.,'Regime de bens')]
    Wait Until Element Is Visible
    ...    //p[contains(.,'Anexe - Certidão de casamento ou instrumento formal de união estável')]
    Wait Until Element Is Visible    //button[@type='button'][contains(.,'attachmentANEXAR DOCUMENTO')]

    Click Element    (//div[contains(.,'Regime de bens')])[14]
    Click Element    //span[@class='mat-option-text'][contains(.,'Comunhão Parcial de Bens')]
    builtin.Sleep    2s

    Wait Until Element Is Visible    //span[contains(text(), 'TRATA-SE DE UNIÃO ESTÁVEL NÃO FORMALIZADA')]
    Click Element    //span[contains(text(), 'TRATA-SE DE UNIÃO ESTÁVEL NÃO FORMALIZADA')]
    builtin.Sleep    2s

    Wait Until Element Is Visible    //mat-label[contains(.,'Tipo de inventário')]
    Click Element    //span[@class='mat-radio-label-content'][contains(.,'Judicial')]
    builtin.Sleep    2s

    Wait Until Element Is Visible
    ...    //mat-label[@class='iradio-group ng-star-inserted'][contains(.,'Local da comarca/fórum')]
    Click Element    //span[@class='mat-radio-label-content'][contains(.,'No Brasil')]
    builtin.Sleep    2s

    Wait Until Element Is Visible    //input[@name='municipio']
    Click Element    (//div[contains(.,'MG')])[15]
    Click Element    //span[@class='mat-option-text'][contains(.,'MG')]
    builtin.Sleep    3s

    Wait Until Element Is Visible    //input[@name='municipio']
    builtin.Sleep    2s
    Click Element    //input[@name='municipio']
    Click Element    //span[@class='mat-option-text'][contains(.,'BELO HORIZONTE')]
    builtin.Sleep    2s

E verifico se apresentou o campo de selecao e campo de anexo da uniao estavel - CT04
    # Wait Until Element Is Visible    //div[@class='mat-form-field-flex ng-tns-c57-21'][contains(.,'Regime de bens')]
    Wait Until Element Is Visible
    ...    //p[contains(.,'Anexe - Certidão de casamento ou instrumento formal de união estável')]
    Wait Until Element Is Visible    //button[@type='button'][contains(.,'attachmentANEXAR DOCUMENTO')]

    Click Element    (//div[contains(.,'Regime de bens')])[14]
    Click Element    //span[@class='mat-option-text'][contains(.,'Comunhão Parcial de Bens')]
    builtin.Sleep    2s

    Wait Until Element Is Visible    //span[contains(text(), 'TRATA-SE DE UNIÃO ESTÁVEL NÃO FORMALIZADA')]
    Click Element    //span[contains(text(), 'TRATA-SE DE UNIÃO ESTÁVEL NÃO FORMALIZADA')]
    builtin.Sleep    2s

    Wait Until Element Is Visible    //mat-label[contains(.,'Tipo de inventário')]
    Click Element    //span[@class='mat-radio-label-content'][contains(.,'Extrajudicial')]
    builtin.Sleep    2s

    # Wait Until Element Is Visible    //mat-label[@class='iradio-group ng-star-inserted'][contains(.,'Local da comarca/fórum')]
    Click Element    //span[@class='mat-radio-label-content'][contains(.,'No Brasil')]
    builtin.Sleep    2s

    Wait Until Element Is Visible    //input[@name='municipio']
    Click Element    (//div[contains(.,'MG')])[15]
    Click Element    //span[@class='mat-option-text'][contains(.,'MG')]
    builtin.Sleep    3s

    Wait Until Element Is Visible    //input[@name='municipio']
    builtin.Sleep    2s
    Click Element    //input[@name='municipio']
    Click Element    //span[@class='mat-option-text'][contains(.,'BELO HORIZONTE')]
    builtin.Sleep    2s

E clico em avançar na tela de Dados Basicos
    Wait Until Element Is Enabled    ${BOTAO_AVANCAR}
    builtin.Sleep    1s
    Click Element    ${BOTAO_AVANCAR}

### ----------------------- TELA 04 - DADOS DO RESPONSAVEL -------------------------------------- ###

Pegando o numero do protocolo DBD para cancelamento posterior
    ${protocolo_DBD_Atual}    RPA.Browser.Selenium.Get Text    //h1[contains(@class,'numero-protocolo-content mt-0')]
    ${protocolo_remove}    Remove String    ${protocolo_DBD_Atual}    .
    ${protocolo_Final}    Remove String    ${protocolo_remove}    -
    Set Global Variable    ${protocolo_Final}
    Log To Console    ${protocolo_Final}
    RETURN    ${protocolo_Final}

Pegando o numero do protocolo DBD02 para cancelamento posterior
    ${protocolo_DBD_Atual2}    RPA.Browser.Selenium.Get Text    //h1[contains(@class,'numero-protocolo-content mt-0')]
    ${protocolo_remove2}    Remove String    ${protocolo_DBD_Atual2}    .
    ${protocolo_Final2}    Remove String    ${protocolo_remove2}    -
    Set Global Variable    ${protocolo_Final2}
    Log To Console    ${protocolo_Final2}
    RETURN    ${protocolo_Final2}

Dado que estou na tela de Dados do Responsavel
    builtin.Sleep    4s
    # Wait Until Element Is Visible    (//div[contains(.,'Dados do responsável')])[13]

ENTAO verifico se a situacao da DBD e: "AGUARDANDO O PREENCHIMENTO DA DBD"
    builtin.Sleep    5s
    Press    F5
    builtin.Sleep    3s
    ${SITUACAO_DBD}    RPA.Browser.Selenium.Get Text
    ...    //span[@class='numero-protocolo-content'][contains(.,'Aguardando o preenchimento da DBD')]
    Should Be Equal    ${SITUACAO_DBD}    AGUARDANDO O PREENCHIMENTO DA DBD

ENTÃO verifico se os dados do responsavel vieram preenchidos
    Wait Until Element Is Visible    //input[contains(@placeholder,'Ex: Nome completo')]
    Wait Until Element Is Visible    //input[contains(@autocomplete,'off')]
    Wait Until Element Is Visible    //input[contains(@mask,'(00) 00000-0000 || (00) 0000-0000')]

E digito o email do responsavel
    Wait Until Element Is Visible    //input[@type='email']
    Input Text    //input[@formcontrolname='telefone']    61983659140
    Input Text    //input[@type='email']    ${EMAIL_RESPONSAVEL}
    builtin.Sleep    2s
    Input Text    //input[contains(@formcontrolname,'confirmacaoEmailResponsavel')]    ${EMAIL_RESPONSAVEL}

E o sistema pergunta se o responsavel pela declaracao e o inventariante
    Wait Until Element Is Visible
    ...    //mat-label[contains(.,'O responsável pelo preenchimento dessa declaração é o inventariante?')]
    builtin.Sleep    7s
    pyautogui.Press    End
    Click Element    //span[contains(.,'Sim')]
    builtin.Sleep    2s

E o sistema pergunta se o responsavel pela declaracao e o inventariante NÂO
    Wait Until Element Is Visible
    ...    //mat-label[contains(.,'O responsável pelo preenchimento dessa declaração é o inventariante?')]
    builtin.Sleep    7s
    pyautogui.Press    End
    Click Element    //span[contains(.,'Não')]
    builtin.Sleep    2s

E informo os dados do cpf do responsavel pela declaracao
    Wait Until Element Is Visible    //input[contains(@mask,'000.000.000-00')]
    Input Text    //input[contains(@mask,'000.000.000-00')]    00040346609
    Click Element    //input[contains(@formcontrolname,'nomeInventariante')]
    builtin.Sleep    2s

E o sistema habilita o botão avançar
    Wait Until Element Is Enabled    //span[@class='mat-button-wrapper'][contains(.,'AVANÇAR')]
    builtin.Sleep    3s
    Click Element    //span[@class='mat-button-wrapper'][contains(.,'AVANÇAR')]
    builtin.Sleep    2s

### ----------------------- TELA 05 - BENEFICIARIOS | MEEIRO -------------------------------------- ###

Dado que estou na tela de beneficiario e Meeiro
    Execute javascript    document.body.style.zoom='90%'
    builtin.Sleep    3s
    Wait Until Element Is Visible    //div[@class='header-title'][contains(.,'Beneficiário | Meeiro')]
    builtin.Sleep    2s

E clico no botao adicionar para incluir um beneficiario filho
    Execute javascript    document.body.style.zoom="80%"
    pyautogui.Press    Home
    builtin.Sleep    3s
    builtin.Sleep    3s
    Scroll Element Into View
    ...    //mat-icon[contains(@class, "mat-icon notranslate material-icons mat-ligature-font mat-icon-no-color ng-star-inserted")]
    Click Element
    ...    //mat-icon[contains(@class, "mat-icon notranslate material-icons mat-ligature-font mat-icon-no-color ng-star-inserted")]
    builtin.Sleep    2s
    Click Element    (//p[contains(text(), "Filho")])[1]

E preencho o cpf do beneficiario filho
    Input Text    ${INPUT_CPF_BENEFICIARIO_MEEIRO}    ${CPF_FILHO}
    builtin.Sleep    2s
    Click Element    ${CAMPO_NOME_BENEFICIARIO_MEEIRO}
    builtin.Sleep    2s

E clico no botao adicionar para incluir um beneficiario filho 2
    pyautogui.Press    Home
    Scroll Element Into View    //div[@class='row zoom-mais'][contains(.,'+')]
    builtin.Sleep    3s
    Click Element    (//mat-icon[contains(text(), 'add_circle')])[16]
    builtin.Sleep    2s
    Click Element    (//p[contains(.,'Filho')])[1]

E preencho o cpf do beneficiario filho 2
    Input Text    ${INPUT_CPF_BENEFICIARIO_MEEIRO}    ${CPF_FILHO_2}
    builtin.Sleep    2s
    Click Element    ${CAMPO_NOME_BENEFICIARIO_MEEIRO}
    builtin.Sleep    2s

E clico no botao adicionar para incluir um beneficiario avo
    builtin.Sleep    3s
    Click Element    ${BOTAO_ADICIONA_BENEFICIARIO_MEEIRO}
    builtin.Sleep    2s
    Click Element    //p[contains(.,'Avô/Avó')]

E informo se e um herdeiro pre morto SIM
    builtin.Sleep    2s
    Click Element    //span[@class='mat-radio-label-content'][contains(.,'Sim')]
    builtin.Sleep    2s

E preecho o cpf do beneficiario avo
    Input Text    ${INPUT_CPF_BENEFICIARIO_MEEIRO}    ${CPF_AVOS}
    builtin.Sleep    2s
    Click Element    //*[@formcontrolname="nomePreMorto"]
    builtin.Sleep    2s
    Click Element    ${ICONE_SELECAO_DATA_CALENDARIO}
    builtin.Sleep    2s
    Click Element    ${SELECAO_DIA_PRIMEIRO_CALENDARIO}
    builtin.Sleep    2s
    Click Element    //span[@class='mat-button-wrapper'][contains(.,'AVANÇAR')]

E o sistema solicita adicionar um beneficiario pais
    pyautogui.Press    Home
    # Scroll Element Into View    //div[@class='row zoom-mais'][contains(.,'+')]
    builtin.Sleep    3s
    # Click Element    (//mat-icon[contains(text(), 'add_circle')])[16]
    Wait Until Element Is Visible    //mat-label[contains(.,'O Beneficiário renuncia a sua parte da herança? *')]
    Click Element    //span[@class='mat-radio-label-content'][contains(.,'Não')]
    builtin.Sleep    2s
    Click Element    ${BOTAO_INCLUIR_BENEFICIARIO_MEEIRO}

E preecho o cpf do beneficiario pais
    Input Text    ${INPUT_CPF_BENEFICIARIO_MEEIRO}    ${CPF_PAIS}
    builtin.Sleep    2s
    Click Element    //*[@formcontrolname="nomeAvo"]
    builtin.Sleep    2s

E clico no botao adicionar para incluir um beneficiario neto
    pyautogui.Press    Home
    Scroll Element Into View    //div[@class='row zoom-mais'][contains(.,'+')]
    builtin.Sleep    3s
    Click Element    (//mat-icon[contains(text(), 'add_circle')])[16]
    builtin.Sleep    2s
    Click Element    (//p[contains(.,'Neto')])[1]

E o sistema pede para preencher o cpf do beneficiario pais
    Input Text    ${INPUT_CPF_BENEFICIARIO_MEEIRO}    ${CPF_PAIS}
    builtin.Sleep    2s
    Click Element    //*[@formcontrolname="nomePreMorto"]
    builtin.Sleep    2s
    Click Element    ${ICONE_SELECAO_DATA_CALENDARIO}
    builtin.Sleep    2s
    Click Element    ${SELECAO_DIA_PRIMEIRO_CALENDARIO}
    builtin.Sleep    3s
    Click Element    //span[@class='mat-button-wrapper'][contains(.,'AVANÇAR')]

E informo as informacoes para adicionar beneficiario neto
    Input Text    ${INPUT_CPF_BENEFICIARIO_MEEIRO}    ${CPF_NETO}
    builtin.Sleep    2s
    Click Element    //*[@formcontrolname="nomeNeto"]
    builtin.Sleep    2s

ENTAO selecionamos se o beneficiario renuncia sua parte NAO
    Wait Until Element Is Visible    //mat-label[contains(.,'O Beneficiário renuncia a sua parte da herança? *')]
    Click Element    //span[@class='mat-radio-label-content'][contains(.,'Não')]
    builtin.Sleep    2s
    Click Element    ${BOTAO_INCLUIR_BENEFICIARIO_MEEIRO}

ENTAO selecionamos se o beneficiario renuncia sua parte SIM - doacao
    Wait Until Element Is Visible    //mat-label[contains(.,'O Beneficiário renuncia a sua parte da herança? *')]
    Click Element    //span[@class='mat-radio-label-content'][contains(.,'Sim')]
    builtin.Sleep    2s

E seleciono o tipo de renuncia
    Wait Until Element Is Visible    //mat-label[contains(.,'Renúncia em favor de: *')]
    Click Element    //span[@class='mat-radio-label-content'][contains(.,'Beneficiário determinado (Doação)')]
    builtin.Sleep    2s

ENTAO seleciono para quem sera realizado a doaçao da parte
    Wait Until Element Is Visible    //mat-label[contains(text(), "Beneficiário/Meeiro")]
    Click Element    //*[@formcontrolname="beneficiario"]
    Click Element    (//span[contains(@class, "mat-option-text")])[1]

E clico em adicionar beneficiario
    Wait Until Element Is Visible    //span[@class='mat-button-wrapper'][contains(.,'ADICIONAR BENEFICIARIO')]
    Click Element    //span[@class='mat-button-wrapper'][contains(.,'ADICIONAR BENEFICIARIO')]
    builtin.Sleep    2s
    Click Element    ${BOTAO_INCLUIR_BENEFICIARIO_MEEIRO}

E aciono o proximo menu lateral
    builtin.Sleep    3s
    Click Element    //p[contains(text(), "Bens | Direitos | Dívidas")]
    builtin.Sleep    2s

ENTAO selecionamos se o beneficiario renuncia sua parte SIM
    Wait Until Element Is Visible    //mat-label[contains(.,'O Beneficiário renuncia a sua parte da herança? *')]
    Click Element    //span[@class='mat-radio-label-content'][contains(.,'Sim')]
    builtin.Sleep    2s
    Wait Until Element Is Visible    //mat-label[contains(text(), "Renúncia em favor de:")]
    Click Element    //span[contains(text(), "Demais herdeiros (Monte-mor)")]
    Click Element    ${BOTAO_INCLUIR_BENEFICIARIO_MEEIRO}

E verifico se apresentou a opção relacionado a renuncia da herança SIM
    builtin.Sleep    2s
    Wait Until Element Is Visible
    ...    //mat-radio-group[@role='radiogroup'][contains(.,'Demais herdeiros (Monte-mor) Beneficiário determinado (Doação)')]
    builtin.Sleep    2s
    Click Element    (//span[contains(@class,'mat-radio-outer-circle')])[3]

E clico no botao adicionar para incluir um beneficiario conjuge
    Execute javascript    document.body.style.zoom="80%"
    pyautogui.Press    Home
    builtin.Sleep    3s
    Click Element    ${BOTAO_ADICIONA_BENEFICIARIO_MEEIRO}
    builtin.Sleep    2s
    Click Element    //p[contains(text(), "Conjuge/Companheiro")]

E preecho o cpf do beneficiario conjuge
    Input Text    ${INPUT_CPF_BENEFICIARIO_MEEIRO}    ${CPF_CONJUGE}
    builtin.Sleep    3s
    Click Element    //div[@class='header-title'][contains(.,'Beneficiário | Meeiro')]
    builtin.Sleep    5s
    Click Element    ${BOTAO_INCLUIR_BENEFICIARIO_MEEIRO}

E clico no botao adicionar para incluir um beneficiario Filho Unilateral
    builtin.Sleep    2s
    Scroll Element Into View    (//mat-icon[contains(text(), 'add_circle')])[16]
    Click Element    (//mat-icon[contains(text(), 'add_circle')])[16]
    builtin.Sleep    2s
    Click Element    //p[contains(.,'Filho unilateral')]

E o sistema pede para preencher o cpf do beneficiario Filho Unilateral
    Input Text    ${INPUT_CPF_BENEFICIARIO_MEEIRO}    ${CPF_FILHOUNILATERAL}
    builtin.Sleep    3s
    Click Element    //div[@class='header-title'][contains(.,'Beneficiário | Meeiro')]
    builtin.Sleep    2s
    Wait Until Element Is Visible    //mat-label[contains(.,'O Beneficiário renuncia a sua parte da herança? *')]
    Click Element    //span[@class='mat-radio-label-content'][contains(.,'Não')]
    builtin.Sleep    2s
    Click Element    ${BOTAO_INCLUIR_BENEFICIARIO_MEEIRO}

E clico no botao adicionar para incluir um beneficiario Outro
    builtin.Sleep    3s
    Scroll Element Into View    ${BOTAO_ADICIONA_BENEFICIARIO_MEEIRO}
    Click Element    ${BOTAO_ADICIONA_BENEFICIARIO_MEEIRO}
    builtin.Sleep    2s
    Click Element    (//p[contains(.,'Outro')])[2]

E verifico se apresentou a tela de cadastro do outro
    Wait Until Element Is Visible    (//div[contains(.,'Cadastro do outro')])[2]
    Wait Until Element Is Visible
    ...    //span[@class='mat-select-placeholder mat-select-min-line ng-tns-c81-11 ng-star-inserted']

E seleciono o tipo do beneficiario Outro - trineto/tataraneto
    builtin.Sleep    2s
    Click Element    (//div[contains(.,'Tipo *')])[8]
    Click Element    //span[@class='mat-option-text'][contains(.,'Trineto/Tataraneto')]

E preencho o cpf do beneficiario Outro
    builtin.Sleep    2s
    Input Text    ${INPUT_CPF_BENEFICIARIO_MEEIRO}    ${CPF_OUTRO}
    Wait Until Element Is Visible    //mat-label[contains(.,'O Beneficiário renuncia a sua parte da herança? *')]
    Click Element    //span[@class='mat-radio-label-content'][contains(.,'Não')]
    builtin.Sleep    2s
    Click Element    ${BOTAO_INCLUIR_BENEFICIARIO_MEEIRO}

E clico no botao adicionar para incluir um testamentario
    pyautogui.Press    Home
    builtin.Sleep    3s
    Click Element    ${BOTAO_ADICIONA_BENEFICIARIO_MEEIRO}
    builtin.Sleep    2s
    Click Element    //p[contains(.,'Testamentário/Legatário')]

E preecho o cpf do testamentario
    Input Text    //input[contains(@placeholder,'999.999.999-99')]    ${CPF_TESTAMENTARIO}
    builtin.Sleep    3s
    Click Element    //h4[contains(.,'Beneficiário | Meeiro')]
    builtin.Sleep    2s
    Click Element    //span[@class='mat-button-wrapper'][contains(.,'INCLUIR TESTAMENTÁRIO/LEGATARIO')]

### ----------------------- TELA 06 - BENS DIREITOS E DIVIDAS -------------------------------------- ###

Dado que estou na tela de Bens Direitos e Dividas
    Wait Until Element Is Visible    //h4[contains(.,'Bens | Direitos | Dívidas')]

E clico no botao para adicionar o bem
    builtin.Sleep    2s
    Wait Until Element Is Visible    ${BOTAO_ADICIONAR_BEM}
    builtin.Sleep    2s
    Click Element    ${BOTAO_ADICIONAR_BEM}
    builtin.Sleep    2s

E clico em acoes em bolsa FII ETF ou BDR
    Wait Until Element Is Visible
    ...    //mat-card-content[@class='mat-card-content'][contains(.,'Ações em Bolsa, FII, ETF ou BDR')]
    builtin.Sleep    3s
    Click Element    //mat-card-content[@class='mat-card-content'][contains(.,'Ações em Bolsa, FII, ETF ou BDR')]

E verifico se estou na tela de inclusao de acoes em bolsa
    Wait Until Element Is Visible    (//div[contains(.,'Ações em bolsa, FII, ETF, ou BDR')])[2]

ENTAO preencho os campos para realizar a inclusao do bem
    Input Text    //input[contains(@type,'text')]    NCHB11
    builtin.Sleep    2s
    Click Element    //span[contains(.,'NCHB11')]
    builtin.Sleep    2s
    Input Text    //input[contains(@maxlength,'20')]    10
    Input Text    //input[contains(@placeholder,'R$ 999.999.999,99')]    10000
    Click Element    ${ICONE_SELECAO_DATA_CALENDARIO}
    Click Element    ${SELECAO_DIA_PRIMEIRO_CALENDARIO}
    # Click Element    //span[@class='mat-button-wrapper'][contains(.,'attachmentANEXAR DOCUMENTO')]

E anexo o documento do extrato no sistema
    Press    End
    # Scroll Element Into View    //span[@class='mat-button-wrapper'][contains(.,'attachmentANEXAR DOCUMENTO')]
    Wait Until Element Is Visible    //span[@class='mat-button-wrapper'][contains(.,'attachmentANEXAR DOCUMENTO')]
    Click Element    //span[@class='mat-button-wrapper'][contains(.,'attachmentANEXAR DOCUMENTO')]

    pyautogui.Write    ${EXECDIR}\\doc\\Extrato.pdf
    builtin.Sleep    2s
    Press    Enter

    # Click Element    //span[@class='mat-button-wrapper'][contains(.,'attachmentANEXAR DOCUMENTO')]

E clico em imovel urbano no Brasil
    builtin.Sleep    2s
    Click Element    //mat-card-content[contains(.,'Imóvel urbano no Brasil')]
    builtin.Sleep    2s

E clico em Obras de Arte
    Click Element    //mat-card-content[contains(.,'Obras de arte')]
    builtin.Sleep    2s

E verifico se estou na tela de Obras de Arte
    Wait Until Element Is Visible    (//div[contains(.,'Obras de arte')])[11]

E verifico se estou na tela de inclusao do imovel urbano no Brasil
    Wait Until Element Is Visible    (//div[contains(.,'Imóvel urbano no Brasil')])[11]

E preencho os campos para inclusao do imovel
    Input Text    //input[contains(@type,'text')]    31742263
    Click Element    //input[contains(@formcontrolname,'uf')]
    builtin.Sleep    2s
    Input Text    //input[@formcontrolname='numero']    10
    Input Text    //input[contains(@placeholder,'99999999999999-9')]    896026A0500017
    builtin.Sleep    2s
    Click Element    //input[contains(@maxlength,'20')]
    builtin.Sleep    3s
    Click Element    (//span[@class='mat-radio-label-content'][contains(.,'Residencial')])[1]
    Input Text    //input[contains(@placeholder,'R$ 999.999.999,00')]    20000000
    Click Element    ${ICONE_SELECAO_DATA_CALENDARIO}
    Click Element    ${SELECAO_DIA_PRIMEIRO_CALENDARIO}

E preencho os campos para inclusao do obras de arte
    builtin.Sleep    2s
    Input Text    //*[@placeholder="Descrição"]    Itens de colecionador
    Input Text    //input[@id='valorTotalDeclarado']    8400000
    Click Element    ${ICONE_SELECAO_DATA_CALENDARIO}
    Click Element    ${SELECAO_DIA_PRIMEIRO_CALENDARIO}
    Click Element    //span[@class='mat-button-wrapper'][contains(.,'attachmentANEXAR DOCUMENTO')]

    pyautogui.Write    ${EXECDIR}\\doc\\Obra de arte.pdf
    builtin.Sleep    2s
    Press    Enter

E clico em veiculo
    builtin.Sleep    3s
    Click Element    //mat-card-content[contains(.,'Veículo')]
    builtin.Sleep    2s

E verifico se estou na tela de inclusao do veiculo
    Wait Until Element Is Visible    (//div[contains(.,'Veículo')])[11]

E preencho os campos para inclusao do veiculo
    Input Text    //input[contains(@formcontrolname,'renavam')]    889441308
    Input Text    //input[contains(@formcontrolname,'placa')]    LSP1F66
    builtin.Sleep    2s
    Click Element    //input[contains(@maxlength,'4')]
    # Click Element    //input[contains(@type,'text')]
    # Click Element    (//span[@class='mat-option-text'][contains(.,'HONDA/CIVIC LXS')])[1]
    builtin.Sleep    2s
    Click Element    //span[contains(text(), 'Não')]
    Input Text    //input[contains(@placeholder,'R$ 999.999.999,00')]    4500000
    Click Element    ${ICONE_SELECAO_DATA_CALENDARIO}
    Click Element    ${SELECAO_DIA_PRIMEIRO_CALENDARIO}
    Click Element    //span[@class='mat-button-wrapper'][contains(.,'attachmentANEXAR DOCUMENTO')]

    pyautogui.Write    ${EXECDIR}\\doc\\Carro.pdf
    builtin.Sleep    2s
    Press    Enter

E clico em adiantamento de Legitima
    builtin.Sleep    2s
    Click Element    //mat-card-content[contains(.,'Adiantamento de legítima')]
    builtin.Sleep    2s

E verifico se estou na tela de adiantamento de Legitima
    Wait Until Element Is Visible    (//div[contains(.,'Adiantamento de legítima')])[2]

ENTAO preencho os campos para realizar a inclusao do bem adiantamento de Legitima
    Input Text    //textarea[contains(@placeholder,'Descrição')]    Teste de Descrição
    Click Element    //div[contains(@id, "mat-select-value-1")]
    Click Element    //span[@class='mat-option-text']
    Click Element    //span[contains(.,'ADICIONAR BENEFICIARIO')]
    Input Text    //input[@formcontrolname='valorTotalDeclarado']    10000000
    builtin.Sleep    2s
    Click Element    ${ICONE_SELECAO_DATA_CALENDARIO}
    builtin.Sleep    3s
    Click Element    ${SELECAO_DIA_PRIMEIRO_CALENDARIO}
    Click Element    //span[contains(.,'attachmentANEXAR DOCUMENTO')]

    pyautogui.Write    ${EXECDIR}\\doc\\Testamento.pdf
    builtin.Sleep    2s
    Press    Enter

E clico em Divida
    builtin.Sleep    2s
    Click Element    //mat-card-content[contains(.,'Dívida')]
    builtin.Sleep    2s

E verifico se estou na tela de inclusao da Divida
    Wait Until Element Is Visible    (//div[contains(.,'Dívida')])[12]

E preencho os campos para inclusao da Divida
    Input Text    //textarea[contains(@placeholder,'Descrição')]    Dividas do Falecido
    Input Text    //input[contains(@placeholder,'R$ 999.999.999,00')]    500000
    builtin.Sleep    2s
    Click Element    ${ICONE_SELECAO_DATA_CALENDARIO}
    builtin.Sleep    3s
    Click Element    ${SELECAO_DIA_PRIMEIRO_CALENDARIO}
    Click Element    //span[contains(.,'attachmentANEXAR DOCUMENTO')]

    pyautogui.Write    ${EXECDIR}\\doc\\Extrato.pdf
    builtin.Sleep    2s
    Press    Enter

E clico em Despesas Funeral
    builtin.Sleep    2s
    Click Element    //mat-card-content[contains(.,'Despesa com funeral')]
    builtin.Sleep    2s

E verifico se estou na tela de Despesas Funeral
    Wait Until Element Is Visible    (//div[contains(.,'Despesa com funeral')])[11]

ENTAO preencho os campos para realizar a inclusao do bem Despesas Funeral
    Input Text    //textarea[contains(@placeholder,'Descrição')]    Teste Despesas com funeral
    Input Text    //input[contains(@placeholder,'R$ 999.999.999,00')]    500000
    builtin.Sleep    2s
    Click Element    ${ICONE_SELECAO_DATA_CALENDARIO}
    builtin.Sleep    3s
    Click Element    ${SELECAO_DIA_PRIMEIRO_CALENDARIO}
    Click Element    //span[contains(.,'attachmentANEXAR DOCUMENTO')]

    pyautogui.Write    ${EXECDIR}\\doc\\Despesa Funeral.pdf
    builtin.Sleep    2s
    Press    Enter

E clico em Imovel Exterior
    builtin.Sleep    2s
    Click Element    //mat-card-content[contains(.,'Imóvel no exterior')]
    builtin.Sleep    2s

E verifico se estou na tela de inclusao do Imovel Exterior
    Wait Until Element Is Visible    (//div[contains(.,'Imóvel no exterior')])[11]

E preencho os campos para inclusao do Imovel Exterior
    Click Element    //span[contains(.,'Residencial')]
    Input Text    //input[contains(@formcontrolname,'valorTotalDeclarado')]    35000000
    builtin.Sleep    2s
    Click Element    ${ICONE_SELECAO_DATA_CALENDARIO}
    builtin.Sleep    3s
    Click Element    ${SELECAO_DIA_PRIMEIRO_CALENDARIO}
    Click Element    //span[contains(.,'attachmentANEXAR DOCUMENTO')]

    pyautogui.Write    ${EXECDIR}\\doc\\Imovel.pdf
    builtin.Sleep    2s
    Press    Enter

    Input Text    //input[@formcontrolname='pais']    Estados Unidos
    Click Element    //input[contains(@formcontrolname,'pais')]
    Click Element    //span[@class='mat-option-text'][contains(.,'Estados Unidos')]
    Input Text    //input[@formcontrolname='codigoPostal']    33125
    Input Text    //input[@formcontrolname='cidade']    Miami
    Input Text    //input[@formcontrolname='estado']    Florida
    Input Text    //input[@formcontrolname='logradouro']    Teste de Logradouro

E clico em Participacoes Societarias
    builtin.Sleep    2s
    Click Element    //mat-card-content[contains(.,'Participações societárias')]
    builtin.Sleep    2s

E verifico se estou na tela de Participacoes Societarias
    Wait Until Element Is Visible    (//div[contains(.,'Participações societárias')])[11]

ENTAO preencho os campos para realizar a inclusao do bem Participacoes Societarias
    Input Text    //input[@formcontrolname='cnpjEmpresa']    ${CNPJ_EMPRESA}
    builtin.Sleep    3s
    Click Element    (//span[contains(@class,'mat-radio-outer-circle')])[2]
    builtin.Sleep    3s
    Click Element    (//span[contains(@class,'mat-radio-outer-circle')])[4]
    Click Element    (//span[contains(@class,'mat-radio-outer-circle')])[2]
    Input Text    //input[@formcontrolname='quantidadeCota']    1000
    Input Text    //input[@formcontrolname='valorTotalDeclarado']    1500000
    Click Element    ${ICONE_SELECAO_DATA_CALENDARIO}
    builtin.Sleep    3s
    Click Element    ${SELECAO_DIA_PRIMEIRO_CALENDARIO}
    Click Element    (//span[contains(.,'attachmentANEXAR DOCUMENTO')])[1]

    pyautogui.Write    ${EXECDIR}\\doc\\Extrato.pdf
    builtin.Sleep    2s
    Press    Enter

    Click Element    (//span[contains(.,'attachmentANEXAR DOCUMENTO')])[2]

    pyautogui.Write    ${EXECDIR}\\doc\\previdencia_privada.pdf
    builtin.Sleep    2s
    Press    Enter

E clico em Previdencia Privada
    builtin.Sleep    3s
    Click Element    //mat-card-content[contains(.,'Previdência privada')]
    builtin.Sleep    2s

E verifico se estou na tela de Previdencia Privada
    Wait Until Element Is Visible    (//div[contains(.,'Previdência privada')])[2]

ENTAO preencho os campos para realizar a inclusao do bem Previdencia Privada
    Click Element    //input[@formcontrolname='cnpjRazaoSocial']
    Click Element    //span[contains(text(),'Bradesco Vida e Previdência S.A.')]
    Input Text    //input[@formcontrolname='numeroContrato']    1111111111
    Input Text    //input[contains(@formcontrolname,'valorTotalDeclarado')]    20000000
    Click Element    ${ICONE_SELECAO_DATA_CALENDARIO}
    builtin.Sleep    3s
    Click Element    ${SELECAO_DIA_PRIMEIRO_CALENDARIO}
    Click Element    (//span[contains(.,'attachmentANEXAR DOCUMENTO')])[1]

    pyautogui.Write    ${EXECDIR}\\doc\\previdencia_privada.pdf
    builtin.Sleep    2s
    Press    Enter
    Click Element    (//span[contains(.,'attachmentANEXAR DOCUMENTO')])[2]

    pyautogui.Write    ${EXECDIR}\\doc\\Extrato.pdf
    builtin.Sleep    2s
    Press    Enter

E clico em Saldo de Fgts_Pis
    builtin.Sleep    2s
    Click Element    //mat-card-content[contains(.,'Saldo de FGTS/PIS-PASEP')]
    builtin.Sleep    2s

E verifico se estou na tela de Saldo de Fgts_Pis
    Wait Until Element Is Visible    (//div[contains(.,'Saldo FGTS/PIS-PASEP')])[11]

ENTAO preencho os campos para realizar a inclusao do bem Saldo de Fgts_Pis
    Click Element    //input[@formcontrolname='nomeBanco']
    Click Element    //span[@class='mat-option-text'][contains(.,'070 - BRB - BANCO DE BRASILIA S.A.')]
    Input Text    //input[contains(@formcontrolname,'numeroAgencia')]    0001
    Input Text    //input[contains(@formcontrolname,'numeroConta')]    100200300
    Input Text    //input[contains(@placeholder,'R$ 999.999.999,00')]    1000000
    Click Element    ${ICONE_SELECAO_DATA_CALENDARIO}
    builtin.Sleep    3s
    Click Element    ${SELECAO_DIA_PRIMEIRO_CALENDARIO}
    Click Element    (//span[contains(.,'attachmentANEXAR DOCUMENTO')])[1]

    pyautogui.Write    ${EXECDIR}\\doc\\FGTS.pdf
    builtin.Sleep    2s
    Press    Enter

E clico em Semovente
    builtin.Sleep    2s
    Click Element    //mat-card-content[contains(.,'Semovente')]
    builtin.Sleep    2s

E verifico se estou na tela de Semovente
    Wait Until Element Is Visible    (//div[contains(.,'Semovente (Rebanho animal)')])[2]

ENTAO preencho os campos para realizar a inclusao do bem Semovente
    Click Element    //*[@id="mat-select-value-1"]
    Click Element    //span[contains(.,'BOVINO')]
    Click Element    //*[@id="mat-select-4"]
    Click Element    //span[@class='mat-option-text'][contains(.,'FÊMEA - 13 A 24 MESES')]
    Input Text    //input[@formcontrolname='quantidade']    200
    Input Text    //input[contains(@formcontrolname,'valorPorCabeca')]    20000
    Click Element    ${ICONE_SELECAO_DATA_CALENDARIO}
    builtin.Sleep    3s
    Click Element    ${SELECAO_DIA_PRIMEIRO_CALENDARIO}
    Click Element    (//span[contains(.,'attachmentANEXAR DOCUMENTO')])[1]
    builtin.Sleep    2s
    pyautogui.Write    ${EXECDIR}\\doc\\cartaovacinacao.pdf
    builtin.Sleep    2s
    Press    Enter
    Click Element    (//span[contains(.,'attachmentANEXAR DOCUMENTO')])[2]
    builtin.Sleep    2s
    pyautogui.Write    ${EXECDIR}\\doc\\fichasanitaria.pdf
    builtin.Sleep    2s
    Press    Enter

E clico em Outro
    builtin.Sleep    3s
    Click Element    //mat-card-content[contains(.,'Outro')]
    builtin.Sleep    2s

E verifico se estou na tela de Outro
    Wait Until Element Is Visible    (//div[contains(.,'Outro')])[11]

ENTAO preencho os campos para realizar a inclusao do bem Outro
    Input Text    //textarea[contains(@placeholder,'Descrição')]    Teste de Bem - Outro
    Input Text    //input[contains(@formcontrolname,'valorTotalDeclarado')]    200000
    Click Element    ${ICONE_SELECAO_DATA_CALENDARIO}
    builtin.Sleep    3s
    Click Element    ${SELECAO_DIA_PRIMEIRO_CALENDARIO}
    Click Element    //span[@class='mat-radio-label-content'][contains(.,'No Brasil')]
    Click Element    //mat-select[contains(@formcontrolname,'uf')]
    Click Element    //span[@class='mat-option-text'][contains(.,'MG')]
    builtin.Sleep    2s
    Click Element    //input[contains(@name,'municipio')]
    Click Element    //span[@class='mat-option-text'][contains(.,'ABRE CAMPO')]
    Click Element    (//span[contains(.,'attachmentANEXAR DOCUMENTO')])[1]
    builtin.Sleep    2s
    pyautogui.Write    ${EXECDIR}\\doc\\divida.pdf
    builtin.Sleep    2s
    Press    Enter

E o sistema habilita o botão salvar
    builtin.Sleep    2s
    Wait Until Element Is Visible    ${BOTAO_SALVAR_BEM}
    Wait Until Element Is Enabled    ${BOTAO_SALVAR_BEM}
    Click Element    ${BOTAO_SALVAR_BEM}

E clico em salvar para salvar todos os bens
    builtin.Sleep    2s
    Click Element    ${BOTAO_AVANCAR}

### ----------------------- TELA 07 - PARTILHA -------------------------------------- ###

Dado que estou na tela de Partilha
    builtin.Sleep    2s
    Wait Until Element Is Visible    //div[@class='header-title'][contains(.,'Partilha')]
    builtin.Sleep    3s

E verifico que o botão Alterar Partilha esta disponivel
    Wait Until Element Is Visible    ${BOTAO_ALTERAR_PARTILHA}
    builtin.Sleep    2s

E o sistema solicita o preenchimento da partilha
    builtin.Sleep    2s
    Input Text    //*[@id="mat-input-29"]    1000000

E clico no botão Alterar Partilha
    Click Element    ${BOTAO_ALTERAR_PARTILHA}
    builtin.Sleep    2s

ENTÂO o sistema apresenta o informativo sobre a troca da partilha
    Wait Until Element Is Visible    //p[contains(@class,'paragrafo ng-star-inserted')]
    builtin.Sleep    2s
    Click Element    //span[contains(.,'SIM')]
    builtin.Sleep    2s

ENTÂO realizo a troca da partilha
    Input Text    //*[@id="mat-input-31"]    300000
    builtin.Sleep    2s
    Input Text    //*[@id="mat-input-32"]    700000
    builtin.Sleep    2s

ENTÂO informo a partilha mencionada no testamento
    Input Text    (//input[@placeholder="0,0000%"])[1]    250000
    builtin.Sleep    2s
    Input Text    (//input[@placeholder="0,0000%"])[2]    250000
    builtin.Sleep    2s
    Input Text    (//input[@placeholder="0,0000%"])[3]    500000
    builtin.Sleep    2s

ENTÂO informo a partilha mencionada no testamento - CT16
    Input Text    (//input[@placeholder="0,0000%"])[1]    500000
    builtin.Sleep    2s
    Input Text    (//input[@placeholder="0,0000%"])[2]    500000
    builtin.Sleep    2s

ENTAO aplico a mesma porcentagem para todos os bens
    Wait Until Element Is Visible    //span[contains(text(), 'REPETIR A % PARA TODOS OS BENS')]
    builtin.Sleep    2s
    Click Element    //span[contains(text(), 'REPETIR A % PARA TODOS OS BENS')]
    builtin.Sleep    2s

### ----------------------- TELA 08 - DOCUMENTOS ANEXOS -------------------------------------- ###

Dado que estou na tela de documentos anexos
    Wait Until Element Is Visible    //h4[@class='header-title'][contains(.,'Documentos anexos')]
    builtin.Sleep    3s

E o sistema solicita a inclusão do documento do responsavel
    Wait Until Element Is Visible    //div[contains(text(), "Pendente")]
    Click Element    //mat-icon[contains(@class, "mat-icon notranslate icon-svn-pendente mat-icon-no-color")]

    Click Element    //span[contains(text(), "ANEXAR DOCUMENTO")]
    pyautogui.Write    ${EXECDIR}\\doc\\documento_responsavel.pdf
    builtin.Sleep    2s
    Press    Enter

    Click Element    //span[contains(text(), "CONCLUIR")]

### ----------------------- TELA 09 - ENVIO -------------------------------------- ###

Dado que estou na tela de Envio
    Wait Until Element Is Visible    //div[@class='header-title flex-grow-1'][contains(.,'Envio')]
    builtin.Sleep    3s

ENTAO verifico se o sistema gerou o documento para envio da DBD
    Wait Until Element Is Visible    //mat-icon[@role='img'][contains(.,'download')]
    builtin.Sleep    2s

E clico em Enviar DBD
    builtin.Sleep    2s
    Click Element    //span[@class='mat-button-wrapper'][contains(.,'ENVIAR DBD')]

ENTAO vamos marcar o aceite e clicar em sim na tela de confirmacao
    builtin.Sleep    2s
    Click Element    //span[contains(@class,'mat-checkbox-inner-container')]
    Click Element    //span[@class='mat-button-wrapper'][contains(.,'PROSSEGUIR')]

### ----------------------- TELA 10 - DOCUMENTO DE ARRECADACAO ESTADUAL -------------------------------------- ###

DADO que estou na tela da DAE
    builtin.Sleep    5s
    Wait Until Element Is Visible    //div[contains(text(), "Documento de arrecadação estadual (DAE)/Pagamentos")]

E verifico se a situacao e EM ANALISE
    builtin.Sleep    2s
    Wait Until Element Is Visible    (//span[contains(text(), "Em análise")])[2]

E verifico se a situacao e AGUARDANDO PAGAMENTO DE DAE
    builtin.Sleep    3s
    Wait Until Element Is Visible    (//span[contains(text(), "Aguardando pagamento do DAE")])[2]

E verifico se a situacao e EM AVALIAÇÃO DE BENS E DIREITOS
    builtin.Sleep    2s
    Wait Until Element Is Visible    (//span[contains(text(), "Em avaliação de bens e direitos")])[2]

ENTAO o sistema permite clicar no botao VISUALIZAR DAE
    builtin.Sleep    2s

Fechar navegador
    Tirando print para evidencias
    RPA.Browser.Selenium.Close Browser

### ----------------------- ACESSO USUARIO INTERNO -------------------------------------- ###

DADO que estou na tela inicial do ITCD versão usuario interno
    builtin.Sleep    3s
    Wait Until Element Is Visible
    ...    //mat-label[@class='ng-tns-c58-3 ng-star-inserted'][contains(.,'Pesquise com um CPF ou Número de Protocolo')]

E realizo a pesquisa da DBD
    Input Text    //input[contains(@formcontrolname,'texto')]    ${protocolo_Final}
    builtin.Sleep    2s
    Click Element    //span[@class='mat-button-wrapper'][contains(.,'PESQUISAR')]

E realizo a pesquisa da DBD e seleciono o tipo de servico
    Input Text    //input[contains(@formcontrolname,'texto')]    ${protocolo_Final}
    # Input Text    //input[contains(@formcontrolname,'texto')]    2300100049931
    Click Element    (//span[contains(.,'Tipo de Serviço')])[1]
    Click Element    //span[@class='mat-option-text'][contains(.,'Declaração de Bens e Direitos - ITCD')]
    builtin.Sleep    2s
    Click Element    //span[@class='mat-button-wrapper'][contains(.,'PESQUISAR')]

E realizo a pesquisa da DBD e seleciono o tipo de servico - CT28
    Input Text    //input[contains(@formcontrolname,'texto')]    2300100037401
    Click Element    (//span[contains(.,'Tipo de Serviço')])[1]
    Click Element    //span[@class='mat-option-text'][contains(.,'Declaração de Bens e Direitos - ITCD')]
    builtin.Sleep    2s
    Click Element    //span[@class='mat-button-wrapper'][contains(.,'PESQUISAR')]

ENTAO seleciono a DBD e aciono o opção transferir protocolo
    builtin.Sleep    2s
    Click Element
    ...    (//span[contains(@class,'mat-checkbox-inner-container mat-checkbox-inner-container-no-side-margin')])[1]
    Click Element    //span[contains(text(), 'Transferir protocolo')]

E clico em NOVO ANALISTA
    builtin.Sleep    12s
    Click Element    //span[@class='mat-button-wrapper'][contains(.,'Novo Analista')]

E acesso o menu lateral MINHA UNIDADE e Seleciono o MUNICIPIO
    Click Element    //p[contains(.,'Minha unidade')]
    builtin.Sleep    2s
    Click Element    //p[contains(.,'AF/3 NÍVEL/RIO CASCA')]

E acesso o menu lateral CONSULTA - CT25
    Click Element    //p[contains(.,'Consulta')]
    builtin.Sleep    2s

E acesso o menu lateral CONSULTA
    Click Element    //p[contains(.,'Consulta')]
    builtin.Sleep    2s
    Click Element    //p[contains(.,'AF/3 NÍVEL/RIO CASCA')]

ENTAO escrevo o MOTIVO e Seleciono o Analista
    Click Element    //*[@id="mat-select-value-11"]
    Click Element    //span[@class='mat-option-text'][contains(.,'Ajustes na programação fiscal')]
    builtin.Sleep    2s
    Click Element    //*[@id="mat-select-value-13"]
    Click Element    //span[contains(text(), " HOM5_NOME_1222 ")]

ENTAO Seleciono NÂO em priorizar e clico em Transferir
    builtin.Sleep    2s
    Click Element    (//span[@class='mat-button-wrapper'][contains(.,'Transferir')])[2]

ENTAO aciono o menu lateral MANUTENCAO DE USUARIOS
    Click Element    //p[contains(.,'Manutenção de usuários')]
    builtin.Sleep    2s

E seleciono a DBD e armazeno o nome do analista responsavel
    builtin.Sleep    2s
    Click Element
    ...    (//span[contains(@class,'mat-checkbox-inner-container mat-checkbox-inner-container-no-side-margin')])[1]
    builtin.Sleep    2s
    ${NOME_SERVIDOR_RESPONSAVEL}    Get Text    (//label[contains(@class,'value')])[6]
    Set Global Variable    ${NOME_SERVIDOR_RESPONSAVEL}
    Log To Console    ${NOME_SERVIDOR_RESPONSAVEL}
    RETURN    ${NOME_SERVIDOR_RESPONSAVEL}

E seleciono a DBD para obter maiores informações
    builtin.Sleep    2s
    Click Element
    ...    (//span[contains(@class,'mat-checkbox-inner-container mat-checkbox-inner-container-no-side-margin')])[1]
    builtin.Sleep    2s
    Click Element    (//span[contains(.,'Declaração de Bens e Direitos - ITCD')])[3]
    builtin.Sleep    2s

ENTÂO clico em Avançar para confirmar a operação
    builtin.Sleep    2s
    Click Element    //span[contains(.,'AVANÇAR')]

E digito o nome do analista responsavel e realizo a pesquisa
    builtin.Sleep    2s
    Input Text    //input[contains(@formcontrolname,'nome')]    ${NOME_SERVIDOR_RESPONSAVEL}
    Click Element    //span[@class='mat-button-wrapper'][contains(.,'PESQUISAR')]

ENTAO realizo o bloqueio do analista
    builtin.Sleep    2s
    Wait Until Element Is Visible    //mat-icon[@role='img'][contains(.,'block')]
    builtin.Sleep    3s

    Click Element    //mat-icon[@role='img'][contains(.,'block')]
    builtin.Sleep    2s
    Click Element    //span[@class='mat-checkbox-label'][contains(.,'POR TEMPO INDETERMINADO')]
    Click Element    (//div[contains(.,'Motivo *')])[7]
    Click Element    //span[@class='mat-option-text'][contains(.,'Consulta médica')]
    Click Element    //span[@class='mat-button-wrapper'][contains(.,'Bloquear usuário')]

ENTAO seleciono a DBD para transferir para outro analista
    builtin.Sleep    2s
    Wait Until Element Is Visible
    ...    //span[contains(.,'Você precisa transferir os processos da caixa desse servidor para outro servidor.')]
    builtin.Sleep    2s
    Click Element    (//span[@class='mat-checkbox-inner-container mat-checkbox-inner-container-no-side-margin'])[1]
    Click Element    //button[contains(.,'Transferir protocolo')]
    builtin.Sleep    15s
    Click Element    //span[contains(.,'Outra Unidade')]
    Click Element    (//div[contains(.,'Unidade *')])[9]
    Input Text    //input[@formcontrolname='unidade']    DF/1º NÍVEL/JUIZ DE FORA - 1
    Click Element    //span[contains(.,'DF/1º NÍVEL/JUIZ DE FORA - 1')]
    Input Text    //textarea[@name='justificativa']    Teste de funcionamento.
    builtin.Sleep    2s
    Click Element    (//span[contains(.,'Transferir')])[2]

E realizo a consulta novamente para verificar que foi realizado a transferencia
    builtin.Sleep    5s
    Click Element    //p[contains(.,'Consulta')]
    builtin.Sleep    2s

    # Input Text    //input[contains(@formcontrolname,'texto')]    ${protocolo_Final}
    Input Text    //input[contains(@formcontrolname,'texto')]    2300100044556
    Click Element    (//span[contains(.,'Tipo de Serviço')])[1]
    Click Element    //span[@class='mat-option-text'][contains(.,'Declaração de Bens e Direitos - ITCD')]
    builtin.Sleep    2s
    Click Element    //span[@class='mat-button-wrapper'][contains(.,'PESQUISAR')]
    builtin.Sleep    2s
    Click Element    (//span[contains(.,'Declaração de Bens e Direitos - ITCD')])[3]
    Scroll Element Into View    //p[contains(.,'Histórico')]
    Click Element    //p[contains(.,'Histórico')]
    builtin.Sleep    5s

ENTAO realizo o desbloqueio do analista
    builtin.Sleep    2s
    # Click Element    (//mat-icon[contains(@class, "mat-icon notranslate mat-icon-no-color")])[1]
    # ENTAO aciono o menu lateral MANUTENCAO DE USUARIOS
    # E digito o nome do analista responsavel e realizo a pesquisa
    # Click Element    //mat-icon[contains(text(), "block")]
    builtin.Sleep    2s
    Click Element    //span[contains(text(), "Desbloquear")]
    builtin.Sleep    2s
    Click Element    (//div[contains(.,'DESBLOQUEAR')])[8]
    Input Text    //*[@id="mat-input-9"]    Testes Automatizados
    Click Element    //span[@class='mat-button-wrapper'][contains(.,'Desbloquear usuário')]

ENTAO digito o numero de protocolo na pesquisa
    Input Text    //input[@formcontrolname='texto']    ${protocolo_Final}
    Click Element    //span[contains(.,'PESQUISAR')]

E clico na DBD para verificar detalhes do preenchimento
    builtin.Sleep    2s
    Click Element    (//label[contains(.,'SERVIDOR RESPONSÁVEL')])[1]
    builtin.Sleep    2s

DADO que estou na tela dos detalhes da DBD
    Wait Until Element Is Visible    (//div[contains(.,'Dados do falecido')])[2]

E clico em Certidao e em seguida em Reprocessamento de certidao
    builtin.Sleep    2s
    Click Element    (//span[contains(.,'Certidão')])[2]
    builtin.Sleep    2s
    Click Element    //button[contains(.,'Reprocessamento de certidão')]

E Verifico se estou na tela de Reprocessamento de certidao
    builtin.Sleep    2s
    Wait Until Element Is Visible    (//div[contains(.,'Histórico dos dados do imposto causa mortis')])[2]

ENTAO informo a justificativa do reprocessamento
    builtin.Sleep    4s
    pyautogui.Press    End
    # Scroll Element Into View    //div[contains(text(), "Novos dados da certidão")]
    Input Text    //textarea[contains(@aria-required,'true')]    Teste de Reprocessamento de Certidão

E anexo o Documento para reprocessamentno da certidao
    builtin.Sleep    2s
    Click Element    //span[@class='mat-button-wrapper'][contains(.,'attachmentANEXAR DOCUMENTO')]

    pyautogui.Write    ${EXECDIR}\\doc\\reprocessamento_certidao.pdf
    builtin.Sleep    2s
    Press    Enter

E clico em Vincular DAE ou PTA
    builtin.Sleep    2s
    Click Element    //span[contains(text(), "Vincular DAE ou PTA")]

E clico em Solicitar Manutencao
    builtin.Sleep    2s
    Click Element    //span[contains(text(), "Solicitar manutenção")]

E clico em Transferir para o contraditório
    builtin.Sleep    2s
    Click Element    //button[contains(.,'Transferir p/ contraditório')]

E clico em Cancelar Declaracao
    builtin.Sleep    2s
    Click Element    (//span[contains(.,'Cancelar declaração')])[3]

E Verifico se estou na tela de cancelamento de declaracao
    builtin.Sleep    2s
    Wait Until Element Is Visible    //h2[contains(.,'Cancelar DBD')]

ENTAO clico em prosseguir
    Click Element    //span[contains(.,'Prosseguir')]

E informo a justificativa e clico em cancelar
    builtin.Sleep    2s
    Input Text    //textarea[@aria-required='true']    Teste de cancelamento de DBD
    builtin.Sleep    2s
    Click Element    //span[contains(.,'CONFIRMAR CANCELAMENTO')]

E Verifico se esta em modo de Manutencao
    builtin.Sleep    2s
    Wait Until Element Is Visible    (//div[contains(.,'Modo de manutenção')])[2]

E Verifico se esta na tela de Transferencia de contraditorio
    builtin.Sleep    2s
    Wait Until Element Is Visible    //h4[contains(.,'Base de cálculo tributável por bem')]

E seleciono o bem que desejo solicitar a ANALISE
    builtin.Sleep    2s
    Click Element
    ...    //span[contains(@class,'mat-checkbox-inner-container mat-checkbox-inner-container-no-side-margin')]

ENTÂO clico em Solicitar avaliação contraditoria
    builtin.Sleep    2s
    Click Element    //span[contains(.,'Solicitar avaliação contraditória')]

E altero o tipo de inventario para Extrajudicial
    builtin.Sleep    2s
    Click Element    //span[@class='mat-radio-label-content'][contains(.,'Extrajudicial')]

E clico em Bens direitos e dividas para realizar a edição do valor e data do bem
    Click Element    //p[contains(.,'Bens | Direitos | Dívidas')]
    builtin.Sleep    2s
    Click Element    //mat-icon[contains(@svgicon,'editar')]
    builtin.Sleep    2s
    Click Element    //span[contains(.,'OK')]
    Input Text    //input[contains(@formcontrolname,'valorTotalDeclarado')]    840000
    builtin.Sleep    2s
    Click Element    //span[@class='mat-button-wrapper'][contains(.,'SALVAR')]

ENTAO clico em Finalizar Manutencao
    builtin.Sleep    2s
    Click Element    //span[contains(.,'FINALIZAR MANUTENÇÃO')]

ENTAO clico em Gerar DAE avulso
    Click Element    //button[contains(.,'Gerar DAE avulso')]

DADO que estou na janela da geração da DAE
    Wait Until Element Is Visible    //label[contains(.,'Gerar DAE avulso')]

E Digito o valor do DAE
    Input Text    //input[@formcontrolname='valorDaeAvulso']    15000

E seleciono a opção de atribuição da DAE - SIM
    Click Element    (//span[@class='mat-radio-label-content'][contains(.,'Sim')])[3]

ENTAO Seleciono o CPF do responsavel pela DAE
    Click Element    //*[@id="mat-select-value-7"]
    Click Element    //span[contains(.,'279.564.586-68')]

E clico em GERAR DAE
    Click Element    //span[contains(.,'gerar dae')]
