[CmdletBinding()]
param(
    [Parameter()]
    [ValidatePattern('^[A-Za-z0-9](?:[A-Za-z0-9-]{0,37}[A-Za-z0-9])?$')]
    [string]$Login
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    throw 'GitHub CLI (gh) não foi encontrado no PATH.'
}

if ([string]::IsNullOrWhiteSpace($Login)) {
    $Login = (& gh api user --jq '.login').Trim()
    if ($LASTEXITCODE -ne 0) {
        throw 'Não foi possível descobrir a conta autenticada. Execute gh auth login.'
    }
}

$profileUrl = "https://github.com/$Login"
$profileHtml = (Invoke-WebRequest -UseBasicParsing -Uri $profileUrl).Content

$visibleAchievements = [regex]::Matches(
    $profileHtml,
    'alt="Achievement: ([^"]+)"'
) | ForEach-Object {
    $_.Groups[1].Value
} | Sort-Object -Unique

$graphQlQuery = 'query($q:String!){search(query:$q,type:ISSUE){issueCount}}'
$searchQuery = "is:pr author:$Login is:merged"
$graphQlJson = & gh api graphql `
    -f "query=$graphQlQuery" `
    -f "q=$searchQuery"

if ($LASTEXITCODE -ne 0) {
    throw 'Não foi possível consultar pull requests mesclados.'
}

$mergedPullRequests = ($graphQlJson | ConvertFrom-Json).data.search.issueCount

[pscustomobject]@{
    Login = $Login
    Profile = $profileUrl
    MergedPullRequests = $mergedPullRequests
    VisibleAchievements = @($visibleAchievements)
}
