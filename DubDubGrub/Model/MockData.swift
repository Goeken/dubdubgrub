//
//  MockData.swift
//  DubDubGrub
//
//  Created by Cody Goeken on 11/22/21.
//

import CloudKit

struct MockData {
    
    static var location: CKRecord {
        let record = CKRecord(recordType: RecordType.location)
        
        record[DDGLocation.kName]           = "Seans Bar and Grill"
        record[DDGLocation.kAddress]        = "123 Main Street"
        record[DDGLocation.kDescription]    = "This is a test description"
        record[DDGLocation.kWebsiteURL]     = "https://appnetic.io"
        record[DDGLocation.kLocation]       = CLLocation(latitude: 40.7128, longitude: 74.0060)
        record[DDGLocation.kPhoneNumber]    = "209-564-6902"
        
        return record
    }
}
