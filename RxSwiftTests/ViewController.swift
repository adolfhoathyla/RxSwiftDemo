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
    
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let bag = DisposeBag()
        
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
        
        
        
        
        
        let provider = NetworkManager()
        
        let _ = provider.isLoading.subscribe { (event) in
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
        
        
        provider.getNewPosts { (posts, success, error) in
            print("PRIMEIRA")
            print(posts)
        }
        
        provider.getNewPosts { (posts, success, error) in
            print("SEGUNDA")
            print(posts)
        }
    }


}

