*** Settings ***
Documentation     Projeto para automatizar os principais fluxos do sistema AutoSystem.
Resource          ../../../resources/imports.robot
Resource          ../../../keywords/desktop/desktop_imports.robot

Suite Setup       Abrir Aplicacao Main e Realizar Login
Test Setup             
Test Teardown     TestLink
Suite Teardown    Fechar Aplicacao

*** Variables ***

*** Test Cases ***
Caixa - Forma de Pagamento PIX com Sitef
    [Tags]    Regressivo
    ${UF}           Get UF
    ${Estado}       Get Estado
    Should Be Equal As Strings    "ABC"    "ABC"
    Log             ${UF}
    Log             ${Estado}

Caixa - Código de Autorização da Transação PIX via SITEF
    [Tags]    MiniRegressivo
    ${UF}           Get UF
    ${Estado}       Get Estado
    Should Be Equal As Strings    "ABC"    "1"
    Log             ${UF}
    Log             ${Estado}