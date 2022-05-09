//
//  ViewController.swift
//  Calculadora
//
//  Created by antonio on 08/05/22.
//

import UIKit


class ViewController: UIViewController {
    
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
    
    var calcResultNumber: Double = 0
    var stringResult: String = ""
    var lastButtonClicked: String = ""
    
    @IBAction func actionButton(_ sender: UIButton){
        isTextInScreen()
        switch sender {
            case zeroButton:
                stringResult += "0"
                containerCalcTextView.text! += "0"
                break
            case oneButton:
                stringResult += "1"
                containerCalcTextView.text! += "1"
                break
            case twoButton:
                stringResult += "2"
                containerCalcTextView.text! += "2"
                break
            case threeButton:
                stringResult += "3"
                containerCalcTextView.text! += "3"
                break
            case fourButton:
                stringResult += "4"
                containerCalcTextView.text! += "4"
                break
            case fiveButton:
                stringResult += "5"
                containerCalcTextView.text! += "5"
                break
            case sixButton:
                stringResult += "6"
                containerCalcTextView.text! += "6"
                break
            case sevenButton:
                stringResult += "7"
                containerCalcTextView.text! += "7"
                break
            case eightButton:
                stringResult += "8"
                containerCalcTextView.text! += "8"
                break
            case nineButton:
                stringResult += "9"
                containerCalcTextView.text! += "9"
                break
            case sumButton:
                sum()
                lastButtonClicked = "+"
                containerCalcTextView.text! += "+"
                break
            case multButton:
                mult()
                lastButtonClicked = "x"
                containerCalcTextView.text! += "x"
                break
            case subButton:
                sub()
                lastButtonClicked = "-"
                containerCalcTextView.text! += "-"
                break
            case divButton:
                div()
                lastButtonClicked = "/"
                containerCalcTextView.text! += "/"
                break
            case clearButton:
                containerCalcTextView.text = "0"
                calcResultNumber = 0
                stringResult = ""
                break
            case calcButton :
                result()
                containerCalcTextView.text = "\(calcResultNumber)"
                stringResult = ""
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
    private func setupContainerAppView(){
        containerAppView = UIView()
        view.addSubview(containerAppView)
        containerAppView.translatesAutoresizingMaskIntoConstraints = false
        containerAppView.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            containerAppView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerAppView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerAppView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerAppView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // Configuracao do container responsavel por ser a area de Saida dos dados
    private func setupContainerScreenView(){
        containerScreenView = UIView()
        view.addSubview(containerScreenView)
        containerScreenView.translatesAutoresizingMaskIntoConstraints = false
        containerScreenView.backgroundColor = .black
        
        NSLayoutConstraint.activate([
            containerScreenView.widthAnchor.constraint(equalTo: containerAppView.widthAnchor, multiplier: 1),
            containerScreenView.heightAnchor.constraint(equalTo: containerAppView.heightAnchor, multiplier: 0.3),
            containerScreenView.topAnchor.constraint(equalTo: containerAppView.topAnchor)
        ])
        
    }
    
    // Configuracao do container que contem a tela dos botoes da calculadora
    private func setupContainerButtonsView(){
        containerButtonsView = UIView()
        view.addSubview(containerButtonsView)
        containerButtonsView.translatesAutoresizingMaskIntoConstraints = false
        containerButtonsView.backgroundColor = .systemCyan
        
        
        NSLayoutConstraint.activate([
            containerButtonsView.widthAnchor.constraint(equalTo: containerAppView.widthAnchor, multiplier: 1),
            containerButtonsView.heightAnchor.constraint(equalTo: containerAppView.heightAnchor, multiplier: 0.7),
            containerButtonsView.bottomAnchor.constraint(equalTo: containerAppView.bottomAnchor)
        ])
    }
    
    // Tela de Botoes
    private func buttonsView(){
        
        zeroButton = UIButton()
        zeroButton.backgroundColor = .systemGray
        zeroButton.layer.borderWidth = 1
        zeroButton.setTitle("0", for: .normal)
        zeroButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        
        oneButton = UIButton()
        oneButton.backgroundColor = .systemGray
        oneButton.layer.borderWidth = 1
        oneButton.setTitle("1", for: .normal)
        oneButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        
        twoButton = UIButton()
        twoButton.backgroundColor = .systemGray
        twoButton.layer.borderWidth = 1
        twoButton.setTitle("2", for: .normal)
        twoButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        
        threeButton = UIButton()
        threeButton.backgroundColor = .systemGray
        threeButton.layer.borderWidth = 1
        threeButton.setTitle("3", for: .normal)
        threeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        
        fourButton = UIButton()
        fourButton.backgroundColor = .systemGray
        fourButton.layer.borderWidth = 1
        fourButton.setTitle("4", for: .normal)
        fourButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        
        
        fiveButton = UIButton()
        fiveButton.backgroundColor = .systemGray
        fiveButton.layer.borderWidth = 1
        fiveButton.setTitle("5", for: .normal)
        fiveButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        
        sixButton = UIButton()
        sixButton.backgroundColor = .systemGray
        sixButton.layer.borderWidth = 1
        sixButton.setTitle("6", for: .normal)
        sixButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        
        sevenButton = UIButton()
        sevenButton.backgroundColor = .systemGray
        sevenButton.layer.borderWidth = 1
        sevenButton.setTitle("7", for: .normal)
        sevenButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        
        eightButton = UIButton()
        eightButton.backgroundColor = .systemGray
        eightButton.layer.borderWidth = 1
        eightButton.setTitle("8", for: .normal)
        eightButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        
        nineButton = UIButton()
        nineButton.backgroundColor = .systemGray
        nineButton.layer.borderWidth = 1
        nineButton.setTitle("9", for: .normal)
        nineButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        
        divButton = UIButton()
        divButton.backgroundColor = .systemOrange
        divButton.layer.borderWidth = 1
        divButton.setTitle("/", for: .normal)
        divButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        
        multButton = UIButton()
        multButton.backgroundColor = .systemOrange
        multButton.layer.borderWidth = 1
        multButton.setTitle("x", for: .normal)
        multButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        
        sumButton = UIButton()
        sumButton.backgroundColor = .systemOrange
        sumButton.layer.borderWidth = 1
        sumButton.setTitle("+", for: .normal)
        sumButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        
        subButton = UIButton()
        subButton.backgroundColor = .systemOrange
        subButton.layer.borderWidth = 1
        subButton.setTitle("-", for: .normal)
        subButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        
        clearButton = UIButton()
        clearButton.backgroundColor = .systemGray
        clearButton.layer.borderWidth = 1
        clearButton.setTitle("AC", for: .normal)
        clearButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        
        calcButton = UIButton()
        calcButton.backgroundColor = .systemOrange
        calcButton.layer.borderWidth = 1
        calcButton.setTitle("=", for: .normal)
        calcButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        
        let firstLineButtonStackView = UIStackView(arrangedSubviews:
            [sevenButton, eightButton, nineButton, divButton])
        
        firstLineButtonStackView.distribution = .fillEqually
        firstLineButtonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let secondLineButtonStackView = UIStackView(arrangedSubviews:
            [fourButton, fiveButton, sixButton, multButton])
        
        secondLineButtonStackView.distribution = .fillEqually
        
        let thirdLineButtonStackView = UIStackView(arrangedSubviews:
            [oneButton, twoButton, threeButton,sumButton])
        
        thirdLineButtonStackView.distribution = .fillEqually
        
        let fourthLineButtonStackView = UIStackView(arrangedSubviews:
            [clearButton, zeroButton, calcButton, subButton])
        
        fourthLineButtonStackView.distribution = .fillEqually
        
        let buttonsStackView = UIStackView(arrangedSubviews:
            [firstLineButtonStackView,secondLineButtonStackView,thirdLineButtonStackView, fourthLineButtonStackView])
        
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.axis = .vertical
        
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        containerButtonsView.addSubview(buttonsStackView)
        
        NSLayoutConstraint.activate([
            
            buttonsStackView.topAnchor.constraint(equalTo: containerButtonsView.topAnchor),
            buttonsStackView.leadingAnchor.constraint(equalTo: containerButtonsView.leadingAnchor),
            buttonsStackView.bottomAnchor.constraint(equalTo: containerButtonsView.bottomAnchor),
            buttonsStackView.widthAnchor.constraint(equalTo: containerButtonsView.widthAnchor)

        ])
    }
    
    
    //Configuracao do container Tela que exibe o texto digitado na calculadora
    private func setupContainerCalcTextView(){
        containerCalcTextView = UITextView()
        containerScreenView.addSubview(containerCalcTextView)
        containerCalcTextView.text = "0"
        containerCalcTextView.backgroundColor = .black
        containerCalcTextView.textColor = .white
        containerCalcTextView.font = UIFont.boldSystemFont(ofSize: 70)
        containerCalcTextView.textAlignment = .right
        containerCalcTextView.isScrollEnabled = false
        containerCalcTextView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerCalcTextView.bottomAnchor.constraint(equalTo: containerScreenView.safeAreaLayoutGuide.bottomAnchor),
            containerCalcTextView.trailingAnchor.constraint(equalTo: containerScreenView.safeAreaLayoutGuide.trailingAnchor),
            containerCalcTextView.widthAnchor.constraint(equalTo: containerScreenView.safeAreaLayoutGuide.widthAnchor, multiplier: 1)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupContainerAppView()
        setupContainerScreenView()
        setupContainerButtonsView()
        setupContainerCalcTextView()
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
    }
    
    //Limpa a tela caso só exista o 0 na tela
    func isTextInScreen(){
        if(containerCalcTextView.text! == "0"){
            containerCalcTextView.text = ""
        }
    }
    
    // Executa a operacao de soma
    func sum(){
        calcResultNumber += (Double(stringResult) ?? 0)
        stringResult = ""
    }
    
    // Executa a operacao de subtracao
    func sub(){
        calcResultNumber = calcResultNumber - (Double(stringResult) ?? 0)
        stringResult = ""
    }
    
    // Executa a operacao de multiplicacao
    func mult(){
        calcResultNumber = calcResultNumber * (Double(stringResult) ?? 1)
        stringResult = ""
    }
    
    // Executa a operacao de dividir
    func div(){
        calcResultNumber = calcResultNumber / (Double(stringResult) ?? 1)
        stringResult = ""
    }
    
    // Resultado da conta
    func result(){
        switch lastButtonClicked {
            case "+":
                sum()
                break;
            case "-":
                sub()
                break;
            case "x":
                mult()
                break;
            case "/":
                div()
                break;
            default:
                break;
        }
    }
    
}
