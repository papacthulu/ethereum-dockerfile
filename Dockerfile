FROM ethereum/client-go:stable
ARG ACCOUNT_PASSWORD
COPY genesis.json /tmp
RUN geth init /tmp/genesis.json
RUN rm -f ~/.ethereum/geth/nodekey
RUN echo ${ACCOUNT_PASSWORD} > /tmp/password \
  && geth account new --password /tmp/password \
  && rm -f /tmp/password
