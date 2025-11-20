# epilepsy_aed_study
As a person living with epilepsy, I decided to dive into clinical data and find the relationship between seizure frequency and anti-epileptic(AED) drug usage. This project analyzes epilepsy-related conditions and antiepileptic drug (AED) usage using the OMOP CDM (SynPUF sample). It focuses on identifying seizure events, examining treatment patterns, and preparing data for visualization in Tableau.

I developed a python script using jupyter notebook to extract OMOP CDM data from SynPUF DagsHub repository.The study uses SQL queries executed on PostgreSQL to extract and prepare datasets needed for analysis. To visualize the prepared dataset, I connected my PostgreSQL database to Tableau Desktop. This minimizes the need to download the analyzed dataset in form of .csv files in order to load to Tableau.

Caution: YOU MUST USE TABLEAU DESKTOP NOT TABLEAU PUBLIC. TABLEAU PUBLIC DOES NOT OFFER POSTGRESQL CONNECTION SERVICES.

The tools used in this project are:
 1. Python
 2. Jupyter Notebook
 3. PostgreSQL
 4. Tableau
 5. Bash (To install certain dependancies. This project was done on MacOS)

The files I extracted from DagsHub using python could not be uploaded to this repository since they are too large. Run the jupyter notebook to download the files on your PC.
