SELECT
	q.queue_id,
	q.agent_type,
	q.title AS agent_title,
	COUNT (1) AS jumlah_build
FROM
	queue q
INNER JOIN (
	SELECT
		build_agent_id
	FROM
		buildresultsummary
	WHERE
		EXTRACT (
			YEAR
			FROM
				build_completed_date
		) = 2023
	AND EXTRACT (
		MONTH
		FROM
			build_completed_date
	) = 8
	AND build_agent_id IS NOT NULL
) A ON A .build_agent_id = q.queue_id
WHERE
	q.agent_type = 'LOCAL'
GROUP BY
	q.queue_id,
	q.agent_type,
	q.title