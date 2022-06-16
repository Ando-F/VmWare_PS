HA failed events
Перед использованием скрипта необходимо загрузить функцию: Get-VieventPlus.ps1

$entity = Get-Folder Datacenters
$start = (Get-Date).AddDays(-5) 
$Recurse = $false
#$eventTypes = "com.vmware.vc.ha.VmRestartedByHAEvent" 
$eventTypes = "VmFailoverFailed"
Get-VIEventPlus -Entity $entity -Start $start -EventType $eventTypes |
  Select @{N="VM";E={$_.Vm.Name}},@{N="ESXi";E={$_.Host.Name}}, CreatedTime  |
  Sort CreatedTime -Descending
