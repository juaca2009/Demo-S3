import psycopg2
import boto3
from openpyxl import Workbook
from io import BytesIO

def handler(event, context):
    # Conexión a la base de datos PostgreSQL
    conn = psycopg2.connect(
        host="postgres", 
        database="mydatabase",
        user="user",
        password="password",
        port="5432"
    )

    cursor = conn.cursor()
    
    # Consultar la tabla de ventas
    cursor.execute("SELECT * FROM ventas")
    ventas = cursor.fetchall()
    
    # Crear un archivo Excel
    workbook = Workbook()
    sheet = workbook.active
    sheet.title = "Ventas"
    
    # Escribir encabezados
    headers = ["ID", "Producto", "Cantidad", "Precio Unitario", "Fecha de Venta"]
    sheet.append(headers)
    
    # Escribir datos
    for venta in ventas:
        sheet.append(venta)
    
    # Guardar el Excel en memoria
    excel_buffer = BytesIO()
    workbook.save(excel_buffer)
    excel_buffer.seek(0)
    
    # Subir el archivo Excel a S3
    s3 = boto3.client('s3', endpoint_url='http://localstack:4566')
    bucket_name = 'demo'
    s3.put_object(Bucket=bucket_name, Key='ventas.xlsx', Body=excel_buffer, ContentType='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')
    
    # Cerrar conexiones
    cursor.close()
    conn.close()

    return {
        'statusCode': 200,
        'body': 'Archivo Excel creado y subido a S3 con éxito.'
    }
