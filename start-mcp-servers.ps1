# start-mcp-servers.ps1
$servers = @(
    @{
        Name = "SQLite"
        Command = "uvx"
        Args = @("mcp-server-sqlite", "--db-path", "C:\DESKTOP\ClaudeMCP\test.db")
    },
    @{
        Name = "EEG"
        Command = "uv"
        Args = @("run", "eeg")
        WorkDir = "C:\DESKTOP\ClaudeMCP\eeg"
    },
    @{
        Name = "Filesystem"
        Command = "npx"
        Args = @("@modelcontextprotocol/server-filesystem", "C:\Users\melan\Desktop")
    }
)

foreach ($server in $servers) {
    $processParams = @{
        FilePath = $server.Command
        ArgumentList = $server.Args
        WindowStyle = 'Normal'
    }
    if ($server.WorkDir) {
        $processParams.WorkingDirectory = $server.WorkDir
    }
    Start-Process @processParams
}