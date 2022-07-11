//
//  CalculatorMiniTests.swift
//  CalculatorMiniTests
//
//  Created by Karin Lim on 05/07/22.
//

import XCTest
@testable import CalculatorMini

class CalculatorMiniTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    func testNegativeExponentOfTen(){
        //Given
        let testValue1 = "0,000000000000000015"
        let testValue2 = "0,0000000048"
        let testValue3 = "0,0025"
        
        //When
        let controller = ViewController()
        let testResult1 = controller.getNegativeExponentFormat(testValue1)
        let testResult2 = controller.getNegativeExponentFormat(testValue2)
        let testResult3 = controller.getNegativeExponentFormat(testValue3)
        //Then
        XCTAssertEqual(testResult1, "1,5e-17", "Negative exponent format is wrong")
        XCTAssertEqual(testResult2, "4,8e-9", "Negative exponent format is wrong")
        XCTAssertEqual(testResult3, "2,5e-3", "Negative exponent format is wrong")
    }
    
    func testPositiveExponentOfTen(){
        //Given
        let testValue1 = "1.000.000.000.000"
        let testValue2 = "480.000.000.000.000.000"
        let testValue3 = "1.750"
        
        //When
        let controller = ViewController()
        let testResult1 = controller.getPositiveExponentFormat(testValue1)
        let testResult2 = controller.getPositiveExponentFormat(testValue2)
        let testResult3 = controller.getPositiveExponentFormat(testValue3)
        //Then
        XCTAssertEqual(testResult1, "1e12", "Positive exponent format is wrong")
        XCTAssertEqual(testResult2, "4,8e17", "Positive exponent format is wrong")
        XCTAssertEqual(testResult3, "1,8e3", "Positive exponent format is wrong")
    }
    
    
    func testConvertResultToExponentOfTen(){
        //Given
        let testValue1 = "1.000.001.000.001,000000001"
        let testValue2 = "1.000.001,0000005"
        let testValue3 = "0,0000000048"
        
        //When
        let controller = ViewController()
        let testResult1 = controller.convertResultToExponentOfTen(testValue1)
        let testResult2 = controller.convertResultToExponentOfTen(testValue2)
        let testResult3 = controller.convertResultToExponentOfTen(testValue3)
        
        //Then
        XCTAssertEqual(testResult1, "1e12")
        XCTAssertEqual(testResult2, "1.000.001,0000005")
        XCTAssertEqual(testResult3, "4,8e-9")
    }
    
    
    func testRemoveNegationSign(){
        //Given
        let testValue = "-1"
        
        //When
        let testResult = testValue.removeNegationSign()
        
        //Then
        XCTAssertEqual(testResult, "1", "")
    }
    
    
    func testRemoveDecimalDigits(){
        //Given
        var testValue = "1.000.000,23456789"
        
        //When
        let testResult = testValue.removeDecimalDigits()
        
        //Then
        XCTAssertEqual(testResult, "1.000.000", "Should remove all number behind comma")
    }
    
    
    func testRemoveGroupSeparator(){
        //Given
        let testValue1 = "1.000.000.000"
        let testValue2 = "1.000.000,000001"
        
        //When
        let testResult1 = testValue1.removeGroupSeparator()
        let testResult2 = testValue2.removeGroupSeparator()
        
        //Then
        XCTAssertEqual(testResult1, "1000000000", "Should remove all the '.'")
        XCTAssertEqual(testResult2, "1000000,000001", "Should remove all the '.'")
    }
    
    
    func testRemoveDecimalSeparator(){
        //Given
        let testValue1 = "1.000.000,000001"
        
        //When
        let testResult1 = testValue1.removeDecimalSeparator()
        
        //Then
        XCTAssertEqual(testResult1, "1.000.000000001", "Should remove only the ',' ")
    }
    
    
    func testFormatDecimalSeparator(){
        //Given
        let testValue = "1.25"
        
        //When
        let testResult = testValue.formatDecimalSeparator()
        
        //Then
        XCTAssertEqual(testResult, "1,25", "Replace . with ,")
    }
    
    
    func testFormatToNumber(){
        //Given
        let testValue = "1.250.500,88"
        
        //When
        let testResult = testValue.formatToNumber()
        
        //Then
        XCTAssertEqual(testResult, Double(1250500.88), "Should convert string to double")
    }
    
    
    func testIsAbleInput(){
        //Given
        let testValueTrue = "1.000.000"
        let testValueFalse = "100.000.000"
        
        //When
        let controller = ViewController()
        let testResultTrue = controller.isAbleInput(testValueTrue)
        let testResultFalse = controller.isAbleInput(testValueFalse)
        
        //Then
        XCTAssertTrue(testResultTrue)
        XCTAssertFalse(testResultFalse)
    }
    
    
    func test<#Name#>(){
        //Given
        <#context#>
        
        //When
        <#statement#>
        
        //Then
        <#expected result#>
    }
                       
                       
    
}
