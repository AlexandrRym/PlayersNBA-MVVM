//
//  NetworkRequest.swift
//  PlayersNBA-MVVM
//
//  Created by AlexRymar on 25.04.2024.
//

import Foundation
final class NetworkRequest{
    static let shared = NetworkRequest() ; private init(){}
    
    func getRequest (){
        let url = URL(string: "https://api.balldontlie.io/v1/players")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("33b58804-a27d-47ab-8746-6c66ee204032", forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid response")
                return
            }
            print("Status code: \(httpResponse.statusCode)")
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let welcome = try decoder.decode(Welcome.self, from: data)
                    let playerArray = welcome.data
                    for element in 0..<25{
                        let datum:Datum = Datum(id: playerArray[element].id, 
                                                firstName:  playerArray[element].firstName,
                                                lastName:  playerArray[element].lastName,
                                                position:  playerArray[element].position,
                                                height:  playerArray[element].height,
                                                weight:  playerArray[element].weight,
                                                jerseyNumber:  playerArray[element].jerseyNumber,
                                                college:  playerArray[element].college,
                                                country:  playerArray[element].college,
                                                draftYear:  playerArray[element].draftYear,
                                                draftRound:  playerArray[element].draftRound,
                                                draftNumber:  playerArray[element].draftNumber, team:  playerArray[element].team)
                        let playerNBA:PlayerNBA = PlayerNBA(id: playerArray[element].id,
                                                            firstName:  playerArray[element].firstName,
                                                            lastName:  playerArray[element].lastName,
                                                            position:  playerArray[element].position, height:  playerArray[element].height)
                        ArrayOfBasketballPlayers.shared.ArrayOfPlayers.append(playerNBA)
                        ArrayInfo.shared.ArrayOfInfoAboutePlayer.append(datum)
                    }
                    print(ArrayOfBasketballPlayers.shared.description)
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }
        task.resume()
    }
}

