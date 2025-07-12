Update-Packages {
    $UpgradeArray = @((winget list --upgrade-available) -match "[A-Za-z0-9]\.[A-Za-z0-9]")
    $list = ($UpgradeArray -split ' ') -match "[A-Za-z0-9]\.[A-Za-z0-9]" -notmatch "[0-9]\.[0-9]"
    foreach ($package in $list) {
        winget upgrade $package
    }
}