//
//  ViewController.swift
//  Assignment 5
//
//  Created by Kaiya Takahashi on 2022-05-10.
//

import UIKit

class ViewController: UIViewController {
    
    var tipPercentage: Float!
    
    lazy var scrollView: UIScrollView = {
        let v = UIScrollView()
        v.addSubview(verticalSV)
        NSLayoutConstraint.activate([
            verticalSV.topAnchor.constraint(equalTo: v.contentLayoutGuide.topAnchor),
            verticalSV.leadingAnchor.constraint(equalTo: v.contentLayoutGuide.leadingAnchor),
            verticalSV.trailingAnchor.constraint(equalTo: v.contentLayoutGuide.trailingAnchor),
            verticalSV.bottomAnchor.constraint(equalTo: v.contentLayoutGuide.bottomAnchor),
            verticalSV.widthAnchor.constraint(equalTo: v.frameLayoutGuide.widthAnchor),
            verticalSV.heightAnchor.constraint(equalTo: v.frameLayoutGuide.heightAnchor)
        ])
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var welcomeLabel: WelcomeLabel = Bundle.main.loadNibNamed("WelcomeLabel", owner: self, options: nil)?.first as! WelcomeLabel
    
    let calculatedMoneyLabel: UILabel = {
        let l = UILabel()
        l.textColor = .white
        l.font = UIFont(name: "Hoefler Text", size: 50)
        l.textAlignment = .center
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let totalAmountLabel: UILabel = {
        let l = UILabel()
        l.text = "Total Amount"
        l.textColor = .white
        l.font = UIFont(name: "Hoefler Text", size: 20)
        l.textAlignment = .left
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let emptyView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let textField: UITextField = {
        let tF = UITextField()
        tF.backgroundColor = UIColor(red: 76/255, green: 51/255, blue: 199/255, alpha: 1)
        tF.layer.cornerRadius = 15
        tF.textAlignment = .center
        tF.placeholder = "Bill Amount"
        tF.textColor = .white
        tF.attributedPlaceholder = NSAttributedString(string: "Total Amount", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 111/255, green: 89/255, blue: 222/255, alpha: 1)])
        tF.keyboardType = .numberPad
        tF.translatesAutoresizingMaskIntoConstraints = false
        return tF
    }()
    
    let percentageLabel: UILabel = {
        let l = UILabel()
        l.textColor = .white
        l.font = UIFont(name: "Hoefler Text", size: 25)
        l.textAlignment = .center
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let tipPercentageLabel: UILabel = {
        let l = UILabel()
        l.text = "Tip Percentage"
        l.textColor = .white
        l.font = UIFont(name: "Hoefler Text", size: 20)
        l.textAlignment = .left
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    lazy var slider: UISlider = {
        let s = UISlider()
        s.minimumValue = 0
        s.maximumValue = 100
        s.isContinuous = true
        s.tintColor = .red
        s.value = 50
        s.addTarget(self, action: #selector(sliderValueDidChanged(_:)), for: .valueChanged)
        s.translatesAutoresizingMaskIntoConstraints = false
        return s
    }()
    
    lazy var button: UIButton = {
        let b = UIButton()
        b.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        b.setTitle("Calculate Tip", for: .normal)
        b.backgroundColor = .red
        b.layer.cornerRadius = 15
        b.clipsToBounds = true
        b.titleLabel?.font = UIFont(name: "Hoefler Text", size: 20)
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    lazy var verticalSV: UIStackView = {
        let vSV = UIStackView(arrangedSubviews: [welcomeLabel, calculatedMoneyLabel, totalAmountLabel, textField, tipPercentageLabel, slider, percentageLabel, button, emptyView])
        vSV.translatesAutoresizingMaskIntoConstraints = false
        vSV.alignment = .fill
        vSV.distribution = .fillProportionally
        vSV.spacing = 30
        vSV.backgroundColor = UIColor(red: 52/255, green: 0/255, blue: 156/255, alpha: 1)
        vSV.axis = .vertical
        return vSV
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        percentageLabel.text = "50%"
        calculatedMoneyLabel.text = "$ 0.00"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(scrollView)
        registerForKeyboardNotification()
        
        NSLayoutConstraint.activate([
            scrollView.frameLayoutGuide.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.frameLayoutGuide.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.frameLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            scrollView.frameLayoutGuide.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            totalAmountLabel.leadingAnchor.constraint(equalTo: verticalSV.leadingAnchor, constant: 50),
            totalAmountLabel.trailingAnchor.constraint(equalTo: verticalSV.trailingAnchor, constant: -50),

            textField.leadingAnchor.constraint(equalTo: verticalSV.leadingAnchor, constant: 100),
            textField.trailingAnchor.constraint(equalTo: verticalSV.trailingAnchor, constant: -100),
            
            tipPercentageLabel.leadingAnchor.constraint(equalTo: verticalSV.leadingAnchor, constant: 50),
            tipPercentageLabel.trailingAnchor.constraint(equalTo: verticalSV.trailingAnchor, constant: -50),
            
            slider.leadingAnchor.constraint(equalTo: verticalSV.leadingAnchor, constant: 100),
            slider.trailingAnchor.constraint(equalTo: verticalSV.trailingAnchor, constant: -100),
            
            button.leadingAnchor.constraint(equalTo: verticalSV.leadingAnchor, constant: 100),
            button.trailingAnchor.constraint(equalTo: verticalSV.trailingAnchor, constant: -100),
        ])
        
        welcomeLabel.setTextFieldWidthAndHeight(height: 0.1, width: 1, equalTo: verticalSV)
        textField.setTextFieldWidthAndHeight(height: 0.05, width: 0.6, equalTo: verticalSV)
        calculatedMoneyLabel.setTextFieldWidthAndHeight(height: 0.1, width: 1, equalTo: verticalSV)
        totalAmountLabel.setTextFieldWidthAndHeight(height: 0.05, width: 1, equalTo: verticalSV)
        tipPercentageLabel.setTextFieldWidthAndHeight(height: 0.05, width: 1, equalTo: verticalSV)
        slider.setTextFieldWidthAndHeight(height: 0.05, width: 0.5, equalTo: verticalSV)
        percentageLabel.setTextFieldWidthAndHeight(height: 0.05, width: 1, equalTo: verticalSV)
        button.setTextFieldWidthAndHeight(height: 0.05, width: 0.5, equalTo: verticalSV)
        emptyView.setViewWidthAndHeight(height: 0.1, width: 1, equalTo: verticalSV)
    }

    @objc func sliderValueDidChanged(_ sender: UISlider!) {
        print(sender.value)
        let currentPercentage = Int(sender.value)
        percentageLabel.text = "\(currentPercentage)%"
        if let billAmount = Double(textField.text!) {
            let result = Double(currentPercentage) * billAmount * 0.01
            calculatedMoneyLabel.text = "$ \(result)"
        }
    }
    
    @objc func buttonPressed(_ sender: UIButton!) {
        if let billAmount = Double(textField.text!){
            let result = billAmount * 0.15
            calculatedMoneyLabel.text = "$ \(result)"
        }
    }
    
    func registerForKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShawn(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasHidden(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWasShawn(_ notification: Notification){
        guard let info = notification.userInfo ,
                let keyboardFrameValue = info[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue else {return}
        
        let keyboardFrame = keyboardFrameValue.cgRectValue
        let keyboardSize = keyboardFrame.size
        
        let contenInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
        scrollView.contentInset = contenInsets
        scrollView.scrollIndicatorInsets = contenInsets
    }
    
    @objc func keyboardWasHidden(_ notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
}

