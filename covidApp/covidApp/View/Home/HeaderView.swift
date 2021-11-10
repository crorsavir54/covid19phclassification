//
//  HeaderView.swift
//  covidApp
//
//  Created by coriv🧑🏻‍💻 on 11/6/21.
//

import Foundation
import UIKit
import SnapKit

class HeaderView: UIView {
    
    private let locationNameLabel: UILabel = {
        let locationNameLabel = UILabel()
        locationNameLabel.text = "Location"
        locationNameLabel.font = .rounded(ofSize: 26, weight: .heavy)
        locationNameLabel.textColor = UIColor(named: "mainColor")
        return locationNameLabel
    }()
    
    private let locationClassificationLabel: UILabel = {
        let locationClassificationLabel = UILabel()
        locationClassificationLabel.text = "Classification"
        locationClassificationLabel.font = .rounded(ofSize: 26, weight: .heavy)
        locationClassificationLabel.textColor = UIColor(named: "mainColor")
        return locationClassificationLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        self.addSubview(locationNameLabel)
        self.addSubview(locationClassificationLabel)
    }
    
    private func setUpConstraints() {
        setLocationLabelConstraints()
        setLocationClassificationLabelConstraints()
    }
    
    private func setLocationLabelConstraints() {
        locationNameLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.topMargin)
            make.left.equalToSuperview().inset(12)
        }
    }
    
    private func setLocationClassificationLabelConstraints() {
        locationClassificationLabel.snp.makeConstraints { make in
            make.top.equalTo(locationNameLabel.snp.bottom)
            make.left.equalToSuperview().inset(12)
        }
    }
    
    func updateHeaderInfo(_ location: String?, _ classification: String?) {
        guard let location = location, let classification = classification else { return }
        locationNameLabel.text = location
        locationClassificationLabel.text = classification
    }
    
    
}
