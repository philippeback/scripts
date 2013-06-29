#!/bin/bash

function usage {
echo Jenkins launchtl controller
echo Usage:
echo ------
echo    start - start jenkins
echo		stop	- stop jenkins
}

function start_it {
echo Starting Jenkins
sudo launchctl load /Library/LaunchDaemons/org.jenkins-ci.plist
}

function stop_it {
echo Stopping Jenkins
sudo launchctl unload /Library/LaunchDaemons/org.jenkins-ci.plist
}

if [ -z "$1" ]; then
	OPTIONS="start stop"

	echo Jenkins Controller
	echo ==================
	echo Select a number

	select opt in $OPTIONS; do
		echo "opt is $opt"

		if [ "$opt" = "start" ]; then
			start_it
			exit
		elif [ "$opt" = "stop" ]; then
			stop_it
			exit
		else
			usage
		fi
	done
else
	if [ "$1" = "start" ]; then
		start_it
	elif [ "$1" = "stop" ]; then
		stop_it
	else
		usage
	fi
fi
