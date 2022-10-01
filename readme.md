# docker-geo-tools

GDAL, tippecanoe, shp2pgsql

## Volume

By default container working directory is `/home` and current working directory $(pwd) is mounted to containers `/home`

## Examples

```sh
geotools.sh shp2pgsql -a -D ./timezones-with-oceans.shapefile/combined-shapefile-with-oceans.shp timezones_shp > timezones_shp.sql

# To run custom script you need to mount it into container with a volume. Then you can run:
geotools.sh ./run-in-container.sh
```
