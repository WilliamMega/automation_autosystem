*** Settings ***
Documentation     Projeto para automatizar os principais fluxos do sistema AutoSystem.
Resource          ../../../resources/imports.robot
Resource          ../../../keywords/desktop/desktop_imports.robot

*** Test Cases ***
Exemplo 01: Gerando CPF e CNPJ
    ${UF}           Get UF
    ${Estado}       Get Estado
    Log             ${UF}
    Log             ${Estado}