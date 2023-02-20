//
//  ThemesCollectionViewController.swift
//  Maqal
//
//  Created by Maxim Tvilinev on 15.02.2023.
//

import UIKit
import SnapKit

class ThemeCollectionViewController: UIViewController {

    private enum Layout {
        static let itemsPerRow: CGFloat = 2
        static let sectionInset = UIEdgeInsets(top: 20,
                                               left: 20,
                                               bottom: 20,
                                               right: 20)
    }

    let themeAction = ThemeAction.allCases

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero,
                                  collectionViewLayout: layout)
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        detailsCollectionViewController()
        layoutUI()
    }

    func detailsCollectionViewController() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ThemeCollectionViewCell.self,
                                forCellWithReuseIdentifier: ThemeCollectionViewCell.reuseIdentifier)
    }

    func layoutUI() {
//        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Maqal"
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension ThemeCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return themeAction.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ThemeCollectionViewCell.reuseIdentifier,
            for: indexPath
        ) as? ThemeCollectionViewCell else { return UICollectionViewCell() }
        cell.layoutUI()

        let themeAction = themeAction[indexPath.row]
        cell.configureCell(themeAction: themeAction)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let selectedAction = themeAction[indexPath.row]
        let maqalTableViewController = MaqalTableViewController(maqal: selectedAction.maqal, title: selectedAction.title)
        navigationController?.pushViewController(maqalTableViewController, animated: true)
    }
}

extension ThemeCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddinWidth = 20 * (Layout.itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddinWidth
        let widthPerItem = availableWidth / Layout.itemsPerRow
        return CGSize(width: widthPerItem, height: 200)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        Layout.sectionInset
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        Layout.sectionInset.top
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        Layout.sectionInset.left
    }

}

