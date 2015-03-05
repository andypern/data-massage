import csv
import json

csvfilename = 'SensorDataV5.csv'
jsonfilename = csvfilename.split('.')[0] + '.json'
csvfile = open(csvfilename, 'r')
jsonfile = open(jsonfilename, 'w')
reader = csv.DictReader(csvfile)

fieldnames = ('ResourceID','Date','Time','HZ','Displace','Flow','SedimentPPM','PressureLbs','ChlorinePPM')

output = []

for each in reader:
	row = {}
	for field in fieldnames:
		row[field] = each[field]
	output.append(row)

json.dump(output, jsonfile, indent=2, sort_keys=True)
