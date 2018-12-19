FROM ubuntu:latest

EXPOSE 3000

WORKDIR /app
ADD . /app

RUN apt-get update && apt-get install -y python3 \
    python3-pip

RUN python3 -m pip install -r requirements.txt

RUN useradd -ms /bin/bash jupyter

USER jupyter

ENTRYPOINT ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--port=3000"]
