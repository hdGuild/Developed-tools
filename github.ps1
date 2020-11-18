# github use from API

## get the GitHub API as token
$token = Get-Content -Path "C:\Users\Philippe\.pat\hdguild2github.token"
## use this token t get the github user as json file ("-i" gets the header too)
curl -i -u hdguild:$token  https://api.github.com/user
