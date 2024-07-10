#! /bin/bash

readonly INPUT_PATH=$1
readonly OUTPUT_PATH=$2
readonly FILE_EXTENSION=$3

if [ $# -eq 0 ]; then
    >&2 echo "ERROR: No arguments provided"
    echo "proper usage: ./run_demo_pipeline.sh INPUT_PATH OUTPUT_PATH FILE_EXTENSION"
    exit 1
fi

if [[ -z "$INPUT_PATH" ]]; then
    echo "ERROR: INPUT_PATH required"
    echo "proper usage: ./run_demo_pipeline.sh INPUT_PATH OUTPUT_PATH FILE_EXTENSION"
    exit 1
fi

if [[ -z "$INPUT_PATH" ]]; then
    echo "ERROR: INPUT_PATH required"
    echo "proper usage: ./run_demo_pipeline.sh INPUT_PATH OUTPUT_PATH FILE_EXTENSION"
    exit 1
fi
cd "${INPUT_PATH}"

find . -type f  -name "*${FILE_EXTENSION}" \
    -exec docker run \
    -e INPUT_FILENAME={} \
    -v "${INPUT_PATH}":/input_directory \
    -v "${OUTPUT_PATH}":/out \
    -e USER_ID=$(id -u) \
    -e GROUP_ID=$(id -g) \
    --rm --name demo_pipeline ghcr.io/asam-ev/qc-framework:demo-pipeline-latest \;
