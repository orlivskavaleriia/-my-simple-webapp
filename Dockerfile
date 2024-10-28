# Вибір базового образу
FROM ubuntu:latest

# Встановлення залежностей для створення віртуального середовища
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv

# Створення віртуального середовища
RUN python3 -m venv /opt/venv

# Активуємо віртуальне середовище та встановлюємо Flask
RUN /opt/venv/bin/pip install flask

# Копіювання коду додатка
COPY app.py /opt/app.py

# Задаємо середовище
ENV FLASK_APP=/opt/app.py

# Запуск Flask додатка
CMD ["/opt/venv/bin/flask", "run", "--host=0.0.0.0"]
