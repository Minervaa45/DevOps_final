FROM python:3.9-alpine3.17
LABEL author="zaxarrexar@gmail.com"

RUN python -m pip install --upgrade pip 
RUN pip install virtualenv

RUN apk add -U --no-cache \
    postgresql-dev \
    gcc \
    python3-dev \
    musl-dev

WORKDIR /opt/app

COPY . .

RUN virtualenv .venv
RUN source .venv/bin/activate
RUN pip install -r requirements.txt
RUN chmod u+x entrypoint.sh

ENV PYTHONUNBUFFERED=1

EXPOSE 8000

ENTRYPOINT [ "./entrypoint.sh" ]

