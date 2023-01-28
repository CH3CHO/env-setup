Function Download {
    Param (
        [Parameter(Mandatory=$true)][string]$Uri,
        [Parameter(Mandatory=$true)][string]$Folder,
        [Parameter(Mandatory=$false)][switch]$Run,
        [Parameter(Mandatory=$false)][string]$Extract)
    $OutFile = "$Folder\$(Split-Path -Path $uri -Leaf)"
    Invoke-WebRequest $Uri -OutFile $OutFile
    if ($Run) {
        Start-Process $OutFile
        return
    }
    if ($Extract) {
        Expand-Archive $OutFile -DestinationPath $Extract
        return
    }
}

# Setup context variables
$WORKING_DISK = "D:"
$DOWNLOADS_FOLDER = "$WORKING_DISK\Downloads"
$TOOLS_FOLDER = "$WORKING_DISK\Tools"

# Install oh-my-posh
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://ohmyposh.dev/install.ps1'))

# Install Scoop
Set-ExecutionPolicy RemoteSigned -scope CurrentUser;
$env:SCOOP = "$TOOLS_FOLDER\scoop"
[Environment]::SetEnvironmentVariable('SCOOP', $env:SCOOP, 'User')
Invoke-Expression "& {$(Invoke-RestMethod get.scoop.sh)} -RunAsAdmin"
scoop update
scoop bucket add extras

# Install applications via Scoop
scoop install autohotkey
scoop install dnGrep
scoop install everything
scoop install gsudo
scoop install irfanview

# Install JDKs
Download https://github.com/adoptium/temurin8-binaries/releases/download/jdk8u302-b08.1/OpenJDK8U-jdk_x64_windows_hotspot_8u302b08.msi -Run 
Download https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.14.1%2B1/OpenJDK11U-jdk_x64_windows_hotspot_11.0.14.1_1.msi -Run

# Install Apache Tomcats
Download https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.92/bin/apache-tomcat-7.0.92.zip $DOWNLOADS_FOLDER -Extract "$TOOLS_FOLDER"
Download https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.32/bin/apache-tomcat-8.5.32.zip $DOWNLOADS_FOLDER -Extract "$TOOLS_FOLDER"

# Install Apache Maven
Download https://dlcdn.apache.org/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.zip $DOWNLOADS_FOLDER -Extract "$TOOLS_FOLDER"

Start-Process http://github.com/PowerShell/PowerShell/releases/latest
Start-Process https://github.com/genzj/pybingwallpaper/releases/latest