*** Settings ***
Resource    ../../../resources/imports.robot
Variables   Locators/locators.yaml

*** Keywords ***
Acessar Tela Transferencia entre Contas
    Press Keys   alt    f
    Press Keys   down
    Press Keys   down
    Press Keys   down
    Press Keys   right
    Press Keys   enter
    Wait for element    image:${EXECDIR}${btn_Titulo_Transf_Contas}    timeout=5

Acessar Tela Contas a Pagar
    Press Keys   alt    f
    Press Keys   down
    Press Keys   down
    Press Keys   down
    Press Keys   down
    Press Keys   right
    Press Keys   enter
    Wait for element    image:${EXECDIR}${btn_Titulo_Contas_Pagar}    timeout=5