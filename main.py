# EJERCICIO
# 1.- Abrir un nuevo fichero para ejecutar codigo Python3
# 2.- Importar la libreria para conectarse a una base de datos en PostgreSQL
# 3.- Conectarse a la tabla de usuarios de la base de datos  curso2
# 4.- Realizar un bucle para visualizar todas las fichas de la  tabla usuarios
# 5.- Cerrar la conexion con la base de datos

import psycopg2 as pg2

# connect a base de datos
conexion = pg2.connect(
    host='localhost',
    database='curso2',
    user='postgres',
    password='1234')

# cursor
cursor = conexion.cursor()

# execute query
cursor.execute('select * from usuarios')
datos = cursor.fetchall()
datos

for dato in datos:
    print(dato)

conexion.close()
