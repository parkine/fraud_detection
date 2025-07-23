# Use Ubuntu 18.04 as base
FROM ubuntu:18.04

# Set timezone to US/Eastern
ENV TZ=US/Eastern
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Update system and install dependencies
RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install python3-pip cython3 python3-numpy python3-pandas python3-sklearn python3-scipy python3-matplotlib jupyter-notebook unzip

# Install extra Python packages
RUN pip3 install ydata-profiling kaggle

# Create a new user, group13 and change to that user
RUN useradd -ms /bin/bash group13
USER group13
WORKDIR /home/group13

# Create a directory for Kaggle config and data
RUN mkdir -p /home/group13/.kaggle /home/group13/data

# Copy Kaggle API token into the container
COPY kaggle.json /home/group13/.kaggle/kaggle.json
RUN chmod 600 /home/group13/.kaggle/kaggle.json

# Download and unzip the Kaggle dataset
RUN kaggle datasets download dhanushnarayananr/credit-card-fraud -p /home/group13/data && \
    unzip /home/group13/data/credit-card-fraud.zip -d /home/group13/data

# Expose the default Jupyter Notebook port
EXPOSE 8888

# Start Jupyter Notebook
CMD ["jupyter", "notebook", "--ip", "0.0.0.0", "--no-browser", "--allow-root"]
