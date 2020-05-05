# commands for doctl digital ocean command line api tool 

# authentificate with PAT
doctl auth init

# listing public images 
doctl compute image list --public -o "json"
# getting the list in an obkect to be parsed 
$MyObjDOImageList = doctl compute image list --public -o "json"  | ConvertFrom-Json
# parsing the object on "CentOS" distributions
$MyObjDOImageList | Where-Object -property Distribution -Match "CentOS"