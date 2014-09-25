x := Syslog new.

x openlog: 'testlog' option: 3 facility: 8.

x syslog: 0 format: '%s: I am writing to syslog now ', DateAndTime now  asString string: 'PharoVM'.

x closelog.