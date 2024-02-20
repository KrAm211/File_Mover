$path = "C:\Users\mark1\Documents\Folder 1"
$destination = "C:\Users\mark1\Documents\Folder 2"
$items = get-childitem -Path $path

foreach($item in $items)
{   
	$extension = [System.IO.Path]::GetExtension($item)
	if($extension -like ".txt")
	{
    	$filepath = $item.FullName
    	Move-Item -Path $filepath -Destination $destination
    	Write-Output $item "Moved succesfully"
	}
	elseif($item.Name -like "Screenshot*")
	{
    	Write-Output $item.Name "Image found"
	}
	else
	{
    	Write-Output $item.Name "Move failed"
	}
	Write-Output `n
}
Write-Output "Move finished"
