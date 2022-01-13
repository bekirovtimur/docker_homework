FROM python:3.6
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
WORKDIR /backend
COPY ./lib_catalog/requirements.txt /backend/
RUN pip install -r requirements.txt
COPY ./lib_catalog /backend/
