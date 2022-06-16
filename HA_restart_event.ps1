Получение событий по HA перезапуску ВМ (vSphere HA restarted virtual machine)


Get-VMHost -Location CLUSTER-*** | Get-VM | Get-VIEvent |
  where {$_.FullFormattedMessage -match "vSphere HA restarted virtual machine"} |
  select ObjectName,@{N="IP addr";E={(Get-view -Id $_.Vm.Vm).Guest.IpAddress}},CreatedTime,FullFormattedMessage |
  Export-Csv -Path 'D:\tmp\exportCSV\HA-***.csv' -Delimiter ';' -Encoding UTF8
