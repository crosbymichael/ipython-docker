FROM crosbymichael/python

RUN apt-get install -y git-core libxml2-dev build-essential make gcc python-dev wget libsqlite3-dev sqlite3
RUN apt-get install -y libfreetype6-dev python-imaging libpng-dev libzmq-dev

RUN pip install pyzmq
RUN pip install numpy
RUN pip install matplotlib
RUN pip install pandas
RUN pip install jinja2
RUN pip install ipython

EXPOSE 8888

CMD ipython notebook --pylab=inline --ip=* --MappingKernelManager.time_to_dead=10 --MappingKernelManager.first_beat=3
