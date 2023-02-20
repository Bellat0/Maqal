//
//  FavouriteTableViewController.swift
//  Maqal
//
//  Created by Maxim Tvilinev on 16.02.2023.
//

import UIKit

class FavouriteTableViewController: UIViewController {

    let tableView = UITableView()

    let maqal = [Maqal]()

    override func viewDidLoad() {
        super.viewDidLoad()

        detailsTableView()
        layoutUI()
    }

    func detailsTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MaqalTableViewCell.self, forCellReuseIdentifier: MaqalTableViewCell.reuseIdentifier)
    }

    func layoutUI() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func isFav(cell: MaqalTableViewCell, indexPath: IndexPath) {
        let maqal = maqal[indexPath.row]
        if maqal.isFavourite == true {
            cell.maqalNameLabel.text = maqal.name
            cell.maqalTranslateLabel.text = maqal.translate
        }
        tableView.reloadData()
    }
}

extension FavouriteTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return maqal.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MaqalTableViewCell.reuseIdentifier, for: indexPath) as? MaqalTableViewCell else { return UITableViewCell() }
        cell.layoutUI()

        isFav(cell: cell, indexPath: indexPath)
        return cell
    }
}
