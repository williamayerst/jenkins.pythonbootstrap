import re       # Regex Module
import requests # CURL webrequest Module

#===========================================================#
#===========================================================#
# Function Definitions                                      #
#===========================================================#
#===========================================================#


# check url ends in "git"
#===========================================================#
def check_giturl(url):
    exp = re.compile('.git$')
    result = exp.search(url)
    if result == None:
        return False
    else:
        return True
    
# get input
#===========================================================#
def get_input():
    global repo_name
    global repo_url
    global xml_file
    repo_name = input("Enter Repo Name:")
    repo_url = ""
    while check_giturl(repo_url) == False:
        repo_url = input("Enter Repo URL:")
    xml_file = "./default.xml"
   
# sense_check URL
#===========================================================#
def sense_check(repo_name,repo_url,xml_file):
    print ("REPO NAME: " + repo_name)
    print ("REPO URL: " + repo_url)
    print ("XML FILE: " + xml_file)

# GET and copy file to temp
#===========================================================#
def set_xmltemp(repo_name,repo_url,xml_file):
    pass
# copy file
# cp ${XMLFILE,,} ${REPONAME,,}.xml
# replace variable parts with SH params
# sed -i "s_REPOURL_${REPOURL,,}_p" ${REPONAME,,}.xml
# sed -i "s_REPONAME_${REPONAME,,}_p" ${REPONAME,,}.xml


# Push crumb and XML file to Jenkins
#===========================================================#
def create_jenkinspipeline():
    pass
# CRUMB=$(curl -s 'http://xxx:yyy@172.21.248.139:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')
# curl -s -XPOST "http://xxx:yyy@172.21.248.139:8080/createItem?name=${REPONAME}" --data-binary @${REPONAME,,}.xml -H "$CRUMB"  -H "Content-Type:text/xml"


#===========================================================#
#===========================================================#
# App Process                                               #
#===========================================================#
#===========================================================#

get_input()                               # Read input from user for Repo Name, Repo URL
sense_check(repo_name,repo_url,xml_file)  # Repeat back to the user that the details are correct
set_xmltemp(repo_name,repo_url,xml_file) # Replace the local config with the required details
create_jenkinspipeline() # Create the Jenkins pipeline

#===========================================================#
#===========================================================#
# Misc Debug
#===========================================================#
#===========================================================#

# ['ConnectTimeout', 'ConnectionError', 'DependencyWarning', 'FileModeWarning', 'HTTPError', 'NullHandler', 'PreparedRequest', 'ReadTimeout', 'Request', 'RequestException', 'Response', 'Session', 'Timeout', 'TooManyRedirects', 'URLRequired', '__author__', '__build__', '__builtins__', '__cached__', '__copyright__', '__doc__', '__file__', '__license__', '__loader__', '__name__', '__package__', '__path__', '__spec__', '__title__', '__version__', '_internal_utils', 'adapters', 'api', 'auth', 'certs', 'codes', 'compat', 'cookies', 'delete', 'exceptions', 'get', 'head', 'hooks', 'logging', 'models', 'options', 'packages', 'patch', 'post', 'put', 'request', 'session', 'sessions', 'status_codes', 'structures', 'utils', 'warnings']
# response = requests.post(url, data=data)
# r = requests.get('https://api.github.com/events')
# print (r.url)

