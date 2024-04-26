//
//  MainViewController + TableView.swift
//  PlayersNBA-MVVM
//
//  Created by AlexRymar on 25.04.2024.
//

import UIKit

extension MainViewController : UITableViewDataSource , UITableViewDelegate {
    
    func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        registerCell()
    }
    
    func registerCell(){
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        if ArrayOfBasketballPlayers.shared.ArrayOfPlayers.isEmpty {
            cell.nameLabel.text = "Завантаження..."
            cell.detailsLabel.text = ""
        } else {
            if indexPath.row < ArrayOfBasketballPlayers.shared.ArrayOfPlayers.count {
                let player = ArrayOfBasketballPlayers.shared.ArrayOfPlayers[indexPath.row]
                cell.nameLabel.text = "Name: \(player.firstName) \(player.lastName)"
                cell.detailsLabel.text = "Height: \(player.height),Position: \(player.position)"
            } else {
                cell.nameLabel.text = ""
                cell.detailsLabel.text = ""
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row < ArrayOfBasketballPlayers.shared.ArrayOfPlayers.count else {
            return
        }
        let selectedPlayer = ArrayOfBasketballPlayers.shared.ArrayOfPlayers[indexPath.row]
        print(selectedPlayer)
        showPlayerDetails(for: selectedPlayer)
    }
    
    func showPlayerDetails(for player: PlayerNBA) {
        InfoPlayers.shared.createScreen(player: player)
        let vc = PlayerDetailsViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
