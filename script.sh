#!/usr/bin/env bash
# save this file to the folder you have 'cs_sushi.c' stored in 
# to be able to run this script, you'll first need to run "chmod +x script.sh" in terminal
# then to run the tests enter in terminal: "./script.sh"

# NOTE THIS IS ONLY FOR TESTING AGAINST REFERENCE OUTPUT, IT WILL NOT WORK IF YOU PROGRAM DOESN'T COMPILE
# ALSO MAKE SURE YOU HAVE COMPILED YOUR PROGRAM (e.g. "dcc cs_sushi.c -o cs_sushi")BEFORE RUNNING THE SCRIPT 
# AND MAKE SURE THE EXECUTABLE FILE NAME IS "cs_sushi"


#colour constants for echo output
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;35m'
CYAN='\033[1;34m'
NC='\033[0m' 

MY_SOLUTION='./cs_sushi'
REFERENCE_SOLUTION='1511 cs_sushi'

for test_file in cs_sushi_tests/*; do

    TEST_INPUT=$(cat $test_file)

    # outputs from the two different programs
    MY_OUTPUT=$($MY_SOLUTION < $test_file)
    REFERENCE_OUTPUT=$($REFERENCE_SOLUTION< $test_file)

    if [ "$MY_OUTPUT" = "$REFERENCE_OUTPUT" ]; then
        echo -e "Autotest for $test_file: ${GREEN}passed!(yay) ${NC}"
    else
        echo -e "Autotest for $test_file: ${RED}failed:(${NC}"
        echo -e "${BLUE}<------------------------------------------------------------------>${NC}"
        echo -e "${BLUE}Output from your program: ${NC}"
        echo " "
        echo $"$MY_OUTPUT"
        echo " "
        echo -e "${BLUE}Output from reference solution: ${NC}"
        echo " "
        echo $"$REFERENCE_OUTPUT"
        echo " "
        echo -e "${BLUE}The input for this test was: ${NC}" 
        echo " "
        echo $"$TEST_INPUT"
        echo -e "${BLUE}<------------------------------------------------------------------>${NC}"
    fi

done

echo " "
echo -e "${CYAN}Tests done! ${NC}"
