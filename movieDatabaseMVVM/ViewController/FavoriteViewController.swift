//
//  FavoriteViewController.swift
//  movieDatabaseMVVM
//
//  Created by Guilherme Siepmann on 24/04/2018.
//  Copyright © 2018 Guilherme Siepmann. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {
    private var tableView: UITableView!
    fileprivate var datasource: [Movie]?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: UIScreen.main.bounds, style: .plain)
        tableView.register(FavoriteTableViewCell.self, forCellReuseIdentifier: "favoriteCell")
        
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.isUserInteractionEnabled = true
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.estimatedRowHeight = 300
        self.view.addSubview(tableView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension FavoriteViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let ds = datasource else { return 0 }
        return ds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath)
        (cell as! FavoriteTableViewCell).configureCell(datasource![indexPath.row])
        return cell
    }
}

extension FavoriteViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .normal, title: "Apagar") { (rowAction, indexPath) in
            guard let cell = tableView.cellForRow(at: indexPath) else { return }
            tableView.reloadData()
        }
        
        deleteAction.backgroundColor = .red
        return [deleteAction]
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        guard let ds = datasource else { return false }
        
        if indexPath.row == ds.count {
            return false
        }
        
        return true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

