#*****All attributes are declared in attributes/for_tomcat.rb*****


#Installs Java 8 and packages needed to install and configure tomcat
node['packs'].each do |pkg|
  package pkg
end

#Configures tomcat user 
user node['user']['name'] do
  shell node['user']['shell']
  home node['user']['home']
end

#Creates download locations for importing cookbook files
node['nec_dirs'].each do |idrs|
  directory idrs
end

#Create empty service control file
#tomcat.service conent will be rdirected here once it is improted
file node['tom_sysd_file'] 

#Import tomcat.service config file
cookbook_file '/tmp/tomcat_systemd/tomcat.service' do
  source 'tomcat.service'
end

#Import install script for tomcat and give required permissions to run script
#See "files/tomcat_install.sh" for details
cookbook_file '/tmp/tomcat_install/tomcat_install.sh' do
  owner node['root_owner']
  group node['root_group']
  mode node['perm_xxx']
end

#Run install script and gaurd against already configured server
execute './tomcat_install.sh' do
  cwd '/tmp/tomcat_install'
  not_if { File.directory?('/opt/tomcat/apache-tomcat-9.0.30') }
end

#Starts and enables tomcat service
service 'tomcat' do
  action [:enable, :start]
end

#Imports war file
cookbook_file '/opt/tomcat/apache-tomcat-9.0.30/webapps/sample.war' do
  source 'sample.war'
end
