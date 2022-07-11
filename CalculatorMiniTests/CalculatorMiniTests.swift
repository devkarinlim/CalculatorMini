//
//  CalculatorMiniTests.swift
//  CalculatorMiniTests
//
//  Created by Karin Lim on 05/07/22.
//

import XCTest
@testable import CalculatorMini
var sut: ViewController!

class CalculatorMiniTests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateInitialViewController()
        sut.loadView()
        sut.viewDidLoad()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testNegativeExponentOfTen(){
        //Given
        let testValue1 = "0,000000000000000015"
        let testValue2 = "0,0000000048"
        let testValue3 = "0,0025"
        
        //When
        let testResult1 = sut.getNegativeExponentFormat(testValue1)
        let testResult2 = sut.getNegativeExponentFormat(testValue2)
        let testResult3 = sut.getNegativeExponentFormat(testValue3)
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
        let testResult1 = sut.getPositiveExponentFormat(testValue1)
        let testResult2 = sut.getPositiveExponentFormat(testValue2)
        let testResult3 = sut.getPositiveExponentFormat(testValue3)
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
        let testResult1 = sut.convertResultToExponentOfTen(testValue1)
        let testResult2 = sut.convertResultToExponentOfTen(testValue2)
        let testResult3 = sut.convertResultToExponentOfTen(testValue3)
        
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
    
    func testFormatNonNumberToNumber(){
        //given
        let testValue = "abcde"
        
        //when
        let testResult = testValue.formatToNumber()
        
        //then
        XCTAssertEqual(testResult, 0)
        
    }

    
    func testIsAbleInput(){
        //Given
        let testValueTrue = "1.000.000"
        let testValueFalse = "100.000.000"
        
        //When
        let testResultTrue = sut.isAbleInput(testValueTrue)
        let testResultFalse = sut.isAbleInput(testValueFalse)
        
        //Then
        XCTAssertTrue(testResultTrue)
        XCTAssertFalse(testResultFalse)
    }
    
    func testFormatResultToDecimal(){
        //given
        sut.resultValue = "1250000,00015"
        
        //when
        sut.formatResultToDecimal()
        
        //then
        XCTAssertEqual(sut.resultValue, "1.250.000,00015")
        XCTAssertEqual(sut.resultLabel.text, "1.250.000,00015")
    }
    
    func testFormatNonNumberResultToDecimal(){
        //given
        sut.resultValue = "yuhuuuu"
        
        //when
        sut.formatResultToDecimal()
        
        //then
        XCTAssertEqual(sut.resultValue, "0")
        XCTAssertEqual(sut.resultLabel.text, "0")
        
    }
    
    

    
    func testClearValue(){
        //given
        sut.isNegative = true
        sut.isDecimalInputed = true
        sut.resultValue = "1.250.000,00015"
        
        //when
        sut.clearValue()
        
        //then
        XCTAssertFalse(sut.isNegative)
        XCTAssertFalse(sut.isDecimalInputed)
        XCTAssertEqual(sut.resultValue, "0")
        
    }
    
    func testClearInput(){
        //given
        sut.firstInput = 100
        sut.secondInput = 50
        sut.operationType = .division
        sut.isFirstEqual = false
        sut.resetCount = 1
        
        //when
        sut.clearInput()
        
        //then
        XCTAssertEqual(sut.firstInput, 0)
        XCTAssertEqual(sut.secondInput, 0)
        XCTAssertEqual(sut.operationType, .none)
        XCTAssertTrue(sut.isFirstEqual)
        XCTAssertEqual(sut.resetCount, 0)
        
    }

    func testSetFirstInput(){
        //given
        let operationType = OperationType.plus
        sut.operationType = .none
        sut.resultValue = "1.250.500,0048"
        
        //when
        sut.setFirstInput(operationType)
        
        //then
        XCTAssertEqual(sut.operationType, operationType)
        XCTAssertEqual(sut.firstInput, 1250500.0048)
    }

    func testResetCalculationOnce(){
        //given
        sut.resetCount = 0
        sut.firstInput = 1250500.0048
        sut.operationType = .plus
        
        //when
        sut.resetCalculation()
        
        //then
        XCTAssertEqual(sut.firstInput, 0)
        XCTAssertEqual(sut.resetCount, 1)
        
    }

    func testResetCalculationTwice(){
        //given
        sut.resetCount = 1
        sut.firstInput = 1250500.0048
        sut.operationType = .plus
        
        //when
        sut.resetCalculation()
        
        //then
        XCTAssertEqual(sut.firstInput, 0)
        XCTAssertEqual(sut.resetCount, 0)
        
    }

    func testNegationTapPositiveToNegative(){
        //given
        sut.resultLabel.text = "0"
        
        //when
        sut.negationButtonTap()
        
        //then
        XCTAssertEqual(sut.resultLabel.text, "-0")
        XCTAssertTrue(sut.isNegative)
    }
    
    func testNegationTapNegativeToPositive(){
        //given
        sut.resultLabel.text = "-0"
        sut.isNegative = true
        
        //when
        sut.negationButtonTap()
        
        //then
        XCTAssertEqual(sut.resultLabel.text, "0")
        XCTAssertFalse(sut.isNegative)
    }
    
    func testNegationTapAfterOperationTap(){
        //given
        sut.operationType = .plus
        sut.resultValue = "100"
        sut.resultLabel.text = "0"
        
        //when
        sut.negationButtonTap()
        
        //then
        XCTAssertEqual(sut.resultLabel.text, "-100")
        XCTAssertTrue(sut.isNegative)
    }

    func testIsNumberInputTrue(){
        //given
        sut.isNumberInput = false
        
        //when
        sut.isNumberInput = true
        
        //then
        XCTAssertEqual(sut.resetButton.titleLabel?.text, "C")
        
    }



    
}
