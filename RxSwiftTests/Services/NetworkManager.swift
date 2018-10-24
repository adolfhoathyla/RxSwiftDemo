//
//  NetworkManager.swift
//  RxSwiftTests
//
//  Created by Adolfho Athyla on 23/10/18.
//  Copyright © 2018 a7hyla. All rights reserved.
//

import UIKit
import Moya
import RxSwift

struct NetworkManager: Networkable {
    var provider = MoyaProvider<PostApi>()
    var isLoading = BehaviorSubject<Bool>(value: false)
    
    func getNewPosts(disposeBag: DisposeBag, completion: @escaping ((_ posts: [Post]?, _ success: Bool, _ error: Error?) -> ())) {
        
        //let disposeBag = DisposeBag()

        self.isLoading.onNext(true)
        
        let _ = provider.rx.request(.newPosts()).RmapArray(to: Post.self).subscribe { (event) in
            switch event {
            case .success(let posts):
                completion(posts, true, nil)
            case .error(let error):
                completion(nil, false, error)
            }
            self.isLoading.onNext(false)
        }.disposed(by: disposeBag)
        
    }
}
