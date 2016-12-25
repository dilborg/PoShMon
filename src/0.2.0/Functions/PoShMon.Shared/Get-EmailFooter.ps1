Function Get-EmailFooter
{
    [CmdletBinding()]
    param(
        [string[]]$SkippedTests,
        [TimeSpan]$TotalElapsedTime
    )

    $emailSection = ''

    $emailSection += '<p>Skipped Tests: '
    if ($SkippedTests -ne $null -or $SkippedTests.Count -eq 0)
        { $emailSection += "None</p>" }
    else
        { $emailSection += ($SkippedTests -join ", ") + "</p>" }

    if ($TotalElapsedTime -ne $null)
         { $emailSection += "<p>Total Elapsed Time (Seconds): $("{0:F2}" -f $TotalElapsedTime.TotalSeconds) ($("{0:F2}" -f $TotalElapsedTime.TotalMinutes) Minutes)</p>" }

    $emailSection += '</body>'

    return $emailSection;
}