//
//  uikit_uiLabel.swift
//  personalEncyclopedia
//
//  Created by Hugo Silva on 26/11/23.
//

import UIKit
import SwiftUI

class uikit_uiLabel: UIView {
    lazy var firstLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "First label"
        lb.textColor = .darkGray
        lb.textAlignment = .left
        lb.font = .systemFont(ofSize: 20)
        return lb
    }()
    
    lazy var secondLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Second label is bigger and might need more lines to fit the screen"
        lb.numberOfLines = 0 // 0 = ilimitado
        lb.textColor = .red
        lb.textAlignment = .right
        lb.font = .systemFont(ofSize: 20)
        return lb
    }()
    
    lazy var thirdLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Third label, STILL a label"
        lb.textColor = .white
        lb.textAlignment = .center
        lb.font = .systemFont(ofSize: 20)
        lb.backgroundColor = UIColor.orange
        lb.layer.cornerRadius = 15
        lb.clipsToBounds = true
        lb.adjustsFontSizeToFitWidth = true
        lb.minimumScaleFactor = 0.5 // permite diminuir o tamanho
        lb.shadowColor = UIColor.gray
        lb.shadowOffset = CGSize(width: 2, height: 2)
        return lb
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

extension uikit_uiLabel {
    func setupSubviews() {
        addSubview(firstLabel)
        addSubview(secondLabel)
        addSubview(thirdLabel)
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            firstLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            firstLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            firstLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            secondLabel.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 30),
            secondLabel.leadingAnchor.constraint(equalTo: firstLabel.leadingAnchor),
            secondLabel.trailingAnchor.constraint(equalTo: firstLabel.trailingAnchor),
            
            thirdLabel.topAnchor.constraint(equalTo: secondLabel.bottomAnchor, constant: 30),
            thirdLabel.leadingAnchor.constraint(equalTo: firstLabel.leadingAnchor),
            thirdLabel.trailingAnchor.constraint(equalTo: firstLabel.trailingAnchor)
        ])
    }
}

struct uikit_uiLabel_Previews: PreviewProvider {
    static var previews: some View {
        DefaultViewRepresentable(view: uikit_uiLabel())
    }
}
