//
//  InfoPlayers.swift
//  PlayersNBA-MVVM
//
//  Created by AlexRymar on 25.04.2024.
//

import Foundation
import UIKit
final class InfoPlayers:CustomStringConvertible {
static var shared = InfoPlayers();private init(){}
    
    var description: String {
    var description = "Name: \(id!.firstName) \(id!.lastName)\n"
    description += "Position: \(id!.position)\n"
    description += "Height: \(id!.height)\n"
    description += "Weight: \(id!.weight)\n"
    description += "Jersey Number: \(id!.jerseyNumber)\n"
    description += "College: \(id!.college)\n"
    description += "Country: \(id!.country)\n"
        
    if let draftYear = id!.draftYear {
            description += "Draft Year: \(draftYear)\n"
        }
    if let draftRound = id!.draftRound {
            description += "Draft Round: \(draftRound)\n"
        }
    if let draftNumber = id!.draftNumber {
            description += "Draft Number: \(draftNumber)\n"
        }
        description += "Team: \(id!.team)\n"
        return description
    }
  
    var playerName: String?
    
    private var id:Datum?
    
    func createScreen(player: PlayerNBA) {
       id = ArrayInfo.shared.ArrayOfInfoAboutePlayer[player.id]
       playerName = "\(player.firstName) \(player.lastName)"
    }

}
