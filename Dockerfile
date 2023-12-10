FROM python

#app directory
WORKDIR /app
#demo user
ARG USER_ID=1000
ARG GROUP_ID=1000

#RUN addgroup -g ${GROUP_ID} demo && adduser -D demo -u ${USER_ID} -g demo -G demo -s /bin/bash

#copy files
COPY --chown=demo . /app/

#install depedencies
RUN pip install -r requirements.txt

#USER demo

#entrypoint
CMD ["uvicorn", "app.main:app", "--proxy-headers", "--host", "0.0.0.0", "--port", "8080"]