FROM python
COPY . /app
WORKDIR /app

#install depedencies
RUN pip install --upgrade pip \
    && pip install -r requirements.txt

#entrypoint
ENTRYPOINT ["uvicorn", "app.main:app", "--proxy-headers", "--host", "0.0.0.0", "--port", "8080"]