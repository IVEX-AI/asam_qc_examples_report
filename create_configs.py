import argparse
import glob
import os

from qc_baselib import Configuration


def args_entrypoint() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        prog="QC Checker - Config creation",
        description="This is a script that create configuration for all target standard files (.xodr, .xosc, ...) in a path.",
    )

    parser.add_argument("-i", "--input_path", required=True)
    parser.add_argument("-b", "--bundle_name", required=True)
    parser.add_argument("-e", "--file_extension", required=True)
    parser.add_argument("-o", "--config_output", required=True)
    parser.add_argument("-r", "--report_path", required=True)

    return parser.parse_args()


def main():
    args = args_entrypoint()
    for xodr_file_path in glob.glob(
        os.path.join(args.input_path, f"**/*.{args.file_extension}"), recursive=True
    ):
        file_name = os.path.basename(xodr_file_path).replace(".xodr", "")

        config = Configuration()

        config.set_config_param(name="XodrFile", value=xodr_file_path)
        config.register_checker_bundle(checker_bundle_name=args.bundle_name)

        report_name = f"{file_name}_report.xqar"
        config.set_checker_bundle_param(
            checker_bundle_name=args.bundle_name,
            name="resultFile",
            value=os.path.join(args.report_path, report_name),
        )

        config_name = f"{file_name}_config.xml"
        config.write_to_file(os.path.join(args.config_output, config_name))


if __name__ == "__main__":
    main()
