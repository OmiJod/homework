Citizen.CreateThread(function()
    
    while true do
        Citizen.Wait(5000) 

        local query = "SELECT * FROM student_errors WHERE account_balance > ?"
        local params = { 1000 }
        
        MySQL.Async.fetchAll(query, params, function(result)
            if not result then
                print("^1Error: student_errors table doesn't exist or query failed.^0")
            else
                for _, v in pairs(result) do
                    print("^2IBAN:^0", v.iban, "^2Balance:^0", v.account_balance)
                end
            end
        end)

        MySQL.Async.execute("INSERT INTO student_errors (iban, account_balance, username) VALUES (?, ?, ?)", {
            "ERROR_123", 100, "debug_user"
        }, function(rowsChanged)
            if rowsChanged == 0 then
                print("^1Error: Missing required column in insertion.^0")
            end
        end)
    end
end)
