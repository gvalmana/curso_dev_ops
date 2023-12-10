# Usa una imagen base de Python
FROM python:3.10.8-alpine

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia el archivo de requerimientos al contenedor en /app
COPY requirements.txt .

# Instala las dependencias
RUN pip install -r requirements.txt

# Copia todo el contenido local al contenedor en /app
COPY . .

# Expone el puerto 8000 para que la aplicación esté disponible externamente
EXPOSE 8000

# Define el comando por defecto para ejecutar la aplicación
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
