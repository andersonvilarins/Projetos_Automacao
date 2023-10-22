*** Settings ***
Library    RequestsLibrary
Library    Collections
Resource    Login_Resource.robot

*** Variables ***
${URL_BASIC}    https://172.23.201.52:37007
${URL_BASIC_ITCDCM}    https://nereu.fazenda.mg.gov.br:37001/itcdcm


*** Keywords ***
Obter token
    Create Session    token    ${URL_BASIC}
    ${headers}=    Create Dictionary    Content-Type=application/json   
    ${resp}        POST On Session    token    /manutencao-usuario/auth
    ...    data={ "username": "52558053604", "password": "12345678" } 
    ...    headers=${headers}
    [Return]    ${resp}

Fornece token
    ${resp}=    Obter token
    Log To Console    ${resp}
    ${payload}=    Set Variable    ${resp.json()}
    ${tokenT}=    Set Variable    ${payload['token']}
    ${token}=    Set Variable    ${tokenT}
    [Return]    ${token}

Buscar declaracao pelo CPF
    ${token}=    Fornece token
    Create Session    buscaPeloCPF  ${URL_BASIC_ITCDCM}
    ${token1}=       Set Variable    Bearer ${token}
    ${headers}=    Create Dictionary    Content-Type=application/json    Authorization=${token1}
    ${respostaGET}    GET On Session    buscaPeloCPF    /api/v1/declaracoes/declaracao-por-protocolo/2300100030458    headers=${headers}
    Log To Console    ${protocolo_Final}
    Log To Console    ${respostaGET.json()}

Listar Historico da DBD
    ${token}=    Fornece token
    Create Session    listarHistorico    ${URL_BASIC_ITCDCM}
    ${token1}=    Set Variable    Bearer ${token}
    ${headers}=    Create Dictionary    Content-Type=application/json    Authorization=${token1}
    ${respostaGET}    GET On Session    listarHistorico    /api/v1/historico/${protocolo_Final}   headers=${headers}
    Log To Console    ${respostaGET.json()}
    Log    ${respostaGET.json()}

Cancelar DBD
    ${token}=    Fornece token
    Create Session    cancelarToken  ${URL_BASIC_ITCDCM}
    ${token1}=       Set Variable    Bearer ${token}
    ${headers}=    Create Dictionary    Content-Type=application/json    Authorization=${token1}
    ${respostaGET}    PUT On Session    cancelarToken    url=/api/v1/declaracoes/cancelar?protocolo=${protocolo_Final}   headers=${headers}
    Log To Console    ${respostaGET.json()}

Cancelar DBD02
    ${token}=    Fornece token
    Create Session    cancelarToken  ${URL_BASIC_ITCDCM}
    ${token1}=       Set Variable    Bearer ${token}
    ${headers}=    Create Dictionary    Content-Type=application/json    Authorization=${token1}
    ${respostaGET2}    PUT On Session    cancelarToken    url=/api/v1/declaracoes/cancelar?protocolo=${protocolo_Final2}   headers=${headers}
    Log To Console    ${respostaGET2.json()}