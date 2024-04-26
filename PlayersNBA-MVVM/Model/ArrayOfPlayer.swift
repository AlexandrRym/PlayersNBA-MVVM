//
//  ArrayOfPlayer.swift
//  PlayersNBA-MVVM
//
//  Created by AlexRymar on 25.04.2024.
//

import Foundation
final class ArrayOfBasketballPlayers:CustomStringConvertible{
    static let shared = ArrayOfBasketballPlayers();private init() {}
        
    var ArrayOfPlayers: [PlayerNBA] = [] {
        didSet {
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ArrayOfPlayersUpdated"), object: nil)
            }
        }
    }
    
    var description: String {
        var result = ""
        for player in ArrayOfPlayers {
            result += "Id: \(player.id) , First Name: \(player.firstName), Last Name: \(player.lastName), Position: \(player.position) , Height:\(player.height)\n"
        }
        return result
    }
}
   

