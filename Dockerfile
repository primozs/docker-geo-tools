FROM osgeo/gdal:alpine-small-3.4.1 AS gdal

FROM gdal as tippecanoe
ARG TIPPECANOE_RELEASE="1.36.0"
RUN apk add --no-cache sudo git g++ make libgcc libstdc++ sqlite-libs sqlite-dev zlib-dev bash \
  && cd /root \
  && git clone https://github.com/mapbox/tippecanoe.git tippecanoe \
  && cd tippecanoe \
  && git checkout tags/$TIPPECANOE_RELEASE \
  && cd /root/tippecanoe \
  && make \
  && make install \
  && cd /root \
  && rm -rf /root/tippecanoe \
  && apk del git g++ make sqlite-dev

FROM tippecanoe as tools
RUN apk add postgis 
