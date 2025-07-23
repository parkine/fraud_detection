# fraud_detection
Build a ML model to find fraudulent transactions. 

1. kaggle.json should be added to the root directory
2. to run docker (build image -> run the container):
 - docker build -t fraud-detection:1.0 .
 - docker run --name fraud-detection -p 8888:8888 -v $(pwd):/home/group13 fraud-detection:1.0
