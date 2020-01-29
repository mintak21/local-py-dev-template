FROM python:3.8-alpine

RUN mkdir -p /usr/app
COPY requirements.txt /usr/app/requirements.txt
RUN pip install -r usr/app/requirements.txt

EXPOSE 8000
WORKDIR /usr/app

CMD [ "python", "manage.py", "runserver"]
