# Use the official Anaconda base image
FROM continuumio/miniconda3

# Copy the environment.yml file to the container
COPY DeepRule.yaml /DeepRule.yaml

# Create the environment using the environment.yml file
RUN conda env create -f /DeepRule.yaml

# Set the working directory inside the container
WORKDIR /DeepRule

# Activate the environment
RUN /bin/bash -c "conda activate DeepRule"
SHELL ["/bin/bash","--login","-c"]
# RUN echo "source activate DeepRule" > ~/.bashrc
ENV PATH ../anaconda3/envs/DeepRule/bin:$PATH

# Copy your Python script into the container
COPY manage.py /DeepRule/manage.py

# Specify the command to run your application
CMD [ "python", "manage.py", "runserver", "0.0.0.0:8800" ]

