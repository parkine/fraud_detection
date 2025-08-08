# fraud_detection

This project builds and analyzes machine learning models to detect fraudulent credit card transactions using the [Kaggle Credit Card Fraud Detection dataset](https://www.kaggle.com/datasets/dhanushnarayananr/credit-card-fraud/data). The entire environment is set up and run using Docker for reproducibility.

## Getting Started

### 1. Add Kaggle API Credentials

Place your `kaggle.json` file in the root directory of this project (required to download data directly from Kaggle).

If you don’t have Kaggle API credentials or prefer not to use them, 
- you can manually download `card_transdata.csv` from [this link](https://www.kaggle.com/datasets/dhanushnarayananr/credit-card-fraud/data)
- unzip the file.
- create the data directory in the root directory.
- place the file in the ./data directory.

### 2. Build and Run Docker Container

Build the Docker image:

    docker build -t fraud-detection:1.0 .

Run the Docker container (mounts current directory, maps port 8888):

    docker run --name fraud-detection -p 8888:8888 -v $(pwd):/home/group13 fraud-detection:1.0

This will launch a Jupyter notebook server accessible at [http://localhost:8888](http://localhost:8888).

### 3. Notebooks Overview

- **data_download.ipynb**: Downloads and saves the Kaggle dataset.
- **data_analyze.ipynb**: Cleans, explores, and prepares the data.
- **classification.ipynb**: Trains and evaluates ML models (Naive Bayes, Decision Tree, Random Forest).
- **EDA.ipynb**: Performs post-modeling analysis, feature importance, and interpretation.

### 4. Project Structure

    1_data_download.ipynb
    2_data_analysis.ipynb
    3_classification.ipynb
    4_model_analysis.ipynb
    Dockerfile
    kaggle.json                     # <- your Kaggle API credentials
    ./data/card_transdata.csv       # <- dataset if downloaded manually
