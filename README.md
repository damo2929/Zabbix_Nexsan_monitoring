# Zabbix_Nexsan_monitoring
this is monitoring for Nexsan storage systems using the management API.

Nexsan provide and API to interactive With the storage array and as such we are going to use that API to provide monitoring.  
Because the API is a text based API on a non standard protocol we use I'd expect scripts to provide the logging functionality and the command issues needed to interact .

Require the following pass to it to operate the script
*	IP address 
*	Username 
*	Password 
*	monitored subsystem

This will provide a colon separated list of results we can use after some processing is it Json data set.  
This data set can then be used by low level discovery to create monitoring items as well as provide the data needed by those monitoring items.  To clean up the data set ee need to run a regular expression to filter lines beginning with the monitored subsystem we are looking for this will filter off control characters and information that whould cause problems with converting the dataset into json format which is the next step of the processing.  


Level discoveries provided by replacing some of the Jason data with a low level discovery macro, this macro is then used to find the monitoring items as such the system will automatically scale to the size of the storage array.  
the template will provide mappings for text elements returned from the API two numeric versions for storage in zabbix this is to reduce the amount of data being stored .
Volume Maps are provided to give meaning to the numbers.  

all monitored items derived from the data sets are created as dependent items and as such will be updated when the the script is polled, also because the lld function is attached to the same parent item new items will be added at the same time.


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
