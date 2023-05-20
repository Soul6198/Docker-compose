FROM python:3.10

COPY . /src

COPY ./requirements.txt /src/requirements.txt
RUN pip3 install --no-cache-dir --upgrade -r /src/requirements.txt

COPY . .

EXPOSE 6061
WORKDIR src

RUN python manage.py migrate
RUN python manage.py collectstatic --noinput 

