//
//  InformationElementView.swift
//  covidApp
//
//  Created by coriv🧑🏻‍💻 on 11/6/21.
//

import UIKit
import SnapKit

final class InformationElementView: RoundedRow {
    
    let margin = UIEdgeInsets(top: 20, left: 20, bottom: -20, right: -20)
    
    var image: String
    var title: String
    var body: String
    
    init(image: String, title: String, body: String) {
        self.image = image
        self.title = title
        self.body = body
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func createSubViews() {
        super.createSubViews()
        
        let container = UIView()
        let imageView = UIImageView(image: UIImage(named: image)!)
        let textContainer = UIView()
        let titleView = createTitleLabel(title: title)
        let bodyView = createBodyLabel(body: body)
        bodyView.numberOfLines = 0
        
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
