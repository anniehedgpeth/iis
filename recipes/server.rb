#
# Cookbook:: iis
# Recipe:: server
#
# Copyright:: 2017, The Authors, All Rights Reserved.

powershell_script 'Install IIS' do
  code 'Add-WindowsFeature Web-Server'
  action :run
end

file 'C:\inetpub\wwwroot\Default.htm' do
  content "<h1>Hello, world!</h1>
  <h2>ipaddress: #{node['ipadress']}</h2>
  <h2>hostname: #{node['hostname']}</h2>
  <h2>total memory: #{node['memory']['total']}</h2>
  <h2>CPU Mhz: #{node['cpu']['0']['mhz']}</h2>"
end

service 'w3svc' do
  action [:enable, :start]
end
