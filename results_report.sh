#!/bin/bash

set -euo pipefail

readonly tmp_results_report_dir="$1"
readonly target_dir="$2"
readonly report_output_dir="${target_dir}/results"

. shared.sh

all_results() {
    find "${tmp_results_report_dir}" -type d -depth 1 -print0 | xargs -0 -n1 basename | sort
}

tool_results_for_query() {
    local query="$1"
    find "${tmp_results_report_dir}/${query}" -type f -depth 1 -print0 | xargs -0 -n1 basename | sort
}

compile_result_report() {
    local query
    local tool

    while IFS= read -r query; do
        {
            echo "## $(pretty_query_name "$query")"
            echo

            while IFS= read -r tool; do
                echo "### $(pretty_tool_name "$tool")"
                echo
                pre_block < "${tmp_results_report_dir}/${query}/${tool}"
                echo
            done <<< "$(tool_results_for_query "$query")"
        } > "${report_output_dir}/${query}.md"
    done <<< "$(all_results)"
}

main() {
    rm -rf "$report_output_dir"
    mkdir -p "$report_output_dir"

    compile_result_report
}

main