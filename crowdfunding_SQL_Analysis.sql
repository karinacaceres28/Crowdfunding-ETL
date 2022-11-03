-- Challenge Bonus queries.

SELECT cf_id, backers_count
FROM campaign
WHERE outcome = 'live'
ORDER BY backers_count DESC;

SELECT cf_id, COUNT(backer_id) as backers_count
FROM backers
GROUP BY cf_id
ORDER BY backers_count DESC;

SELECT co.first_name, co.last_name, co.email, 
    (ca.goal) as "Remaining Goal Amount"
INTO email_contacts_remaining_goal_amount
FROM contacts as co
INNER JOIN campaign as ca
ON ca.contact_id = co.contact_id
WHERE ca.outcome = 'live'
ORDER BY ca.goal DESC;

SELECT * FROM email_contacts_remaining_goal_amount;

SELECT ba.email, ba.first_name, ba.last_name,
    ca.cf_id, ca.description, ca.end_date,
    (ca.goal) as "Left of Goal"
INTO email_backers_remaining_goal_amount
FROM backers as ba
INNER JOIN campaign as ca
ON ba.cf_id = ca.cf_id
ORDER BY ba.last_name;

SELECT * FROM email_backers_remaining_goal_amount;


