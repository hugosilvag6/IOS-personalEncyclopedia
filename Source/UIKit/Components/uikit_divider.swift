//
//  uikit_divider.swift
//  personalEncyclopedia
//
//  Created by Hugo Silva on 26/11/23.
//

import SwiftUI
import UIKit

class uikit_divider: UIView {
    lazy var dividerView: UIView = {
        let vw = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.backgroundColor = .blue
        return vw
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews() {
        addSubview(dividerView)
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            dividerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            dividerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            dividerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            dividerView.heightAnchor.constraint(equalToConstant: 2)
        ])
    }
}

struct uikit_divider_Previews: PreviewProvider {
    static var previews: some View {
        DefaultViewRepresentable(view: uikit_divider())
    }
}

