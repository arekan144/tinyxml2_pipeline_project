FROM build

WORKDIR /app

RUN make test > Result.txt

CMD ["bash"]
