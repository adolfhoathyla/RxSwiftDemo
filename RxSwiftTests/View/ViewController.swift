//
//  ViewController.swift
//  RxSwiftTests
//
//  Created by Adolfho Athyla on 21/10/18.
//  Copyright © 2018 a7hyla. All rights reserved.
//

import UIKit
import Moya
import RxSwift

class ViewController: UIViewController {
    
    let postsVM = PostsViewModel()
    
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        let subject = BehaviorSubject<String>(value: "First")
        
        subject.onNext("Hello")
        
        let subscription = subject.subscribe { (event) in
            switch event {
            case .next(let value):
                print(value)
            case .error(let error):
                print(error)
            case .completed:
                print("completed")
            }
        }
        
        subject.onNext("World")
    
        subscription.disposed(by: bag)
        
        
        
        
        
        
        
        let _ = postsVM.provider.isLoading.subscribe { (event) in
            switch event {
            case .next(let value):
                print("IS LOADING: \(value)")
                UIApplication.shared.isNetworkActivityIndicatorVisible = value
            case .error(let error):
                print(error)
            case .completed:
                print("completed")
            }
        }
        
        

        
        postsVM.fetchPosts(disposeBag: bag)
        postsVM.fetchPosts(disposeBag: bag)
        postsVM.fetchPosts(disposeBag: bag)
    }


}

