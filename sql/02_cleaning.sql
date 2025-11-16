-- Remove duplicate transactions in staging
WITH Deduped AS (
    SELECT *, ROW_NUMBER() OVER(PARTITION BY TransactionID ORDER BY TransactionDate DESC) AS rn
    FROM Staging_Transactions
)
DELETE FROM Deduped WHERE rn > 1;

-- Fill missing customer genders
UPDATE Customers
SET Gender = 'Unknown'
WHERE Gender IS NULL;

-- Correct negative quantities or amounts
UPDATE Transactions
SET Quantity = ABS(Quantity), TotalAmount = ABS(TotalAmount)
WHERE Quantity <= 0 OR TotalAmount <= 0;

-- Standardize product categories
UPDATE Products
SET Category = UPPER(Category);
