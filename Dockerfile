FROM ubuntu:18.04

RUN apt-get update \
    && apt install -y \
        wget unzip \
        git make cmake gcc g++ \
        libmad0-dev \
        libmad0 \
        libid3tag0-dev \
        libid3tag0 \
        libsndfile1-dev \
        libsndfile1 \
        libgd-dev \
        libgd3 \
        libboost-filesystem-dev \
        libboost-filesystem1.65.1 \
        libboost-program-options-dev \
        libboost-program-options1.65.1 \
        libboost-regex-dev \
        libboost-regex1.65.1 \
    && git clone https://github.com/bbcrd/audiowaveform.git \
        && cd audiowaveform \
        && wget https://github.com/google/googletest/archive/release-1.8.0.tar.gz \
        && tar xzf release-1.8.0.tar.gz \
        && ln -s googletest-release-1.8.0/googletest googletest \
        && ln -s googletest-release-1.8.0/googlemock googlemock \
        && mkdir build \
        && cd build \
        && cmake .. \
        && make install \
        && cd .. \
        && rm -rf audiowaveform \
    && apt-get purge --auto-remove -y \
            git make cmake gcc g++ \
            libmad0-dev \
            libid3tag0-dev \
            libsndfile1-dev \
            libgd-dev \
            libboost-filesystem-dev \
            libboost-program-options-dev \
            libboost-regex-dev \
            unzip wget \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["audiowaveform"]
CMD ["--help"]

