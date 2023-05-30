from    testlink import TestlinkAPIClient, TestLinkHelper
from    testlink.testlinkerrors import TLResponseError
import  os.path
from    platform import python_version
from    datetime import datetime
 
#Carrega as variáveis de ambiente para conexão
os.environ ["TESTLINK_API_PYTHON_SERVER_URL"] = "https://testlink.linx.com.br/lib/api/xmlrpc/v1/xmlrpc.php"
os.environ ["TESTLINK_API_PYTHON_DEVKEY"] = "4d83931f022e93983ee8e2ae27ecc2a4"
 
#Nome do Projeto
Projeto = "AutoSystem"
#Nome do Plano de teste
TestPlanName = "MIni Regressivo 3.3.1.102"
#Nome da build que esta rodando
BuildName = "Mini Regressivo 3.3.1.102"
#nota que pode ser adicionada ao rodar
Note = "Teste automatizado executado via Robot Framework e integração via TestLink"
#sobreescrever o teste ou adicionar na lista
OverWrite = True
#Chave do usuario
DevKey = "4d83931f022e93983ee8e2ae27ecc2a4"
#Usuario
user = "robot.postautosi"
# URL da api do testlink
UrlTestLink = 'https://testlink.linx.com.br/lib/api/xmlrpc/v1/xmlrpc.php'
TimeExec = '1'
 
def update_Status_TestCase(TestCaseName, Status):
 
    tl_helper = TestLinkHelper()
    myTestLink = tl_helper.connect(TestlinkAPIClient)
 
    DateExec = datetime.today().strftime('%Y-%m-%d %H:%M:%S')
 
    TestPlan = myTestLink.getTestPlanByName(Projeto, TestPlanName)
    TestPlanID = TestPlan[0]['id']
    Test = myTestLink.getTestCaseIDByName(TestCaseName)
    TestCaseID = Test[0]['id']
    TCExternalID = Test[0]['tc_external_id']
 
    newResult = myTestLink.reportTCResult(
                       TestCaseID,
                       TestPlanID,
                       BuildName,
                       Status,
                       Note,
                       user=user,
                       overwrite=OverWrite
                       )