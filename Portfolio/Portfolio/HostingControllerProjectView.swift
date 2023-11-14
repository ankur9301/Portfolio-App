//
//  HostingControllerProjectView.swift
//  Portfolio
//
//  Created by Ankur Gyawali on 11/14/23.
//

import Foundation
import UIKit
import SwiftUI
class HostingControllerProjectView: UIHostingController<ProjectsView> {
    required init?(coder aDecoder: NSCoder) {
        // Call the init of the super class
        super.init(coder: aDecoder, rootView: ProjectsView())
    }
}
