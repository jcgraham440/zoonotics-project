# Zoonotics ETL project

# Project overview:

The Zoonotics ETL project intends to examine the scale and scope of zoonotically transmitted diseases, both within and outside of the US. Zoonosis is defined as: "a disease that can be transmitted from animals to people or, more specifically, a disease that normally exists in animals but that can infect humans." 

Within that overall goal, we wanted to demonstrate the ability to extract, transform and load data related to zoonotics. This README describes the ETL process.

# US outbreak data:

One of the primary sources of data concerning diseases in the US is the CDC website. In particular, we found a wealth of information on the CDC's National Outbreak Reporting System (NORS). See https://wwwn.cdc.gov/norsdashboard/. On that page is an Excel spreadsheet listing outbreak data for every state from 2009-2017. It contains a plethora of columns, including:

Year, Month, Mode (e.g. Person-to-person, Food, Animal Contact), Etiology,Serotype, Etiology Status, Setting (where the outbreak happened, e.g. a hotel or a restaurant), Hospitalizations, Deaths, Animal Type, and so on. There are a total of 21 columns, and over 46,000 rows.

The Extraction phase simply was downloading this spreadsheet to a local computer, and instructing Excel to save it as a CSV file. 

The Transform/cleaning phase consisted of 
    1) loading the NORS CSV file into a Pandas dataframe.
    2) discarding columns unrelated to zoonotics, and creating a new dataframe with the following 
       columns: Year, Month, State, Mode, Etiology, and Animal Type
    2a) consequently declaring a SQL schema containing the above columns (see the Load phase below)
    3) Using Pandas to drop columns with NaN or null values
The resulting cleaned dataframe contained the zoonotic data we were looking for: 


Year Month  State   Mode            Etiology           Animal Type
2009	1	Ohio	Animal Contact	Cryptosporidium    Cattle
2009	3	Montana	Animal Contact	Cryptosporidium    Sheep or goats
2009	4	Ohio	Animal Contact	Salmonella enterica	Pet fish
2009	5	Ohio	Animal Contact	Cryptosporidium 	Cattle
2009	5	Iowa	Animal Contact	Cryptosporidium     Sheep or goats

The Loading phase consisted of using sqlalchemy to insert the clean dataframe contents into a Postgres database.

# Global outbreak data:

The World Health Organization (WHO) has confirmed cases and confirmed deaths of zoonotic diseases by year for selected countries. We focused our efforts on viral and bacterial neglected tropical zoonotic diseases.
We retrieved our data from the following site: http://apps.who.int/gho/data/node.main.A1629?lang=en. We downloaded data on deaths from rabies, confirmed cases of Buruli Ulcer, and confirmed cases of Human African Trypanosomiasis (both the gambiense and the rhodensiense strains).


The extraction phase for the global zoonotics outbreak data was downloading and then saving the CSV files to our local computers. 

Each of the 4 global infectious disease files were transformed with Pandas using the same procedure in a Jupyter notebook:
    1. Reading the file into Pandas and setting the index to countries to transform the dataframe, i.e. switch the columns and the rows
    2. Rename the column entries for the infectious disease agent
    3. Rename the column names and the index name
    4. Change all the entries with "No Data" to NaN
Finally, the 4 clean datasets were merged together to create comprehensive global zoonotics disease outbreaks table. Further cleaning was necessary prior to loading the data into the SQL database.

    1. The dataframe was reshaped
    2. The columns were remolded
    3. Select columns were renamed


# Load the us and global zoonotic transformed data into SQL:

To successfully load the data, we used the process of writing the tables into the target database (Postgres SQL). We set up the connection via engine and loaded the transformed Pandas dataframe to SQL.

# Roadmap of zoonotics-projects github repo:

    1. The resources folder contains the CDC and the WHO infectious disease CSV files  from the extraction step
    2. The zoonotics-schema.sql is was used to create tables in SQL for the loading process
    3. The zoonotics-file.ipynb file was used to perform data transformation and SQL database loading 
    4.  We transformed the data and loaded it to Postgres SQL. The following two csv files is the output of the tables from Postgres:
        * global_outbreaks_table from sql.csv 
        * us_outbreaks_table from sql.csv 
    5.  image.png is a quality check after loading the tables to ensure that the data was loaded properly





