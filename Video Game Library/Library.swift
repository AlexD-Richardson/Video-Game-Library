//
//  Library.swift
//  Video Game Library
//
//  Created by Alex Richardson on 9/4/18.
//  Copyright © 2018 Alex Richardson. All rights reserved.
//

import Foundation

class Library {

    
    private var gameArray: [Game] = [Game(title: "Super Smash Bros Melee"), Game(title: "Mario Kart 64"), Game(title: "Sonic Adventure Battle 2")]
    
    func addGame() {
        
        print("\n")
        
        print("Please enter the title of the game you want to add:")
        var input: String? = nil
        
        repeat {
            let line = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if line != "" {
                input = line
            } else {
                print("Invalid input! Please try again:")
            }
        } while input == nil
        
        gameArray.append(Game(title: input!))
        
        print("\n")
        
        print("Thanks for adding a game! Here is our library of games so far:")
        
        print("\n")
        
        for game in gameArray {
            print(game.title)
            
        }
        print("\n")
    }
    
    func removeGame() {
        
        print("\n")
        
        print("If you want to remove a game from the Video Game Library, you must enter an administrator password.")
        
        var input: String? = nil
        
        repeat {
            let line = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if line != "" {
                input = line
            } else {
                print("Invalid input! Please try again:")
            }
        } while input == nil
        
        if input == "Gamecube>All" {
            
            
            
            print("Here is the list of the games we have to remove:")
            
            for (i, index) in gameArray.enumerated() {
                
                print("\(i + 1) \(index.title)")
                
            }
            
            print("\n")
            
            print("Please enter in a number corresponding to the game you want to remove:")
            
            if let input = Int(readLine()!) {
                
                if input > 0 && input < gameArray.count + 1 {
                    
                    gameArray.remove(at: input - 1)
                    
                }
                
            } else {
                print("Invalid Input! Please enter in a number between 1 and \(gameArray.count - 1)")
            }
            
            print("\n")
            
            print("Here are the games in the library after the removal:")
            
            print("\n")
            
            for game in gameArray {
                
                print(game.title)
                
            }
        }
            
        else {
            print("Sorry we don't recognize that password")
            
        }
    }
    
    func listAvailableGames() {
        
        print("\n")
        
        print("Here are the games we have available:")
        
        print("\n")
        
        for game in gameArray {
            
            if game.checkedIn == true {
                print(game.title)
            }
        }
        
        print("\n")
    }
    
    func checkOutGames() {
        print("\n")
        print("What game would you like to check out?")
        print("\n")
        
        for (i, index) in gameArray.enumerated() {
            
            if index.checkedIn == true {
                
                print("\(i + 1) \(index.title)")
                
            }
            
        }
        
        print("\n")
        
        print("Please enter in a number corresponding to the game you want to check out:")
        
        if let input = Int(readLine()!) {
            
            if input > 0 && input < gameArray.count + 1 {
                
                gameArray[input - 1].checkedIn = false
                let currentCalendar = Calendar.current
                let dueDate = currentCalendar.date(byAdding: .day, value: 14, to: Date())
                gameArray[input - 1].dueDate = dueDate
                if let dueDate = dueDate {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM/dd/yyy"
                    print("\n")
                    print("Your game is due back on \(dateFormatter.string(from: dueDate))")
                }
                
                
            } else {
                print("Invalid Input! Please enter in a number between 1 and \(gameArray.count)")
                checkOutGames()
            }
            
        }
    }
    
    func checkInGames() {
        print("\n")
        print("What game would you like to check in?")
        print("\n")
        
        for (i, index) in gameArray.enumerated() {
            
            if index.checkedIn == false {
                
                print("\(i + 1) \(index.title)")
                
            }
            
        }
        
        print("\n")
        
        print("Please enter in a number corresponding to the game you want to check in:")
        
        print("\n")
        
        if let input = Int(readLine()!) {
            
            if input > 0 && input < gameArray.count + 1 {
                
                gameArray[input - 1].checkedIn = true
                gameArray[input - 1].dueDate = nil
                
                print("\n")
                
                print("Here are the games that are available to check out now:")
                
                print("\n")
                
                for game in gameArray {
                    if game.checkedIn == true {
                        print(game.title)
                    }
                }
                
                
            } else {
                print("Invalid Input! Please enter in a number between 1 and \(gameArray.count)")
                checkInGames()
            }
            
        }
        
    }
    
    func checkedOutGames() {
        
        print("\n")
        
        print("Here are the games that are checked out:")
        
        print("\n")
        
        for game in gameArray {
            
            if let dueDate = game.dueDate {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MM/dd/yyy"
                
                if game.checkedIn == false {
                    print("\(game.title)  Due Date: \(dateFormatter.string(from: dueDate))")
                }
            }
        }
        print("\n")
    }
    
}


