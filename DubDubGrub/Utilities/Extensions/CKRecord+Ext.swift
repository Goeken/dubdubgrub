//
//  CKRecord+Ext.swift
//  DubDubGrub
//
//  Created by Cody Goeken on 11/23/21.
//

import CloudKit


extension CKRecord {
    
    func convertToDDGLocation() -> DDGLocation {
        DDGLocation(record: self)
    }
    
    func convertToDDGProfile() -> DDGProfile {
        DDGProfile(record: self)
    }
}
