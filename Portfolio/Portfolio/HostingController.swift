//
//  HostingController.swift
//  Portfolio
//
//  Created by Ankur Gyawali on 11/13/23.
//

import Foundation
import UIKit
import SwiftUI

// Make sure your SwiftUI view is already defined in another file, like AboutMeView.swift
class HostingController: UIHostingController<AboutMeView> {
    required init?(coder aDecoder: NSCoder) {
        // Call the init of the super class
        super.init(coder: aDecoder, rootView: AboutMeView())
    }
}


