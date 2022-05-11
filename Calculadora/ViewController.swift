//
//  ViewController.swift
//  Calculadora
//
//  Created by antonio on 08/05/22.
//

import UIKit

enum Buttons: String{
    case zero = "0"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case sum = "+"
    case sub = "-"
    case mult = "x"
    case div = "/"
    case equal = "="
    case rest = "%"
    case del = "Del"
    case point = "."
}

class ViewController: UIViewController {
    
    @IBOutlet var buttonNumber: UIButton!
    @IBOutlet var sumButton: UIButton!
    @IBOutlet var subButton: UIButton!
    @IBOutlet var multButton: UIButton!
    @IBOutlet var divButton: UIButton!
    @IBOutlet var zeroButton: UIButton!
    @IBOutlet var oneButton: UIButton!
    @IBOutlet var twoButton: UIButton!
    @IBOutlet var threeButton: UIButton!
    @IBOutlet var fourButton: UIButton!
    @IBOutlet var fiveButton: UIButton!
    @IBOutlet var sixButton: UIButton!
    @IBOutlet var sevenButton: UIButton!
    @IBOutlet var eightButton: UIButton!
    @IBOutlet var nineButton: UIButton!
    @IBOutlet var clearButton: UIButton!
    @IBOutlet var calcButton: UIButton!
    @IBOutlet var decimalButton: UIButton!
    @IBOutlet var deleteButton: UIButton!
    @IBOutlet var restButton: UIButton!
    @IBOutlet var changeCalculatorButton: UIButton!
    
    private var calculator = CalculatorAppLogic()
    var calcResultNumber: Double = 0
    var stringResult: String = ""
    var lastButtonClicked: String = ""
    var borderButtonSize = 10
    var fontSize = 40
    
    @IBAction func actionButton(_ sender: UIButton){
        isTextInScreen()
        
        //print(sender.tag)
        
        switch sender {
            case zeroButton:
                stringResult += Buttons.zero.rawValue
                containerCalcTextView.text! += Buttons.zero.rawValue
                break
            case oneButton:
                stringResult += Buttons.one.rawValue
                containerCalcTextView.text! += Buttons.one.rawValue
                break
            case twoButton:
                stringResult += Buttons.two.rawValue
                containerCalcTextView.text! += Buttons.two.rawValue
                break
            case threeButton:
                stringResult += Buttons.three.rawValue
                containerCalcTextView.text! += Buttons.three.rawValue
                break
            case fourButton:
                stringResult += Buttons.four.rawValue
                containerCalcTextView.text! += Buttons.four.rawValue
                break
            case fiveButton:
                stringResult += Buttons.five.rawValue
                containerCalcTextView.text! += Buttons.five.rawValue
                break
            case sixButton:
                stringResult += Buttons.six.rawValue
                containerCalcTextView.text! += Buttons.six.rawValue
                break
            case sevenButton:
                stringResult += Buttons.seven.rawValue
                containerCalcTextView.text! += Buttons.seven.rawValue
                break
            case eightButton:
                stringResult += Buttons.eight.rawValue
                containerCalcTextView.text! += Buttons.eight.rawValue
                break
            case nineButton:
                stringResult += Buttons.nine.rawValue
                containerCalcTextView.text! += Buttons.nine.rawValue
                break
            case sumButton:
                finalCalc()
                lastButtonClicked = Buttons.sum.rawValue
                containerCalcTextView.text! += Buttons.sum.rawValue
                break
            case multButton:
                finalCalc()
                lastButtonClicked = Buttons.mult.rawValue
                containerCalcTextView.text! += Buttons.mult.rawValue
                break
            case subButton:
                finalCalc()
                lastButtonClicked = Buttons.sub.rawValue
                containerCalcTextView.text! += Buttons.sub.rawValue
                break
            case divButton:
                finalCalc()
                lastButtonClicked = Buttons.div.rawValue
                containerCalcTextView.text! += Buttons.div.rawValue
                break
            case clearButton:
                containerCalcTextView.text = "0"
                calcResultNumber = 0
                stringResult = ""
                lastButtonClicked = ""
                break
            case calcButton :
                finalCalc()
                let numberFormatter = NumberFormatter()
                numberFormatter.maximumFractionDigits = 2
                containerCalcTextView.text = String((numberFormatter.string(from: calcResultNumber as NSNumber)!))
                break
            case decimalButton:
                stringResult += Buttons.point.rawValue
                containerCalcTextView.text! += Buttons.point.rawValue
                break
            case deleteButton:
                let cutString: String = String(containerCalcTextView.text!.dropLast())
                stringResult = String(stringResult.dropLast())
                containerCalcTextView.text! = cutString
                lastButtonClicked = ""
                break
            case changeCalculatorButton:
                break
            case restButton:
                finalCalc()
                lastButtonClicked = Buttons.rest.rawValue
                containerCalcTextView.text! += Buttons.rest.rawValue
                break
            default:
                containerCalcTextView.text = ""
        }
    }
    
