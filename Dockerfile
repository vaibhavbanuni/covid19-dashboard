FROM python:3.6
LABEL "project"="docker-ci-cd-v2"
COPY . .
RUN pip3.6 install -r requirements.txt
CMD ["python","manage.py","runserver","0.0.0.0:8000"]
EXPOSE 8000
