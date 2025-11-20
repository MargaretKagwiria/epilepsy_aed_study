-- Race reference table
CREATE TABLE IF NOT EXISTS epilepsy_summary.omop_race (
    race_concept_id INT,
    race_name TEXT,
    source TEXT
);

INSERT INTO epilepsy_summary.omop_race (race_concept_id, race_name, source) VALUES
(8527, 'White', 'OMOP Standard'),
(8516, 'Black or African American', 'OMOP Standard'),
(8657, 'Asian', 'OMOP Standard'),
(8522, 'Native Hawaiian or Other Pacific Islander', 'OMOP Standard'),
(8567, 'American Indian or Alaska Native', 'OMOP Standard'),
(44814657, 'Multiple Race', 'OMOP Standard'),
(0, 'Unknown / Not Recorded', 'OMOP Standard');


-- Gender reference table
CREATE TABLE epilepsy_summary.gender_synpuf AS
SELECT 1 AS gender_code, 'Male' AS gender
UNION ALL
SELECT 2, 'Female';

-- Seizure concept reference table
CREATE TABLE epilepsy_summary.seizure_concepts (
    concept_id INT,
    seizure_type TEXT
);

INSERT INTO epilepsy_summary.seizure_concepts (concept_id, seizure_type) VALUES
(38003536, 'Generalized seizure'),
(38003535, 'Partial seizure'),
(38003534, 'Epilepsy diagnosis'),
(38003533, 'Convulsions'),
(38003532, 'Status epilepticus');


-- Anti-epileptic drugs reference table
CREATE TABLE epilepsy_summary.aed_concept_ids (
    concept_id INT,
    drug_name TEXT
);

INSERT INTO epilepsy_summary.aed_concept_ids (concept_id, drug_name) VALUES
(1125315, 'Carbamazepine'),
(1118086, 'Valproate'),
(1112833, 'Phenytoin'),
(1124300, 'Lamotrigine'),
(1118081, 'Levetiracetam'),
(1123582, 'Clobazam'),
(1122440, 'Topiramate'),
(1124298, 'Oxcarbazepine'),
(1122200, 'Gabapentin');










