FROM python:3.12-slim

WORKDIR /app

COPY . /app

# חשוב מאוד ל-SSL בתוך containers
RUN apt-get update && apt-get install -y ca-certificates && update-ca-certificates

# שדרוג pip
RUN python -m pip install --upgrade pip

# התקנת dependencies
RUN pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org -r requirements.txt

EXPOSE 5000

CMD ["python", "app/main.py"]