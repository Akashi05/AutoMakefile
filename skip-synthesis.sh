#!/usr/bin/env bash
##
## EPITECH PROJECT, 2024
## autoMakefile
## File description:
## the requirement
##

verif="$(expr length "${1}")"
if [ "$verif" = 0 ]; then
    echo "no parameter given"
    exit 84;
fi
while read line
do
    file_name="$(awk -F " " ' {print $NF} ' <<< "$line")"
    len="$(expr length "${1}")"
    if [ "${file_name:0:len}" = "$1" ]; then
        awk -F " " ' {print $3"            "$NF} ' <<< "$line"
    fi
done