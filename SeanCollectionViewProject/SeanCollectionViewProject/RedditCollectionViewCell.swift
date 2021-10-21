//
//  RedditCollectionViewCell.swift
//  SeanCollectionViewProject
//
//  Created by Sean Jones on 10/20/21.
//

import UIKit

class RedditCollectionViewCell: UICollectionViewCell {
    //MARK: - PROPERTIES
    var url: String?
    
    
    //MARK: - OUTLETS
    
    @IBOutlet weak var postLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}
