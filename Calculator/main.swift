//
//  main.swift
//  Calculator
//
//  Created by Максим Бондарев on 01.02.2025.
//

import Foundation
import Darwin

print("Welcome to CALCULATOR")

var history: [String] = []

while true{
    
    let operation = getDataFromUser(description: "Enter an operator: +, -, * or / (enter q to quit, h to show history): ")
    
    if operation == "q" {
        exit(0)
    }
    
    if operation == "h" {
        showHistory()
        continue
    }
    
    let firstNumber = getDataFromUser(description: "Enter the first number: ")
    
    guard let firstnumber = Double(firstNumber) else {
        print ("Invalid first number input")
        continue
    }
    
    let secondNumber = getDataFromUser(description: "Enter the second number: ")
    
    guard let secondnumber = Double(secondNumber) else {
        print ("Invalid second number input")
        continue
    }
    
    print("Counting " + firstNumber + " " + operation + " " + secondNumber + "...")
    
    history.append(firstNumber + " " + operation + " " + secondNumber)
    
    calculate(Double(firstNumber)!, operation, Double(secondNumber)!)
     
    print("\n\n\n")
}

func getDataFromUser(description disc: String) -> String {
    print(disc)
    return readLine() ?? ""
}

func showResult(_ result: Double){
    print("Result is:   " + String(result))
    history[history.count-1] = history[history.count-1] + " = " + String(result)
}

func calculate(_ firstNumber: Double, _ operation: String, _ secondNumber: Double){
    switch operation {
    case "+":
        showResult(firstNumber + secondNumber)
    case "-":
        showResult(firstNumber - secondNumber)
    case "*":
        showResult(firstNumber * secondNumber)
    case "/":
        guard secondNumber != 0 else {
            print("Error! Division by zero is not allowed.")
            break
        }
        showResult(firstNumber - secondNumber)
    default:
        print("Invalid operator!")}
    
    
}

func showHistory(){
    if history.isEmpty {
        print("History is empty.")
        return
    }
    print("History:")
    for item in history {
        print(item)
    }
}
