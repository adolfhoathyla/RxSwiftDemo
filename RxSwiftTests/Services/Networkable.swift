//
//  Networkable.swift
//  RxSwiftTests
//
//  Created by Adolfho Athyla on 23/10/18.
//  Copyright © 2018 a7hyla. All rights reserved.
//

import UIKit
import Moya
import RxSwift

protocol Networkable {
    var provider: MoyaProvider<PostApi> { get }
    var isLoading: BehaviorSubject<Bool> { get }
    func getNewPosts(completion: @escaping (([Post]?, Bool, Error?) -> ()))
}
