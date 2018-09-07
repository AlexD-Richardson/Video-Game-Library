//
//  Library.swift
//  Video Game Library
//
//  Created by Alex Richardson on 9/4/18.
//  Copyright © 2018 Alex Richardson. All rights reserved.
//

import Foundation

class Library {
    
    private var gameArray: [Game] =
        
        [Game(title: "Super Smash Bros Melee", rating: "T"),
         Game(title: "Mario Kart 64", rating: "E"),
         Game(title: "Sonic Adventure Battle 2", rating: "E"),
         Game(title: "Super Mario 64", rating: "E"),
         Game(title: "Fallout 3", rating: "M"),
         Game(title: "Red Dead Redemption", rating: "M")]
    
    func addGame() {
        
        print("\n")
        
        print("If you want to add a game to the Video Game Library, you must enter an administrator password.")
        
        var input: String? = nil
        
        repeat {
            let line = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if line != "" {
                input = line
            } else {
                print("Invalid input! Please try again:")
            }
        } while input == nil
        
        print("\n")
        
        if input == "Gamecube>All" {
            
            print("Welcome Admin! Please enter the title of the game you want to add:")
            var input: String? = nil
            
            repeat {
                let line = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
                
                if line != "" {
                    
                    input = line
                    
                } else {
                    
                    print("Invalid input! Please try again:")
                }
            } while input == nil
            
            var input2: String? = nil
            
            print("\n")
            
            print("Please enter in the rating of \(input!)")
            
            repeat {
                
                let line = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
                
                if line == "M" || line == "T" || line == "E" {
                    
                    input2 = line
                    
                } else {
                    
                    print("Invalid input! Please try again:")
                }
                
            } while input2 == nil
            
            
            
            gameArray.append(Game(title: input!, rating: input2!))
            
            print("\n")
            
            print("Thanks for adding a game! Here is our library of games so far:")
            
            print("\n")
            
            for game in gameArray {
                
                print("\(game.title) Rating: \(game.rating)")
                
            }
            print("\n")
            
        } else {
            
            print("Sorry we don't recognize that password!")
        }
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
        
        print("\n")
        
        if input == "Gamecube>All" {
            
            
            print("Welcome Admin! Here is the list of the games we have to remove:")
            
            print("\n")
            
            for (i, index) in gameArray.enumerated() {
                
                print("\(i + 1) \(index.title) Rating: \(index.rating)")
                
            }
            
            print("\n")
            
            print("Please enter in a number corresponding to the game you want to remove:")
            
            if let input = Int(readLine()!) {
                
                if input > 0 && input < gameArray.count + 1 {
                    
                    if gameArray[input - 1].checkedIn == true {
                        
                        gameArray.remove(at: input - 1)
                        
                    } else {
                        print("\(gameArray[input - 1].title) is checked out at the moment! You must check the game in first")
                        checkInGames()
                        
                    }
                    
                } else {
                    print("Invalid Input! Please enter in a number between 1 and \(gameArray.count)")
                    removeGame()
                    
                }
                
            }  else {
                print("Invalid Input! Please enter in a number between 1 and \(gameArray.count)")
                removeGame()
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
        
        var funcCont = false
        for game in gameArray {
            
            if game.checkedIn {
                
                funcCont = true
            }
        }
        
        if !funcCont {
            return print("There are no games available at the moment. Sorry!")
        }
        
        
        print("Here are the games we have available:")
        
        print("\n")
        
        for game in gameArray {
            
            if game.checkedIn == true {
                print("\(game.title) Rating: \(game.rating)")
            }
        }
        
        print("\n")
    }
    
    func checkOutGames() {
        
        print("\n")
        
        var funcCont = false
        for game in gameArray {
            
            if game.checkedIn {
                
                funcCont = true
            }
        }
        
        if !funcCont {
            return print("There are no games available to checkout")
        }
        
        print("What game would you like to check out?")
        
        print("\n")
        
        for (i, index) in gameArray.enumerated() {
            
            if index.checkedIn == true {
                
                print("\(i + 1) \(index.title) Rating: \(index.rating)")
                
            }
            
        }
        
        print("\n")
        
        print("Please enter in a number corresponding to the game you want to check out:")
        
        if let input = Int(readLine()!) {
            
            if input > 0 && input < gameArray.count + 1 {
                
                if !gameArray[input - 1].checkedIn {
                    
                    return print("\(gameArray[input - 1].title) is already checked out. Sorry!")
                    
                }
                
                if gameArray[input - 1].rating == "M" {
                    
                    print("Please enter your age to verify if you are old enough to check this game out:")
                    
                    let permission = checkAge()
                    
                    if permission == (false, false) || permission == (false, true) {
                        
                        return print("Sorry you are too young to check this game out.")
                    }
                    
                } else if gameArray[input - 1].rating == "T" {
                    
                    print("Please enter your age to verify if you are old enough to check this game out:")
                    
                    let permission = checkAge()
                    
                    if permission == (false, false) {
                        
                        return print("Sorry you are too young to check this game out.")
                        
                    }
                }
                
                gameArray[input - 1].checkedIn = false
                
                let currentCalendar = Calendar.current
                
                let dueDate = currentCalendar.date(byAdding: .day, value: 14, to: Date())
                
                gameArray[input - 1].dueDate = dueDate
                
                if let dueDate = dueDate {
                    
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "EEEE MMMM d, yyyy"
                    print("\n")
                    print("\(gameArray[input - 1].title) is due back on \(dateFormatter.string(from: dueDate))")
                }
                
                
                
            } else {
                print("Invalid Input! Please enter in a number between 1 and \(gameArray.count)")
                checkOutGames()
            }
            
            
        } else {
            print("Invalid Input! Please enter in a number between 1 and \(gameArray.count)")
            checkOutGames()
            
        }
        
    }
    
    
    func checkInGames() {
        
        print("\n")
        
        var funcCont = false
        for game in gameArray {
            
            if !game.checkedIn {
                
                funcCont = true
            }
        }
        
        if !funcCont {
            return print("There are no games available to check in")
        }
        
        print("What game would you like to check in?")
        
        print("\n")
        
        for (i, index) in gameArray.enumerated() {
            
            if index.checkedIn == false {
                
                print("\(i + 1) \(index.title) Rating: \(index.rating)")
                
            }
            
        }
        
        print("\n")
        
        print("Please enter in a number corresponding to the game you want to check in:")
        
        print("\n")
        
        if let input = Int(readLine()!) {
            
            if input > 0 && input < gameArray.count + 1 {
                
                if gameArray[input - 1].checkedIn {
                    
                    return print("\(gameArray[input - 1].title) is already checked in")
                    
                } else {
                    
                    gameArray[input - 1].checkedIn = true
                    gameArray[input - 1].dueDate = nil
                    
                    print("\n")
                    
                    print("Here are the games that are available to check out now:")
                    
                    print("\n")
                    
                    for game in gameArray {
                        if game.checkedIn == true {
                            
                            print("\(game.title) Rating: \(game.rating)")
                        }
                    }
                }
                
                
            } else {
                print("Invalid Input! Please enter in a number between 1 and \(gameArray.count)")
                checkInGames()
            }
            
        } else {
            print("Invalid Input! Please enter in a number between 1 and \(gameArray.count)")
            checkInGames()
        }
        
    }
    
    func checkedOutGames() {
        
        print("\n")
        
        var funcCont = false
        for game in gameArray {
            
            if !game.checkedIn {
                
                funcCont = true
            }
        }
        
        if !funcCont {
            return print("There are no games checked out at the moment")
        }
        
        print("Here are the games that are checked out:")
        
        print("\n")
        
        for game in gameArray {
            
            if let dueDate = game.dueDate {
                
                let dateFormatter = DateFormatter()
                
                dateFormatter.dateFormat = "EEEE MMMM d, yyyy"
                
                if game.checkedIn == false {
                    
                    print("\(game.title) Rating: \(game.rating) Due Date: \(dateFormatter.string(from: dueDate))")
                }
            }
        }
        print("\n")
    }
    
    func checkAge() -> (Bool, Bool) {
        
        var permissionM = false
        var permissionT = false
        
        var age: Int? = nil
        
        
        repeat {
            if let input = Int(readLine()!) {
                
                age = input
                
                if age! >= 18 {
                    
                    permissionM = true
                    permissionT = true
                    
                    return (permissionM, permissionT)
                    
                } else if age! >= 13 && age! < 18 {
                    
                    permissionM = false
                    permissionT = true
                    
                    return (permissionM, permissionT)
                    
                } else {
                    
                    permissionM = false
                    permissionT = false
                    
                }
            } else {
                
                print("Invalid input! Please enter your valid age.")
            }
        } while age == nil
        
        return (permissionM, permissionT)
        
    }
    
    
}




