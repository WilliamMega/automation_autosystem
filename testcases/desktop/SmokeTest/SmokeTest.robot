*** Settings ***
Documentation     Projeto para automatizar os principais fluxos do sistema AutoSystem.
Resource          ../../../resources/imports.robot
Resource          ../../../keywords/desktop/desktop_imports.robot

Test Setup       Abrir Aplicacao Main e Realizar Login
Test Teardown    Fechar Aplicacao

*** Variables ***

*** Test Cases ***
Cenário 1: Validar Tela Transferencia entre Contas
    [Tags]    SmoketTest
    Acessar Tela Transferencia entre Contas

Cenário 1: Validar Tela Contas a Pagar
    [Tags]    SmoketTest
    Acessar Tela Contas a Pagar