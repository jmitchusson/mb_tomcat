default['packs'] = ['java-1.8.0-openjdk-devel.x86_64', 'wget', 'unzip', 'firewalld']

default['tom_sysd_file'] = '/etc/systemd/system/tomcat.service'
default['nec_dirs'] = ['/tmp/tomcat_install', '/tmp/tomcat_systemd', '/opt/tomcat']

default['user']['name'] = 'tomcat'
default['user']['shell'] = '/bin/false'
default['user']['home'] = '/opt/tomcat'

default['root_owner'] = 'root'
default['root_group'] = 'root'
default['perm_wwr'] = '662'
default['perm_xxx'] = '775'
