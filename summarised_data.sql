-- Patients on anti-epileptic drugs
CREATE TABLE epilepsy_summary.aed_patients AS
SELECT
    d.person_id,
    a.drug_name,
	MIN(CAST(d.drug_era_start_date AS DATE)) AS start_date,
	g.gender,
	r.race_name,
	l.state
FROM public.drug_era d
INNER JOIN epilepsy_summary.aed_concept_ids a
    ON d.drug_concept_id = a.concept_id
INNER JOIN public.person p
	ON d.person_id = p.person_id
JOIN epilepsy_summary.gender_synpuf g
	ON p.gender_source_value = g.gender_code
JOIN epilepsy_summary.omop_race r
	ON p.race_concept_id = r.race_concept_id
JOIN public.location l
	ON p.location_id = l.location_id
GROUP BY d.person_id,
    a.drug_name,g.gender,
	r.race_name,
	l.state;


-- Seizure occurrences in the datasets
CREATE TABLE epilepsy_summary.seizure_events AS
SELECT co.condition_occurrence_id,
	co.person_id,
	sc.concept_name,
	co.condition_concept_id,
	co.condition_start_date,
	co.condition_type_concept_id,
	co.condition_source_concept_id
FROM public.condition_occurrence co
INNER JOIN epilepsy_summary.seizure_concepts sc 
	ON co.condition_source_concept_id = sc.concept_id
ORDER BY condition_start_date, person_id;


-- Summary table of all patients who have had a seizure
CREATE TABLE epilepsy_summary.seizure_patients AS
SELECT
    se.person_id,
    COUNT(se.*) AS seizure_count,
    MIN(se.condition_start_date) AS first_seizure_date,
    MAX(se.condition_start_date) AS last_seizure_date,
	g.gender,
	r.race_name,
	l.state
FROM epilepsy_summary.seizure_events se
INNER JOIN public.person p
	ON se.person_id = p.person_id
JOIN epilepsy_summary.gender_synpuf g
	ON p.gender_source_value = g.gender_code
JOIN epilepsy_summary.omop_race r
	ON p.race_concept_id = r.race_concept_id
JOIN public.location l
	ON p.location_id = l.location_id
GROUP BY se.person_id,
    g.gender,
	r.race_name,
	l.state


-- This is a table containing all patients who are on AEDs or have had atleast 1 seizure 
CREATE TABLE epilepsy_summary.all_patients_seizure_aed AS 
WITH seizure_counts AS ( 
	SELECT person_id, COUNT(*) AS seizure_count, 
	MIN(condition_start_date) AS first_seizure_date, 
	MAX(condition_start_date) AS last_seizure_date 
	FROM epilepsy_summary.seizure_events GROUP BY person_id ) 
SELECT COALESCE(sc.person_id, aed.person_id) AS person_id, 
	sc.seizure_count, 
	sc.first_seizure_date, 
	sc.last_seizure_date, 
	aed.drug_name AS current_aed, 
	aed.start_date AS aed_start_date, 
	aed.gender, 
	aed.race_name, 
	aed.state 
FROM seizure_counts sc 
FULL OUTER JOIN epilepsy_summary.aed_patients aed 
	ON sc.person_id = aed.person_id
ORDER BY person_id;

