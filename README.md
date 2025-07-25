# fraud_detection

This project builds and analyzes machine learning models to detect fraudulent credit card transactions using the [Kaggle Credit Card Fraud Detection dataset](https://www.kaggle.com/datasets/dhanushnarayananr/credit-card-fraud/data). The entire environment is set up and run using Docker for reproducibility.

## Getting Started

### 1. Add Kaggle API Credentials

Place your `kaggle.json` file in the root directory of this project (required to download data directly from Kaggle).

If you don’t have Kaggle API credentials or prefer not to use them, you can manually download `card_transdata.csv` from [this link](https://www.kaggle.com/datasets/dhanushnarayananr/credit-card-fraud/data) and place it in the root directory.

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

    data_download.ipynb
    data_analyze.ipynb
    classification.ipynb
    EDA.ipynb
    Dockerfile
    requirements.txt
    kaggle.json           # <- your Kaggle API credentials
    card_transdata.csv    # <- dataset if downloaded manually

## Notes

- This project uses ydata_profiling, scikit-learn, pandas, and other common ML/data science libraries.
- All experiments are run inside the Docker container for consistency.
- For questions or issues, please refer to the notebook comments or open an issue.
