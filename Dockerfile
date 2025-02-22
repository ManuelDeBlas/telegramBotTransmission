FROM python:3.7
# Utiliza la imagen base de Python 3.7

# System deps:
RUN pip install poetry
# Instala Poetry, una herramienta para la gestión de dependencias en Python

# Copy only requirements to cache them in docker layer
WORKDIR /code
# Establece el directorio de trabajo en /code
COPY poetry.lock pyproject.toml /code/
# Copia los archivos poetry.lock y pyproject.toml al directorio de trabajo

# Project initialization:
RUN POETRY_VIRTUALENVS_CREATE=false poetry install --no-interaction --no-ansi
# Instala las dependencias del proyecto usando Poetry sin crear entornos virtuales

# Creating folders, and files for a project:
COPY . /code
# Copia todos los archivos del proyecto al directorio de trabajo

# Expose the port the app runs on
EXPOSE 8000
# Expone el puerto 8000 para que la aplicación sea accesible desde fuera del contenedor

# Define the command to run the application
CMD ["python", "transmission_bot/telegram_bot.py"]
# Define el comando para ejecutar la aplicación, en este caso, ejecuta el archivo telegram_bot.py con Python