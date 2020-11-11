RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'

echo -e "${BLUE}\n#########################################"
echo -e "~~~~~~~~~~~~~~~~~ Tests ~~~~~~~~~~~~~~~~~"
echo -e "#########################################\n${NC}"

for test in ./test/input/*; do
    # Print file name as test name
    printf "${BLUE} TEST: "
    echo $test | cut -f4 -d "/"
    printf "${NC}"
    echo

    # Run test and redirect stdin to output file
    ./common $(cat $test) > ${test/input/output}

    # Compare output and expected files
    diff --color ${test/input/output} ${test/input/expected}
    diff_return=$?
    one=1
    # Test results
    if [ $diff_return == $one ]
    then
        printf "${RED} FAILED: Bad output ${NC}"
    else
        printf "${GREEN} OK ${NC}"
    fi
    echo
    echo -e "\n-------------------------------------\n" 
done