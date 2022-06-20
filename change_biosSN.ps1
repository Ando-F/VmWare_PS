Import-Module VMware.VimAutomation.Core

## $vCenter = "Имя vCenter"
##Connect-VIserver $vCenter

$VMs = "имя_VM1", "имя_VM2"

$spec = New-Object VMware.Vim.VirtualMachineConfigSpec

foreach ($vm in $VMs)
{
If (Get-VM $vm -ErrorAction SilentlyContinue )
{
$trueVM = Get-VM $vm
If ($trueVM.PowerState -ne 'PoweredOn')
{
$Uuid = ""
For ($i = 0; $i -lt 2; $i++){
If ($i -eq 1){
$Uuid += " "
}

For ($j = 0; $j -lt 8; $j++){
$CE = "{0:X}" -f (Get-Random -Minimum 0 -Maximum 255)

If ($CE.Length -eq 1){
$CE = "0$CE"
}

$Uuid += $CE

If ($j -ne 7){
$Uuid += " "
}
}
}
$spec.uuid = $UUid
$trueVM.Extensiondata.ReconfigVM_Task($spec) | Out-Null
write-host "$trueVM new BIOS SN = $Uuid" -ForegroundColor Green
}
else {Write-Host VM $trueVM is PoweredON !!! -ForegroundColor Yellow}
}
else {Write-Host VM $vm is not exists -ForegroundColor Red }
}
