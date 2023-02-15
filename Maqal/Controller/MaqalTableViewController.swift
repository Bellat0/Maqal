//
//  MaqalTableViewController.swift
//  Maqal
//
//  Created by Maxim Tvilinev on 15.02.2023.
//

import UIKit

class MaqalTableViewController: UIViewController {

    let tableView = UITableView()
    let maqal = [Maqal]()

    override func viewDidLoad() {
        super.viewDidLoad()
        detailsTableView()
        layoutUI()
    }

    func detailsTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MaqalTableViewCell.self, forCellReuseIdentifier: ThemeCollectionViewCell.reuseIdentifier)
    }

    func layoutUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}

extension MaqalTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return maqal.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ThemeCollectionViewCell.reuseIdentifier,
            for: indexPath
        ) as? MaqalTableViewCell else { return UITableViewCell() }
        let maqal = maqal[indexPath.row]
        cell.configure(maqal: maqal)
        return cell

    }


}
