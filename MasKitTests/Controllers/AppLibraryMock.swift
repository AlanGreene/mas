//
//  AppLibraryMock.swift
//  MasKitTests
//
//  Created by Ben Chatelain on 12/27/18.
//  Copyright © 2018 mas-cli. All rights reserved.
//

@testable import MasKit

class AppLibraryMock: AppLibrary {
    var installedApps = [SoftwareProduct]()

    /// Finds an app using a bundle identifier.
    ///
    /// - Parameter bundleId: Bundle identifier of app.
    /// - Returns: Software Product of app if found; nil otherwise.
    public func installedApp(forBundleId bundleId: String) -> SoftwareProduct? {
        return nil
    }

    func uninstallApp(app: SoftwareProduct) throws {
        if !installedApps.contains(where: { (product) -> Bool in
            return app.itemIdentifier == product.itemIdentifier
        }) { throw MASError.notInstalled }

        // Special case for testing where we pretend the trash command failed
        if app.bundlePath == "/dev/null" {
            throw MASError.uninstallFailed
        }

        // Success is the default, watch out for false positives!
    }
}

/// Members not part of the AppLibrary protocol that are only for test state managment.
extension AppLibraryMock {
    /// Clears out the list of installed apps.
    func reset() {
        installedApps = []
    }
}
