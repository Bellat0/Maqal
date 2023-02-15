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
        maqalNameLabel.text = "Hello"
        maqalNameLabel.textColor = .darkGray
        maqalNameLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        maqalNameLabel.numberOfLines = 0
        maqalNameLabel.lineBreakMode = .byWordWrapping
        maqalNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }

        contentView.addSubview(maqalTranslateLabel)
        maqalTranslateLabel.text = "World!"
        maqalTranslateLabel.textColor = .magenta
        maqalTranslateLabel.font = UIFont.systemFont(ofSize: 16)
        maqalTranslateLabel.numberOfLines = 0
        maqalTranslateLabel.lineBreakMode = .byWordWrapping
        maqalTranslateLabel.snp.makeConstraints { make in
            make.top.equalTo(maqalNameLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-8)
        }
    }

    func configure(maqal: Maqal) {
        maqalNameLabel.text = maqal.name
        maqalTranslateLabel.text = maqal.translate
    }
}
