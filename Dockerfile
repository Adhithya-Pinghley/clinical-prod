FROM python:3.10
ENV PIP_DISABLE_PIP_VERSION_CHECK 1
ENV PYTHONWRITTENBYTECODE 1
ENV PYTHONUNBUFFERED 1
RUN mkdir -p /clinical-prod
WORKDIR /clinical-prod
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
COPY NandhaKumaranDentalClinic/NandhaKumaranDental/manage.py .
EXPOSE 8100
# CMD ["python", "manage.py", "runserver", "0.0.0.0:8100"]
CMD ["sh", "-c", "cd NandhaKumaranDentalClinic\NandhaKumaranDental\manage.py && python manage.py runserver 0.0.0.0:8100"]
# CMD python manage.py runserver