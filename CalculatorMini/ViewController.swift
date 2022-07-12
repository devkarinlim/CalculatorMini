//
//  ViewController.swift
//  CalculatorMini
//
//  Created by Karin Lim on 05/07/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var verticalStackView: UIStackView!
    @IBOutlet weak var row1: UIStackView!
    @IBOutlet weak var row2: UIStackView!
    @IBOutlet weak var row3: UIStackView!
    @IBOutlet weak var row4: UIStackView!
    @IBOutlet weak var row5: UIStackView!
    
    var resetButton: CustomButton!
    var operationType : OperationType = .none
    var firstInput: Double = 0
    var secondInput: Double = 0
    var resetCount: Int = 0
    var resultValue: String = ""
    var isFirstEqual: Bool = true
    var isNumberInput: Bool = false{
        willSet(newValue){
            if newValue{
                resetButton.setTitle("C", for: .normal)
            }
            else{
                resetButton.setTitle("AC", for: .normal)
            }
        }
    }
    
    override var shouldAutorotate: Bool{
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return UIInterfaceOrientationMask.portrait
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupResultLabel()
        setupVerticalStackView()
        setupRow1FromTop()
        setupRow2FromTop()
        setupRow3FromTop()
        setupRow4FromTop()
        setupRow5FromTop()
    }
    
    func setupResultLabel(){
        resultLabel.textColor = .white
        resultLabel.text = "0"
    }
    
    func setupVerticalStackView(){
        verticalStackView.spacing = 8
        verticalStackView.distribution = .fillProportionally
    }
    
    func setupHorizontalStackView(_ currRow: UIStackView, idx: Int) -> UIStackView{
        currRow.distribution = .fillProportionally
        currRow.alignment = .fill
        currRow.spacing = 8
        NSLayoutConstraint.activate([
            currRow.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor, multiplier: 1),
            currRow.heightAnchor.constraint(equalTo: verticalStackView.heightAnchor, multiplier: 1/5, constant: -8)
        ])
        return currRow
    }
    
    func setupRow1FromTop(){
        row1 = setupHorizontalStackView(row1, idx: 0)
        resetButton = CustomButton()
        resetButton.configure(.reset)
        resetButton.setupConstraint(stackView: row1)
        resetButton.addTarget(self, action: #selector(resetCalculation), for: .touchUpInside)
        let plusminusButton: CustomButton = CustomButton()
        plusminusButton.configure(.plusminus)
        plusminusButton.setupConstraint(stackView: row1)
        plusminusButton.addTarget(self, action: #selector(negationButtonTap), for: .touchUpInside)
        let percentButton: CustomButton = CustomButton()
        percentButton.configure(.percent)
        percentButton.setupConstraint(stackView: row1)
        percentButton.addTarget(self, action: #selector(percentButtonTap), for: .touchUpInside)
        let divideButton: CustomButton = CustomButton()
        divideButton.configure(.divide)
        divideButton.setupConstraint(stackView: row1)
        divideButton.addTarget(self, action: #selector(divisionButtonTap), for: .touchUpInside)
        row1.addArrangedSubview(resetButton)
        row1.addArrangedSubview(plusminusButton)
        row1.addArrangedSubview(percentButton)
        row1.addArrangedSubview(divideButton)
    }
    
    func setupRow2FromTop(){
        row2 = setupHorizontalStackView(row2, idx: 1)
        let num7Button = CustomButton()
        num7Button.configure(.number7)
        num7Button.setupConstraint(stackView: row2)
        num7Button.addTarget(self, action: #selector(numberButtonTap), for: .touchUpInside)
        let num8Button = CustomButton()
        num8Button.configure(.number8)
        num8Button.setupConstraint(stackView: row2)
        num8Button.addTarget(self, action: #selector(numberButtonTap), for: .touchUpInside)
        let num9Button = CustomButton()
        num9Button.configure(.number9)
        num9Button.setupConstraint(stackView: row2)
        num9Button.addTarget(self, action: #selector(numberButtonTap), for: .touchUpInside)
        let multipleButton = CustomButton()
        multipleButton.configure(.multiple)
        multipleButton.setupConstraint(stackView: row2)
        multipleButton.addTarget(self, action: #selector(multipleButtonTap), for: .touchUpInside)
        row2.addArrangedSubview(num7Button)
        row2.addArrangedSubview(num8Button)
        row2.addArrangedSubview(num9Button)
        row2.addArrangedSubview(multipleButton)
    }
    
    func setupRow3FromTop(){
        row3 = setupHorizontalStackView(row3, idx: 2)
        let num4Button = CustomButton()
        num4Button.configure(.number4)
        num4Button.setupConstraint(stackView: row3)
        num4Button.addTarget(self, action: #selector(numberButtonTap), for: .touchUpInside)
        let num5Button = CustomButton()
        num5Button.configure(.number5)
        num5Button.setupConstraint(stackView: row3)
        num5Button.addTarget(self, action: #selector(numberButtonTap), for: .touchUpInside)
        let num6Button = CustomButton()
        num6Button.configure(.number6)
        num6Button.setupConstraint(stackView: row3)
        num6Button.addTarget(self, action: #selector(numberButtonTap), for: .touchUpInside)
        let minusButton = CustomButton()
        minusButton.configure(.minus)
        minusButton.addTarget(self, action: #selector(minusButtonTap), for: .touchUpInside)
        minusButton.setupConstraint(stackView: row3)
        row3.addArrangedSubview(num4Button)
        row3.addArrangedSubview(num5Button)
        row3.addArrangedSubview(num6Button)
        row3.addArrangedSubview(minusButton)
    }
    
    func setupRow4FromTop(){
        row4 = setupHorizontalStackView(row4, idx: 3)
        let num1Button = CustomButton()
        num1Button.configure(.number1)
        num1Button.setupConstraint(stackView: row4)
        num1Button.addTarget(self, action: #selector(numberButtonTap), for: .touchUpInside)
        let num2Button = CustomButton()
        num2Button.configure(.number2)
        num2Button.setupConstraint(stackView: row4)
        num2Button.addTarget(self, action: #selector(numberButtonTap), for: .touchUpInside)
        let num3Button = CustomButton()
        num3Button.configure(.number3)
        num3Button.setupConstraint(stackView: row4)
        num3Button.addTarget(self, action: #selector(numberButtonTap), for: .touchUpInside)
        let plusButton = CustomButton()
        plusButton.configure(.plus)
        plusButton.setupConstraint(stackView: row4)
        plusButton.addTarget(self, action: #selector(plusButtonTap), for: .touchUpInside)
        row4.addArrangedSubview(num1Button)
        row4.addArrangedSubview(num2Button)
        row4.addArrangedSubview(num3Button)
        row4.addArrangedSubview(plusButton)
    }
    
    func setupRow5FromTop(){
        row5 = setupHorizontalStackView(row5, idx: 4)
        let num0Button = CustomButton()
        num0Button.configure(.number0)
        num0Button.setupConstraint(stackView: row5)
        num0Button.addTarget(self, action: #selector(numberButtonTap), for: .touchUpInside)
        let decimalButton = CustomButton()
        decimalButton.configure(.decimal)
        decimalButton.setupConstraint(stackView: row5)
        decimalButton.addTarget(self, action: #selector(numberButtonTap), for: .touchUpInside)
        let equalsButton = CustomButton()
        equalsButton.configure(.equals)
        equalsButton.setupConstraint(stackView: row5)
        equalsButton.addTarget(self, action: #selector(equalsButtonTap), for: .touchUpInside)
        row5.addArrangedSubview(num0Button)
        row5.addArrangedSubview(decimalButton)
        row5.addArrangedSubview(equalsButton)
    }
    
    @objc func numberButtonTap(sender: Any){
        if let buttonLabel = (sender as AnyObject).titleLabel {
            if resultLabel.text != nil{
                if !isAbleInput(resultValue) {return}
                if !isFirstEqual{
                    clearInput()
                    if buttonLabel?.text != ","{
                        resultValue = buttonLabel?.text ?? "0"
                    }
                }
                if operationType != .none && resultValue == "0"{
                    resultLabel.text = resultValue
                }
                if resultLabel.text == "0" && buttonLabel?.text != ","{
                    resultValue = ""
                }
                else if resultLabel.text == "-0" && buttonLabel?.text != ","{
                    resultValue = "-"
                }
                if !resultLabel.text!.isContains(",") && buttonLabel?.text == ","{
                    resultValue += buttonLabel!.text ?? ""
                    if(buttonLabel?.text == ","){
                        resultLabel.text! += buttonLabel?.text ?? ""
                    }
                }
                if buttonLabel?.text != ","{
                    resultValue += buttonLabel!.text ?? ""
                    resultLabel.text! += buttonLabel?.text ?? ""
                }
                if !resultLabel.text!.isContains(","){
                    formatResultToDecimal()
                }
                isNumberInput = true
            }
        }
    }
    
    @objc func resetCalculation(){
        resultLabel.text = "0"
        if(resetCount == 1){
            clearInput()
            resultValue = "0"
        }
        else{
            if operationType != .none{
                firstInput = 0
            }
            resetCount = 1
        }
        clearValue()
        isNumberInput = false
    }
    
    func clearInput(){
        firstInput = 0
        secondInput = 0
        operationType = .none
        isFirstEqual = true
        resetCount = 0
    }
    
    func clearValue(){
        resultValue = "0"
    }
    
    @objc func negationButtonTap(){
        resetCount = 0
        let isNegative = resultLabel.text!.isContains("-")
        if operationType != .none{
            resultLabel.text = resultValue
        }
        if let text = resultLabel.text{
            if !isNegative{
                resultLabel.text?.insert("-", at: text.startIndex)
            }
            else{
                resultLabel.text?.removeFirst()
            }
            resultValue = resultLabel.text!
            if !isFirstEqual{
                firstInput = resultValue.formatToNumber()
            }
        }
    }
    
    @objc func percentButtonTap(){
        resetCount = 0
        let result = resultValue.removeGroupSeparator().formatToNumber() / 100
        resultValue = String(result).formatDecimalSeparator()
        formatResultToDecimal()
        if !isFirstEqual{
            firstInput = resultValue.formatToNumber()
        }
    }
    
    @objc func divisionButtonTap(){
        setFirstInput(.division)
    }
    
    @objc func multipleButtonTap(){
        setFirstInput(.multiple)
    }
    
    @objc func minusButtonTap(){
        setFirstInput(.minus)
    }
    
    @objc func plusButtonTap(){
        setFirstInput(.plus)
    }
    
    @objc func equalsButtonTap(){
        if operationType == .none{
            isFirstEqual = false
            return
        }
        if isFirstEqual{
            secondInput = resultLabel.text?.formatToNumber() ?? 0
        }
        switch operationType {
        case .none:
            break
        case .plus:
            resultValue = String(firstInput + secondInput).formatDecimalSeparator()
        case .minus:
            resultValue = String(firstInput - secondInput).formatDecimalSeparator()
        case .multiple:
            resultValue = String(firstInput * secondInput).formatDecimalSeparator()
        case .division:
            if firstInput == 1 && secondInput == 0{
                resultValue = "ERROR"
            }
            else{
                resultValue = String(firstInput / secondInput).formatDecimalSeparator()
            }
        }
        formatResultToDecimal()
        isFirstEqual = false
        isNumberInput = false
        firstInput = resultValue.formatToNumber()
    }
    
    func formatResultToDecimal(){
        if resultValue == "ERROR"{
            resultLabel?.text = resultValue
            return
        }
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 100
        formatter.decimalSeparator = ","
        formatter.groupingSeparator = "."
        let resultVal = formatter.number(from:resultValue.removeGroupSeparator())
        resultValue = formatter.string(from: resultVal ?? 0)!
        resultLabel?.text = convertResultToExponentOfTen(resultValue)
    }
    
    func setFirstInput(_ typeOperation: OperationType){
        if isNumberInput && operationType != .none{
            equalsButtonTap()
        }
        if operationType == .none{
            firstInput = resultValue.formatToNumber()
        }
        operationType = typeOperation
        isFirstEqual = true
        clearValue()
        resetCount = 0
        isNumberInput = false
    }
    
    //limit input digits to 9 number digits max
    func isAbleInput(_ resultValue: String)->Bool{
        var result = false
        var labelValue = resultValue.removeGroupSeparator()
        labelValue = labelValue.removeDecimalSeparator()
        labelValue = labelValue.removeNegationSign()
        if labelValue.count < 9{
            result = true
        }
        return result
    }
    
    func convertResultToExponentOfTen(_ resultValueStr: String)->String{
        var result = resultValueStr
        var absValue = resultValueStr.removeNegationSign()
        if absValue.contains("."){
            absValue = absValue.removeDecimalDigits()
            if absValue.removeGroupSeparator().count > 9{
                result = getPositiveExponentFormat(absValue)
            }
        }
        else{
            if absValue.removeDecimalSeparator().count > 9{
                result = getNegativeExponentFormat(absValue)
            }
        }
        return result
    }
    
    func getPositiveExponentFormat(_ digitStr: String)->String{
        let numValue = digitStr.formatToNumber()
        let nPow = digitStr.removeGroupSeparator().count - 1
        let divideByValue = pow(10, nPow)
        let decimalValue = numValue/NSDecimalNumber(decimal: divideByValue).doubleValue
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 1
        let decimalValueStr = formatter.string(from: decimalValue as NSNumber)?.formatDecimalSeparator()
        return decimalValueStr! + "e" + String(nPow)
    }
    
    func getNegativeExponentFormat(_ digitStr: String)->String{
        let numValue = digitStr.formatToNumber()
        var nPow = digitStr.removeDecimalSeparator().count - 1
        let divideByValue = pow(10, nPow)
        let decimalValue = numValue*NSDecimalNumber(decimal: divideByValue).doubleValue
        var decimalValueStr = ""
        (decimalValueStr, nPow) = getDecimalValueStr(decimalValue: decimalValue, nPow: nPow)
        if nPow >= 9{
            return decimalValueStr + "e-" + String(nPow)
        }
        else{
            return decimalValueStr
        }
        
    }
    
    func getDecimalValueStr(decimalValue: Double, nPow: Int)->(String,Int){
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        var n = nPow
        var decValue = decimalValue
        var decimalValueStr = formatter.string(from: decValue as NSNumber)!.formatDecimalSeparator()
        if decimalValueStr.count > 1{
            n -= decimalValueStr.count - 1
            var newNPow = decimalValueStr.count - 1
            if n < 9{
                formatter.maximumFractionDigits = 8
                newNPow = nPow
            }
            decValue /= NSDecimalNumber(decimal: pow(10, newNPow)).doubleValue
            decimalValueStr = formatter.string(from: decValue as NSNumber)!.formatDecimalSeparator()
        }
        return (decimalValueStr, n)
    }
    
}

enum OperationType{
    case none
    case plus
    case minus
    case multiple
    case division
}

extension String{
    func removeGroupSeparator()->String{
        return self.replacingOccurrences(of: ".", with: "")
    }
    
    func removeDecimalSeparator()->String{
        return self.replacingOccurrences(of: ",", with: "")
    }
    
    func removeNegationSign()->String{
        return self.replacingOccurrences(of: "-", with: "")
    }
    
    func formatDecimalSeparator()->String{
        return self.replacingOccurrences(of: ".", with: ",")
    }
    
    func isContains(_ char: String.Element)->Bool{
        var result = false
        if self.firstIndex(of: char) != nil{
            result = true
        }
        return result
    }
    
    mutating func removeDecimalDigits()-> String{
        if let findComaIdx = self.firstIndex(of: ","){
            self.removeSubrange(findComaIdx..<self.endIndex)
        }
        return self
    }
    
    func formatToNumber()->Double{
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.decimalSeparator = ","
        formatter.groupingSeparator = "."
        formatter.maximumIntegerDigits = 1000
        return Double(truncating: formatter.number(from: self) ?? 0)
    }
}

