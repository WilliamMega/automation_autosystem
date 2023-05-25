# *** Settings ***
# Documentation     Projeto Faker BR.
# Resource          ../../../resources/imports.robot
# Resource          ../../../keywords/desktop/desktop_imports.robot

# *** Keywords ***
# Teste dados fakes BRASILEIROS
#     ${CPF}          FakerLibrary.Cpf
#     ${CNPJ}         FakerLibrary.Cnpj
#     @{OUTROS}       Create List    CPF: ${CPF}   CNPJ: ${CNPJ}
#     Log Many        @{OUTROS}    

# *** Test Cases ***
# CN01:Teste dados fakes BRASILEIROS
#     Teste dados fakes BRASILEIROS