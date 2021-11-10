//
//  ViewController.swift
//  covidApp
//
//  Created by coriv🧑🏻‍💻 on 11/6/21.
//
// For this to work, use Latitude and Longitude, 7.073056, 125.612778 <- Davao Del Sur
// Apple location will also work with location name CA

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    private var viewModel = MapInformationViewModel()
    private var headerView = HeaderView()
    
    private var symptomsElement = SymptomsElement()
    private var symptomsElementTopConstraint: Constraint!
    private var symptomsElementBottomConstraint: Constraint!
    
    private var informationView = InformationView()
    private var informationViewTopConstraint: Constraint!
    private var informationViewBottomConstraint: Constraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        createUI()
        viewModel.checkIfLocationServicesIsEnabled()
        viewModel.location.bind { [weak self] location in
            DispatchQueue.main.async {
                self?.updateUI(location!)
            }
        }
    }
    
    private func updateUI(_ location: Location) {
        
        self.headerView.updateHeaderInfo(("Location: " + location.name), location.classification.name)
        let classification = location.classification.name
        let message = "During \(classification), you can:"
        self.informationView.updateClassification(message)
        self.informationView.addInformationStackView(location.classification)
    }
    
    private func createUI() {
        view.backgroundColor = .systemBackground
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.isUserInteractionEnabled = true
        scrollView.alwaysBounceVertical = true
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints { make in
            make.top.bottom.equalTo(view.safeAreaInsets)
            make.left.right.equalTo(view)
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.bottom.equalTo(view.safeAreaInsets)
            make.left.right.equalTo(view)
        }
        
        let wrapper = UIView()
        scrollView.addSubview(wrapper)
        wrapper.snp.makeConstraints { make in
            make.edges.equalTo(scrollView.contentLayoutGuide.snp.edges)
            make.width.equalTo(scrollView.frameLayoutGuide.snp.width)
        }
        
        wrapper.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.top.equalTo(wrapper)
            make.left.right.equalToSuperview()
        }
        
        wrapper.addSubview(symptomsElement)
        symptomsElement.snp.makeConstraints { make in
            symptomsElementTopConstraint = make.top.equalTo(headerView.snp.bottom).offset(80).constraint
            make.top.equalTo(headerView.snp.bottom).offset(20).priority(.medium)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        wrapper.addSubview(informationView)
        informationView.snp.makeConstraints { make in
            informationViewTopConstraint = make.top.equalTo(symptomsElement.snp.bottom).offset(20).constraint
            make.top.equalTo(symptomsElement.snp.bottom).offset(20).priority(.medium)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
    }
}
