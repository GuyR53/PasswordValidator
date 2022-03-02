# Getting the parameter (password) from the powershell
$password=$args[0]

# Checking if we got have to take the pass from a file and if so we take it
if ("$password" -like "-f" )
{
  $File=$args[1]
  $password=Get-Content -Path $File
}

$OutMessage=""
$Flag=0


# Checking if length is minimum of 10 characters
if ((${#Password} -lt 10))
{
    $OutMessage+="Password is less than 10 characters!'n";
    $Flag=1
}

# Checking if pass contains both alphabet and number.
if ($password -notmatch "^\d+$" -or $password -notmatch '\d')
{
    $OutMessage+="The Password must contain at least one letter and one digit!'n";
    $Flag=1
}

#Checking if pass include both small and capital case letters.
if (($password -notcontains "[a-z]" -or $password -notcontains "[A-Z]"))
{
    $OutMessage+="The Password must contain at least one UPPERCASE and one LOWERCASE letter!";
    $Flag=1
}

# Checking whether we have an error in the pass and print out messages according to that, return exit codes
if ( "$Flag" -eq 1 )
{

    echo ^<ESC^>[31m [31m$OutMessage[0m ;
    exit 1
}
else
{
    echo ^<ESC^>[32m [32m"Password is valid!"[0m
    exit 0
}


