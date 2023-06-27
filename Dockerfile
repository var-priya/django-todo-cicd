FROM python:3.9
COPY . .
RUN pip install django==3.2
CMD ["python","manage.py","runserver","0.0.0.0:8000"] 
