//
//  SymptomsElement.swift
//  covidApp
//
//  Created by coriv🧑🏻‍💻 on 11/6/21.
// 7.073056, 125.612778
import UIKit
import SnapKit

final class SymptomsElement: RoundedRow {
    
    let margin = UIEdgeInsets(top: 20, left: 20, bottom: -20, right: -20)
    
    override func createSubViews() {
        super.createSubViews()
        
        let container = UIView()
        let imageView = UIImageView(image: UIImage(named: "symptoms")!)
        let textContainer = UIView()
        let titleView = createTitleLabel(title: "Do you think you might have COVID-19?")
        titleView.numberOfLines = 0
        let bodyView = createBodyLabel(body: "Call hotline to get immediate help")
        
        self.addSubview(container)
        container.addSubview(textContainer)
        container.addSubview(imageView)
        textContainer.addSubview(titleView)
        textContainer.addSubview(bodyView)
        
        container.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        textContainer.snp.makeConstraints { make in
            make.top.greaterThanOrEqualToSuperview().offset(margin.top)
            make.bottom.lessThanOrEqualToSuperview().offset(margin.bottom)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(margin.left)
            make.right.equalTo(imageView.snp.left).offset(36)
        }
        
        titleView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
        
        bodyView.snp.makeConstraints{ make in
            make.top.equalTo(titleView.snp.bottom).offset(10)
            make.bottom.left.equalToSuperview()
            make.right.equalToSuperview().offset(-10)
        }
        
        imageView.snp.makeConstraints { make in
            make.bottom.right.equalToSuperview()
            make.top.greaterThanOrEqualToSuperview()
            make.size.equalTo(CGSize(width: 135, height: 110))
        }
        
        container.clipsToBounds = true
        container.layer.cornerRadius = cornerRadius
    }
}

