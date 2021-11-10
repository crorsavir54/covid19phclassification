//
//  LocationRepository.swift
//  covidApp
//
//  Created by coriv🧑🏻‍💻 on 11/6/21.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore
import Firebase

final class LocationRepository {
    
    static var shared = LocationRepository()
    private let store = Firestore.firestore()
    var locations = [Location]()
    
    private let path = "locations"
    
    private init() {
        get()
    }
    
    public func get() {
        store.collection(path)
            .addSnapshotListener { (snapshot, error) in
                if let error = error {
                    print(error)
                    return
                }
                self.locations = snapshot?.documents.compactMap {
                    try? $0.data(as: Location.self)
                    
                } ?? []
            }
    }
}
