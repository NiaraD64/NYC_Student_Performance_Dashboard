SELECT * FROM math_results_backup
LIMIT 15;

--Check for duplicates
SELECT report_category, geographic_subdivision, school_name, 
grade, year, student_category, COUNT(*)
FROM math_results_backup
GROUP BY report_category, geographic_subdivision, school_name, 
grade, year, student_category
HAVING COUNT(*) > 1;

--Check for missing values
SELECT 
COUNT(*) FILTER (WHERE report_category IS NULL) AS null_report_category,
COUNT(*) FILTER (WHERE geographic_subdivision IS NULL) AS null_geo,
COUNT(*) FILTER (WHERE school_name IS NULL) AS null_school,
COUNT(*) FILTER (WHERE grade IS NULL) AS null_grade,
COUNT(*) FILTER (WHERE year IS NULL) AS null_year,
COUNT(*) FILTER (WHERE student_category IS NULL) AS null_student_category,
COUNT(*) FILTER (WHERE number_tested IS NULL) AS null_num_tested,
COUNT(*) FILTER (WHERE mean_scale_score IS NULL) AS null_mean_score,
COUNT(*) FILTER (WHERE num_level_1 IS NULL) AS null_num_lv1,
COUNT(*) FILTER (WHERE pct_level_1 IS NULL) AS null_pct_lv1,
COUNT(*) FILTER (WHERE num_level_2 IS NULL) AS null_num_lv2,
COUNT(*) FILTER (WHERE pct_level_2 IS NULL) AS null_pct_lv2,
COUNT(*) FILTER (WHERE num_level_3 IS NULL) AS null_num_lv3,
COUNT(*) FILTER (WHERE pct_level_3 IS NULL) AS null_pct_lv3,
COUNT(*) FILTER (WHERE num_level_4 IS NULL) AS null_num_lv4,
COUNT(*) FILTER (WHERE pct_level_4 IS NULL) AS null_pct_lv4,
COUNT(*) FILTER (WHERE num_level_3_4 IS NULL) AS null_num_lv3_4,
COUNT(*) FILTER (WHERE pct_level_3_4 IS NULL) AS null_pct_lv3_4
FROM math_results_backup;