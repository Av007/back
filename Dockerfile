FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt /app/

RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/
COPY .env-dist /app/.env

ENV PYTHONUNBUFFERED 1

EXPOSE 8000

RUN python manage.py collectstatic --noinput
RUN python manage.py migrate

ENTRYPOINT ["entrypoint.sh"]
CMD ["gunicorn", "app.wsgi:application", "--bind", "0.0.0.0:8000"]
