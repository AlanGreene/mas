//
//  SignOutCommandSpec.swift
//  MasKitTests
//
//  Created by Ben Chatelain on 2018-12-28.
//  Copyright © 2018 mas-cli. All rights reserved.
//

@testable import MasKit
import Result
import Quick
import Nimble

class SignOutCommandSpec: QuickSpec {
    override func spec() {
        describe("signout command") {
            it("updates stuff") {
                let cmd = SignOutCommand()
                let result = cmd.run(SignOutCommand.Options())
                print(result)
//                expect(result).to(beSuccess())
            }
        }
    }
}
