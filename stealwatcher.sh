#!/bin/bash

#Check for dependencies and install them quietly
dpkg -l | grep -qw whois || sudo apt install whois -yy 2>&1 >/dev/null

NAME_TO_CHECK="$1"
DATE_FILTER="$2"

EXTENSION_FILE="extensions.txt"
TMPDIR='/tmp/stealwatcher'
REPORT_FILE="${TMPDIR}/report_${NAME_TO_CHECK}.txt"
WHOIS_FILTER='Creation'

# if the argument DATE_FILTER is empty ( is not entered as the second argument ), then, affect the actual date to the variable

init_datefilter(){
	if [[ -z ${DATE_FILTER} ]]
	then
		DATE_FILTER=$(date +"%Y")
	fi
}

#if -e -> Exist ?   if ! -e -> exist pas ? 

init_workplace(){
	if [[ ! -e ${TMPDIR} ]]
	then
		echo "${TMPDIR} doesnt exist"
		mkdir ${TMPDIR}
		echo" creating ${TMPDIR} for you..." 
	else
		if [[ ! -d ${TMPDIR} ]]
		then
			echo "Alert: ${TMPDIR} exists and is a file"
			exit 1
		else
			echo "${TMPDIR} exists and is a directory ... nice ! "
			if [[ -e ${REPORT_FILE} ]]
			then
				echo "Deleting the report file ..."
				rm ${REPORT_FILE}
			else
				echo "${REPORT_FILE} will be created... wait few seconds "
			fi
		fi
	fi
}

gen_infos(){
	for EXTENSION in $(cat ${EXTENSION_FILE})
	do
		whois ${NAME_TO_CHECK}${EXTENSION} > ${TMPDIR}/${NAME_TO_CHECK}${EXTENSION}
	done
}

create_report(){
	for EXTENSION in $(cat ${EXTENSION_FILE})
	do
		CHECK=$(grep -w ${WHOIS_FILTER} ${TMPDIR}/${NAME_TO_CHECK}${EXTENSION} |grep ${DATE_FILTER})

		if [[ -n ${CHECK} ]]
		then
			echo "##### Domain: ${NAME_TO_CHECK}${EXTENSION} has been stealed #####" >> ${REPORT_FILE}
			grep -w ${WHOIS_FILTER} ${TMPDIR}/${NAME_TO_CHECK}${EXTENSION} >> ${REPORT_FILE}
			echo '' >> ${REPORT_FILE}
			echo "$(grep -w "Domain Name:" ${TMPDIR}/${NAME_TO_CHECK}${EXTENSION}) is reported as a new stealthed domain registred the ->  $(grep -w ${WHOIS_FILTER} ${TMPDIR}/${NAME_TO_CHECK}${EXTENSION}) and will be send to the TelegramBot"
		else
			echo "##### Domain: ${NAME_TO_CHECK}${EXTENSION} -> nothing to do ... ##### "
		fi
	done
}

telegram_report(){
	if [[ -e ${REPORT_FILE} ]]
	then
		bash ./telegram-send.sh "$(cat ${REPORT_FILE})"
		echo "sending the report to the Telegram Bot..."
	else
		echo "Nothing to report..."
		exit 0
	fi
}

init_datefilter
init_workplace
gen_infos
create_report
telegram_report
