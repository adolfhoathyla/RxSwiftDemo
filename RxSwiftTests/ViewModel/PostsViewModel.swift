//
//  PostsViewModel.swift
//  RxSwiftTests
//
//  Created by Adolfho Athyla de Almeida Beserra on 24/10/2018.
//  Copyright © 2018 a7hyla. All rights reserved.
//

import UIKit
import Moya
import RxSwift

class PostsViewModel: NSObject {
    
    var posts = [Post]()
    
    let provider = NetworkManager()
    
    func fetchPosts(disposeBag: DisposeBag) {
        provider.getNewPosts(disposeBag: disposeBag) { (posts, success, error) in
            if success {
                guard let posts = posts else { return }
                self.posts = posts
                print(posts)
            }
        }

    }
}
