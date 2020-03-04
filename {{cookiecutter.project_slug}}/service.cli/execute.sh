#!/bin/sh
cd "$(dirname "$0")"

# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -o errexit
set -o nounset
IFS=$(printf '\n\t')

# ----------------------------------------------------------------
# This script shall be modified according to the needs in order to run the service
# The inputs defined in docker/inputs.json are available as env variables by their key in capital letters
# For example: input_1 -> $INPUT_1
# call stack:
# run.sh -> do_run.bash -> execute.bash

cd /home/scu/{{ cookiecutter.project_package_name }}
# put the code to execute the service here
# and default all outputs to $LOG_FILE
# For example: java someJavaClass >> $LOG_FILE
ls -al >> "$LOG_FILE"

# then retrieve the output and move it to the $OUTPUT_FOLDER
# as defined in the output labels
# For example: cp output.csv $OUTPUT_FOLDER or to $OUTPUT_FOLDER/output.json using jq
#TODO: Replace following
cat > "${OUTPUT_FOLDER}"/output.json << EOF
{
{%- for i in range(cookiecutter.number_of_outputs|int) -%}
{%- if i > 0 -%},{%- endif %}
    "output_{{ i+1 }}":"some_stuff"
{%- endfor %}
}
EOF
