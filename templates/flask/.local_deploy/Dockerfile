FROM python:3.8-slim-buster

RUN mkdir -p /usr/local/application
COPY ./app/ /usr/local/application/
RUN pip install -r /usr/local/application/requirements.txt

WORKDIR /usr/local/application
CMD ["gunicorn", "flask_app:app", "-c", "config/gunicorn_setting.py"]
