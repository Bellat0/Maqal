//
//  FavouriteTableViewController.swift
//  Maqal
//
//  Created by Maxim Tvilinev on 16.02.2023.
//

import UIKit

class FavouriteTableViewController: UIViewController {

    let tableView = UITableView()

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
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension FavouriteTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MaqalTableViewCell.reuseIdentifier, for: indexPath) as? MaqalTableViewCell else { return UITableViewCell() }
        cell.layoutUI()

        return cell
    }
}
