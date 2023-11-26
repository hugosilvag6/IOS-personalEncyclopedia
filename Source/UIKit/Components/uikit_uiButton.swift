//
//  uikit_uiButton.swift
//  personalEncyclopedia
//
//  Created by Hugo Silva on 26/11/23.
//

import UIKit
import SwiftUI

fileprivate struct CustomColor {
    static let appPink = UIColor(red: 255/255, green: 0/255, blue: 136/255, alpha: 1)
}

class uikit_uiButton: UIView {
    lazy var firstButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Entrar", for: .normal)
        bt.titleLabel?.font = .systemFont(ofSize: 18)
        bt.setTitleColor(.lightGray, for: .normal)
        bt.clipsToBounds = true // permite arredondar
        bt.layer.cornerRadius = 7.5
        bt.backgroundColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1)
        bt.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        bt.isEnabled = true
        return bt
    }()
    
    lazy var secondButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.backgroundColor = .systemPink
        bt.layer.cornerRadius = 22.5
        bt.layer.shadowColor = CustomColor.appPink.cgColor
        bt.layer.shadowRadius = 10
        bt.layer.shadowOffset = CGSize(width: 0, height: 5)
        bt.layer.shadowOpacity = 0.3
        bt.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        let img = UIImage(systemName: "paperplane")?.withRenderingMode(.alwaysTemplate)
        bt.setImage(img, for: .normal)
        bt.tintColor = .white // é aqui que o ícone é pintado de branco
        bt.imageView?.contentMode = .scaleAspectFit
        // Usava-se o código abaixo pra mudar tamanho, mas foi deprecated
        // Agora o ideal é mudar o contentMode, e definir o tamanho do botão
        bt.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return bt
    }()
    
    lazy var thirdButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Não tem uma conta? Cadastre-se", for: .normal)
        bt.titleLabel?.font = .systemFont(ofSize: 18)
        bt.contentHorizontalAlignment = .left // alinha o texto
        bt.setTitleColor(.red, for: .normal)
        bt.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return bt
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension uikit_uiButton {
    @objc func buttonTapped() {
        // esse método pode acontecer de 2 formas:
        // 1- ficando aqui, e chamando o delegate.buttonTapped(), que será uma VC
        // 2- pode estar direto na VC, que deve fazer view.button.addTarget....
        print(#function)
    }
}

extension uikit_uiButton {
    func setupSubviews() {
        addSubview(firstButton)
        addSubview(secondButton)
        addSubview(thirdButton)
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            firstButton.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            firstButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            firstButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            firstButton.heightAnchor.constraint(equalToConstant: 50),
            
            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 30),
            secondButton.widthAnchor.constraint(equalToConstant: 55),
            secondButton.heightAnchor.constraint(equalToConstant: 55),
            secondButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 30),
            thirdButton.leadingAnchor.constraint(equalTo: firstButton.leadingAnchor),
            thirdButton.trailingAnchor.constraint(equalTo: firstButton.trailingAnchor)
        ])
    }
}

struct uikit_uiButton_Previews: PreviewProvider {
    static var previews: some View {
        DefaultViewRepresentable(view: uikit_uiButton())
    }
}
