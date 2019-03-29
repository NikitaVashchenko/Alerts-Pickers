//
//  TelegramPickerLocalizable.swift
//  Alerts&Pickers
//
//  Created by Lex on 09.10.2018.
//  Copyright © 2018 Supreme Apps. All rights reserved.
//

import Foundation
import UIKit

public enum LocalizableButtonType {
    case photoOrVideo
    case file
	#if PERMISSION_LOCATION
	case location
	#endif
	#if PERMISSION_CONTACTS
    case contact
	#endif
    case photos(count: Int)
    case videos(count: Int)
    case medias(count: Int)
    case sendDocumentAsFile
    case sendPhotoAsFile(count: Int)
    case addContact
}

public enum Failure {
    case noAccessToPhoto
    case noAccessToCamera
    case error(Error)
}

public protocol TelegramPickerResourceProvider {
    
    func localized(buttonType: LocalizableButtonType) -> String
    
    /// Perform dismisser in your action block to dismiss this alert from a presenting controller.
    func localizedAlert(failure: Failure) -> UIAlertController?
	
	#if PERMISSION_LOCATION
	func resourceProviderForLocationPicker() -> LocationPickerViewControllerResourceProvider?
	#endif
}

