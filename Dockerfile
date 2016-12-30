FROM debian:stretch-slim
MAINTAINER pomupekun<pomupekun.gmail.com>

ENV PATH=/opt/conda/bin:$PATH

RUN apt-get update && apt-get upgrade -y && \
	apt-get install -y \
		bzip2 \
		wget && \
	wget -q https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/install_miniconda.sh && \
	bash /tmp/install_miniconda.sh -b -p /opt/conda && \
	conda update -y conda && \
	conda update -y --all && \
	conda install -y \
		jupyter && \
	rm /tmp/install_miniconda.sh
CMD ["/jupyter/conf/cmd.sh"]

