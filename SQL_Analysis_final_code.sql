-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT cf_id, backers_count, outcome
FROM campaign
WHERE outcome = 'live'
ORDER BY backers_count DESC;

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT cf_id, COUNT(cf_id) as backers_count
FROM backers
GROUP BY cf_id
ORDER BY COUNT(cf_id) DESC;

-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
SELECT ct.first_name, 
	ct.last_name, 
	ct.email,
	(cp.goal - cp.pledged) as "Remaining Goal Amount"
--INTO email_contacts_remaining_goal_amount
FROM contacts as ct
INNER JOIN campaign as cp
ON (ct.contact_id=cp.contact_id)
WHERE cp.outcome = 'live'
ORDER BY "Remaining Goal Amount" DESC;

-- Check the table
SELECT * FROM email_contacts_remaining_goal_amount

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
SELECT bk.email,
	bk.first_name, 
	bk.last_name,
	bk.cf_id,
	cp.company_name,
	cp.description,
	cp.end_date,
	(cp.goal - cp.pledged) as "Left of Goal"
INTO email_backers_remaining_goal_amount
FROM backers as bk
LEFT JOIN campaign as cp
ON (bk.cf_id=cp.cf_id)
WHERE cp.outcome = 'live'
ORDER BY bk.email DESC;

-- Check the table
SELECT * FROM email_backers_remaining_goal_amount











































