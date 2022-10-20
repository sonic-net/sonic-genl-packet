#
# Regular cron jobs for the genlpacket package
#
0 4	* * *	root	[ -x /usr/bin/genlpacket_maintenance ] && /usr/bin/genlpacket_maintenance