    var containerAppView: UIView!
    var containerScreenView: UIView!
    var containerButtonsView: UIView!
    var containerCalcTextView: UITextView!
    
    //configuracao do container da tela do app
    
    // Configuracao do container responsavel por ser a area de Saida dos dados
    private func setupContainerScreenView(){
        containerScreenView = UIView()
        view.addSubview(containerScreenView)
        containerScreenView.translatesAutoresizingMaskIntoConstraints = false
        containerScreenView.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            containerScreenView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
            containerScreenView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            containerScreenView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerScreenView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            containerScreenView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
    }
    
    // Configuracao do container que contem a tela dos botoes da calculadora
    private func setupContainerButtonsView(){
        containerButtonsView = UIView()
        view.addSubview(containerButtonsView)
        containerButtonsView.translatesAutoresizingMaskIntoConstraints = false
        containerButtonsView.backgroundColor = .white
        
        
        NSLayoutConstraint.activate([
            containerButtonsView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
            containerButtonsView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            containerButtonsView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerButtonsView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            containerButtonsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        ])
    }
    
    // Tela de Botoes
    private func buttonsView(){
        
        
        zeroButton = UIButton()
        zeroButton.backgroundColor = .systemGray
        zeroButton.layer.borderWidth = 1
        zeroButton.layer.cornerRadius = CGFloat(borderButtonSize)
        zeroButton.setTitle("0", for: .normal)
        zeroButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: CGFloat(fontSize))
        
