//
//  PostApi.swift
//  RxSwiftTests
//
//  Created by Adolfho Athyla on 23/10/18.
//  Copyright © 2018 a7hyla. All rights reserved.
//

import UIKit
import Moya

enum PostApi {
    case newPosts()
}


extension PostApi: TargetType {
    var baseURL: URL {
        return URL(string: "https://cheesecakelabs.com")!
    }
    
    var path: String {
        return "/challenge"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return stubbedResponse("Popular")
    }
    
    var task: Moya.Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
}


extension PostApi {
    func stubbedResponse(_ filename: String) -> Data! {
        @objc class TestClass: NSObject { }
        
        let bundle = Bundle(for: TestClass.self)
        let path = bundle.path(forResource: filename, ofType: "json")
        return (try? Data(contentsOf: URL(fileURLWithPath: path!)))
    }
}
