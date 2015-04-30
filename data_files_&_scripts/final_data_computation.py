#once data is compiled into a single spreadsheet, this code is used to compute
#year-to-date rainfall, and its difference from normal year-to-date rainfall
#and create a csv file containing cleaned-up data, ready to be imported to mongo

YTD2013 = int(0)
YTD2014 = int(0)
YTD2015 = int(0)

my_file = open('merged_climate_data.csv', 'r')
write_file = open('final_climate_data.csv', 'w')

header = 'STATION,ELEVATION,LATITUDE,LONGITUDE,DATE,YTD_PRECIP_NORM,YTD2013_PRECIP,PRECIP2013_DIFF,YTD2014_PRECIP,PRECIP2014_DIFF,YTD2015_PRECIP,PRECIP2015_DIFF\n'
write_file.write(header)



my_file.readline()
for line in my_file:
    line = line.split(',')
    date = line[4].split('|')
    date = date[1]
    #re-start YTD count at beginning of new location's data
    if date == '0101':
        YTD2013 = 0
        YTD2014 = 0
        YTD2015 = 0
    #ignore missing data
    if line[9] != '':
        #ignore 'negative' values (i.e. NOAA's indicators for invalid data)
        if line[9][0] != '-':
            YTD2013 = YTD2013 + int(line[9])
    DIFF2013 = YTD2013 - int(line[5])
    if line[12] != '':
        if line[12][0] != '-':
            YTD2014 = YTD2014 + int(line[12])
    DIFF2014 = YTD2014 - int(line[5])
    if line [15] != '':
        if line[15][0] != '-':
            YTD2015 = YTD2015 + int(line[15])
    DIFF2015 = YTD2015 - int(line[5])
    line = line[0]+','+line[1]+','+line[2]+','+line[3]+','+date+','+line[5]+','+str(YTD2013)+','+str(DIFF2013)+','+str(YTD2014)+','+str(DIFF2014)+','+str(YTD2015)+','+str(DIFF2015)+'\n'
    write_file.write(line)

my_file.close()
write_file.close()
