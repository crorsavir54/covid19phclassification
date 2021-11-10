//
//  CardView.swift
//  covidApp
//
//  Created by coriv🧑🏻‍💻 on 11/6/21.
//  Reusable Card View Style

import UIKit
import SnapKit

class CardView: UIView {
    
    let cornerRadius = CGFloat(15)
    
    init() {
        super.init(frame: .zero)
        configureLayer()
    }
    
    convenience init(embed view: UIView) {
        self.init()
        self.addSubview(view)
        
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLayer() {
        self.backgroundColor = UIColor(named: "cardColor")
        self.layer.cornerRadius = cornerRadius
    }
}
