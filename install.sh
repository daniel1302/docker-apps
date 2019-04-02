#!/usr/bin/env bash


##
 # Usage: replaceInFile input_file output_file search_str replace_str
 ##
replaceInFile()
{
    if [ ! $# -eq 4 ]; then
        echo "Usage: replaceInFile input_file output_file search_str replace_str";
        exit;
    fi;

    INPUT_FILE=$1;
    OUTPUT_FILE=$2;
    SEARCH_STR=$3;
    REPLACE_STR=$4;


    if [ "$INPUT_FILE" == "$OUTPUT_FILE" ]; then
        sed -i "s/$SEARCH_STR/$REPLACE_STR/" $INPUT_FILE;
    else
        sed "s/$SEARCH_STR/$REPLACE_STR/" $INPUT_FILE > $OUTPUT_FILE;
    fi;

    echo "Updating file $OUTPUT_FILE";
}

# get mysql password
read -sp 'Mysql password: ' MYSQL_PASSWORD;

#replace mysql password in required files
replaceInFile ./vault/config.sample.hcl ./vault/config.hcl TYPE_MYSQL_PASSWORD_HERE $MYSQL_PASSWORD;
replaceInFile ./assets/secrets.sample.env ./assets/secrets.env TYPE_MYSQL_PASSWORD_HERE $MYSQL_PASSWORD;

echo "Finished"