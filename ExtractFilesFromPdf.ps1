# powershellscript to extract images from a pdf
# this will do the following 
# 1. unlock the locked.pdf pdf and save it as .\unloncked\locked_unlocked.pdf unlocked pdf
# 2. extract the images from .\unlocked\locked_unlocked.pdf pdf and put them in .\unlocked\locked_unlocked\ folder
# 3. zip the images folder and save the ziped file as .\unlocked\images\locked_unlocked.zip
# 4. delete the .\unlocked\locked_unlocked\ folder with extracted images.

param($fullpathfile)

# 0. extract path and filename 
$filepath = Split-Path -Path $fullpathfile -Parent
$FileName = Split-Path -Path $fullpathfile -LeafBase 
$fileExtension = Split-Path -Path $fullpathfile -Extension


# 1. unlock the locked.pdf pdf and save it as .\unloncked\locked_unlocked.pdf unlocked pdf
# creates the uncrypted path folder if not exists
$uncrypted = "uncrypted"
$uncryptedfolderpath = -join ($filepath,"\",$uncrypted)
$uncryptedfilename = -join ($FileName,"_",$uncryptedfoldername,$fileExtension)
$uncryptedfilefullpath = -join ($uncryptedfolderpath,"\",$uncryptedfilename)


if (!(Test-Path $uncryptedfolderpath -PathType Container)) {
    New-Item -ItemType Directory -Force -Path $uncryptedfolderpath
}


# unlocking
$params = -join('-q#-dNOPAUSE#-dBATCH#-sDEVICE=pdfwrite#-sOutputFile="',$uncryptedfilefullpath,'"#-c .setpdfwrite#-f "',$fullpathfile,'"')
$prms = $params -split '#'
& gswin64.exe $prms

$params = $prms -join " "