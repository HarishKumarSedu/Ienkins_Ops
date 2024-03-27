FROM python:3.10-slim-buster
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip 

# copy all the file to the folder /code 
COPY . /code

#set the files permission 
RUN chmod +x /code/src

# install the requirements 
RUN pip install --no-cache-dir --upgrade -r code/src/requirements.txt

# expose the port 
EXPOSE 8005 

WORKDIR /code/src

ENV PYTHONPATH "${PYTHONPATH}:/code/src"

#install the package 
CMD pip install -e .
