-- Check if the table 'orders' exists before attempting to drop it
PRAGMA foreign_keys = OFF;  -- Disable foreign key constraints temporarily
BEGIN;
    -- Create a temporary table to store the result of the existence check
    CREATE TEMPORARY TABLE IF NOT EXISTS temp_check (exists INTEGER);
    
    -- Insert a value into the temporary table if the 'orders' table exists
    INSERT INTO temp_check (exists)
    SELECT 1 FROM sqlite_master WHERE type='table' AND name='orders';
    
    -- Drop the 'orders' table if it exists
    DELETE FROM temp_check WHERE exists = 0; -- Remove the row if the table does not exist
    DROP TABLE IF EXISTS orders; -- This will only execute if the table exists
COMMIT;
PRAGMA foreign_keys = ON;  -- Re-enable foreign key constraints
