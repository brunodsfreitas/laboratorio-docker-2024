#!/bin/bash
echo "1."
# URL do arquivo XML
xml_url="https://raw.githubusercontent.com/brunodsfreitas/html-repo-example/master/getstatus264"

# Baixar o arquivo XML da URL usando o curl
xml_content=$(curl -s "$xml_url")

# Função para processar o XML e extrair campos e valores
process_xml() {
    local xml="$1"
    local in_tag=0
    local key=""
    local value=""

    while IFS= read -r line; do
        echo "$line"
        # Procurar por padrões de tags e valores no XML
        if [[ $line =~ "<" && $line =~ ">" ]]; then
            key=$(echo "$line" | awk -F '[<>]' '{print $4}')
            #echo "$key"
            in_tag=1
        elif [[ $line =~ "<" && $line =~ "/>" ]]; then
            value=$(echo "$line" | awk -F '[<>]' '{print $3}')
            echo "$line"
            echo "22"
            echo "$value"
            xml_values["$key"]="$value"
            in_tag=0
        elif [ $in_tag -eq 1 ]; then
            value=$(echo "$line" | awk -F '[<>]' '{print $1}')
            echo "$line"
            echo "$value"
            xml_values["$key"]="$value"
            in_tag=0
        fi
    done <<< "$xml"

    # Exibir os campos e valores
    for key in "${!xml_values[@]}"; do
        echo "Campo: $key, Valor: ${xml_values[$key]}"
    done
}

# Array para armazenar os valores
declare -A xml_values

# Chama a função para processar o XML
process_xml "$xml_content"