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
# getting the list in an object to be parsed 
$MyObjDOImageList = doctl compute image list --public -o "json"  | ConvertFrom-Json
# parsing the object on "CentOS" distributions
$MyObjDOImageList | Where-Object -property Distribution -Match "CentOS"
# parsing the object on "Ubuntu" distributions and "LEMP" description
$MyObjDOImageList | Where-Object -property Distribution -Match "Ubuntu" | Where-Object -property Description -match "LEMP"
$MyObjDOImageList | Where-Object -property slug -match "ubuntu-18-04-x64"


# listing available size for server
doctl compute size list -o "json"
# getting the list in an object to be parsed 
$myObjDOimageSize = doctl compute size list -o "json" | ConvertFrom-Json
# parsing the object on images sizes available on FRA1 region, sorted by cost
$myObjDOimageSize | Where-Object -property regions -Match "FRA1" `
                  | where-Object -Property price_hourly -LE 0.1 `
                  | Where-Object -property Memory -GE 1024 `
                  | Sort-Object -Property price_monthly -Descending
                  # the cheaper is $5 monthly

# search cost from image size
$myObjDOimageSize | Where-Object -Property slug -EQ "2Gb" # $20 monthly
