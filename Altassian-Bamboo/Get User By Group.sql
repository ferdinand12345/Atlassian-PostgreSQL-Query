SELECT
	child_name
FROM
	cwd_membership
WHERE
	LOWER (parent_name) IN (
		LOWER ('Example Group'),
		LOWER ('This_is_Example')
	)
AND membership_type = 'GROUP_USER'
AND group_type = 'GROUP'
GROUP BY
	child_name