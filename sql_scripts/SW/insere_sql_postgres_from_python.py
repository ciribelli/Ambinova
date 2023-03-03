import psycopg2
import datetime
import pandas as pd
import numpy as np


def grava(fk_usuario, fk_ambiente, dataregistro, temperatura, umidade, arcond):
    try:
        connection = psycopg2.connect(user="postgres",
                                    password="postgres",
                                    host="localhost",
                                    port="5432",
                                    database="trabalho_final")
        cursor = connection.cursor()
        
        postgreSQL_select_Query = "select * from monitoramento"
        cursor.execute(postgreSQL_select_Query)
        num = cursor.rowcount # numero de linhas
        print (num)

        
        
        postgres_insert_query = """ INSERT INTO monitoramento (pk_monitor, fk_usuario, fk_ambiente, dataregistro, temperatura, umidade, arcond) VALUES (%s,%s,%s,%s,%s,%s,%s)"""
        
        record_to_insert = (num, fk_usuario, fk_ambiente, dataregistro, temperatura, umidade, arcond)
        print('cursor', cursor.rowcount)
        cursor.execute(postgres_insert_query, record_to_insert)
        connection.commit()
        count = cursor.rowcount
        print(count, "Record inserted successfully into mobile table")

    except (Exception, psycopg2.Error) as error:
        print("Failed to insert record into mobile table", error)

    finally:
        # closing database connection.
        if connection:
            cursor.close()
            connection.close()
            print("PostgreSQL connection is closed")



# Definir a data de início e fim
start_date = datetime.datetime(2021, 1, 1, 0, 0, 0)
end_date = datetime.datetime(2021, 1, 31, 23, 0, 0)
# Definir o intervalo de tempo entre as datas
delta = datetime.timedelta(hours=1)

current_date = start_date
while current_date <= end_date:
    print(current_date.strftime("%Y-%m-%d %H:%M:%S"))
    arcond = ''
    d = 0
    if(current_date.hour > 20 & current_date.hour < 3):
        arcond = 'TRUE'
        d = 4
    else:
        arcond = 'FALSE'
        d = 0
    grava(13, 1, current_date.strftime("%Y-%m-%d %H:%M:%S"), 23.4+2*np.random.rand(1)[0]-d, 46.7+10*np.random.rand(1)[0], arcond)
    current_date += delta
    




