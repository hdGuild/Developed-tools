# commands for doctl digital ocean command line api tool 

# authentificate with PAT
doctl auth init

# listing certificates available for account 
doctl compute ssh-key list -o "json"
#getting the list in an object to be parsed
$myObjDOSSHkeys = doctl compute ssh-key list -o "json" | ConvertFrom-Json
# parsing the object on "Eurynome" name
$myObjDOSSHkeys | Where-Object -property name -match "Eurynome"

# listing public images 
doctl compute image list --public -o "json"
# getting the list in an obkect to be parsed 
$MyObjDOImageList = doctl compute image list --public -o "json"  | ConvertFrom-Json
# parsing the object on "CentOS" distributions
$MyObjDOImageList | Where-Object -property Distribution -Match "CentOS"