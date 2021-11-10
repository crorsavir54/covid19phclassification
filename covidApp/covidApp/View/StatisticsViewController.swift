//
//  StatisticsViewController.swift
//  covidApp
//
//  Created by coriv🧑🏻‍💻 on 11/6/21.
//

import UIKit
import SnapKit
import CoreLocation
import MapKit


class StatisticsViewController: UIViewController {
    private var viewModel = MapInformationViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Statistics"
        view.backgroundColor = .systemBackground
    }
}
