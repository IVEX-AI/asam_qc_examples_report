# ASAM QC Checker - Examples report generator

This repository contains a simple entry point for the ASAM Standard Quality
Checkers [demo pipeline](https://github.com/asam-ev/qc-framework/tree/develop/demo_pipeline).

## Usage

This section describe the usage of the entry point using the
[OpenDrive examples](https://publications.pages.asam.net/standards/ASAM_OpenDRIVE/ASAM_OpenDRIVE_Specification/latest/specification/_attachments/generated/ASAM_OpenDRIVE_1-8-0_examples_and_use-cases.zip).

```
./run_demo_pipeline.sh \
    /home/user/Downloads/ASAM_OpenDRIVE_1-8-0_examples_and_use-cases \
    $(pwd)/reports/open_drive \
    xodr
```

This will execute the latest demo pipeline docker image for each file in the
given input path and will produce the output that can be found on the
[reports/open_drive](./reports/open_drive/).
