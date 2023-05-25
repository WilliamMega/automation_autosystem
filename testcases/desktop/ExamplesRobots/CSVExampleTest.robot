*** Settings ***
Documentation     Projeto para automatizar os principais fluxos do sistema AutoSystem.
Resource          ../../../resources/imports.robot
Resource          ../../../keywords/desktop/desktop_imports.robot

*** Variables ***
# Example data generated with: https://www.mockaroo.com/
@{template_list}=   1  Douglas  Morris  dmorris0@mozilla.org  Male  205.4.212.229
&{template_dict}=   id=1  first_name=Douglas  last_name=Morris  email=dmorris0@mozilla.org  gender=Male  ip_address=205.4.212.229
&{template_dict_quoting}=   id=1  first_name=Douglas  last_name=Morris  email=dmorris0@mozilla.org  gender="Male  ip_address=205.4.212.229

*** Test Cases ***
Leia o arquivo csv para um acesso de teste de exemplo dict como atributos - Exemplo 1
    @{dict}=    read csv file to associative  ${EXECDIR}/datadriven/data.csv
    Should Be Equal As Strings     ${dict[0].first_name}    ${dict[0]}[first_name]
    Should Be Equal As Integers    ${dict[0].id}    ${dict[0]}[id]
Leia o arquivo csv para um acesso de teste de exemplo dict como atributos - Exemplo 2
    @{dict}=    read csv file to associative  ${EXECDIR}/datadriven/example_data.csv
    Should Be Equal As Integers    ${dict[0].id_product}    ${dict[0]}[id_product]    
    Should Be Equal As Strings     ${dict[0].name_product}    ${dict[0]}[name_product]
    Log                            ${dict[0].id_product}
    Log                            ${dict[0].name_product}
    Log                            ${dict[1].id_product}
    Log                            ${dict[1].name_product}
    Log                            ${dict[2].id_product}
    Log                            ${dict[2].name_product}

Leia o arquivo csv para um teste de exemplo de lista
    @{list}=  read csv file to list  ${EXECDIR}/datadriven/data.csv
    lists should be equal          ${template_list}  ${list[1]}

Leia o arquivo csv para um teste de exemplo dict
    @{dict}=    read csv file to associative  ${EXECDIR}/datadriven/data.csv
    dictionaries should be equal   ${template_dict}  ${dict[0]}
  
Leia o arquivo csv sem citar a associativa
    @{dict}=    read csv file to associative  ${EXECDIR}/datadriven/data_quoting.csv  delimiter=,  quoting=${3}
    dictionaries should be equal   ${template_dict_quoting}  ${dict[0]}    