function Install-PackageUpdates {

    Write-Verbose "Getting all available Updates"

    $UpgradeArray = @((winget list --upgrade-available) -match "[A-Za-z0-9]\.[A-Za-z0-9]")
    if ($null -eq $UpgradeArray) {

        [System.Console]::WriteLine("No Packages need to be updated")
        exit

    } else {

        $list = ($UpgradeArray -split ' ') -match "[A-Za-z0-9]\.[A-Za-z0-9]" -notmatch "[0-9]\.[0-9]"

        Write-Verbose "These Packages need to be upgraded`n$list"

        foreach ($package in $list) {

            winget upgrade $package

        }

        [System.Console]::WriteLine("All packages have been updated")

    }

}