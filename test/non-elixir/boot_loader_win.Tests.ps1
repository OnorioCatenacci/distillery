#copy the eex files to the ps1 names
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$testPath = "$here\..\..\priv\templates"

$template = "$testPath\boot_loader_win.ps1.eex"
cp $template "$testPath\boot_loader_win.ps1"
$sut = "$testPath\boot_loader_win.ps1"

. "$sut"
 
Describe "distillery" {
    It "Should Be Able To Find A Service By Name" {
	Test-ServiceIsInstalled "eventlog" | Should Be $true
    }

    It "Should Not Find A Non-existent Service" {
	Test-ServiceIsInstalled "NoSuchService" | Should Be $false
    }

    It "Should Be Able To Find A Binary By Name"{
	Get-BinaryByName "calc" | Should Be "c:\Windows\system32\calc.exe"
    }

    It "Should Return A Special Constant When A Binary Cannot Be Found" {
	Get-BinaryByName "nosuchbin" | Should Be $binaryNotFound
    }
}
