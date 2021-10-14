IMAGENAME := bnaylor/mtt
IMAGEVER := 1.0
MTTSRC=src/mytinytodo-v1.6.7.zip

default: all

unpack: clean
	@mkdir -p unpacked
	@tar -xvf ${MTTSRC} -C unpacked
	@mv unpacked/mytinytodo/* unpacked/
	@rmdir unpacked/mytinytodo
	@mkdir -p unpacked/db_template
	@mv unpacked/db/* unpacked/db_template/

docker:
	@docker build . -t ${IMAGENAME}:${IMAGEVER}
	@docker tag ${IMAGENAME}:${IMAGEVER} ${IMAGENAME}:latest

all: unpack docker

clean:
	@rm -rf unpacked
