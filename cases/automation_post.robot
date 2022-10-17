*** Settings ***
Resource  ../resources/main.robot

Suite Setup  Open App
Suite Teardown  Fechar Navegador
Test Teardown  Evidênciar teste



*** Test Cases ***
Efetuar post
    # ${body}    Efetuar GET mensagem
    # Log To Console    msg:body${body}
    # Log To Console    :
          
    # ${mensagem}    Remove String    '${body}'  '
    # ${mensagem}    Remove String    '${mensagem}'  data
    # ${mensagem}    Remove String    '${mensagem}'  :
    # ${mensagem}    Remove String    '${mensagem}'  \n
    # ${mensagem}    Remove String    '${mensagem}'  '''
    # ${mensagem}    Replace String    ${mensagem}    {    <3
    # ${mensagem}    Replace String    ${mensagem}    }    <3
    # ${mensagem}    Replace String    ${mensagem}    \n   ${SPACE}
    # Log To Console    formatada:${mensagem}

    ${msg_random}    FakerLibrary.Random Int  min=1  max=296
    Log To Console    message: ${msg.msg${msg_random}}

    Click    ${post.btn_efetuar_post}
    Wait Element    ${post.input_comentario}
    Input Text      ${post.input_comentario}      ${msg.msg${msg_random}}
    Sleep    2
    Click    ${post.btn_concluir_post}
    Sleep    10