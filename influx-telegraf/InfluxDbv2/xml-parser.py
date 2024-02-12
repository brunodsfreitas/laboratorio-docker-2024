#!/usr/bin/env python3
import xml.etree.ElementTree as ET
import requests
import datetime

def main():
    xml_url = 'https://raw.githubusercontent.com/brunodsfreitas/html-repo-example/master/getstatus264'

    response = requests.get(xml_url)
    if response.status_code == 200:
        xml_data = response.content
        root = ET.fromstring(xml_data)

        time_now = datetime.datetime.utcnow().strftime('%Y-%m-%dT%H:%M:%SZ')

        for elem in root.findall('.//status/*'):
            metric_name = f"{elem.tag},id=0"  # Substitua 'id=1' conforme necessário

            if elem.text is not None:
                metric_value = float(elem.text) if elem.text.isdigit() else elem.text
                print(f"{metric_name} value={metric_value} {time_now}")
    else:
        print(f"Failed to fetch XML from {xml_url}")

if __name__ == "__main__":
    main()
