-- Update password column to support BCrypt hash (60+ characters)
USE KiemTraQTWeb;
GO

ALTER TABLE Users
ALTER COLUMN password NVARCHAR(255);
GO

-- Update existing passwords to BCrypt hash
-- BCrypt hash of '123' = $2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy
UPDATE Users
SET password = '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy'
WHERE password = '123';
GO

PRINT 'Password column updated successfully!';
GO
