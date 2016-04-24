SELECT COUNT(term_freq.id_doc) as juml, term_freq.id_term, all_terms.term 
FROM term_freq 
LEFT JOIN all_terms 
ON term_freq.id_term = all_terms.id_term 
WHERE term_freq.id_term 
IN (SELECT id_term FROM term_freq WHERE id_doc = 1) GROUP BY term_freq.id_term