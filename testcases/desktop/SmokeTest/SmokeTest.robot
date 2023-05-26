*** Settings ***
Documentation     Projeto para automatizar os principais fluxos do sistema AutoSystem.
Resource          ../../../resources/imports.robot
Resource          ../../../keywords/desktop/desktop_imports.robot

Suite Setup       Abrir Aplicacao Main
Suite Teardown    Fechar Aplicacao

*** Variables ***

*** Test Cases ***
Cenário 1: Validar Tela Transferencia entre Contas
    [Tags]    SmoketTest
    Realizar Login
    Acessar Tela Transferencia entre Contas

Cenário 1: Validar Tela Contas a Pagar
    [Tags]    SmoketTest
    Realizar Login
    Acessar Tela Contas a Pagar