//
//  ViewController.swift
//  Calculadora
//
//  Created by antonio on 08/05/22.
//

import UIKit

class ViewController: UIViewController {
        
    
    var screenLabel: UILabel!
    var sumButton: UIButton!
    var subButton: UIButton!
    var multButton: UIButton!
    var divButton: UIButton!
    var zeroButton: UIButton!
    var oneButton: UIButton!
    var twoButton: UIButton!
    var threeButton: UIButton!
    var fourButton: UIButton!
    var fiveButton: UIButton!
    var sixButton: UIButton!
    var sevenButton: UIButton!
    var eightButton: UIButton!
    var nineButton: UIButton!
    var clearButton: UIButton!
    var resultButton: UIButton!
    var operation: String = ""
    var numbers: Double = 0.0
    var countClick: Int = 0
    var auxNumber: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        setupSumButton()
        setupSubButtom()
        setupMultButtom()
        setupDivButtom()
        setupNineButton()
        setupEightButton()
        setupSevenButton()
        setupSixButton()
        setupFiveButton()
        setupFourButton()
        setupThreeButton()
        setupTwoButton()
        setupOneButton()
        setupZeroButton()
        setupClearButton()
        setupResultButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupScreenLabel()
        
        
        sumButton.addTarget(self, action: #selector(sum), for: .touchUpInside)
        subButton.addTarget(self, action: #selector(sub), for: .touchUpInside)
        multButton.addTarget(self, action: #selector(mult), for: .touchUpInside)
        divButton.addTarget(self, action: #selector(div), for: .touchUpInside)
        resultButton.addTarget(self, action: #selector(result), for: .touchUpInside)
        clearButton.addTarget(self, action: #selector(clear), for: .touchUpInside)
        
        zeroButton.addTarget(self, action: #selector(clickZeroButton), for: .touchUpInside)
        oneButton.addTarget(self, action: #selector(clickOneButton), for: .touchUpInside)
        twoButton.addTarget(self, action: #selector(clickTwoButton), for: .touchUpInside)
        threeButton.addTarget(self, action: #selector(clickThreeButton), for: .touchUpInside)
        fourButton.addTarget(self, action: #selector(clickFourButton), for: .touchUpInside)
        fiveButton.addTarget(self, action: #selector(clickFiveButton), for: .touchUpInside)
        sixButton.addTarget(self, action: #selector(clickSixButton), for: .touchUpInside)
        sevenButton.addTarget(self, action: #selector(clickSevenButton), for: .touchUpInside)
        eightButton.addTarget(self, action: #selector(clickEightButton), for: .touchUpInside)
        nineButton.addTarget(self, action: #selector(clickNineButton), for: .touchUpInside)
        
    }
    
    
    func setupScreenLabel(){
        screenLabel = UILabel()
        view.addSubview(screenLabel)
        
        screenLabel.text = "Valores"
        screenLabel.textColor = .white
        screenLabel.textAlignment = .center
        screenLabel.font = .systemFont(ofSize: 50, weight: .medium)
        screenLabel.backgroundColor = .darkGray
        screenLabel.frame = CGRect(x: 0, y: 10, width: 330, height: 200)
    }
    
    func setupDivButtom(){
        divButton = UIButton()
        view.addSubview(divButton)
        
        divButton.setTitle("/", for: .normal)
        divButton.backgroundColor = .systemOrange
        divButton.setTitleColor(.black, for: .normal)
        divButton.frame = CGRect(x: 250, y: 275, width: 80, height: 75)
    }
    
    func setupMultButtom(){
        multButton = UIButton()
        view.addSubview(multButton)
        
        multButton.setTitle("x", for: .normal)
        multButton.backgroundColor = .systemOrange
        multButton.setTitleColor(.black, for: .normal)
        multButton.frame = CGRect(x: 250, y: 351, width: 80, height: 73)
    }
    
    func setupSubButtom(){
        subButton = UIButton()
        view.addSubview(subButton)
        
        subButton.setTitle("-", for: .normal)
        subButton.backgroundColor = .systemOrange
        subButton.setTitleColor(.black, for: .normal)
        subButton.frame = CGRect(x: 250, y: 426, width: 80, height: 73)
    }
    
    func setupSumButton(){
        sumButton = UIButton()
        view.addSubview(sumButton)
        
        sumButton.setTitle("+", for: .normal)
        sumButton.backgroundColor = .systemOrange
        sumButton.setTitleColor(.black, for: .normal)
        sumButton.frame = CGRect(x: 250, y: 501, width: 80, height: 73)
        
    }
    
    
    func setupNineButton(){
        nineButton = UIButton()
        view.addSubview(nineButton)
        
        nineButton.setTitle("9", for: .normal)
        nineButton.backgroundColor = .systemGray
        nineButton.setTitleColor(.white, for: .normal)
        nineButton.frame = CGRect(x: 169, y: 276, width: 80, height: 73)
    }
    
    func setupEightButton(){
        eightButton = UIButton()
        view.addSubview(eightButton)
        
        eightButton.setTitle("8", for: .normal)
        eightButton.backgroundColor = .systemGray
        eightButton.setTitleColor(.white, for: .normal)
        eightButton.frame = CGRect(x: 88, y: 276, width: 80, height: 73)
    }
    
    func setupSevenButton(){
        sevenButton = UIButton()
        view.addSubview(sevenButton)
        
        sevenButton.setTitle("7", for: .normal)
        sevenButton.backgroundColor = .systemGray
        sevenButton.setTitleColor(.white, for: .normal)
        sevenButton.frame = CGRect(x: 2, y: 276, width: 85, height: 73)
    }
    
    func setupSixButton(){
        sixButton = UIButton()
        view.addSubview(sixButton)
        
        sixButton.setTitle("6", for: .normal)
        sixButton.backgroundColor = .systemGray
        sixButton.setTitleColor(.white, for: .normal)
        sixButton.frame = CGRect(x: 169, y: 351, width: 80, height: 73)
    }
    
    func setupFiveButton(){
        fiveButton = UIButton()
        view.addSubview(fiveButton)
        
        fiveButton.setTitle("5", for: .normal)
        fiveButton.backgroundColor = .systemGray
        fiveButton.setTitleColor(.white, for: .normal)
        fiveButton.frame = CGRect(x: 88, y: 351, width: 80, height: 73)
    }
    
    func setupFourButton(){
        fourButton = UIButton()
        view.addSubview(fourButton)
        
        fourButton.setTitle("4", for: .normal)
        fourButton.backgroundColor = .systemGray
        fourButton.setTitleColor(.white, for: .normal)
        fourButton.frame = CGRect(x: 2, y: 351, width: 85, height: 73)
    }
    
    func setupThreeButton(){
        threeButton = UIButton()
        view.addSubview(threeButton)
        
        threeButton.setTitle("3", for: .normal)
        threeButton.backgroundColor = .systemGray
        threeButton.setTitleColor(.white, for: .normal)
        threeButton.frame = CGRect(x: 169, y: 426, width: 80, height: 73)
    }
    
    func setupTwoButton(){
        twoButton = UIButton()
        view.addSubview(twoButton)
        
        twoButton.setTitle("2", for: .normal)
        twoButton.backgroundColor = .systemGray
        twoButton.setTitleColor(.white, for: .normal)
        twoButton.frame = CGRect(x: 88, y: 426, width: 80, height: 73)
    }
    
    func setupOneButton(){
        oneButton = UIButton()
        view.addSubview(oneButton)
        
        oneButton.setTitle("1", for: .normal)
        oneButton.backgroundColor = .systemGray
        oneButton.setTitleColor(.white, for: .normal)
        oneButton.frame = CGRect(x: 2, y: 426, width: 85, height: 73)
    }
    
    func setupZeroButton(){
        zeroButton = UIButton()
        view.addSubview(zeroButton)
        
        zeroButton.setTitle("0", for: .normal)
        zeroButton.backgroundColor = .systemGray
        zeroButton.setTitleColor(.white, for: .normal)
        zeroButton.frame = CGRect(x: 2, y: 501, width: 85, height: 73)
    }
    
    func setupClearButton(){
        clearButton = UIButton()
        view.addSubview(clearButton)
        
        clearButton.setTitle("C", for: .normal)
        clearButton.backgroundColor = .systemGray
        clearButton.setTitleColor(.white, for: .normal)
        clearButton.frame = CGRect(x: 88, y:501, width: 80, height: 73)
    }
    
    func setupResultButton(){
        resultButton = UIButton()
        view.addSubview(resultButton)
        
        resultButton.setTitle("=", for: .normal)
        resultButton.backgroundColor = .systemOrange
        resultButton.setTitleColor(.white, for: .normal)
        resultButton.frame = CGRect(x: 169, y:501, width: 80, height: 73)
    }
    
    
    
    //metodos que alteram o valor
    func labelIsVoid(){
        if(screenLabel.text! == "Valores"){
            screenLabel.text = ""
        }
    }
    
    // Metodos que executam uma operaçao
    
    @objc func clear(){
        screenLabel.text = ""
        numbers = 0
    }
    
    @objc func sum(){
        
        operation = "soma"
        countClick = countClick + 1
        
        if(countClick == 1){
            numbers = (Double(screenLabel.text!) ?? 0)
        }else{
            numbers = numbers+(Double(screenLabel.text!) ?? 0)
            
        }
        sumButton.backgroundColor = .systemRed
        subButton.backgroundColor = .systemCyan
        multButton.backgroundColor = .systemCyan
        divButton.backgroundColor = .systemCyan
        screenLabel.text! = ""
    }
    
    @objc func sub(){
        
        operation = "subtracao"
        countClick = countClick + 1
        if(countClick == 1){
            numbers = (Double(screenLabel.text!) ?? 0)
        }else{
            numbers = numbers-(Double(screenLabel.text!) ?? 0)
        }
        sumButton.backgroundColor = .systemCyan
        subButton.backgroundColor = .systemRed
        multButton.backgroundColor = .systemCyan
        divButton.backgroundColor = .systemCyan
        screenLabel.text! = ""
    }
    
    @objc func mult(){
        
        operation = "multiplicacao"
        countClick+=1
        if(countClick == 1){
            numbers = (Double(screenLabel.text!) ?? 1)
        }else{
            numbers = numbers*(Double(screenLabel.text!) ?? 1)
        }
        sumButton.backgroundColor = .systemCyan
        subButton.backgroundColor = .systemCyan
        multButton.backgroundColor = .systemRed
        divButton.backgroundColor = .systemCyan
        screenLabel.text! = ""
    }
    
    @objc func div(){
        
        operation = "divisao"
        countClick+=1
        if(countClick == 1){
            numbers = (Double(screenLabel.text!) ?? 1)
        }else{
            numbers = numbers/(Double(screenLabel.text!) ?? 1)
        }
        sumButton.backgroundColor = .systemCyan
        subButton.backgroundColor = .systemCyan
        multButton.backgroundColor = .systemCyan
        divButton.backgroundColor = .systemRed
        screenLabel.text! = ""
    }
    
    @objc func result(){
        
        if(operation == "soma"){
            numbers = numbers+(Double(screenLabel.text!) ?? 0)
        }else if(operation == "subtracao"){
            numbers = numbers-(Double(screenLabel.text!) ?? 0)
        }else if(operation == "multiplicacao"){
            numbers = numbers*(Double(screenLabel.text!) ?? 1)
        }else if(operation == "divisao"){
            numbers = numbers/(Double(screenLabel.text!) ?? 1)
        }
        sumButton.backgroundColor = .systemCyan
        subButton.backgroundColor = .systemCyan
        multButton.backgroundColor = .systemCyan
        divButton.backgroundColor = .systemCyan
        screenLabel.text = String(numbers)
        countClick=0
    }
    
    // Teclas Numéricas
    @objc func clickZeroButton(){
        
        labelIsVoid()
        screenLabel.text! += "0"
    }
    
    @objc func clickOneButton(){
        labelIsVoid()
        screenLabel.text! += "1"
    }
    
    @objc func clickTwoButton(){
        labelIsVoid()
        screenLabel.text! += "2"
    }
    
    @objc func clickThreeButton(){
        labelIsVoid()
        screenLabel.text! += "3"
    }
    
    @objc func clickFourButton(){
        labelIsVoid()
        screenLabel.text! += "4"
    }
    
    @objc func clickFiveButton(){
        labelIsVoid()
        screenLabel.text! += "5"
    }
    
    @objc func clickSixButton(){
        labelIsVoid()
        screenLabel.text! += "6"
    }
    
    @objc func clickSevenButton(){
        labelIsVoid()
        screenLabel.text! += "7"
    }
    
    @objc func clickEightButton(){
        labelIsVoid()
        screenLabel.text! += "8"
    }
    
    @objc func clickNineButton(){
        labelIsVoid()
        screenLabel.text! += "9"
    }
}

