$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\$sut"
 
Describe "distillery" {
    It "Should Be Able To Find A Service By Name" {
    Get-ServiceByName "eventlog" | Should Be $true
    }

    It "Should Not Find A Non-existent Service" {
	Get-ServiceByName "NoSuchService" | Should Be $false
    }
}
