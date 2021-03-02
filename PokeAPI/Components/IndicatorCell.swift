//
//  IndicatorCell.swift
//  PokeAPI
//
//  Created by Guilherme Moraes on 02/03/21.
//

import Foundation
import UIKit

class IndicatorCell: UICollectionViewCell {
    
    var indicator : UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.style = .large
        view.color = .white
        return view
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup(){
        contentView.addSubview(indicator)
        indicator.center = contentView.center
    }
    
}
