FROM ubuntu:13.10

RUN apt-get update && apt-get install -y language-pack-en openssh-server git-core libxml2-dev \
    curl python build-essential make gcc python-dev wget libsqlite3-dev sqlite3 libfreetype6 \
    libfreetype6-dev python-imaging libpng-dev libzmq-dev

ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales

RUN wget http://python-distribute.org/distribute_setup.py && python distribute_setup.py
RUN wget https://raw.github.com/pypa/pip/master/contrib/get-pip.py && python get-pip.py

RUN apt-get install -y 
RUN pip install pyzmq
RUN pip install numpy
RUN pip install matplotlib
RUN pip install pandas
RUN pip install jinja2
RUN pip install ipython

EXPOSE 8888

CMD ipython notebook --pylab=inline --ip=* --MappingKernelManager.time_to_dead=10 --MappingKernelManager.first_beat=3
