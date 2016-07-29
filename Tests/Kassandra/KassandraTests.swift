/**
 Copyright IBM Corporation 2016

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */


import XCTest
@testable import Kassandra

class KassandraTests: XCTestCase {

    private var client: Kassandra!
       
    weak var expectation: XCTestExpectation!
    
    var tokens = [String]()
    
    static var allTests: [(String, (KassandraTests) -> () throws -> Void)] {
        return [
            ("testConnect", testConnect),
            ("testQuery", testQuery),
        ]
    }
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        client = Kassandra()
    }
	
    func testConnect() throws {
        
        do {
            try client.connect {
                error in
                
                print(error)
            }

        } catch {
            throw error
        }
        sleep(10)
    }
    
    func testQuery() throws {
        
        do {
            try client.connect {
                error in
                
                print(error)
            }
            try client.query() {
                error in
                
                print(error)
            }
        } catch {
            throw error
        }
        sleep(10)
    }
}
