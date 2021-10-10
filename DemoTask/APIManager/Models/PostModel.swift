//
//  PostModel.swift
//  DemoTask
//
//  Created by SOTSYS140 on 10/10/21.
//

import UIKit

struct PostList: Codable {
    public var userId: Int? = 0
    public var id: Int? = 0
    public var title: String? = ""
    public var body: String? = ""
    
    init(userId: Int?, id: Int?, title: String?, body: String?){
        self.userId = userId ?? 0
        self.id = id ?? 0
        self.title = title ?? ""
        self.body = body ?? ""
    }
}
