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
* TestLink-API-Python-client
* RPAFramework-Recognition
	* Baixar e configurar no Path do Windows: https://github.com/allure-framework/allure2/releases (Version: 2.22.0)
	* Exemplo: C:\allure-2.22.0\bin -> Variaveis do ambiente -> Variaveis do sistema -> Path
* Allure-robotframework
* Accessibility Insights For Windows (Inspector from elements) [download] (https://accessibilityinsights.io/downloads/)


## ESTRUTURA DO PROJETO
| Diretório                			| finalidade                                                                                   | 
|-----------------------------------------------|----------------------------------------------------------------------------------------------|
| allure-report					| Depois que o relatório é gerado (Allure serve ou Allure Open) é disponibilizado o index.html |
| allure-results				| Armazenamento do relatório Allure e logs gerado após execução 			       |
| datadriven					| Armazenamento dos arquivos a serem utilizados no DataDriven (.csv)			       |
| keywords\desktop         			| Funcionalidades implementadas (Palavras chaves) que devem ser utilizadas nos tests cases     |
| desktop_imports.robot    			| Arquivo que possui as resources das Keywords na pasta keywords\desktop                       |
| keywords\desktop\xxx\locators 		| Configuração dos locators conforme suas Keywords (Substituir o nome da pasta "xxx")          |
| keywords\desktop\xxx\locators\locators.yaml	| Mapeamentos dos locators da respectiva Keywords, escritos em arquivos yaml                   |
| keywords\desktop\xxx\Locators\yyy           	| Repositório responsavel por armazenar as imagens (Locators) conforme suas Keywords           |
| keywords\desktop\BaseTest\BaseTest.robot      | Classe responsavel pelas funções basicas do projeto (Open/Closet/TestLink/ScreenShot)        | 
| keywords\desktop\Utils			| Classes Utils para apoiar o projeto de automação					       |
| report				   	| Armazenamento do relatorio Nativo e logs gerado após execução                                |
| resources\config         			| Configuração das principais variaveis da automação Desktop, escritos em arquivos yaml        |
| resources\imports.robot  			| Configuração das principais bibliotecas utilizadas na automação                              |
| resources\IntegraTestLink			| Repositorio responsavel por integrar com o TestLink                                          |
| testcases\desktop           			| Configuração dos macros diretórios para execução das suites de teste (Smoke/Regressivo)      |   
| testcases\desktop\ExamplesRobots		| Exemplos dos arquivos .robot para trabalhar com diferentes bibliotecas		       |   
| requirements.txt	       			| Armazena informações sobre todas as bibliotecas, módulos e pacotes específicos do projeto    |
                                        
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

Informação importante sobre Locatos:

Por limitações da aplicação do AutoSystem não é possível encontrar os elementos utilizando o Accessibility Insights For Windows, dessa forma iremos utilizar os recursos do teclado (Setas, TAB, Enter e etc) para interagir com os elementos. Além disso iremos utilizar imagens para encontrar determinados elementos.

### KEYWORDS

Palavras-chave da biblioteca são palavras-chave que vêm da biblioteca que importamos no Robot Framework. Iremos criar e utilizar tais palavras-chave para criar o nosso 
passo a passo de nossos casos de teste.

## GERAR RELATÓRIO NATIVO DO ROBOT FRAMEWORK

robot -d .\report .\testcases\desktop\SmokeTest\SmokeTest.robot

## GERAR RELATÓRIO NATIVO DO ROBOT FRAMEWORK PASSANDO TAGS

robot -d .\report -i SmoketTest .\testcases\desktop\SmokeTest\SmokeTest.robot
robot -d .\report -i SmoketTest .\testcases\desktop\
robot -d .\report -i MiniRegressivo .\testcases\desktop\
robot -d .\report -i Regressivo .\testcases\desktop\

Obs.: Sempre passar a pasta "report" (Não mudar esse diretório).

## GERAR RELATÓRIO NATIVO E DO ALLURE

Executar os seguintes comandos para limpar as pastas:

"rmdir allure-report"
"rmdir allure-results"

Run With Tags:

robot --listener 'allure_robotframework;./allure-results' -d .\report -i SmoketTest .\testcases\desktop\
robot --listener 'allure_robotframework;./allure-results' -d .\report -i MiniRegressivo .\testcases\desktop\
robot --listener 'allure_robotframework;./allure-results' -d .\report -i Regressivo .\testcases\desktop\

"allure-results" é referente aos artefatos do relatório do Allure;
"report" é referente aos artefatos do relatório Nativo;

Após gerar os artefatos do allure, é necessário executar o seguinte comando:

"allure generate allure-results --clean -o allure-report"
"allure open allure-report" ou "allure serve ./allure-results"

O relatório ficará disponível no endereço abaixo:

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
* TestLink-API-Python-client: Biblioteca para integrar com o TestLink;

## COMANDO PARA EXECUTAR OS TESTES
Com o prompt de comando acesse a pasta do projeto.

    * *single run:*
        robot -d .\report -i SmoketTest .\testcases\desktop\
	robot -d .\report -i Regressivo .\testcases\desktop\
	robot -d .\report -i MiniRegressivo .\testcases\desktop\

    * *run with report.html:*
    	rmdir allure-report
	rmdir allure-results
        robot --listener 'allure_robotframework;./allure-results' -d .\report -i SmoketTest .\testcases\desktop\
	robot --listener 'allure_robotframework;./allure-results' -d .\report -i MiniRegressivo .\testcases\desktop\
	robot --listener 'allure_robotframework;./allure-results' -d .\report -i Regressivo .\testcases\desktop\
	allure generate allure-results --clean -o allure-report
	allure open allure-report" ou "allure serve ./allure-results

    * *run with tags:*
	robot --listener 'allure_robotframework;./allure-results' -d .\report -i SmoketTest .\testcases\desktop\
	robot --listener 'allure_robotframework;./allure-results' -d .\report -i MiniRegressivo .\testcases\desktop\
	robot --listener 'allure_robotframework;./allure-results' -d .\report -i Regressivo .\testcases\desktop\

## MULTIPLOS COMANDOS 
Você também pode mesclar a linha de comando, sendo assim você pode escolher uma determinada tag que se deseja executar dos seus testes, 
podendo escolher também a massa de dados que irá utilizar.

robot -d .\report -i SmoketTest .\testcases\desktop\
robot -d .\report -i Regressivo .\testcases\desktop\
robot -d .\report -i MiniRegressivo .\testcases\desktop\

robot --listener 'allure_robotframework;./allure-results' -d .\report -i SmoketTest .\testcases\desktop\
robot --listener 'allure_robotframework;./allure-results' -d .\report -i MiniRegressivo .\testcases\desktop\
robot --listener 'allure_robotframework;./allure-results' -d .\report -i Regressivo .\testcases\desktop\

### DETALHES DO COMANDOS
| Comando                							    | finalidade                                                     | 
|-----------------------------------------------------------------------------------|--------------------------------------------------------------- |
| robot -d               							    | Especificar o diretório dos results da execução                |
| robot -d .\report -t “Cenário 01: Pesquisar postagem Season Premiere” Testes	    | Executar apenas um teste específico da suíte                   |
| robot -N “Nome de Exemplo” -d ..\report Testes              			    | Dando um nome à execução (para efeito de Log/Report) 	     |
| robot -d \report -i smoketest Testes 		    				    | Executando por TAGS					     |

## TESTES CONTINUOS

Os tests continuos vão acontecer que uma versão do AutoSystem esteja liberada (Exe) para testes, com isso será iniciado a execução da automação em uma máquina
virtual.

Teremos inicialmente 3 grandes testes a serem executados:

Tags [SmokeTeste] [MiniRegressivo] [Regressivo].

SmokeTeste: Abrir as principais telas (Menus e SubMenus) do sistema;
MiniRegressivo: Regressivo compactado do sistema;
Regressivo: Regressi completo do sistema;

Para executar cada teste, basta acessar a máquina virtual e executar o respectivo Job no Jenkins, conforme orientação abaixo.

### JENKINS
O processo do Jenkins precisa ser executado como um usuário e não como um serviço, para que o ambiente de desktop correto seja alocado. Isso significa que o Jenkins deve executar o cmd na inicialização.

1 - Realizar download no link abaixo:

https://www.jenkins.io/download/ (Generic Java package (.war));

2 - Criar uma pasta no c: "Jenkins" e mover o pacote "jenkins.war" para essa pasta;

3 - Abrir o cmd:

java -jar jenkins.war --httpPort=8080

4 - Abrir o browser e entrar no seguinte endereço "http://localhost:8080/";
- Instalar os principais plugins;
- Instalar o plugin "Robot Framework plugin";

5 - Configurar um job; 
Baixar o código da automação (GitHub);

6 - Ir em "Manage Jenkins" -> "Script Console":

Link de apoio: https://wiki.jenkins.io/JENKINS/Configuring-Content-Security-Policy.html

Unset the header:

E inserir o comando abaixo:

System.setProperty("hudson.model.DirectoryBrowserSupport.CSP", "")

Clicar em Run em seguida.

7 - Ir no recurso "General" dentro da Job:

Marcar o check box "Use custom workspace?";
Informar o diretório "C:\Automacao\RobotFrameWork" (Exemplo);
Informar o Display Name "AutoSystem-SmokeTeste" (Exemplo);

8 - Ir no recurso "Build Steps" dentro da Job:

Inserir o seguinte passo "Execute Windows batch command" e configurar conforme abaixo:

Exemplo:

cd C:\Automacao\RobotFramework
robot -d .\report .\testcases\desktop\SmokeTest\SmokeTest.robot
echo Completed

8 - Ir no recurso "Post-build Actions" dentro da Job:

Inserir o relatório "Publish Robot Framework test results" e configurar conforme abaixo:

Directory of Robot output "C:\Automacao\RobotFramework\report";
Informar nos campos "Thresholds for build resul" os valores "0.0";

9 - Como executar a Job no Jenkins?

Como iremos trabalhar com a interface grafica (GUI Windows), o RPA Desktop precisa ser executado manualmente e a automação precisa trabalhar alguns fluxo de exceção.

- Suba o Jenkins (cmd):

java -jar jenkins.war --httpPort=8080

- Vá em "Manage Jenkins" > "Jenkins CLI" e baixe o "jenkins-cli.jar";
- Mova o pacote "jenkins-cli.jar" para a seguinte pasta "C:/jenkins";
- Vá em "Manage Jenkins" > "Configure Global Security", dentro de "Authorization" e selecione a opção "Anyone can do anything";
- Abra outro cmd e digite:

> java -jar jenkins-cli.jar -s http://localhost:8080/ build AutoSystem-SmokeTeste

Obs.: "AutoSystem-SmokeTeste" é o nome do Job.

### PRE-REQUISITOS
Visual Studio Code: https://code.visualstudio.com/download

 Plugins:

    Robot Framework Language Server - Robocorp;

    Material Icon Theme;

Python: https://www.python.org/downloads/ - Version: 3.11

RPA Desktop: https://robocorp.com/docs/libraries/rpa-framework/rpa-desktop

RPAFramework-Recognition: https://pypi.org/project/rpaframework-recognition/

Allure-robotframework: https://pypi.org/project/allure-robotframework/

    Baixar e configurar no Path do Windows: https://github.com/allure-framework/allure2/releases (Version: 2.22.0)

       Exemplo: C:\allure-2.22.0\bin -> Variáveis do ambiente -> Variáveis do sistema -> Path

Accessibility Insights For Windows (Inspector from elements): (https://accessibilityinsights.io/downloads/)

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
