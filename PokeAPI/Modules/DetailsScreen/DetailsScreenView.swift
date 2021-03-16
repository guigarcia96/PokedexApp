//
//  DetailsScreenView.swift
//  PokeAPI
//
//  Created by Guilherme Moraes on 02/03/21.
//

import UIKit

protocol DetailsScreenViewContract {
    func setup(with: Pokemon)
}

class DetailsScreenView: UIView {
    
    private lazy var primeiroTexto: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        self.addSubview(primeiroTexto)
        primeiroTexto.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        primeiroTexto.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
}
extension DetailsScreenView: DetailsScreenViewContract {
    func setup(with: Pokemon) {
        primeiroTexto.text = with.name
    }
}
