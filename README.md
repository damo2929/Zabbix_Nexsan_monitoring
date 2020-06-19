# Zabbix_Nexsan_monitoring
this is monitoring for Nexsan storage systems using the management API.

requirements
* zabbix 4.4 +
* expect
* netcat

place nexsan.sh in you external scripts folder as defined in the zabbix configuration.

import the values maps 1st 
import the template

attach the tamplate to a host and set macros
{$USERNAME}
{$PASSWORD}

and it should all start working.

enjoy.
