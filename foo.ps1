$NonInteractive = [Environment]::GetCommandLineArgs() | Where-Object{ $_ -like '-NonI*' }
if ([Environment]::UserInteractive -and -not $NonInteractive) {
  echo "Interactive"
} else {
  echo "NonInteractive"
}
