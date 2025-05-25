from fastapi import FastAPI
import mysql.connector

# Conexion a la base de datos
db = mysql.connector.connect(
    host="127.0.0.1",  # Corrección del host
    port=3306,
    user="root",
    password="root",
    database="pandatat"
)

#Se crea el endpoint para obtener los pedidos
app = FastAPI()

@app.get("/pedidos")
def obtener_pedidos():
    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Pedidos")
    pedidos = cursor.fetchall()
    cursor.close()
    return pedidos

#Se crea el endpoint para obtener los usuarios
@app.get("/usuarios")
def obtener_usuarios():
    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Usuarios")
    usuarios = cursor.fetchall()
    cursor.close()
    return usuarios

#Se crea el endpoint para obtener los roles
@app.get("/roles")
def obtener_roles():
    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Roles")
    roles = cursor.fetchall()
    cursor.close()
    return roles