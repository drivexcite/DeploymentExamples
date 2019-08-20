Param (
   [string] $PlainText
)


$encodedHeader = 'Authorization=Basic ' + [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($PlainText))

write-output $encodedHeader