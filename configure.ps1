# GitLab repository information
$gitlab_repo = "https://gitlab.vmic.xyz/hamflx/work-fast"
$gitlab_raw_base_url = "$gitlab_repo/-/raw/main"

# Define the file paths in the GitLab repository
$fnm_config_repo_path = "profile/.fnm-config.nu"
$fnm_env_repo_path = "profile/.fnm-env.nu"
$zoxide_repo_path = "profile/.zoxide.nu"

# Create the files in the user's home directory
$home_dir = $env:USERPROFILE
$fnm_config_path = "$home_dir\.fnm-config.nu"
$fnm_env_path = "$home_dir\.fnm-env.nu"
$zoxide_path = "$home_dir\.zoxide.nu"

# Function to download a file from GitLab
function Download-GitLabFile {
    param (
        [string]$RepoPath,
        [string]$LocalPath
    )
    
    $url = "$gitlab_raw_base_url/$RepoPath"
    
    try {
        Invoke-WebRequest -Uri $url -OutFile $LocalPath
        Write-Host "Downloaded $RepoPath to $LocalPath"
        return $true
    } catch {
        Write-Warning "Failed to download $RepoPath from GitLab: $_"
        return $false
    }
}

# Download the configuration files from GitLab
$fnm_config_downloaded = Download-GitLabFile -RepoPath $fnm_config_repo_path -LocalPath $fnm_config_path
$fnm_env_downloaded = Download-GitLabFile -RepoPath $fnm_env_repo_path -LocalPath $fnm_env_path
$zoxide_downloaded = Download-GitLabFile -RepoPath $zoxide_repo_path -LocalPath $zoxide_path

# Check if all files were downloaded successfully
if ($fnm_config_downloaded -and $fnm_env_downloaded -and $zoxide_downloaded) {
    Write-Host "All configuration files were downloaded successfully to $home_dir"
} else {
    Write-Warning "Some configuration files could not be downloaded. Please check the errors above."
}

# Define the content for nushell config
$config_content = @"
source ~/.fnm-config.nu

`$env.config.history.file_format = 'sqlite'

source ~/.zoxide.nu
"@

$env_content = @"
source-env ~/.fnm-env.nu
"@

$config_path = "$env:APPDATA\nushell\config.nu"
$env_path = "$env:APPDATA\nushell\env.nu"

# Function to check if content already exists in a file
function Test-ContentExists {
    param (
        [string]$FilePath,
        [string]$Content
    )
    
    if (Test-Path -Path $FilePath) {
        $fileContent = Get-Content -Path $FilePath -Raw
        
        # Check if each line of the content exists in the file
        foreach ($line in ($Content -split "`n")) {
            $trimmedLine = $line.Trim()
            if ($trimmedLine -and -not $fileContent.Contains($trimmedLine)) {
                return $false
            }
        }
        return $true
    }
    return $false
}

# Check and update config.nu
if (Test-Path -Path $config_path) {
    if (Test-ContentExists -FilePath $config_path -Content $config_content) {
        Write-Host "Nushell config at $config_path already contains the required content. Skipping update."
    } else {
        Add-Content -Path $config_path -Value $config_content
        Write-Host "Updated nushell config at $config_path"
    }
} else {
    Write-Warning "Config file not found at $config_path. Please create it manually before running this script."
}

# Check and update env.nu
if (Test-Path -Path $env_path) {
    if (Test-ContentExists -FilePath $env_path -Content $env_content) {
        Write-Host "Nushell environment at $env_path already contains the required content. Skipping update."
    } else {
        Add-Content -Path $env_path -Value $env_content
        Write-Host "Updated nushell environment at $env_path"
    }
} else {
    Write-Warning "Environment file not found at $env_path. Please create it manually before running this script."
}
