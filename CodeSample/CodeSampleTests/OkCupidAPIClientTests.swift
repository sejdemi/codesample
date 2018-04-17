import XCTest
@testable import CodeSample

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
  
  func testIfUserOnline() {
    guard let json = loadJSONFromFile() else {
      return
    }
    let matchedUserProfile = OkCupidAPIClient.parseUserJSON(with: json)
    XCTAssertEqual(matchedUserProfile[1].isOnline, 0)
  }
  
  func testStateName() {
    guard let json = loadJSONFromFile() else {
      return
    }
    let matchedUserProfile = OkCupidAPIClient.parseUserJSON(with: json)
    XCTAssertEqual(matchedUserProfile[2].state, "NY")
  }
  
  func testCityName() {
    guard let json = loadJSONFromFile() else {
      return
    }
    let matchedUserProfile = OkCupidAPIClient.parseUserJSON(with: json)
    XCTAssertEqual(matchedUserProfile[3].city, "Astoria")
  }
  
}
