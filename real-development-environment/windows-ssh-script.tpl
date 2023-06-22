add-content -path c:\Users\evansc.ssh/config -value '
Host ${hostname}  
    HostName ${hostname}     
    User ${user}     
    IdentityFile ${pem}'