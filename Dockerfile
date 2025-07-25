# Use Ubuntu 20.04 as base
FROM ubuntu:20.04

# Set timezone to US/Eastern
ENV TZ=US/Eastern
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Update system and install dependencies
RUN apt-get -y update && \
    apt-get -y install \
    python3-pip cython3 \
    build-essential python3-dev libatlas-base-dev \
    libopenblas-dev liblapack-dev git g++ unzip

RUN pip3 install --upgrade pip setuptools==68.2.2 wheel importlib-metadata

# Install scientific stack first for compatibility
RUN pip3 install numpy pandas scikit-learn scipy matplotlib jupyter ipywidgets

# Install your profiling and other tools
RUN pip3 install ydata-profiling kaggle
RUN pip3 install --upgrade jinja2==3.0.3

RUN useradd -ms /bin/bash group13 && \
    mkdir -p /home/group13/.kaggle /home/group13/data

# Copy Kaggle API token into the container
COPY kaggle.json /home/group13/.kaggle/kaggle.json

# Create a new user, group13 and change to that user
USER group13
WORKDIR /home/group13

# Expose the default Jupyter Notebook port
EXPOSE 8888

# Start Jupyter Notebook
CMD ["jupyter", "notebook", "--ip", "0.0.0.0", "--no-browser", "--allow-root"]
