FROM alpine:latest
ENV FLASK_PATH /var/flaskapp
ENV FLASK_USER flaskuser
RUN adduser -h $FLASK_PATH -s /bin/sh -D $FLASK_USER
WORKDIR $FLASK_PATH
COPY . .
RUN chown -R $FLASK_USER:$FLASK_USER $FLASK_PATH
RUN apk update && apk add python3 --no-cache
RUN apk add --no-cache py3-pip
RUN pip3 install -r requirement.txt
USER $FLASK_USER
EXPOSE 5000
CMD ["app.py"]
ENTRYPOINT ["python3"]
