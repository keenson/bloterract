# init a base image (Alpine is small Linux distro)
FROM python:3.9.5-slim-buster

# define the present working directory
WORKDIR /code

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# update pip to minimize dependency errors 
RUN pip install --upgrade pip

# copy the contents into the working dir
COPY requirements.txt .

# run pip to install the dependencies of the flask app
RUN pip install --no-cache-dir --upgrade -r requirements.txt

COPY /app .

# define the command to start the container
CMD ["python","app.py"]