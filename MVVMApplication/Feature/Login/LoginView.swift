//
//  LoginView.swift
//  MVVMApplication
//
//  Created by Vadim Marchenko on 20.03.2022.
//

import Foundation
import UIKit
import SnapKit
import CombineCocoa

final class LoginView: BaseView {
    
    private let titleLabel = UILabel()
    private let stackView = UIStackView()
    let emailField = UITextField()
    let passwordField = UITextField()
    let actionButton = UIButton()
    
    
    override func makeUI() {
        makeStackUI()
        makeTitleLabelUI()
        makeEmailFieldUI()
        makePasswordFieldUI()
        makeActionButtonUI()
    }
    
    //MARK: Config views
    private func makeStackUI() {
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = Dimension.biggerMaring
        
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(Dimension.biggerMaring)
            make.top.equalToSuperview().inset(Dimension.bigTopMargin)
        }
    }
    
    private func makeTitleLabelUI() {
        titleLabel.text = "Login to the App"
        titleLabel.textColor = .black
        titleLabel.font = UIFont(name: titleLabel.font.fontName, size: 28)
     
        stackView.addArrangedSubview(titleLabel)
    }
    
    private func makeEmailFieldUI() {
        emailField.placeholder = "E-mail"
        stackView.addArrangedSubview(emailField)
        
        emailField.snp.makeConstraints { make in
            make.height.equalTo(Dimension.buttonSize)
        }
    }
    
    
    private func makePasswordFieldUI() {
        passwordField.placeholder = "Password"
        stackView.addArrangedSubview(passwordField)
    }
    
    private func makeActionButtonUI() {
        actionButton.setTitle("Login", for: .normal)
        actionButton.backgroundColor = .blue
        stackView.addArrangedSubview(actionButton)
    }
}
