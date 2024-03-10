#!/bin/bash

TESTER="ft_nmTester/sh/nm_tester.sh" 
NAME="ft_nm"
TESTER_LOGS="tester_logss"
VALGRIND_OPT=0
BONUS_OPT=0
VERBOSE_OPT=0

check_output_log() {
	CMD_TEST="$1"
	OPT_TEST="$2"

	if [ ${VERBOSE_OPT} -eq 1 ]; then
		cat ${TESTER_LOGS}
	fi

	cat ${TESTER_LOGS} | grep "KO" > /dev/null
	if [ $? -eq 0 ]; then
		display_color_msg ${RED} "test ${CMD_TEST} ${OPT_TEST}  failed"
		exit 1
	else
		display_color_msg ${GREEN} "test ${CMD_TEST} ${OPT_TEST} passed"
	fi
	rm ${TESTER_LOGS}
}

call_tester() {
	${TESTER} ${NAME} ${VALGRIND_OPT} $1 $2 > ${TESTER_LOGS}
	check_output_log ${NAME} $1
}


display_help() {
	if [ -z $1 ] || ([ ! -z $1 ] && [ "$1" == "-h" ]); then
		display_color_msg ${LIGHT_MAGENTA} "Usage: ./call_tester.sh [valgrind_opt] [bonus_opt] [verbose_opt]"
		display_color_msg ${LIGHT_MAGENTA} "Default: set one option to 1 to enable it, other or empty/another value to disable it\n./call_tester -h or without args to display this message"
	fi
}

check_args() {

	if [ ! -z $1 ]; then
		if [ "${1}" == 1 ]; then
			display_color_msg ${LIGHT_CYAN} "Valgrind test enabled"
			VALGRIND_OPT=1
		fi
	fi

	if [ ! -z $2 ]; then
		if [ "${2}" == 1 ]; then
			display_color_msg ${LIGHT_CYAN} "Bonus test enabled"
			BONUS_OPT=1
		fi
	fi

	if [ ! -z $3 ]; then
		if [ "${3}" == "1" ]; then
			display_color_msg ${LIGHT_CYAN} "Verbose mode enabled"
			VERBOSE_OPT=1
		fi
	fi
}

init_call_tester() {
	display_help "$@"
	if [ ! -f ${NAME} ]; then
		make
	fi
	./rsc/mk/ascii.sh "tester"
	check_args "$@"
}

real_call_tester() {
	init_call_tester "$@"
	${TESTER} ${NAME} ${VALGRIND_OPT} > ${TESTER_LOGS}
	check_output_log ${NAME} ""
	if [ ${BONUS_OPT} -eq 1 ]; then
	# uggly case to compile bonus if needed
		make bonus || print ""
		call_tester "" ""
		call_tester "-p" "-p"
		call_tester "-r" "-r"
		call_tester "-u" "-u"
		call_tester "-g" "-g"
		call_tester "-a" "-a"
		call_tester "-rp" "-rp"
		call_tester "-ru" "-ru"
		call_tester "-pu" "-pu"
		call_tester "-rpu" "-rpu"
		call_tester "-gu" "-gu"
		call_tester "-gp" "-gp"
		call_tester "-gr" "-gr"
		call_tester "-grpu" "-grpu"
	fi
}