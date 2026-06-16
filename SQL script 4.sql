drop  database testing ;

create DATABASE testing2;

-- Create External Data Source
CREATE  EXTERNAL DATA SOURCE regex_dsrc_demo
WITH (
    LOCATION = 'https://testregexext.blob.core.windows.net/demo' );



CREATE EXTERNAL FILE FORMAT regex_csv_format
WITH (  
    FORMAT_TYPE = DELIMITEDTEXT,  
    FORMAT_OPTIONS (  
        FIELD_TERMINATOR = ',' )  );



CREATE EXTERNAL TABLE test2
(
    id varchar(20),
    city varchar(100),
    quantity varchar(100),
    unitprice VARCHAR(100) )  
WITH (
    LOCATION = '/csvFile_azure.csv',
    DATA_SOURCE = regex_dsrc_demo,  
    FILE_FORMAT = regex_csv_format
);


SELECT  * FROM test2;