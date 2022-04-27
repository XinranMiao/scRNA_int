STAT 877 spring 22 course project
-----

Create the docker image from `Dockerfile`
```{bash}
# build the image
docker build -t username/image:tag .
# test the image
docker run -ti --rm=true username/image:tag /bin/bash
# push the image
docker push username/image:tag
```
This image has been pushed as `xinranmiao/sg_int:v1`

Reference
-------
`scIB` [package](https://github.com/theislab/scib), [reproducibility](https://github.com/theislab/scib-reproducibility).

`scDesign2` [documentation](https://htmlpreview.github.io/?https://github.com/JSB-UCLA/scDesign2/blob/master/vignettes/scDesign2.html)
