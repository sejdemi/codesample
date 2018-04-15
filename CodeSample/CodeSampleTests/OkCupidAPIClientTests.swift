import XCTest
@testable import CodeSample
//create malformed json sample

class OkCupidAPIClientTests: XCTestCase {
  typealias JSON = [String: Any]
  let json: JSON = [:]
  
  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func loadJSONFromFile() -> JSON? {
    guard let path = Bundle.main.path(forResource: "Sample", ofType: "json") else {
      return nil
    }
    guard let data: Data = NSData(contentsOfFile: path) as Data? else {
      return nil
    }
    do {
      let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
      guard let dictionary = object as? JSON else {
        return nil
      }
      return dictionary
    } catch  {
      print("Not parsed")
    }
    return nil
  }
  
  func testJSONPArsing() {
    guard let json = loadJSONFromFile() else {
      return
    }
    let matchedUserProfile = OkCupidAPIClient.parseUserJSON(with: json)
    XCTAssertEqual(matchedUserProfile.count, 18)
  }
  
  func testUserName() {
    guard let json = loadJSONFromFile() else {
      return
    }
    let matchedUserProfile = OkCupidAPIClient.parseUserJSON(with: json)
    XCTAssertEqual(matchedUserProfile[0].username, "bklyn2356")
  }
  
  func testExample() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
  }
  
  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }
  
  
}
