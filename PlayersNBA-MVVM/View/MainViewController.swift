//
//  MainViewController.swift
//  PlayersNBA-MVVM
//
//  Created by AlexRymar on 25.04.2024.
//

import UIKit

final class MainViewController: UIViewController {
    
    let tableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
}()
    
    var viewModel  = MainViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadApp()
    }
    
    private  func loadApp() {
        DispatchQueue.main.async {
            NetworkRequest.shared.getRequest()
        }
        setupViews()
        NotificationCenter.default.addObserver(self, selector: #selector(updateTableView), name: NSNotification.Name(rawValue: "ArrayOfPlayersUpdated"), object: nil)
    }
    
    @objc private func updateTableView() {
    tableView.reloadData()
}

    private  func setupViews(){
        view.addSubview(tableView)
        title = "🏀 NBA PLAYERS"
        setupTableView()
        setupConstraints()
    }
}

extension MainViewController{
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
