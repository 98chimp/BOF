//
//  PostService.swift
//  BOF
//
//  Created by Shahin on 2017-05-01.
//  Copyright © 2017 98%Chimp. All rights reserved.
//

import Foundation

class PostService
{
    // MARK: - Properties
    static let shared = PostService()
    var mockedPosts = [Post]()
    private let initialJSON = ["posts": [["content": "Hilarious Prank: Use millions of years of evolution to swell an ape’s brain until it’s capable of feeling disappointed in itself",
                                          "poster": ["firstName": "Shahin", "lastName": "Zangenehpour"]],
                                         ["content": "FYI Haters, The Fact I Think About These Big Questions Is Proof The Universe Has A Consciousness. If You Don't Understand. Maybe That's The Point.",
                                          "poster": ["firstName": "Lela", "lastName": "Burns"]],
                                         ["content": "It's Like I Always Say, Unlock The Large Hadron Collider In Your Mind. On An Unrelated Note, Has Anyone Seen The New Seth Rogan Film?",
                                          "poster": ["firstName": "May", "lastName": "Cunningham"]],
                                         ["content": "In conclusion, understanding still leaves you standing.",
                                          "poster": ["firstName": "Randall", "lastName": "Shelton"]],
                                         ["content": "Jaden says: Why do we go to school again? Epic.",
                                          "poster": ["firstName": "Lida", "lastName": "Nunez"]],]]
    
    private let updatedJSON = ["posts": [["content": "Hilarious Prank: Use millions of years of evolution to swell an ape’s brain until it’s capable of feeling disappointed in itself",
                                          "poster": ["firstName": "Shahin", "lastName": "Zangenehpour"]],
                                         ["content": "FYI Haters, The Fact I Think About These Big Questions Is Proof The Universe Has A Consciousness. If You Don't Understand. Maybe That's The Point.",
                                          "poster": ["firstName": "Lela", "lastName": "Burns"]],
                                         ["content": "It's Like I Always Say, Unlock The Large Hadron Collider In Your Mind. On An Unrelated Note, Has Anyone Seen The New Seth Rogan Film?",
                                          "poster": ["firstName": "May", "lastName": "Cunningham"]],
                                         ["content": "In conclusion, understanding still leaves you standing.",
                                          "poster": ["firstName": "Randall", "lastName": "Shelton"]],
                                         ["content": "Jaden says: Why do we go to school again? Epic.",
                                          "poster": ["firstName": "Lida", "lastName": "Nunez"]],
                                         ["content": "Hilarious Prank: Use millions of years of evolution to swell an ape’s brain until it’s capable of feeling disappointed in itself",
                                           "poster": ["firstName": "Shahin", "lastName": "Zangenehpour"]],
                                          ["content": "FYI Haters, The Fact I Think About These Big Questions Is Proof The Universe Has A Consciousness. If You Don't Understand. Maybe That's The Point.",
                                           "poster": ["firstName": "Lela", "lastName": "Burns"]],
                                          ["content": "It's Like I Always Say, Unlock The Large Hadron Collider In Your Mind. On An Unrelated Note, Has Anyone Seen The New Seth Rogan Film?",
                                           "poster": ["firstName": "May", "lastName": "Cunningham"]],
                                          ["content": "In conclusion, understanding still leaves you standing.",
                                           "poster": ["firstName": "Randall", "lastName": "Shelton"]],
                                          ["content": "Jaden says: Why do we go to school again? Epic.",
                                           "poster": ["firstName": "Lida", "lastName": "Nunez"]],]]
    
    // MARK: - Init
    init()
    {
        self.mockedPosts = generateBasePosts(from: initialJSON)
    }
    
    // MARK: - Helpers
    
    
    fileprivate func generateBasePosts(from json: [String: Any]) -> [Post]
    {
        if let jsonPosts = json["posts"] as? [[String: Any]]
        {
            for jsonPost in jsonPosts
            {
                
                let post = Post.parse(jsonPost)
                mockedPosts.append(post)
                print(post.content)
                print(post.poster?.firstName ?? "someone")
            }
        }
        return mockedPosts
    }
}
