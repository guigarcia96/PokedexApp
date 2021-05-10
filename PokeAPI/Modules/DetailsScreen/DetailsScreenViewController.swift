//
//  DetailsScreenViewController.swift
//  PokeAPI
//
//  Created by Guilherme Moraes on 02/03/21.
//

import UIKit

protocol DetailsScreenViewControllerContract {
    func setup(with: Pokemon, color: UIColor)
}

class DetailsScreenViewController: UIViewController, Cordinating {
    var coordinator: Coordinator?
    var viewModel: DetailsScreenViewModelContract
    
    lazy var myView: DetailsScreenView = {
        let view = DetailsScreenView()
        return view
    }()
    
    init(viewModel: DetailsScreenViewModelContract) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = myView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        title = "Pokemon Details"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = viewModel.returnSelectedColor()
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
    }
}

extension DetailsScreenViewController: DetailsScreenViewControllerContract {
    func setup(with: Pokemon, color: UIColor) {
        myView.setup(with: with, viewColor: color)
    }
}

