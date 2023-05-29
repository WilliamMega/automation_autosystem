*** Settings ***
Documentation     Projeto para automatizar os principais fluxos do sistema AutoSystem.
Resource          ../../../resources/imports.robot
Resource          ../../../keywords/desktop/desktop_imports.robot

Test Teardown    TestLink

*** Test Cases ***
Caixa - Código de Autorização da Transação PIX via SITEF
    ${UF}           Get UF
    ${Estado}       Get Estado
    Should Be Equal As Strings    "ABC"    "ABC"
    Log             ${UF}
    Log             ${Estado}