FROM build

WORKDIR /app

RUN make test | tail -n10 > Result.txt

CMD ["bash"]
