#takes climate-data CSVs from NOAA, deletes unnecessary columns, and creates a
#unique weather-station-ID & date column, to facilitate merging of daily-normals
#(i.e. 30-year-averages of weather data) file with daily summaries file for multiple years

#file requested from NOAA of 30-year averages of precipitation and temperature to be cleaned up
filename = "525424.csv"

my_file = open(filename,"r")
write_file = open("clean_normals.csv","w")

header = 'STATION,ELEVATION,LATITUDE,LONGITUDE,DATE,YTD-PRECIP-NORM,DLY-TAVG-NORM,DLY-TMAX-NORM,DLY-TMIN-NORM\n'
write_file.write(header)

my_file.readline()
for line in my_file:
    line = line.split(',')
    date = line[5][4:]
    if len(date) == 3:
        date = 0 + date
    line = line[1]+','+line[2]+','+line[3]+','+line[4]+','+line[0]+'|'+date+','+line[17]+','+line[32]+','+line[34]+','+line[35]+'\n'
    write_file.write(line)

my_file.close()
write_file.close()

#clean_summaries will do the appropriate data cleaning for daily summaries data
#for a single year; the function takes 2 arguments: the source file that contains
#the data provided by NOAA, and the name of the file that the data is being
#coppied to
def clean_summaries(source_file, dest_file):
    my_file = open(source_file, "r")
    write_file = open(dest_file,"w")
    year = source_file[0:4]
    header = 'DATE,'+year+'-PRECIPITATION,'+year+'-TMAX,'+year+'-TMIN\n'
    write_file.write(header)
    my_file.readline()
    for line in my_file:
        line = line.split(',')
        date = line[5][4:]
        if len(date) == 3:
            date = 0 + date
        line = line[0]+'|'+date+','+line[8]+','+line[11]+','+line[12]+'\n'
        write_file.write(line)
    my_file.close()
    write_file.close()    


#clean daily summaries data for previous years:
clean_summaries("2013_summaries.csv", "2013_clean.csv")
clean_summaries("2014_summaries.csv", "2014_clean.csv")
clean_summaries("2015_summaries.csv", "2015_clean.csv")

#the resulting csv files were merged manually in Excel


    




