//
//  CollectionViewTableViewCell.swift
//  NetflixClone
//
//  Created by Praval Gautam on 11/02/24.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell{
    
    
    
    
    static let identifier = "CollectionViewTableViewCell"    // static ka matlab ha agar koi is class ka instance banata hai to ye nahi call hoga
    private var titles =  [Title]()
    
    private let collectionView : UICollectionView  = {
        
        let layout  =  UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: 140, height: 200)
        layout.scrollDirection = .horizontal
        let collectionView  =  UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: "TitleCollectionViewCell")
        return  collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemTeal
        contentView.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
    //for fill the title in titles
    
    public func configure(with titles: [Title]){
        self.titles = titles
        DispatchQueue.main.async{
            [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
    
    
    
    
    
    
    
}

extension CollectionViewTableViewCell :UICollectionViewDelegate,UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let cell  =  collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else{
           return UICollectionViewCell()
        }
        guard let model  =  titles[indexPath.row].poster_path else{
            return UICollectionViewCell()
        }//add this toi remove optional failure
        cell.configure(with: model)
    return cell
}
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }

}
