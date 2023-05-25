# PROJETO PARA AUTOMAÇÃO DESKTOP UTILIZANDO A BIBLIOTECA RPA - ROBOT FRAMEWORK
Projeto desenvolvido para automatizar os principais casos de teste do sistema Auto System - Linx

## PRÉ-REQUISITOS
Requisitos de software necessários para configuração do ambiente de desenvolvimento

* Visual Studio Code (Last version) [download](https://code.visualstudio.com/download)
  * Plugins
    * Robot Framework Language Server - Robocorp
    * Material Icon Theme
* Python [download](https://www.python.org/downloads/) - Version: 3.11
* RPA Framework
* RPA Desktop
* RPAFramework-Recognition
	* Baixar e configurar no Path do Windows: https://github.com/allure-framework/allure2/releases (Version: 2.22.0)
	* Exemplo: C:\allure-2.22.0\bin -> Variaveis do ambiente -> Variaveis do sistema -> Path
* Allure-robotframework
* Accessibility Insights For Windows (Inspector from elements) [download] (https://accessibilityinsights.io/downloads/)


## ESTRUTURA DO PROJETO
| Diretório                						| finalidade                                                                                   | 
|-----------------------------------------------|----------------------------------------------------------------------------------------------|
| keywords\desktop         						| Funcionalidades implementadas (Palavras chaves) que devem ser utilizadas nos tests cases     |
| desktop_imports.robot    						| Arquivo que possui as resources das Keywords na pasta keywords\desktop                       |
| keywords\desktop\xxx\locators 				| Configuração dos locators conforme suas Keywords (Substituir o nome da pasta "xxx")          |
| keywords\desktop\xxx\locators\locators.yaml	| Mapeamentos dos locators da respectiva Keywords, escritos em arquivos yaml                   |
| keywords\desktop\xxx\Locators\yyy           	| Repositório responsavel por armazenar as imagens (Locators) conforme suas Keywords           |
| report				   						| Armazenamento do relatorio Nativo e logs gerado após execução								   |
| allure_results				   			    | Armazenamento do relatorio Allure e logs gerado após execução								   |
| resources\config         						| Configuração das principais variaveis da automação Desktop, escritos em arquivos yaml        |
| resources\imports.robot  						| Configuração das principais bibliotecas utilizadas na automação                              |
| testcases\desktop           					| Configuração dos macros diretórios para execução das suites de teste (Smoke/Regressivo)      |   
| testcases\desktop\ExamplesRobots				| Exemplos dos arquivos .robot para trabalhar com diferentes bibliotecas				       |   
| requirements.txt	       						| Armazena informações sobre todas as bibliotecas, módulos e pacotes específicos do projeto    |
                                        
## SNIPPETS

### CONFIGURAÇÃO DAS SUITES DE TESTE

*** Settings ***

SUITE SETUP
TEST SETUP
TEST TEARDOWN
SUITE TEARDOWN

Existem dois tipos de Setup no Robot Framework: o Test Setup e o Suite Setup. Como o próprio nome já diz, o Test Setup inicializará as configurações para cada teste 
e o Suite Setup inicializará para a suite. Fique atento à sua necessidade e lembre-se de que o Test Setup irá executar os comandos sempre antes de iniciar cada teste 
e o Suite Setup apenas ao iniciar a Suite.

Assim como o Setup, também existem dois tipos de Teardown no Robot Framework: o Test Teardown e o Suite Teardown. Funcionam iguais ao Setup, porém são executados após 
um teste ou após uma suite.

### ESCRITA BDD - GHERKIN

No RobotFramework não há a necessidade de instalar um plugin ou uma biblioteca para escrever seus casos de testes na linguagem Gherkin (BDD), basta escrever o passo a 
passo dos seus casos de testes conforme a definição do BDD. Lembre-se de montar adequadamente suas Keywords, para ter um código legivel e de facil manutenção.

Palavras chaves:

Dado
Quando
Então
E (Podendo ser utilizado depois do Quando e do Então);

Exemplo:

*** Test Cases ***
Entrar com administrador
    Dado que estou na página de login
    Quando eu entro com o nome de usuário "admin" e a senha "admin"
    Então eu deveria ver a página de boas-vindas

Entrar com usuário inválido
    Dado que estou na página de login
    Quando eu entro com o nome de usuário "inválido" e a senha "inválida"
    Então eu devo ver a mensagem de erro
    E eu deveria ser capaz de fazer login novamente

### LOCATORS

Nos dois diretórios abaixo, segue explicação:

1 - keywords\desktop\xxx\locators: Responsavel por armanezar os locators da respectiva keywords. Na estrutura desse projeto, temos que segmentar as keywords conforme o
 conjunto similar das funcionalidades do sistema.
2 - keywords\desktop\xxx\locators\locators.yaml: Arquivo responsavel por mapear os locators da respectiva Keywords, escritos em arquivos yaml

Informação importante sobre Locatos:​
​
Por limitações da aplicação do AutoSystem não é possível encontrar os elementos utilizando o Accessibility Insights For Windows, dessa forma iremos utilizar os recursos do teclado (Setas, TAB, Enter e etc) para interagir com os elementos. Além disso iremos utilizar imagens para encontrar determinados elementos.


### KEYWORDS

Palavras-chave da biblioteca são palavras-chave que vêm da biblioteca que importamos no Robot Framework. Iremos criar e utilizar tais palavras-chave para criar o nosso 
passo a passo de nossos casos de teste.

## GERAR RELATÓRIO NATIVO DO ROBOT FRAMEWORK

robot -d .\report .\testcases\desktop\SmokeTest\SmokeTest.robot

## GERAR RELATÓRIO NATIVO DO ROBOT FRAMEWORK PASSANDO TAGS

robot -d .\report -i SmoketTest .\testcases\desktop\SmokeTest\SmokeTest.robot

Obs.: Sempre passar a pasta "report" (Não mudar esse diretório).

## GERAR RELATÓRIO NATIVO E DO ALLURE

robot --listener 'allure_robotframework;./allure_results' -d .\report .\testcases\desktop\SmokeTest\SmokeTest.robot

"allure_results" é referente aos artefatos do relatório do Allure;
"report" é referente aos artefatos do relatório Nativo;

Após gerar os artefatos do allure, é necessário executar o seguinte comando:

allure serve ./allure_results

O relatório ficará disponivel no endereço abaixo:

- http://192.168.0.29:52403/index.html


## DOWNLOAD DO PROJETO TEMPLATE PARA SUA MÁQUINA LOCAL
Faça o donwload do template no repositório de código para utilizar no seu projeto em especifico, 
feito isso, fique a vontande para usufruir dos recursos disponíveis e 
também customizar de acordo com sua necessidade. 

## FRAMEWORKS UTILIZADOS
Abaixo está a lista de frameworks utilizados nesse projeto
* RobotFramework - Biblioteca base
* RpaDesktop - Biblioteca para interagir com os elementos do sistema AutoSystem
* String - Biblioteca para trabalhar com Strings (https://robotframework.org/robotframework/latest/libraries/String.html)
* FakerLibrary - Biblioteca para gerar dados Faker para automação(https://guykisel.github.io/robotframework-faker/)
* Library Process - Biblioteca Robot Framework para processos em execução.
* Library OperatingSystem - Biblioteca padrão do Robot Framework que permite que várias tarefas relacionadas ao sistema operacional sejam executadas no sistema em que o Robot Framework está sendo executado. Ele pode, entre outras coisas, executar comandos (por exemplo, Executar ), criar e remover arquivos e diretórios (por exemplo, Criar Arquivo , Remover Diretório ), verificar se os arquivos ou diretórios existem ou contêm algo (por exemplo, Arquivo Deve Existir , Diretório Deve Estar Vazio ) e manipular variáveis ​​de ambiente (por exemplo, Definir variável de ambiente ).
* Library DateTime - biblioteca padrão do Robot Framework que suporta a criação e conversão de valores de data e hora (por exemplo, Get Current Date , Convert Time ), bem como fazer cálculos simples com eles (por exemplo, Subtract Time From Date , Add Time To Time ).

## COMANDO PARA EXECUTAR OS TESTES
Com o prompt de comando acesse a pasta do projeto.

* single run:
        robot .\testcases\desktop\SmokeTest\SmokeTest.robot

    * *run with report.html:*
        robot --listener 'allure_robotframework;./allure_results' -d .\report .\testcases\desktop\SmokeTest\SmokeTest.robot

    * *run with tags:*
		robot --listener 'allure_robotframework;./allure_results' -d .\report -i SmoketTest .\testcases\desktop\SmokeTest\SmokeTest.robot


## MULTIPLOS COMANDOS 
Você também pode mesclar a linha de comando, sendo assim você pode escolher uma determinada tag que se deseja executar dos seus testes, 
podendo escolher também a massa de dados que irá utilizar.


robot -d \report -i smoketest Testes

### DETALHES DO COMANDOS
| Comando                															| finalidade                                                     | 
|-----------------------------------------------------------------------------------|--------------------------------------------------------------- |
| robot -d               															| Especificar o diretório dos results da execução                |
| robot -d .\report -t “Cenário 01: Pesquisar postagem Season Premiere” Testes		| Executar apenas um teste específico da suíte					 |
| robot -N “Nome de Exemplo” -d ..\report Testes              						| Dando um nome à execução (para efeito de Log/Report) 			 |
| robot -d \report -i smoketest Testes 												| Executando por TAGS											 |

## TESTES CONTINUOS
### JENKINS
Em desenvolvimento

### PRE-REQUISITOS
Em desenvolvimento

### ETAPAS
* Preparação do ambiente
* Execução dos testes
* Geração do Report
* Analisar os arquivos report.html e log.html

## LOG DE EXECUÇÃO
Os logs de execução gerados pela execução ficam alocados na pasta ./report

  ## LINKS DE APOIO
* [RPA Desktop](https://rpaframework.org/libraries/desktop/)
* [RPA Desktop - Find Elements - IMG, Keyboard Shortcuts, Accessibility Insights](https://robocorp.com/docs/development-guide/desktop)
* [RPA Desktop - Find Elements](https://robocorp.com/docs/development-guide/desktop/how-to-find-user-interface-elements-using-locators-and-keyboard-shortcuts-in-windows-applications)