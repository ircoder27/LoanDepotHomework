﻿<#
Description:
This code will collect 2 different sets of multiples defined by 2 different variables
$mutliple1 / $multiple2) limited by a 3rd variable ($max). Once collected, the results
are displayed and then summed.

The premise is that $multiple1 will be the lower of the 2 multiples being used.
The code is structed to check the lower of the 2 multiples first and if the 
product of the multiple and the multiplier exceeds the limit as set by the 
upper variable, then we exit the loop since the larger of the 2 multiples ($multiple2)
will already have surpassed the upper limit in a previous loop.

This is a very 'brute force' attempt to solve the problem. A more elegant solution
is likely using .NET array function.

Date: 04/04/2018
Author: Arden Walde
This code was generated by request from Loan Depot as a preliminary skill test
prior to a subsequent, more difficult test to be administered onsite
#>


$multiple = 0           # variable to capture temporary values
$multiple1 = 3          # 1 of 2 multiples to be evaluated/captured
$multiple2 = 5          # 2 0f 2 multiples to be evaluated/captured
$multiple1Array = @()   # define empty array to capture all multiples of first
$multiple2Array = @()   # define empty array to capture all multiples of second
$max = 1000             # numerical limit to capture 
$arraySum = $array1Sum = $array2Sum = 0    # variables to capture temporary values
$loopCounter = 1        # provides a multiplier for the multiples
$loopComplete = 0       # not really needed - just keeps the loop going
clear-host              # clear the screen for clarity

while($loopComplete -eq 0)   # top of loop - really not the best looping choice
{
    $multiple = $multiple1 * ($loopCounter)          # multiply the first (lower)
    if ($multiple -lt $max)                          # check against upper limit
    {
        $multiple1Array+=$multiple                   # if not - add to array
        $multiple = 0                                # reset the variable (safety)
    }
    else                                             # if we exceed the upper
    {
        write-host ($multiple1Array)                 # display the smaller multiples
        write-host ($multiple2Array)                 # display the larger multiples
        $multiple1Array | Foreach{$array1Sum +=$_}   # sum the contents of the array
        $multiple2Array | Foreach{$array2Sum +=$_}   # and of the larger multiple array
        $arraySum=$array1Sum + $array2Sum            # sum the array subtotals
        write-host ($arraySum)                       # display the final sum
        break                                        # exit the script (not elegant)
    }
    
    $multiple = $multiple2 * ($loopCounter)          # multiply the second (larger)
    if ($multiple -lt $max)                          # check against upper limit
    {
        $multiple2Array+=$multiple                   # if not - add to array
        $multiple = 0                                # reset the variable (safety
    }
    $loopCounter++                                   # increment the multiplier
}
