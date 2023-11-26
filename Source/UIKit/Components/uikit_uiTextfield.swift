//
//  uikit_uiTextfield.swift
//  personalEncyclopedia
//
//  Created by Hugo Silva on 26/11/23.
//

import UIKit
import SwiftUI

class uikit_uiTextfield: UIViewController {
    
    lazy var firstTf: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Digite sua senha"
        tf.font = .systemFont(ofSize: 14)
        tf.keyboardType = .default
        tf.isSecureTextEntry = true
        tf.textColor = .darkGray
        tf.text = "123456"
        return tf
    }()
    
    lazy var secondTf: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .red.withAlphaComponent(0.3)
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.placeholder = "Digite seu email"
        tf.autocapitalizationType = .none
        tf.textColor = .darkGray
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
    }
}

extension uikit_uiTextfield {
    func setupSubviews() {
        view.addSubview(firstTf)
        view.addSubview(secondTf)
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            firstTf.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            firstTf.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            firstTf.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            secondTf.topAnchor.constraint(equalTo: firstTf.bottomAnchor, constant: 30),
            secondTf.leadingAnchor.constraint(equalTo: firstTf.leadingAnchor),
            secondTf.trailingAnchor.constraint(equalTo: firstTf.trailingAnchor),
        ])
    }
}

struct uikit_uiTextfield_Previews: PreviewProvider {
    static var previews: some View {
        DefaultViewControllerRepresentable(viewController: uikit_uiTextfield())
    }
}
