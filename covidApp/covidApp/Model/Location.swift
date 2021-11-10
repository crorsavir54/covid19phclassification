//
//  Location.swift
//  covidApp
//
//  Created by coriv🧑🏻‍💻 on 11/6/21.
//

import Foundation

struct Location: Codable {
    var id = UUID()
    var name: String
    var classification: Classification
}

struct Classification: Codable {
    var id = UUID()
    var name: String
    var description: String
    var activities: [Activity]
}

struct Activity: Codable {
    var id = UUID()
    var type: String
    var label: String
    var icon: String
}

// Testing Data
//extension Location {
//    static var data: [Location] {
//        [
//            Location(name: "CA", classification: Classification.data[0]),
//            Location(name: "Davao Del Sur", classification: Classification.data[1])
//        ]
//    }
//}
//
extension Classification {
    static var data: [Classification] {
        [
            Classification(name: "GCQ", description: "General Community Quarantine", activities: Activity.gcq),
            Classification(name: "ECQ", description: "Enhanced Community Quarantine", activities: Activity.ecq)
        ]
    }
}

extension Activity {
    
    static var gcq: [Activity] {
        [
            Activity(type: "Sports and Exercise", label: "GCQ Sports and Exercise description", icon: "sports"),
            Activity(type: "Personal Care", label: "GCQ Personal Care Services Info", icon: "personalCare"),
            Activity(type: "Restos", label: "GCQ Resto Services Info", icon: "food")
        ]
    }
    
    static var ecq: [Activity] {
        [
            Activity(type: "Sports and Exercise", label: "ECQ Sports and Exercise description", icon: "sports"),
            Activity(type: "Personal Care", label: "ECQ Personal Care Services Info", icon: "personalCare"),
            Activity(type: "Restos", label: "ECQ Resto Services Info", icon: "food")
        ]
    }
}
