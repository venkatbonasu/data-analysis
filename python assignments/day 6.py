#Day 6:
#1. Write a program to create a text file with Python and insert text “Data Analytics is the
#trending course in market.” And close the File.

fileptr = open("D:\\python notes.txt","w")
fileptr.write("Data Analytics is the trending course in market.")
fileptr.close()

import logging
from datetime import datetime

logging.basicConfig(filename='file_operations.log', level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

def create_write_file():
    try:
        logging.info("Attempting to create and open the file 'python notes.txt'.")
        file=open('python notes.txt','w')
        logging.info("File 'Data Analytics.txt' created and opened successfully")
        file.write("Data Analytics is the trending course in market.")
        logging.info("Text written to the file 'python notes.txt'.")
    except Exception as e:
        logging.error(f"An error occured:{e}")
    finally:
        try:
            file.close()
            logging.info("File 'python notes.txt' closed successfully")
        except Exception as e:
            logging.error(f"An error occured while closing file:{e}")

create_write_file()