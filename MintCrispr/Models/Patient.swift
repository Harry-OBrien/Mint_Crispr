//
//  Patient.swift
//  MintCrispr
//
//  Created by Harry on 28/10/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import Foundation
//import FirebaseCore
//import FirebaseFirestore

struct Patient {
	let id: String
//	let hospitalDepartmentReference: DocumentReference
	
	let firstName: String
	let lastName: String
	let tests: [TestGroup]?
	
	// TO DO: map data from firebase to model
//	static func getPatient(identifiedBy userID: String, onComplete: @escaping (Patient?) -> ()) {
//		let db = Firestore.firestore()
//		let docRef = db.collection("patients").document(userID)
//
//		docRef.getDocument {(document, error) in
//			guard let document = document, document.exists
//				else {
//					print("Document does not exist")
//					return
//			}
//
//			let data = document.data()!
//			let patient = Patient.parseFromFirebaseData(data)
//			print(patient)
//			onComplete(patient)
//			print("Document data: \(data["tests"]!)")
//		}
//	}
	
//	fileprivate static func parseFromFirebaseData(_ data: [String : Any]) -> Patient {
//		return Patient(id: data["id"] as! String,
//					  hospitalDepartmentReference: data["hospitalDepartmentReference"] as! DocumentReference,
//					  firstName: data["firstName"] as! String,
//					  lastName: data["lastName"] as! String,
//					  tests: )
//	}
}

//	static func getPatientName(identifiedBy id: String, onComplete: @escaping (Patient) -> ()) {
//		do {
//
//
//		}
//		catch let err {
//			print(err)
//		}
//	}
//}
