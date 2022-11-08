FROM python:3
RUN pip install django==3.2

COPY . .

RUN python manage.py migrate
EXPOSE 8000
CMD ["python","manage.py","runserver","127.0.0.1:8000"]


