//
//  MaqalTableViewController.swift
//  Maqal
//
//  Created by Maxim Tvilinev on 15.02.2023.
//

import UIKit

class MaqalTableViewController: UIViewController {
    
    let tableView = UITableView()

    let maqal: [Maqal]

    init(maqal: [Maqal]) {
        self.maqal = maqal
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

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

extension MaqalTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return maqal.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MaqalTableViewCell.reuseIdentifier, for: indexPath) as? MaqalTableViewCell else { return UITableViewCell() }
        cell.layoutUI()

        let maqal = maqal[indexPath.row]
        cell.configureCell(maqal: maqal)
        return cell
    }

    
}
