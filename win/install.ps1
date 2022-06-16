Start http://github.com/PowerShell/PowerShell/releases/latest
Start https://github.com/genzj/pybingwallpaper/releases/latest
Start https://adoptium.net/temurin/releases?version=8
Start https://adoptium.net/temurin/releases?version=11

Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://ohmyposh.dev/install.ps1'))

$WORKING_DISK = "D:"
$DOWNLOADS_FOLDER = "$WORKING_DISK\Downloads"
$TOOLS_FOLDER = "$WORKING_DISK\Tools"

Set-ExecutionPolicy RemoteSigned -scope CurrentUser;
$env:SCOOP = $WORKING_DISK + "\Tools\scoop"
[Environment]::SetEnvironmentVariable('SCOOP', $env:SCOOP, 'User')
iwr get.scoop.sh | iex
scoop update

scoop bucket add extras

scoop install autohotkey
scoop install dnGrep
scoop install gsudo
scoop install irfanview

iwr https://github.com/adoptium/temurin8-binaries/releases/download/jdk8u302-b08.1/OpenJDK8U-jdk_x64_windows_hotspot_8u302b08.msi -OutFile "$DOWNLOADS_FOLDER\OpenJDK8U-jdk_x64_windows_hotspot_8u302b08.msi"
Start "$DOWNLOADS_FOLDER\OpenJDK8U-jdk_x64_windows_hotspot_8u302b08.msi"
iwr https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.14.1%2B1/OpenJDK11U-jdk_x64_windows_hotspot_11.0.14.1_1.msi -OutFile "$DOWNLOADS_FOLDER\OpenJDK11U-jdk_x64_windows_hotspot_11.0.14.1_1.msi"
Start "$DOWNLOADS_FOLDER\OpenJDK11U-jdk_x64_windows_hotspot_11.0.14.1_1.msi"

iwr https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.92/bin/apache-tomcat-7.0.92.zip -OutFile "$DOWNLOADS_FOLDER\apache-tomcat-7.0.92.zip"
Expand-Archive "$DOWNLOADS_FOLDER\apache-tomcat-7.0.92.zip" -DestinationPath "$TOOLS_FOLDER"
iwr https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.32/bin/apache-tomcat-8.5.32.zip -OutFile "$DOWNLOADS_FOLDER\apache-tomcat-8.5.32.zip"
Expand-Archive "$DOWNLOADS_FOLDER\apache-tomcat-8.5.32.zip" -DestinationPath "$TOOLS_FOLDER"