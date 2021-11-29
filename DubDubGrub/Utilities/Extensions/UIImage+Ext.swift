//
//  UIImage+Ext.swift
//  DubDubGrub
//
//  Created by Cody Goeken on 11/25/21.
//

import CloudKit
import UIKit

extension UIImage {
    
    func convertToCKAsset() -> CKAsset? {
        
        // Get apps base document directory url
        
        guard let urlPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            print("Doc directory came back nil")
            return nil
        }
        
        // Append unique id for profile image
        let fileUrl = urlPath.appendingPathComponent("selectedAvatarImage")
        
        // Write the image data to the locations to the address
        
        guard let imageData = jpegData(compressionQuality: 0.25) else { return nil }
        
        // create
        do {
            try imageData.write(to: fileUrl)
            return CKAsset(fileURL: fileUrl)
        } catch {
            return nil
        }
    }
}
