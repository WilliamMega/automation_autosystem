*** Settings ***
Resource    ../../../resources/imports.robot
Variables   Locators/locators.yaml

*** Variables ***
${LocatorHomeTelaInicialMain}=     image:${EXECDIR}${btn_Home_Tela_Inicial_Main}
${LocatorHomeBtnNao}=     image:${EXECDIR}${btn_Home_Nao}

*** Keywords ***
Abrir Aplicacao Main
    ${AutoSystemApp}=    Open application    ${auto_system_main_dir}
    Sleep    ${timeout_10}
    Click    ${LocatorHomeTelaInicialMain}

Abrir Aplicacao Main e Realizar Login
    ${AutoSystemApp}=    Open application    ${auto_system_main_dir}
    Sleep    ${timeout_10}
    Click    ${LocatorHomeTelaInicialMain} 
    Realizar Login - MSG

Realizar Login - MSG
    Type text    ${user}
    Press Keys   tab
    Type text    ${pass}
    Press Keys   enter
    Sleep    ${timeout_15}
    Click    ${LocatorHomeBtnNao}

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
    Sleep    ${timeout_3}
    Close all applications