# ccc
FROM python:3.11.8-slim

WORKDIR /app

COPY ./app .

COPY requirements.txt .

RUN pip install -r requirements.txt

RUN apt-get update && apt-get install -y

# Suppr caches instal packages
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Suppr fichiers temporaires
RUN rm -rf /tmp/*

# Suppr logs
RUN rm -rf /var/log/*

CMD ["python3", "main.py"]

EXPOSE 8501

ENTRYPOINT [ "streamlit", "run", "./app/app_streamlit.py", "--server.port=8501", "--server.address=0.0.0.0" ]