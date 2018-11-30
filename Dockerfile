FROM mikeifomin/midas_wallet_base:v1-zeromq-dev

WORKDIR /usr/local/bin

COPY ./CrowdFundingCoind .
COPY ./CrowdFundingCoin-cli .

RUN chmod +x ./* && \
    ln CrowdFundingCoind walletd && \
    ln CrowdFundingCoin-cli wallet-cli

VOLUME ["/root/.CrowdFundingCoin"]
EXPOSE 47755

RUN walletd --help || exit $(($? == 127))
