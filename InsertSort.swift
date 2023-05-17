//
// InsertSort.swift
//
//  Created by Nicolas Riscalas
//  Created on 2023-05-11
//  Version 1.0
//  Copyright (c) 2023 Nicolas Riscalas. All rights reserved.
//
//  Sorts with inser sort
import Foundation

func insertSort(_ array: inout [Int]) {
    for counter in 1..<array.count {
        let key = array[i]
        var counter2 = counter - 1
        while counter2 >= 0 && array[counter2] > key {
            array[counter2 + 1] = array[counter2]
            counter2 -= 1
        }
        array[counter2 + 1] = key
    }
}

// Set the input and output file paths
let inputFilePath = "input.txt"
let outputFilePath = "output.txt"

// Read input from file
if let inputFile = try? String(contentsOfFile: inputFilePath) {
    let lines = inputFile.components(separatedBy: "\n")

    // Process each line
    var answers = [String]()
    for line in lines {
        var numbers = line.split(separator: " ").compactMap { Int($0) }

        // Sort the numbers using insert sort
        insertSort(&numbers)
        // Write the sorted array to the output file
        let sortedArray = "Your array sorted is \(numbers)"
        answers.append(sortedArray)
    }
    // Write output to file
    let outputString = answers.joined(separator: "\n")
    do {
        try outputString.write(toFile: outputFilePath, atomically: true, encoding: .utf8)
    } catch {
        print("Error writing to file: \(error)")
    }
} else {
    print("File not found or unable to read input file")
}
