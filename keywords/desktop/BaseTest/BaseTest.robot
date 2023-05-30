*** Settings ***
Resource    ../../../resources/imports.robot
Variables   Locators/locators.yaml

*** Variables ***
${LocatorHomeTelaInicialMain}=     image:${EXECDIR}${btn_Home_Tela_Inicial_Main}
${LocatorHomeBtnNao}=     image:${EXECDIR}${btn_Home_Nao}

*** Keywords ***

#Open Aplication
Abrir Aplicacao Main
    ${AutoSystemApp}=    Open application    ${auto_system_main_dir}
    Sleep    ${timeout_10}
    Click    ${LocatorHomeTelaInicialMain}

Abrir Aplicacao Main e Realizar Login
    ${AutoSystemApp}=    Open application    ${auto_system_main_dir}
    Sleep    ${timeout_10}
    Click    ${LocatorHomeTelaInicialMain} 
    Realizar Login - Wait

#Fim - Open Aplication

#Login
Realizar Login
    Type text    ${user}
    Press Keys   tab
    Type text    ${pass}
    Press Keys   enter
    Sleep    ${timeout_15}
    ${Count}    Set Variable    ${0}
    ${FindHomeBtnNao}    Find element    ${LocatorHomeBtnNao}
    IF    ${Count}!=${TryBtnNoHome}
        WHILE    ${Count} < ${TryBtnNoHome}
                Click    ${LocatorHomeBtnNao}
                ${Count}=    Evaluate    ${Count} + 1
                IF    ${Count}==${TryBtnNoHome}
                    Sleep    0.5s
                ELSE 
                    Sleep    ${timeout_10}
                END
        END
    END

Realizar Login - Wait
    Type text    ${user}
    Press Keys   tab
    Type text    ${pass}
    Press Keys   enter
    Sleep    ${timeout_15}
    Wait for element    image:${EXECDIR}${btn_Home_Nao}    timeout=5
    Click    ${LocatorHomeBtnNao}
#Fim - Login

#ScreenShotFailure
StatusTestScreenShot
    Run Keyword If Test Failed    Take Screenshot
#Fim - ScreenShotFailure

#Close Aplications
Fechar Aplicacao
    Sleep    ${timeout_1}
    Close all applications
#Fim - Close Aplications

#Integração com o TestLink (Essa integração somente será utilizada nos testes referente ao MiniRegressivo e Regressivo)
TestLink
    ValidaStatus ${TEST NAME}

ValidaStatus ${TEST NAME}
    Run Keyword If Test Passed    Results ${TEST NAME}, p
    Run Keyword If Test Failed    Results ${TEST NAME}, f
    Run Keyword If Test Failed    Take Screenshot
 
Results ${TEST NAME}, ${Status}
    update_Status_TestCase    ${TEST NAME}    ${Status}

#Fim - Integração com o TestLink