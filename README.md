# ASAM QC Checker - Examples report generator

This repository contains a simple set of scripts to generate reports from
standard example files using one of the ASAM Standard Quality Checkers.

## Usage

This section describes the steps to use one of the python checkers with the
scripts in this repository. It uses the [OpenDrive checker](https://github.com/asam-ev/qc-opendrive)
as example.

1. Install python dependencies

```
pip install -r requirements.txt
```

2. Prepare target checker to this folder

```
git clone https://github.com/asam-ev/qc-opendrive.git
cd qc-opendrive
git checkout develop
pip install -r requirements.txt
cd ..
```

3. Run the script to create the configs automatically

```
python create_configs.py \
  -i /home/user/Downloads/ASAM_OpenDRIVE_1-8-0_examples_and_use-cases \
  -e xodr \
  -b xodrBundle \
  -o configs/open_drive \
  -r reports/open_drive
```

4. Execute the checker with the configs

```
./run.sh qc-opendrive $(pwd)/configs/open_drive
```
