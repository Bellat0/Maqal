//
//  SearchMaqalViewController.swift
//  Maqal
//
//  Created by Maxim Tvilinev on 17.02.2023.
//

import UIKit

class SearchMaqalTableViewController: UIViewController {

    let tableView = UITableView()
    let searchController = UISearchController(searchResultsController: nil)

    let maqalArrayCheck = [Maqal(name: "Әркімнің өз жері — жұмақ", translate: "Родимый край для каждого — рай", isFavourite: false),
        Maqal(name: "Ерінен айырылған көмгенше жылайды, елінен айырылған өлгенше жылайды", translate: "Потерю супруга оплакивают, пока не похоронят его, потерю родины оплакивают, пока не похоронят самого", isFavourite: false),
        Maqal(name: "Туған жердің күні де ыстық, түні де ыстық", translate: "На родине и дни, и ночи прекрасны", isFavourite: false)]

    override func viewDidLoad() {
        super.viewDidLoad()

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

        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        definesPresentationContext = true

    }


}


extension SearchMaqalTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MaqalTableViewCell.reuseIdentifier, for: indexPath) as? MaqalTableViewCell else { return UITableViewCell() }
        cell.layoutUI()

        return cell
    }
}

extension SearchMaqalTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
    }

}
