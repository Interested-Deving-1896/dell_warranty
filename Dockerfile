FROM alpine

RUN apk add --no-cache bash coreutils jo curl go git jq
RUN go install github.com/ericchiang/pup@latest
RUN go install github.com/msoap/shell2http@latest

# curl-impersonate: presents a real Chrome TLS fingerprint, needed by the
# scrape fallback path (plain curl is blocked by Dell's Akamai bot manager).
ARG CI_VERSION=v1.5.6
RUN set -eux; \
    arch="$(apk --print-arch)"; \
    url="https://github.com/lexiforest/curl-impersonate/releases/download/${CI_VERSION}/curl-impersonate-${CI_VERSION}.${arch}-linux-musl.tar.gz"; \
    mkdir -p /opt/curl-impersonate; \
    curl -fsSL "$url" | tar -xz -C /opt/curl-impersonate; \
    ln -s /opt/curl-impersonate/curl-impersonate /usr/local/bin/curl-impersonate; \
    curl-impersonate --version

ENV PATH="${PATH}:/root/go/bin"

ENV PORT=8080
ENV API_CACHE=3600

COPY ./dell_warranty.sh /app/dell_warranty.sh

EXPOSE $PORT

CMD shell2http -port ${PORT} -no-index -cache=${API_CACHE} \
               -export-vars DEBUG,DELL_API_KEY,DELL_API_SEC,DELL_ABCK \
               -show-errors -include-stderr -form \
               /check 'DEBUG=$v_debug /app/dell_warranty.sh -j $v_svctag'
