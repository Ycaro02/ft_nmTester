#!/bin/bash

source ft_nmTester/sh/color.sh
source ft_nmTester/sh/call_tester_utils.sh

# First args is valgrind 1 for enalbe, other or empty for disable
# Second args is bonus test, 1 for enable, other or empty for disable
# Third args is verbose mode, 1 for enable, other or empty for disable

real_call_tester "$1" "$2" "$3"