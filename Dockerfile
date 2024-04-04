FROM python:3.11
RUN apt-get update && apt-get install -y wget gtk3.0
# RUN apt-get update -y && \
#     apt-get install -y --no-install-recommends \
# 	git \
# 	openssh-server \
# 	curl \
# 	gcc \
# 	g++ \
# 	clang \
# 	build-essential \
# 	cmake \
# 	unzip \
# 	tar \
# 	gzip \
# 	sudo \
# 	python3 \
# 	python3-defusedxml \
# 	python3-lxml \
# 	libssl-dev \
# 	libffi-dev \
# 	ca-certificates && \
# 	apt-get autoclean && \
#     	apt-get autoremove && \
#     	apt-get clean && \
# 	rm -rf /var/lib/apt/lists/*

ENV PIP_DISABLE_PIP_VERSION_CHECK 1
ENV PYTHONWRITTENBYTECODE 1
ENV PYTHONUNBUFFERED 1
RUN mkdir -p /clinical-prod
WORKDIR /clinical-prod
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
# COPY NandhaKumaranDentalClinic/NandhaKumaranDental/manage.py .
EXPOSE 8100
# CMD ["python", "NandhaKumaranDentalClinic\NandhaKumaranDental\manage.py", "runserver", "0.0.0.0:8100"]
CMD ["gunicorn", "DentalCare.wsgi:application", "--bind", "0.0.0.0:8100"]
# CMD ["bash", "-c", "cd NandhaKumaranDentalClinic\NandhaKumaranDental\manage.py && python manage.py runserver 0.0.0.0:8100"]
# CMD python manage.py runserver