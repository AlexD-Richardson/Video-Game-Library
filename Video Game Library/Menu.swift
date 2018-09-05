//
//  Menu.swift
//  Video Game Library
//
//  Created by Alex Richardson on 8/30/18.
//  Copyright © 2018 Alex Richardson. All rights reserved.
//

import Foundation

class Menu {
    
    var shouldQuit = false
    
    let library = Library()
    
    func go() {
        
        help()
        
        repeat {
            
            var input = getInput()
            
            while validateInput(input) == false {
                print("Invalid Input")
                input = getInput()
            }
            
            handleInput(input)
            
            
        } while !shouldQuit
        
    }
    
    
    func help() {
        
        print("""
        Menu
        1 Add Game
        2 Remove Game
        3 List Available Games
        4 Check Out Games
        5 Check In Games
        6 List Checked Out Games
        7 Help
        8 Quit
        
        """)
        
        print("Please enter a number corresponding to the option you want:")
        
    }
    
    func getInput() -> String {
        var input: String? = nil
        
        repeat {
            let line = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if line != "" {
                input = line
            } else {
                print("Invalid input!")
            }
        } while input == nil
        
        return input!
    }
    
    func validateInput( _ input: String) -> Bool {
        let menuOptions = Array(1...8)
        
        guard let number = Int(input) else { return false }
        
        return menuOptions.contains(number)
    }
    
    
    func handleInput(_ input: String) {
        switch input {
        case "1":
            library.addGame()
            print("\n")
            help()
        case "2":
            library.removeGame()
            print("\n")
            help()
        case "3":
            library.listAvailableGames()
            print("\n")
            help()
        case "4":
            library.checkOutGames()
            print("\n")
            help()
        case "5":
            library.checkInGames()
            print("\n")
            help()
        case "6":
            library.checkedOutGames()
            print("\n")
            help()
        case "7":
            help()
        case "8":
            quit()
        default:  //if input is anything else
            break
        }
    }
    
    func quit() {
        shouldQuit = true
        print("Thanks for using the Video Game Library! Bye.")
    }
}
