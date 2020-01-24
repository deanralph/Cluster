FROM alpine

RUN apk add python3-dev
RUN pip3 install --upgrade pip
RUN pip3 install flask

WORKDIR /usr/local/rest
COPY . ./

EXPOSE 5000

ENTRYPOINT [ "python3" ]
CMD [ "main.py" ]
