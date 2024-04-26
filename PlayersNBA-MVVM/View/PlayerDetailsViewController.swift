//
//  PlayerDetailsViewController.swift
//  PlayersNBA-MVVM
//
//  Created by AlexRymar on 25.04.2024.
//

import UIKit

final class PlayerDetailsViewController: UIViewController {
 
    private var NameLabel = {
        var label = UILabel()
        label.text = "Name ⛹🏻‍♂️:\n\(InfoPlayers.shared.playerName!)"
        label.numberOfLines = -1
        label.font = UIFont.boldSystemFont(ofSize: 28)
        return label
    }()
    
    private var infoView = {
        var View = UIView()
        View.backgroundColor = UIColor(named: "sooBlueColor")
        return View
    }()
    
    private var descriptionLabel = {
        var label = UILabel()
        label.text = "Description📙:\n\(InfoPlayers.shared.description)"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadApp()
    }
    
    private func loadApp(){
        setupView()
        setupAnchors()
    }
    
    private func setupView(){
        view.backgroundColor = UIColor(named: "sooWhiteColor")
        view.addSubview(infoView)
        infoView.addSubview(NameLabel)
        infoView.addSubview(descriptionLabel)
    }
    
    private func setupAnchors(){
        setupInfoView()
        setupNameAnchor()
        setupDescriptionLabel()
    }
    
    private func setupDescriptionLabel(){
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: NameLabel.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: NameLabel.bottomAnchor, constant: 0),
            descriptionLabel.bottomAnchor.constraint(equalTo: NameLabel.bottomAnchor, constant: 450),
            descriptionLabel.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -4)
        ])
    }

    private func setupInfoView(){
        infoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            infoView.bottomAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: -24),
            infoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            infoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24)
        ])
    }

    private func setupNameAnchor(){
        NameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            NameLabel.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 4),
            NameLabel.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 4),
            NameLabel.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -4),
            NameLabel.heightAnchor.constraint(equalToConstant: 68)
        ])
    }

}
