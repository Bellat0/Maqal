//
//  MaqalTableViewCell.swift
//  Maqal
//
//  Created by Maxim Tvilinev on 15.02.2023.
//

import UIKit

class MaqalTableViewCell: UITableViewCell {

    static let reuseIdentifier = "MaqalTableViewCell"

    let maqalNameLabel = UILabel()
    let maqalTranslateLabel = UILabel()

    func layoutUI() {
        contentView.addSubview(maqalNameLabel)
        maqalNameLabel.textColor = UIColor(red: 59/255, green: 59/255, blue: 59/255, alpha: 1)
        maqalNameLabel.font = UIFont(name: "Helvetica Neue", size: 18)
        maqalNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        maqalNameLabel.numberOfLines = 0
        maqalNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }

        contentView.addSubview(maqalTranslateLabel)
        maqalTranslateLabel.textColor = UIColor(red: 90/255, green: 90/255, blue: 90/255, alpha: 1)
        maqalTranslateLabel.font = UIFont(name: "Helvetica Neue", size: 16)
        maqalTranslateLabel.numberOfLines = 0
        maqalTranslateLabel.snp.makeConstraints { make in
            make.top.equalTo(maqalNameLabel.snp.bottom).offset(4)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-8)
        }
    }

    func configureCell(maqal: Maqal) {
        maqalNameLabel.text = maqal.name
        maqalTranslateLabel.text = maqal.translate
    }
}