        oneButton = UIButton()
        oneButton.backgroundColor = .systemGray
        oneButton.layer.borderWidth = 1
        oneButton.layer.cornerRadius = CGFloat(borderButtonSize)
        oneButton.setTitle("1", for: .normal)
        oneButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: CGFloat(fontSize))
        
        twoButton = UIButton()
        twoButton.backgroundColor = .systemGray
        twoButton.layer.borderWidth = 1
        twoButton.layer.cornerRadius = CGFloat(borderButtonSize)
        twoButton.setTitle("2", for: .normal)
        twoButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: CGFloat(fontSize))
        
        threeButton = UIButton()
        threeButton.backgroundColor = .systemGray
        threeButton.layer.borderWidth = 1
        threeButton.layer.cornerRadius = CGFloat(borderButtonSize)
        threeButton.setTitle("3", for: .normal)
        threeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: CGFloat(fontSize))
        
        fourButton = UIButton()
        fourButton.backgroundColor = .systemGray
        fourButton.layer.borderWidth = 1
        fourButton.layer.cornerRadius = CGFloat(borderButtonSize)
        fourButton.setTitle("4", for: .normal)
        fourButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: CGFloat(fontSize))
        
        
        fiveButton = UIButton()
        fiveButton.backgroundColor = .systemGray
        fiveButton.layer.borderWidth = 1
        fiveButton.layer.cornerRadius = CGFloat(borderButtonSize)
        fiveButton.setTitle("5", for: .normal)
        fiveButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: CGFloat(fontSize))
        
        sixButton = UIButton()
        sixButton.backgroundColor = .systemGray
        sixButton.layer.borderWidth = 1
        sixButton.layer.cornerRadius = CGFloat(borderButtonSize)
        sixButton.setTitle("6", for: .normal)
        sixButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: CGFloat(fontSize))
        
        sevenButton = UIButton()
        sevenButton.backgroundColor = .systemGray
        sevenButton.layer.borderWidth = 1
        sevenButton.layer.cornerRadius = CGFloat(borderButtonSize)
        sevenButton.setTitle("7", for: .normal)
        sevenButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: CGFloat(fontSize))
        
        eightButton = UIButton()
        eightButton.backgroundColor = .systemGray
        eightButton.layer.borderWidth = 1
        eightButton.layer.cornerRadius = CGFloat(borderButtonSize)
        eightButton.setTitle("8", for: .normal)
        eightButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: CGFloat(fontSize))
        
        nineButton = UIButton()
        nineButton.backgroundColor = .systemGray
        nineButton.layer.borderWidth = 1
        nineButton.layer.cornerRadius = CGFloat(borderButtonSize)
        nineButton.setTitle("9", for: .normal)
        nineButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: CGFloat(fontSize))
        
        
        divButton = UIButton()
        divButton.backgroundColor = .systemOrange
        divButton.layer.borderWidth = 1
        divButton.layer.cornerRadius = CGFloat(borderButtonSize)
        divButton.setTitle("/", for: .normal)
        divButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: CGFloat(fontSize))
        
        multButton = UIButton()
        multButton.backgroundColor = .systemOrange
        multButton.layer.borderWidth = 1
        multButton.layer.cornerRadius = CGFloat(borderButtonSize)
        multButton.setTitle("x", for: .normal)
        multButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: CGFloat(fontSize))
        
        sumButton = UIButton()
        sumButton.backgroundColor = .systemOrange
        sumButton.layer.borderWidth = 1
        sumButton.layer.cornerRadius = CGFloat(borderButtonSize)
        sumButton.setTitle("+", for: .normal)
        sumButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: CGFloat(fontSize))
        
        subButton = UIButton()
        subButton.backgroundColor = .systemOrange
        subButton.layer.borderWidth = 1
        subButton.layer.cornerRadius = CGFloat(borderButtonSize)
        subButton.setTitle("-", for: .normal)
        subButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: CGFloat(fontSize))
        
        clearButton = UIButton()
        clearButton.backgroundColor = .systemGray2
        clearButton.layer.borderWidth = 1
        clearButton.layer.cornerRadius = CGFloat(borderButtonSize)
        clearButton.setTitle("AC", for: .normal)
        clearButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: CGFloat(fontSize))
        
        calcButton = UIButton()
        calcButton.backgroundColor = .systemOrange
        calcButton.layer.borderWidth = 1
        calcButton.layer.cornerRadius = CGFloat(borderButtonSize)
        calcButton.setTitle("=", for: .normal)
        calcButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: CGFloat(fontSize))
        
        deleteButton = UIButton()
        deleteButton.backgroundColor = .systemGray2
        deleteButton.layer.borderWidth = 1
        deleteButton.layer.cornerRadius = CGFloat(borderButtonSize)
        deleteButton.setTitle("Del", for: .normal)
        deleteButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: CGFloat(fontSize))
        
        decimalButton = UIButton()
        decimalButton.backgroundColor = .systemGray
        decimalButton.layer.borderWidth = 1
        decimalButton.layer.cornerRadius = CGFloat(borderButtonSize)
        decimalButton.setTitle(".", for: .normal)
        decimalButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: CGFloat(fontSize))
        
        restButton = UIButton()
        restButton.backgroundColor = .systemGray2
        restButton.layer.borderWidth = 1
        restButton.layer.cornerRadius = CGFloat(borderButtonSize)
        restButton.setTitle("%", for: .normal)
        restButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: CGFloat(fontSize))
        
        changeCalculatorButton = UIButton()
        changeCalculatorButton.backgroundColor = .systemOrange
        changeCalculatorButton.layer.borderWidth = 1
        changeCalculatorButton.layer.cornerRadius = CGFloat(borderButtonSize)
        changeCalculatorButton.setTitle("#", for: .normal)
        changeCalculatorButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: CGFloat(fontSize))
        
        let firstLineButtonStackView = UIStackView(arrangedSubviews:
            [clearButton, deleteButton, restButton, divButton])
        
        firstLineButtonStackView.distribution = .fillEqually

        
        let secondLineButtonStackView = UIStackView(arrangedSubviews:
            [sevenButton, eightButton, nineButton, multButton])
        
        secondLineButtonStackView.distribution = .fillEqually
        
        let thirdLineButtonStackView = UIStackView(arrangedSubviews:
            [fourButton, fiveButton, sixButton,subButton])
        
        thirdLineButtonStackView.distribution = .fillEqually
        
        let fourthLineButtonStackView = UIStackView(arrangedSubviews:
            [oneButton, twoButton, threeButton, sumButton])
        
        fourthLineButtonStackView.distribution = .fillEqually
        
        let fifthLineButtonStackView = UIStackView(arrangedSubviews:
            [changeCalculatorButton, zeroButton, decimalButton, calcButton])
        fifthLineButtonStackView.distribution = .fillEqually
        
        
        let buttonsStackView = UIStackView(arrangedSubviews:
            [firstLineButtonStackView,secondLineButtonStackView,thirdLineButtonStackView, fourthLineButtonStackView, fifthLineButtonStackView])
        
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.axis = .vertical
        
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        containerButtonsView.addSubview(buttonsStackView)
        
        NSLayoutConstraint.activate([
            
            buttonsStackView.topAnchor.constraint(equalTo: containerButtonsView.topAnchor),
            buttonsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            buttonsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            buttonsStackView.bottomAnchor.constraint(equalTo: containerButtonsView.safeAreaLayoutGuide.bottomAnchor),
            buttonsStackView.widthAnchor.constraint(equalTo: containerButtonsView.widthAnchor)

        ])
    }
    
    
    //Configuracao do container Tela que exibe o texto digitado na calculadora
    private func setupContainerCalcTextView(){
        containerCalcTextView = UITextView()
        containerScreenView.addSubview(containerCalcTextView)
        containerCalcTextView.text = "0"
        containerCalcTextView.backgroundColor = .white
        containerCalcTextView.textColor = .black
        containerCalcTextView.font = UIFont.boldSystemFont(ofSize: 70)
        containerCalcTextView.textAlignment = .right
        containerCalcTextView.isScrollEnabled = false
        containerCalcTextView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerCalcTextView.bottomAnchor.constraint(equalTo: containerScreenView.safeAreaLayoutGuide.bottomAnchor),
            containerCalcTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            containerCalcTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            containerCalcTextView.widthAnchor.constraint(equalTo: containerScreenView.widthAnchor, multiplier: 1),
            containerCalcTextView.heightAnchor.constraint(equalTo: containerScreenView.heightAnchor, multiplier: 0.8)
            
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupContainerScreenView()
        setupContainerButtonsView()
        //setupContainerCalcTextView()
        buttonsView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupContainerCalcTextView()
        
        nineButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        eightButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        sevenButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        sixButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        fiveButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        fourButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        threeButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        twoButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        oneButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        zeroButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        sumButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        subButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        multButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        divButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        clearButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        calcButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        deleteButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        decimalButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        restButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        changeCalculatorButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
    }
    
    //Limpa a tela caso só exista o 0 na tela
    func isTextInScreen(){
        if(containerCalcTextView.text! == "0" || containerCalcTextView.text! == "0.0"){
            containerCalcTextView.text = ""
        }
        
    }
    
    func finalCalc(){
       calcResultNumber = calculator.calc(value: (Double(stringResult) ?? 0), startValue: calcResultNumber, operation: lastButtonClicked)
        lastButtonClicked = ""
        stringResult = ""
    
    }
    
    
}

