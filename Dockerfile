# Parent image
FROM python:3.6-slim

# Create path and set working directory
ENV INSTALL_PATH /metatag
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

# Install needed packages
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

# Run app.py when the container launches
CMD gunicorn -b 0.0.0.0:8000 --access-logfile - "metatag.app:create_app()"
