# syntax=docker/dockerfile:1

FROM python:3.7-slim-buster

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

# Lint
CMD [ "python3", "-m", "pylint", "--disable=R,C", "hello.py"]

# Test
CMD ["python3", "-m", "pytest", "-vv", "--cov=hello", "test_hello.py"]