//
//  RoundedRow.swift
//  covidApp
//
//  Created by coriv🧑🏻‍💻 on 11/6/21.
//

import Foundation
import UIKit
import SnapKit

class RoundedRow: CardView {
    
    let tapped: () -> ()
    
    init(tapped: @escaping () -> () = {}) {
        self.tapped = tapped
        super.init()
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUI() {
        createSubViews()
    }
    
    func createSubViews() {
        self.removeAllSubviews()
    }
    
    func createTitleLabel(title: String) -> UILabel {
        let titleView = UILabel()
        titleView.text = title
        titleView.font = .rounded(ofSize: 21, weight: .bold)
        titleView.textColor = UIColor(named: "mainColor")
        return titleView
    }
    
    func createBodyLabel(body: String) -> UILabel {
        let bodyLabel = UILabel()
        bodyLabel.text = body
        bodyLabel.font = .rounded(ofSize: 15, weight: .regular)
        bodyLabel.textColor = .gray
        bodyLabel.numberOfLines = 0
        return bodyLabel
    }
    
    func createImageView(imageNamed: String, addShadow: Bool = true) -> UIView {
        let image = UIImage(named: imageNamed)
        let imageView = UIImageView(image: image)
        if !addShadow {
            return imageView
        }
        let wrapper = UIView()
        let shadowPath = UIBezierPath(ovalIn: imageView.bounds).cgPath
        wrapper.layer.shadowPath = shadowPath
        imageView.layer.shadowPath = shadowPath
        wrapper.addSubview(imageView)
        return wrapper
    }
}

