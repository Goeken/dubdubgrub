//
//  DDGProfile.swift
//  DubDubGrub
//
//  Created by Cody Goeken on 11/22/21.
//

import CloudKit


struct DDGProfile {
    
    static let kFirstName = "firstName"
    static let kLastName = "lastName"
    static let kCompanyName = "companyName"
    static let kAvatar = "avatar"
    static let kBio = "bio"
    static let kisCheckedIn = "isCheckedIn"
    
    let ckRecordID: CKRecord.ID
    let firstName: String
    let lastName: String
    let avatar: CKAsset!
    let companyName: String
    let bio: String
    let isCheckedIn: CKRecord.Reference? = nil

    
    init(record: CKRecord) {
        ckRecordID  = record.recordID
        firstName   = record[DDGProfile.kFirstName] as? String ?? "N/A"
        lastName = record[DDGProfile.kLastName] as? String ?? "N/A"
        companyName = record[DDGProfile.kCompanyName] as? String ?? "N/A"
        avatar = record[DDGProfile.kAvatar] as? CKAsset
        bio     = record[DDGProfile.kBio] as? String ?? "N/A"
    }
}


