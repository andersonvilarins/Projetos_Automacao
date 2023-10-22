*** Settings ***
Resource    ../5.objetos/objeto_abrirSite.robot

Library    SeleniumLibrary
Library    pyautogui

*** Keywords ***


 
Informo um usuário e senha válidos
    Input Text    ${campo_Username}    ${Usermane}
    Input Text    ${campo_Password}    ${Password}
E clico no botão Login
    Click Element    ${btn_login}    
E clico no menu "My Info"
    Click Element    ${menu_MyInfo}
Inserir primeiro nome
    Input Text    ${campo_primeiro_nome}    Anderson
Inserir nome do meio
    Input Text    ${campo_nome_do_meio}     Barros
Inserir último nome
    Input Text    ${campo_ultimo_nome}      Vieira
Inserir apelido
    Input Text    ${campo_apelido}          vilarins
Inserir código do empregado
    Input Text    ${campo_cod_empregado}    763999
Inserir número da carteira de habilitação
    Input Text    ${campo_cnh}    24568529
Inserir data de vailidade da habilitação
    Input Text    ${campo_data_validade_chn}    2030-03-25
Inserir número do Ssn
    Input Text    ${campo_numero_SSN}    452874
Inserir número do Sin
    Input Text    ${campo_SIN}    258539-8
Inserir nacionalidade
    Click Element    ${combo_nacionalidade}
    builtin.Sleep    1
    
    # Scroll Element Into View    ${combo_brasil}
    # Click Element    ${combo_brasil}    
Inserir estado civil
    Click Element    ${campo_estado_civil} 
Inserir data de nascimento
    Input Text    ${campo_data_nascimento}    1983-08-20
Selecionar check do gênero
    Click Element    ${btn_genero}
Inserir número da reservista
    Input Text    ${campo_numero_reservista}    78524524-1
Selecionar check de fumante
    Click Element    ${btn_fumante}
Selecionar a opção do tipo sanguíneo
    Click Element    ${combo_tipo_sanguineo}   
    pyautogui.Press    Down
    pyautogui.Press    Enter 
    Click Element    ${label_tipo_sanguineo}        
#Inserir anexo
Inserir anexo
    Scroll Element Into View    ${btn_anexo}
    Click Element    ${btn_anexo}
    Click Element    ${btn_procurar_anexo}
    builtin.Sleep    2s
    pyautogui.Write    ${EXECDIR}\\7.anexos\\Anderson Vieira_CV.pdf
    builtin.Sleep    2s
    Press    Enter
    
    
Clicar na opção salvar
    Click Element    ${btn_save1}
    builtin.Sleep    3
Clicar na opção salvar(2)
    Click Element    ${btn_save2}
    builtin.Sleep    2
Confirmação da mensagem “Success – Successfully save"
    Capture Page Screenshot    Success.png    