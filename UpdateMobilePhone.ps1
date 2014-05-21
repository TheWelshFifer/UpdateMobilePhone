$user = get-aduser -filter * -properties * | where {$_.Mobilephone -ne $null -and $_.mobilephone.startswith("0")}

foreach($u in $user)
{
    set-aduser $u -mobilephone("+44"+$u.mobilephone.trimstart("0"))
}