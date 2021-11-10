//
//  InformationView.swift
//  covidApp
//
//  Created by coriv🧑🏻‍💻 on 11/6/21.
//

import Foundation
import UIKit
import SnapKit

class InformationView: UIView {
    
    let stackView = UIStackView()
    
    private let locationClassificationLabel: UILabel = {
        let locationClassificationLabel = UILabel()
        locationClassificationLabel.text = ""
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
    
    private func setupView() {
        self.addSubview(locationClassificationLabel)
        self.addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20
    }
    
    private func setUpConstraints() {
        locationClassificationLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
        }
        stackView.snp.makeConstraints { make in
            make.top.equalTo(locationClassificationLabel.snp.bottom).offset(20)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
    
    func addInformationStackView(_ classification: Classification) {
        stackView.removeAllSubviews()
        let activities = classification.activities
        for activity in activities {
            let row = InformationElementView(image: activity.icon, title: activity.type, body: activity.label)
            stackView.addArrangedSubview(row)
        }
        
    }
    
    func updateClassification(_ classification: String?) {
        guard let classification = classification else {
            return
        }
        locationClassificationLabel.text = classification
    }
}
