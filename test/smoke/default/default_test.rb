#Test if java 8 is installed
describe command ('java -version 2>&1') do
  its('stdout') { should match /1\.8\.0/ }
end


#test if tomcat user exist, shell set, home dir set, and group set
describe user ('tomcat')do
  it { should exist }
  its('home') { should eq '/opt/tomcat' }
  its('shell') { should eq '/bin/false'}
  its('group') { should eq 'tomcat' }
end


#Test if tomcat is set to correct home dir
describe file ('/opt/tomcat/apache-tomcat-9.0.30') do
  it { should exist }
end

#Test if correct permissions are set on tomcat home dir
describe directory ('/opt/tomcat') do
  its('owner') { should eq 'tomcat' }
  its('group') { should eq 'tomcat' }
end


#Test to confirm the status of tomcat
describe service ('tomcat') do
  it { should be_enabled }
  it { should be_running }
end

#Test if war has been deployed
describe file('/opt/tomcat/apache-tomcat-9.0.30/webapps/sample.war') do
  it { should exist }
end

#Test if port 8080 is available for http request
describe command ('sudo lsof -nP -iTCP -sTCP:LISTEN') do
  its('stdout')  { should match /8080/ }
end



