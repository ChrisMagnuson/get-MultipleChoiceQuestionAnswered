function get-MultipleChoiceQuestionAnswered {
    [CmdletBinding()]
    param(
        $Question,
        [array]$Choices,
        $DefaultChoice
    )
    
    $ChoiceDescriptions = @()
    foreach ($Choice in $Choices) {
        $ChoiceDescriptions += New-Object System.Management.Automation.Host.ChoiceDescription "&$Choice"
    }

    $options = [System.Management.Automation.Host.ChoiceDescription[]]$ChoiceDescriptions

    $result = $host.ui.PromptForChoice("", $Question, $options, $Choices.IndexOf($DefaultChoice))
    Write-Verbose "Index of result chosen: $result"
    Write-Verbose "Choice selected: $($Choices[$result])"
    $Choices[$result]
}