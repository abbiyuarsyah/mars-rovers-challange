//
//  ViewController.swift
//  MarsRovers
//
//  Created by Pandu Abbiyuarsyah on 01/05/18.
//  Copyright © 2018 Shortlyst. All rights reserved.
//

import UIKit

class MarsRoversViewController: UIViewController {
    
    private let N: Int = 1
    private let E: Int = 2
    private let S: Int = 3
    private let W: Int = 4
    
    private var xCordinate: Int = 0
    private var yCordinate: Int = 0
    private var roversHeading: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roversLocation()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    public func setPosition(x: Int, y: Int, heading: Int) {
        xCordinate = x
        yCordinate = y
        roversHeading = heading
    }
    
    private func roversLocation() {
        //MARK - just a title
        print("=====THE OUTPUT=====")
        
        //MARK - set the input with a hardcode
        
        //MARK - Rover 1
        setPosition(x: 5, y: 5, heading: 0)
        setPosition(x: 1, y: 2, heading: N)
        process(roverControl: "LMLMLMLMM")
        roversPosition()
        
        //MARK - Rover 2
        setPosition(x: 3, y: 3, heading: E)
        process(roverControl: "MMRMMRMRRM")
        roversPosition()
    }
    
    //================================ROVER PROCESS====================================
    
    private func process(roverControl: String) {
        
        for i in 0..<roverControl.count {
            let index = roverControl.index(roverControl.startIndex, offsetBy: i)
            let gotStringIndex = roverControl[index]
            doTheProcess(roverControl: gotStringIndex)
        }
        
    }
    
    private func doTheProcess(roverControl: Character) {
        if roverControl == "L" {
            goToLeft()
        } else if roverControl == "R" {
            goToRight()
        } else if roverControl  == "M" {
            moveForward()
        } else {
            print("ooppss there's something wrong")
        }
    }
    
    
    //================================ROVER MOVEMENTS====================================
    
    private func goToLeft(){
        roversHeading = (roversHeading! - 1) < N ? W : roversHeading! - 1
    }
    
    private func goToRight() {
        roversHeading = (roversHeading! + 1) > W ? N : roversHeading! + 1
    }
    
    private func moveForward() {
        if roversHeading == N {
            yCordinate += 1
        } else if roversHeading == E {
            xCordinate += 1
        } else if roversHeading == S {
            yCordinate -= 1
        } else if roversHeading == W {
            xCordinate -= 1
        }
    }
    
    //================================THE OUTPUT====================================
    
    // just run it with the iPhone simulator, the output will be shown on the Log Debugger below
    
    private func roversPosition() {
        var heading = "N"
        
        if roversHeading == 1 {
            heading = "N"
        } else if roversHeading == 2 {
            heading = "E"
        } else if roversHeading == 3 {
            heading = "S"
        } else if roversHeading == 4 {
            heading = "W"
        }
        print("\(xCordinate) \(yCordinate) \(heading)")
    }
    
}


