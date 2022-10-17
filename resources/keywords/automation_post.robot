*** Settings ***
Resource  ../main.robot

*** Keywords ***

################################################################
# API
################################################################
Efetuar GET mensagem
    ${response}  EXECUTE    GET    /quotes/random
    [Return]  ${response.json()}


EXECUTE
    [Arguments]  ${method}  ${endpoint}  ${body}=None
    # ${headers}  Authorization Headers  ${token}
    
    IF  $method.upper() == 'POST'
        ${response}  POST
        ...  url=${links.api_positive_vibes}${endpoint}
        ...  json=${body}
        #...  headers=${headers}
        ...  expected_status=any
    ELSE IF  $method.upper() == 'PATCH'
        ${response}  PATCH
        ...  url=${links.api_positive_vibes}${endpoint}
        ...  json=${body}
        #...  headers=${headers}
        ...  expected_status=any
    ELSE IF  $method.upper() == 'DELETE'
        ${response}  DELETE
        ...  url=${links.api_positive_vibes}${endpoint}
        #...  headers=${headers}
        ...  expected_status=any
    ELSE
        IF  ${body} != None
            ${response}  GET
            ...  url=${links.api_positive_vibes}${endpoint}
            ...  json=${body}
        #    ...  headers=${headers}
            ...  expected_status=any
        ELSE
            ${response}  GET
            ...  url=${links.api_positive_vibes}${endpoint}
        #    ...  headers=${headers}
            ...  expected_status=any
        END
    END
    Set Suite Variable    ${response}
    Sleep  2
    [Return]  ${response}
