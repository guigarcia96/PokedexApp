//
//  HomeScreenView.swift
//  PokeAPI
//
//  Created by Guilherme Moraes on 24/02/21.
//

import UIKit

class HomeScreenView: UIView {
    
    var viewModel = HomeScreenViewModel()
    let pokemonCellId = "pokemonCellId"
    
    private lazy var collectionView: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .darkGray
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(HomeScreenCollectionViewCell.self, forCellWithReuseIdentifier:pokemonCellId )
        collectionView.register(IndicatorCell.self, forCellWithReuseIdentifier:"indicator" )
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierachy()
        setupConstraints()
        configure()
        reloadData()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        collectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    func reloadData(){
        collectionView.reloadData()
    }
    func configure() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    func setupHierachy(){
        self.addSubview(collectionView)
    }
}

extension HomeScreenView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.poke.count + 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row != viewModel.poke.count {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: pokemonCellId, for: indexPath) as? HomeScreenCollectionViewCell
            cell?.setup(pokemons: viewModel.poke[indexPath.row], id: viewModel.getPokemonId(indice: indexPath.row))
            cell?.backgroundColor = viewModel.generateRandomColor()
            cell?.layer.cornerRadius = 12
            cell?.layer.masksToBounds = true
            return cell ?? UICollectionViewCell()
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "indicator", for: indexPath) as! IndicatorCell
            cell.setup()
            cell.indicator.startAnimating()
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row < viewModel.poke.count {
            let width = collectionView.frame.width / 2-1
            return CGSize(width: width, height: width)
        } else {
            let width = collectionView.frame.width
            return CGSize(width: width , height: 40)
        }
       
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == viewModel.poke.count{
            let seconds = 0.2
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                self.updateNextSet()
            }
        }
    }
    func updateNextSet(){
        if let next = viewModel.pokemons?.next {
            viewModel.getPokemons(url: next)
        }
    }
}
