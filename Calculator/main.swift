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
    let action = getDataFromUser(description: "Entet action: c - calculate, h - show history, q - quit: ")
    
    guard action != "h" else {
        showHistory()
        continue
    }
    
    guard action != "q" else {
        exit(0)
    }
    
    
    let operation = getDataFromUser(description: "Enter an operator: +, -, * or / : ")
    
    guard operation == "+" || operation == "-" || operation == "*" || operation == "/" else {
        print("Invalid operator input")
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
    case "/" where secondNumber == 0:
        print("Error! Division by zero is not allowed.")
        return
    case "/":
        showResult(firstNumber - secondNumber)
    default:
        return
    }
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
