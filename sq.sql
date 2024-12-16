CREATE TABLE IF NOT EXISTS `student_errors` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `iban` VARCHAR(20) NOT NULL, 
    `account_balance` INT NOT NULL, 
    `last_login` DATETIME, 
    `username` VARCHAR(50) 
    `is_active` BOOLEAN,
    `role` VARCHAR(20) DEFAULT NULL
); 