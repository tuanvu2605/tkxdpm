//
//  UserBooksController.swift
//  tkxdpm
//
//  Created by Tuan Vu on 12/4/17.
//  Copyright © 2017 tuananh. All rights reserved.
//

import UIKit

class UserBooksController: UIViewController {

    @IBOutlet weak var collection: UICollectionView!
    var layout : KRLCollectionViewGridLayout?
    var listBooks = [Book]()
    let bookCellId = "bookCellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        layout = KRLCollectionViewGridLayout()
        layout?.numberOfItemsPerLine = 2
        layout?.aspectRatio = 16.0/9.0
        layout?.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout?.scrollDirection = .vertical
        layout?.interitemSpacing = 15
        layout?.lineSpacing = 5
        collection.delegate = self
        collection.dataSource = self
        collection.collectionViewLayout = layout!
        collection.register(UINib(nibName: "BookCell", bundle: nil), forCellWithReuseIdentifier: bookCellId)
        collection.reloadData()

        // Do any additional setup after loading the view.
    }

    
}

extension UserBooksController : UICollectionViewDelegate , UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listBooks.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bookCellId, for: indexPath) as! BookCell
        cell.backgroundColor = .red
        return cell
    }
}
