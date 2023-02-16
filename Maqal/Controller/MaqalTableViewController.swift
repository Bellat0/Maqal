//
//  MaqalTableViewController.swift
//  Maqal
//
//  Created by Maxim Tvilinev on 15.02.2023.
//

import UIKit

class MaqalTableViewController: UIViewController {
    
    let tableView = UITableView()

    var maqal: [Maqal]

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

    // MARK: Swipe
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let favouriteAction = favouriteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [favouriteAction])
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let shareAction = shareAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [shareAction])
    }

    func favouriteAction(at indexPath: IndexPath) -> UIContextualAction {
        var maqal = maqal[indexPath.row]

        let action = UIContextualAction(style: .normal, title: "") { action, view, completion in
            maqal.isFavourite = !maqal.isFavourite
            self.maqal[indexPath.row] = maqal
            completion(true)
        }
        action.backgroundColor = maqal.isFavourite ? .systemPurple : .systemGray
        action.image = UIImage(systemName: "star")
        return action
    }

    func shareAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .normal, title: "") { action, view, completion in

            let maqal = self.maqal[indexPath.row]
            let shareController = UIActivityViewController(activityItems: [maqal.name + "\n" + maqal.translate], applicationActivities: nil)
            self.present(shareController, animated: true)
            completion(true)
        }
        action.backgroundColor = .systemGreen
        action.image = UIImage(systemName: "square.and.arrow.up")
        return action

    }
}
