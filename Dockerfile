FROM cirrusci/flutter

WORKDIR /app

COPY pubspec.yaml /app/

COPY lib /app/lib

COPY test /app/test

RUN sudo chown -R cirrus:cirrus /app

CMD ["flutter","run"]