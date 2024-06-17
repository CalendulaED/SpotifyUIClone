//
//  SpotifyCloneApp.swift
//  SpotifyClone
//
//  Created by Yuxuan Wu on 5/20/24.
//

import SwiftUI
import SwiftfulRouting

@main
struct SpotifyCloneApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView { _ in
                ContentView()
            }
        }
    }
}


// Enable swipe back gesture in SwiftUI
extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
