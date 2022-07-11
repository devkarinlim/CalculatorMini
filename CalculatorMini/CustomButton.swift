//
//  CustomButton.swift
//  CalculatorMini
//
//  Created by Karin Lim on 05/07/22.
//

import UIKit

class CustomButton: UIButton {
    
    enum ButtonType{
        case reset
        case plusminus
        case percent
        case divide
        case multiple
        case minus
        case plus
        case equals
        case decimal
        case number0
        case number1
        case number2
        case number3
        case number4
        case number5
        case number6
        case number7
        case number8
        case number9
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    
    
    func setupButton(){
        frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        clipsToBounds = true
        titleLabel?.textColor = .white
//        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func configure(_ buttonType: ButtonType){
        switch buttonType {
        case .reset:
            customize(title: "AC", bgColor: .lightGray)
        case .plusminus:
            customize(title: "+/-", bgColor: .lightGray)
        case .percent:
            customize(title: "%", bgColor: .lightGray)
        case .divide:
            customize(title: "/", bgColor: .systemOrange)
        case .multiple:
            customize(title: "X", bgColor: .systemOrange)
        case .minus:
            customize(title: "-", bgColor: .systemOrange)
        case .plus:
            customize(title: "+", bgColor: .systemOrange)
        case .equals:
            customize(title: "=", bgColor: .systemOrange)
        case .decimal:
            customize(title: ",", bgColor: .darkGray)
        case .number0:
            customize(title: "0", bgColor: .darkGray)
        case .number1:
            customize(title: "1", bgColor: .darkGray)
        case .number2:
            customize(title: "2", bgColor: .darkGray)
        case .number3:
            customize(title: "3", bgColor: .darkGray)
        case .number4:
            customize(title: "4", bgColor: .darkGray)
        case .number5:
            customize(title: "5", bgColor: .darkGray)
        case .number6:
            customize(title: "6", bgColor: .darkGray)
        case .number7:
            customize(title: "7", bgColor: .darkGray)
        case .number8:
            customize(title: "8", bgColor: .darkGray)
        case .number9:
            customize(title: "9", bgColor: .darkGray)
        }
    }
    
    func customize(title: String, bgColor: UIColor){
        setTitle(title, for: .normal)
        backgroundColor = bgColor
        contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func setupConstraint(stackView: UIStackView){
        if titleLabel?.text == "0"{
            NSLayoutConstraint.activate([
                widthAnchor.constraint(equalTo: heightAnchor, multiplier: 2)
            ])
        }
        else{
            NSLayoutConstraint.activate([
                widthAnchor.constraint(equalTo: heightAnchor, multiplier: 1)
            ])
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height * 0.5
    }
    
    
}
