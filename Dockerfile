FROM crosbymichael/python

RUN apt-get update && apt-get install -y \
    ipython \
    ipython-notebook \
    python-matplotlib \
    python-numpy \
    python-pandas

EXPOSE 80
CMD ipython notebook --pylab=inline --ip=* --port=80 --MappingKernelManager.time_to_dead=10 --MappingKernelManager.first_beat=3
