#! /bin/bash

readonly PYTHON_CHECKER_PATH=$1
readonly CONFIGS_PATH=$2

if [ $# -eq 0 ]; then
    >&2 echo "ERROR: No arguments provided"
    echo "proper usage: ./run.sh PYTHON_CHECKER_PATH CONFIG_PATH"
    exit 1
fi

if [[ -z "$PYTHON_CHECKER_PATH" ]]; then
    echo "ERROR: PYTHON_CHECKER_PATH required"
    echo "proper usage: ./run.sh PYTHON_CHECKER_PATH CONFIG_PATH"
    exit 1
fi

if [[ -z "$CONFIGS_PATH" ]]; then
    echo "ERROR: CONFIGS_PATH required"
    echo "proper usage: ./run.sh PYTHON_CHECKER_PATH CONFIG_PATH"
    exit 1
fi

cd "${PYTHON_CHECKER_PATH}"

find "${CONFIGS_PATH}" -type f \
    -exec python main.py -c {} \;
