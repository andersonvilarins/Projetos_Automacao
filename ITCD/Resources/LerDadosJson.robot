*** Settings ***
Library    RPA.JSON
Library    Telnet

*** Keywords ***
Ler dado JSON
    [Arguments]               ${propriedade}
    ${nome_caso_teste}        Obter caso de teste atual
    ${file_name}              Obter nome da massa de dados
    ${valor}                  Obter valor    ${file_name}    ${propriedade}    ${nome_caso_teste}
    [Return]                  ${valor}

Obter nome da massa de dados    
    [Return]    ${NOMEMASSADEDADOS}

Obter caso de teste atual    
    [Return]    ${TEST_NAME}    

Obter valor
    [Arguments]    ${file_name}    ${propriedade}    ${nome_caso_teste}    
    ${path_file_json}=    Catenate    ${EXECDIR}\\Massas\\${file_name}.json
    ${json}=        Load JSON from file    ${path_file_json}
    ${json_path}    Convert To String    $[?(@.CasoTeste=="${nome_caso_teste}")].${propriedade}
    ${valor}=        Get value from JSON    ${json}    ${json_path}
    [return]    ${valor}