//
//  ViewController.swift
//  SeanCollectionViewProject
//
//  Created by Sean Jones on 10/20/21.
//

import UIKit

protocol ViewControllerDelegate {
    func next(url: String)
}

class ViewController: UIViewController {
    
    //MARK: - PROPERTIES
    var viewModel: PostViewModel?
    var delegate: ViewControllerDelegate?
        
    var redditCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubViews()
        
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.estimatedItemSize = CGSize(width: 130, height: 180)
        redditCollectionView.collectionViewLayout = flowlayout
        
        redditCollectionView.delegate = self
        redditCollectionView.dataSource = self
        redditCollectionView.register(UINib(nibName: "Post", bundle: .main), forCellWithReuseIdentifier: "redditCell")
        setupViewModel()
    }
    
   static func create() -> ViewController {
       let controller = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "PostListVC") as! ViewController
       return controller
        
    }
    
    func setupViewModel() {
        self.viewModel = PostViewModel()
        viewModel?.closure = {self.redditCollectionView.reloadData()}
        
        
    }
    
  
    
    func configureSubViews() {
        redditCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(redditCollectionView)
        
        redditCollectionView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        redditCollectionView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        redditCollectionView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        redditCollectionView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
    }
    
    
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let posts = self.viewModel?.posts else { return 0}
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = redditCollectionView.dequeueReusableCell(withReuseIdentifier: "redditCell", for: indexPath) as? RedditCollectionViewCell  else { return UICollectionViewCell()}
         let post = self.viewModel?.posts?[indexPath.item]
        cell.postLabel.text = post?.title
        cell.url = post?.url
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130 , height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell =  redditCollectionView.cellForItem(at: indexPath) as? RedditCollectionViewCell {
            if let url = cell.url {
                delegate?.next(url: url)
            }
           
            
        }
    }
    
}
