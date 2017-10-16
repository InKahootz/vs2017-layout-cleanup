# Catalog is master download list
$catalog = (Get-Content .\Catalog.json) | ConvertFrom-Json 
$set = New-Object System.Collections.Generic.HashSet[string]
$catalog.packages | foreach { $set.Add("$($_.id),version=$($_.version)") | Out-Null }
$folders = Get-ChildItem -Directory

foreach ($folder in $folders) { 
    # Only look at folders with the version identifier in them
    if ("$folder.Name" -match "(.*?,version=[\d.]+\d)") 
    {  
        # If they weren't in our catalog, aka old download, delete it
        if (!$set.Contains("$($matches[0])")){
            Write-Host "$($matches[0]) is presumably from an old layout. Deleting it."
            Remove-Item $folder.PSPath -Recurse -ErrorAction SilentlyContinue
        }
    } 
}