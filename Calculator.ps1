Write-Host "Welcome to my Calculator using Powershell Scripting" -ForegroundColor Green

function ParseInput {
    $ref = ''
    do {
        $parsed = [int]::TryParse((Read-Host "Enter a number"), [ref]$ref)
        if (-not $parsed) {
            Write-Host ("ERROR! You must enter a numeric value") -ForegroundColor Red
        }
    } while (-not $parsed)
    $ref
}

$R = $true

while ($R) {
    $num1 = ParseInput
    $num2 = ParseInput
    $operators = Read-Host "Choose an operator [+, -, *, or /]"
    Switch($operators){
        - {
            Write-Host("The difference is: ")
            $num1 - $num2
        }

        +{
            Write-Host("The sum is: ")
            $num1 + $num2
        }

        *{
            Write-Host("The product is: ")
            $num1 * $num2
        }

        /{
            Write-Host("The quotient is: ")
            $num1 / $num2
        }

        default{
            Write-Host("Syntax Error") -ForegroundColor Red
        }
    }
    $choix = Read-Host "Do you want to continue? Y/N"
    if($choix -notmatch "^(Yes|Y)$") {
        $R = $false
    }
}
