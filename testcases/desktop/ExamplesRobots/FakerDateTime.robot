*** Settings ***
Documentation     Projeto para automatizar os principais fluxos do sistema AutoSystem.
Resource          ../../../resources/imports.robot
Resource          ../../../keywords/desktop/desktop_imports.robot

*** Keywords ***
Exemplos relacionados a pessoa
  ${NOMEFAKE}                 FakerLibrary.Name
  ${ENDERECOFAKE}             FakerLibrary.Address
  ${TELEFONEFAKE}             FakerLibrary.Phone Number
  ${CIDADEFAKE}               FakerLibrary.City
  ${CODIGOPOSTALFAKE}         FakerLibrary.Postalcode
  ${TRABALHOFAKE}             FakerLibrary.Job
  @{PESSOA}                   Create List    Nome Aleatório: ${NOMEFAKE}  Endereço Aleatório: ${ENDERECOFAKE}
  ...                         Telefone Aleatório: ${TELEFONEFAKE}  Cidade Aleatória: ${CIDADEFAKE}
  ...                         CódigoPostal Aleatório: ${CODIGOPOSTALFAKE}   Trabalho: ${TRABALHOFAKE}
  Log Many    @{PESSOA}

Exemplos relacionados a datas
  ${DATAFAKE}                 FakerLibrary.Date
  ${MESFAKE}                  FakerLibrary.Month
  ${ANOFAKE}                  FakerLibrary.Year
  ${DIADASEMANAFAKE}          FakerLibrary.Day Of Week
  ${DIADOMESFAKE}             FakerLibrary.Day Of Month
  @{DATAS}                    Create List    Data Aleatória: ${DATAFAKE}  Mês Aleatório: ${MESFAKE}  Ano Aleatório: ${ANOFAKE}
  ...                         Dia da Semana Aleatório: ${DIADASEMANAFAKE}   Dia do Mês Aleatório: ${DIADOMESFAKE}
  Log Many    @{DATAS}

Exemplos diversos
  ${EMAILFAKE}                FakerLibrary.Email
  ${PASSWORDFAKE}             FakerLibrary.Password
  ${CORFAKE}                  FakerLibrary.Color Name
  ${CARTAODECREDITOFAKE}      FakerLibrary.Credit Card Number
  ${PALAVRAFAKE}              FakerLibrary.Word
  @{OUTROS}                   Create List    E-mail Aleatório: ${EMAILFAKE}   Senha Aleatória: ${PASSWORDFAKE}
  ...                         Cor Aleatório: ${CORFAKE}   Cartão de Crédito Aleatório: ${CARTAODECREDITOFAKE}
  ...                         Palavra Aleatória: ${PALAVRAFAKE}
  Log Many    @{OUTROS}

Teste dados fakes
    ${RANDOMINT}      FakerLibrary.Random Int
    ${RANDOMLETTERS}  FakerLibrary.Random Letters
    ${RANGOMSTRINGLETTERS}   Generate Random String	3	[LETTERS]
    ${RANGOMSTRINGNUMBERS}   Generate Random String	3	[NUMBERS] 
    ${NOME}           FakerLibrary.name
    ${CIDADE}         FakerLibrary.city
    ${CEP}            FakerLibrary.postcode
    ${ESTADO}         FakerLibrary.state 
    @{OUTROS}                   Create List    Nome Aleatório: ${NOME}   CIDADE: ${CIDADE}
    ...                         CEP: ${CEP}   ESTADO: ${ESTADO}
    ...                         RANDOMINT: ${RANDOMINT}   RANDOMLETTERS: ${RANDOMLETTERS}
    ...                         RANGOMSTRINGLETTERS: ${RANGOMSTRINGLETTERS}   ESTADO: ${RANGOMSTRINGNUMBERS}
    Log Many    @{OUTROS}

Teste dados fakes - Datas
    ${CURRENT_DATE}              Date Time.Get Current Date    increment=-3d    exclude_millis=True    result_format=date_format=%d/%m/%Y
    ${CURRENT_DATETIME}          Date Time.Get Current Date    increment=-2h    exclude_millis=True    result_format=date_format=%H:%M:%S
    ##${DATA}                      DateTime.Add Time To Date    ${CURRENT_DATE}    50
    ##${CONVERTERD_DATE}           Convert Date    18/05/2020    result_format=%Y-%m-%d    date_format=%d/%m/%Y    
    ##${DATA_CONVERT}              DateTime.Convert Date    ${CURRENT_DATE}    date_format=%m.%d.%Y
    ##@{OUTROS}                    Create List    DATA: ${DATA}   CURRENT_DATE: ${CURRENT_DATE}
    ##Log Many    @{OUTROS}    
    Log     ${CURRENT_DATE}
    Log     ${CURRENT_DATETIME} 

*** Test Cases ***
Cenário 1: Validar Tela Transferencia entre Contas
    ##Realizar Login
    ##Acessar Tela Transferencia entre Contas
    Exemplos relacionados a pessoa
    Exemplos relacionados a datas
    Exemplos diversos
    Teste dados fakes

Cenário 2: Validar FakerLibrary
    ##Realizar Login
    ##Acessar Tela Transferencia entre Contas
    Exemplos relacionados a pessoa
    Exemplos relacionados a datas
    Exemplos diversos
    Teste dados fakes - Datas

Cenário 3: Validar FakerLibrary
    ${NOME}     FakerLibrary.name
    ${CIDADE}   FakerLibrary.city
    ${CEP}      FakerLibrary.postcode
    ${ESTADO}   FakerLibrary.state
    @{OUTROS}                   Create List    Cor Aleatório: ${CIDADE}   Cartão de Crédito Aleatório: ${CEP}
    ...                         Palavra Aleatória: ${ESTADO}
    Log Many    @{OUTROS}