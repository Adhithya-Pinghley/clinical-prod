FROM python:3.10
ENV PIP_DISABLE_PIP_VERSION_CHECK 1
ENV PYTHONWRITTENBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV clinical-prod=E:\Adhithya\repoTest\clinical-prod
RUN mkdir -p /clinical-prod
WORKDIR /clinical-prod
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . clinical-prod
EXPOSE 8100
# CMD ["python", "NandhaKumaranDentalClinic\NandhaKumaranDental\manage.py", "runserver", "127.0.0.1:8100"]
CMD python NandhaKumaranDentalClinic\NandhaKumaranDental\manage.py runserver