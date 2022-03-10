[CmdletBinding(SupportsShouldProcess)]
param (
    [Parameter(Mandatory)]
    [ValidateScript({ if (Test-Path $_ -PathType Container) { $true } else { Throw '-Source must ba a valid directory' } })]
    [string]
    $Source,

    [Parameter(Mandatory)]
    [ValidateScript({ if (Test-Path $_ -PathType Container) { $true } else { Throw '-Target must ba a valid directory' } })]
    [string]
    $Target
)
Begin {
    if (-Not (Test-Path -Path ${env:ARMA3TOOLS} -PathType Container)) {
        Throw 'Arma 3 Tools not found'
    }
    $cfgConvertExe = Join-Path -Path ${env:ARMA3TOOLS} -ChildPath 'CfgConvert/CfgConvert.exe'
    if (-Not (Test-Path -Path $cfgConvertExe -PathType Leaf)) {
        Throw 'CfgConvert.exe not found'
    }
    $fileBankExe = Join-Path -Path ${env:ARMA3TOOLS} -ChildPath 'FileBank/FileBank.exe'
    if (-Not (Test-Path -Path $fileBankExe -PathType Leaf)) {
        Throw 'FileBank.exe not found'
    }
    $missionFilename = Join-Path $Source -ChildPath 'mission.sqm'
    if (-Not (Test-Path -Path $missionFilename -PathType Leaf)) {
        Throw 'mission.sqm file not found'
    }
    $Source = Resolve-Path $Source.TrimEnd('/\')
}
Process {
    & $cfgConvertExe -bin -dst "$missionFilename" "$missionFilename"
    & $fileBankExe -dst $Target $Source
}