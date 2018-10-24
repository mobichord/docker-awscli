FROM alpine:edge

RUN apk -v --no-cache --update add python3 groff less mailcap curl && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    pip install --upgrade awscli s3cmd python-magic && \
    rm -r /root/.cache

ENTRYPOINT ["aws"]