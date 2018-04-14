import XCTest

class OkCupidAPIClientTests: XCTestCase {
  let json: [String: Any] = [:]
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func getJSON()-> [String: Any] {
    var jsonResult: [String: Any] = [:]
    if let path = Bundle.main.path(forResource: "Sample", ofType: "json") {
      do {
        let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        if let json = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? [String: Any] {
        jsonResult = json
        }
      } catch {
        print("Could not get JSON")
      }
    }
    return jsonResult
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
