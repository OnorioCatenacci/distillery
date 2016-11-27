<#

  .Synopsis
  Finds the installation of the erlang runtime system.

  .Example
    #Find the directory for the erlang runtime system. Returns a special value if it's not found.
    Find-ErlBinDir

  .Author
  Onorio Catenacci
 
  .License
  MIT

#>

Set-Variable -Name ErlangShellExe -Option Constant -Value "erl.exe"
Set-Variable -Name ErlDirNotFound -Option Constant -Value "Erlang Binary Directory Not Found"

function Find-ErlBinDir{
  try
  {
    $d = Get-ChildItem "/$($ErlangShellExe)" -Recurse | Select-Object -ExpandProperty "DirectoryName"
    if ($d -eq $null) 
    {
        $ErlDirNotFound
    } 
    else
    {
        $d
    }
  }
  catch 
  {
    $ErlDirNotFound
  }
}
 

function FindErtsBinDir{
    if(Find-ErlBinDir -ne $ErlDirNotFound) {
    }
    }

# SIG # Begin signature block
# MIIFwQYJKoZIhvcNAQcCoIIFsjCCBa4CAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUSZC/3o247UXLOB0Tg4UvFKf9
# Ko2gggNKMIIDRjCCAi6gAwIBAgIQVKgVAPgb1JNGLs1dt71ggTANBgkqhkiG9w0B
# AQsFADAsMSowKAYDVQQDEyFQb3dlclNoZWxsIExvY2FsIENlcnRpZmljYXRlIFJv
# b3QwHhcNMTYxMTI3MjA0MjMxWhcNMzkxMjMxMjM1OTU5WjAaMRgwFgYDVQQDEw9Q
# b3dlclNoZWxsIFVzZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDJ
# mRbYcaqp/ZzV9ZHw5BrmlgvWKMxMYCpiMmjEHXpAn7rPoL3TkWGfoN4CRQsZ3T5S
# 04YkjwdND9ZJW9099OWnjdFBLLQad6wIdsAZyjxHyOIjWG6VDE2wI17cVBQ0mFuj
# bRHHcd2/DwYZnNWSX0mOd7UKAkPCawlgMg7kTkZtz8AnjPgPeWSIE2Ig5K+O/CI+
# pxRBk2T0BgQnq1QNAKePScMj3vOXHamN0b4hqro10mFxn4GIZ0hlEtXEfWavBcQp
# ZognbSsCFYQJlZ3uhSQQfJdM6N1WsF88a1nJoPPURCQfT+zt9ut84iyE5hMGlH5J
# HvcaeRRvMCYTvHsdh2eTAgMBAAGjdjB0MBMGA1UdJQQMMAoGCCsGAQUFBwMDMF0G
# A1UdAQRWMFSAEI/EaL8bSnl0x22F3sEOIbyhLjAsMSowKAYDVQQDEyFQb3dlclNo
# ZWxsIExvY2FsIENlcnRpZmljYXRlIFJvb3SCEJChIECc9yOVS7zo0F7lsfkwDQYJ
# KoZIhvcNAQELBQADggEBABWrd8fmnFjhY1RURtjojAeDDxni10EV3YvOd+pRiqDE
# Ry7ZA530BJSWHllaHEhQ18rxZR0FpsXlfKk48yxcLflX+zVBGCYTzkBRO92esliI
# ecIRmoCRlBRm2zh+JfIRwmo0VTd1BNlaJ6c6979nNgU0AmufBSLWmqNsRsbIrOZr
# e3NYZoN36/Gfru+qm0wSEM0sde30S9rdy6Z8AkeXmjVVs42/eRfkDv49Gwrd26Yv
# LxYYwWUZKkRqTGQQRPVZAHlaLZiPEQtzlq88nglwi+VebWObTnJFed2mKzJhqpb7
# RjLd6aJ/szNjft2FGEd2ik7sfAO+c605HwSTh27z86gxggHhMIIB3QIBATBAMCwx
# KjAoBgNVBAMTIVBvd2VyU2hlbGwgTG9jYWwgQ2VydGlmaWNhdGUgUm9vdAIQVKgV
# APgb1JNGLs1dt71ggTAJBgUrDgMCGgUAoHgwGAYKKwYBBAGCNwIBDDEKMAigAoAA
# oQKAADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgorBgEEAYI3AgELMQ4w
# DAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQUlyZbp03cv6uY8Wd488km2w0G
# C2EwDQYJKoZIhvcNAQEBBQAEggEAbn0cm8pZOZkRAVCmOQWL4TkMDNRvQH7MgQZM
# OaASLsi0W3+VZu3VvfYnjcVlOa7pYDOQvnB9QoxEcLw9v+YyDz24TGTAW83fOwFU
# 3unFs+XPLYwUdYygvxdHQ0we0HuX7mCbr1FGUBtVCgoeo5X/9cDRIv9SY8ZOINsw
# AEizOv+Hj77kjGGlNqI0Uur5Gqo0+rmi2L8lo+k6YCDux30SgZwA1U5/u2SJyawP
# y6hRICGOtvDocFh7Zh+lS9niPuQx50XjMnoleiDXEvKsYsnFouF/9ywHy43hhHH0
# 76VGn69uA4COG3P3lkAz6sSm9jSdRHQAhCZj9OkqhOTqGZf2Fw==
# SIG # End signature block
