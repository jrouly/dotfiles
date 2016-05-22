[fwBasic]
status = enabled
incoming = deny
outgoing = allow
routed = disabled

[Rule0]
ufw_rule = 192.168.1.87 22 ALLOW IN 192.168.1.92 22
description = SSH
command = /usr/sbin/ufw allow in from 192.168.1.92 port 22 to 192.168.1.87 port 22
policy = allow
direction = in
protocol = 
from_ip = 192.168.1.92
from_port = 22
to_ip = 192.168.1.87
to_port = 22
iface = 
routed = 
logging = 

[Rule1]
ufw_rule = 17500 ALLOW IN Anywhere
description = Dropbox
command = /usr/sbin/ufw allow in from any to any port 17500
policy = allow
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 17500
iface = 
routed = 
logging = 

[Rule2]
ufw_rule = 51413 ALLOW IN Anywhere
description = transmission-daemon
command = /usr/sbin/ufw allow in from any to any port 51413
policy = allow
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 51413
iface = 
routed = 
logging = 

[Rule3]
ufw_rule = 9091/tcp ALLOW IN Anywhere
description = transmission-daemon
command = /usr/sbin/ufw allow in proto tcp from any to any port 9091
policy = allow
direction = in
protocol = tcp
from_ip = 
from_port = 
to_ip = 
to_port = 9091
iface = 
routed = 
logging = 

[Rule4]
ufw_rule = 48851/udp ALLOW IN Anywhere
description = transmission-daemon
command = /usr/sbin/ufw allow in proto udp from any to any port 48851
policy = allow
direction = in
protocol = udp
from_ip = 
from_port = 
to_ip = 
to_port = 48851
iface = 
routed = 
logging = 

[Rule5]
ufw_rule = 17500 (v6) ALLOW IN Anywhere (v6)
description = Dropbox
command = /usr/sbin/ufw allow in from any to any port 17500
policy = allow
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 17500
iface = 
routed = 
logging = 

[Rule6]
ufw_rule = 51413 (v6) ALLOW IN Anywhere (v6)
description = transmission-daemon
command = /usr/sbin/ufw allow in from any to any port 51413
policy = allow
direction = in
protocol = 
from_ip = 
from_port = 
to_ip = 
to_port = 51413
iface = 
routed = 
logging = 

[Rule7]
ufw_rule = 9091/tcp (v6) ALLOW IN Anywhere (v6)
description = transmission-daemon
command = /usr/sbin/ufw allow in proto tcp from any to any port 9091
policy = allow
direction = in
protocol = tcp
from_ip = 
from_port = 
to_ip = 
to_port = 9091
iface = 
routed = 
logging = 

[Rule8]
ufw_rule = 48851/udp (v6) ALLOW IN Anywhere (v6)
description = transmission-daemon
command = /usr/sbin/ufw allow in proto udp from any to any port 48851
policy = allow
direction = in
protocol = udp
from_ip = 
from_port = 
to_ip = 
to_port = 48851
iface = 
routed = 
logging = 

