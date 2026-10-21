
-- View all policies
SELECT * FROM policies;

-- Active policies
SELECT * FROM policies
WHERE policy_status='Active';

-- Total premium by policy type
SELECT policy_type, SUM(premium) AS total_premium
FROM policies
GROUP BY policy_type;

-- Total claim amount by status
SELECT claim_status, SUM(claim_amount) AS total_claim
FROM claims
GROUP BY claim_status;

-- Join all tables
SELECT c.customer_name, c.city, p.policy_type,
       cl.claim_amount, cl.claim_status
FROM customers c
JOIN policies p
ON c.customer_id=p.customer_id
JOIN claims cl
ON p.policy_id=cl.policy_id;

-- Premium above average
SELECT *
FROM policies
WHERE premium > (
    SELECT AVG(premium)
    FROM policies
);

-- Count claims
SELECT claim_status, COUNT(*) AS total_claims
FROM claims
GROUP BY claim_status;
