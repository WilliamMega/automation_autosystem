*** Settings ***
Documentation     Projeto para automatizar os principais fluxos do sistema AutoSystem.
Resource          ../../../resources/imports.robot
Resource          ../../../keywords/desktop/desktop_imports.robot

*** Test Cases ***
Exemplo 01: Gerando CPF e CNPJ
    ${CPF}      Gera CPF
    ${CNPJ}     Gera CNPJ
    Log         ${CPF}
    Log         ${CNPJ}

Exemplo 02: Gerando CPF e CNPJ com Formatacao
    ${CPF_FORMAT}     Gera CPF Format
    ${CNPJ_FORMAT}    Gera CNPJ Format
    Log               ${CPF_FORMAT}
    Log               ${CNPJ_FORMAT}