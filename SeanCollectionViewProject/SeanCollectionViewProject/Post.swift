//
//  Post.swift
//  SeanCollectionViewProject
//
//  Created by Sean Jones on 10/20/21.
//

import Foundation


struct TopLevelObject: Decodable {
    let data: SecondLevelObject
}
struct SecondLevelObject: Decodable {
    let children: [ThirdLevelObject]
}
struct ThirdLevelObject: Decodable {
    let data: Post
}
struct Post: Decodable {
    let title: String
    let url: String
}
