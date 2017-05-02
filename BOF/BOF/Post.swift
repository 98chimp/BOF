//
//  File.swift
//  BOF
//
//  Created by Shahin on 2017-05-01.
//  Copyright © 2017 98%Chimp. All rights reserved.
//

import Foundation

class Post
{
    typealias postKeys = Constants.Models.Post
    
    // MARK: - Properties
    var content = ""
    var poster: User?
    
    // MARK: - Parsers
    static func parse(_ json: [String:Any]) -> Post
    {
        let post = Post()
        
        post.content = json[postKeys.content] as! String
        post.poster = User.parse(json[postKeys.poster] as! [String: Any])
        
        return post
    }
}
