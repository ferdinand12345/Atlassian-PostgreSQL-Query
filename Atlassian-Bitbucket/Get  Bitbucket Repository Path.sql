SELECT
	'<your-bitbucket-home>/' || r. ID AS PATH,
	r.slug,
	P .project_key
FROM
	repository r
JOIN project P ON r.project_id = P . ID
ORDER BY
	P .project_key ASC,
	r.slug ASC