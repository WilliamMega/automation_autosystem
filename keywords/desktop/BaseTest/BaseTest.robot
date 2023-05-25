*** Settings ***
Resource    ../../../resources/imports.robot
Variables   Locators/locators.yaml

*** Variables ***
${LocatorHomeBtnNao}=     image:${EXECDIR}${btn_Home_Nao}

*** Keywords ***
Abrir Aplicacao
    ${AutoSystemApp}=    Open application    ${auto_system_dir}
    Sleep    ${timeout_10}
    Sleep    1s

Realizar Login
    Type text    ${user}
    Press Keys   tab
    Type text    ${pass}
    Press Keys   enter
    Sleep    ${timeout_3}
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

Fechar Aplicacao
    Sleep    ${timeout_5}
    Close all applications