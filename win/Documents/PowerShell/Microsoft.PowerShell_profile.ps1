$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

Import-Module PSKubectlCompletion
Register-KubectlCompletion

$Env:KUBE_EDITOR = 'code -w'

Set-Alias g git
Set-Alias ll ls
Set-Alias vi vim
Set-Alias bz bazelisk
Set-Alias bazel bazelisk

Import-Module PSReadLine
Set-PSReadlineOption -EditMode vi
Set-PSReadLineOption -ViModeIndicator Cursor

oh-my-posh init pwsh --config ~/.oh-my-posh/ch3cho.minimal.json | Invoke-Expression
Import-Module posh-git

Import-Module ZLocation

$Policy = Get-ExecutionPolicy
Set-ExecutionPolicy Bypass -Scope Process
. "$(Split-Path -Path $PROFILE)\kubectl_aliases.ps1"
Set-ExecutionPolicy $Policy -Scope Process

function j([string] $version) {
    $JAVA_HOME = ""
    Switch ($version) {
        "8" {
            $JAVA_HOME = "c:\Program Files\AdoptOpenJDK\jdk-8.0.282.8-hotspot";
            break;
        }
        "11" {
            $JAVA_HOME = "c:\Program Files\AdoptOpenJDK\jdk-11.0.4.11-hotspot";
            break;
        }
        "17" {
            $JAVA_HOME = "c:\Program Files\AdoptOpenJDK\jdk-17.0.6+10";
            break;
        }
        "21" {
            $JAVA_HOME = "c:\Program Files\AdoptOpenJDK\jdk-21.0.6+7"
            break;
        }
        "24" {
            $JAVA_HOME = "c:\Program Files\AdoptOpenJDK\jdk-24.0.1+9"
            break;
        }
        "g21" {
            $JAVA_HOME = "c:\Program Files\AdoptOpenJDK\graalvm-jdk-21.0.3+7.1"
            break;
        }
        "g24" {
            $JAVA_HOME = "f:\Software\JDK\graalvm-jdk-24+36.1"
            break;
        }
        default {
            Write-Host "Unsupported Java version: " + $version
            return;
        }
    }
    $env:JAVA_HOME = $JAVA_HOME
    $env:PATH = $JAVA_HOME + "\bin;" + $env:PATH
    echo "JAVA_HOME=$JAVA_HOME"
}

function m([string] $version) {
    $M2_HOME = ""
    Switch ($version) {
        "339" {
            $M2_HOME = "d:\Tools\apache-maven-3.3.9\";
            break;
        }
        "385" {
            $M2_HOME = "d:\Tools\apache-maven-3.8.5\";
            break;
        }
        "386" {
            $M2_HOME = "d:\Tools\apache-maven-3.8.6\";
            break;
        }
        "398" {
            $M2_HOME = "d:\Tools\apache-maven-3.9.8\";
            break;
        }
        default {
            Write-Host "Unsupported Maven version: " + $version
            return;
        }
    }
    $env:M2_HOME = $M2_HOME
    $env:PATH = $M2_HOME + "\bin;" + $env:PATH
    echo "M2_HOME=$M2_HOME"
}

