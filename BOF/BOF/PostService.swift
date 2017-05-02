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
    var areNewPostsAvailable = false
    
    // Random 'tweets' courtesy of
    // http://www.gq.com/story/jaden-smith-tweet-generator
    
    private let initialJSON = ["posts": [["content": "Hilarious Prank: Use millions of years of evolution to swell an ape’s brain until it’s capable of feeling disappointed in itself",
                                          "poster": ["firstName": "Shahin", "lastName": "Zangenehpour"]],
                                         ["content": "FYI Haters, The Fact I Think About These Big Questions Is Proof The Universe Has A Consciousness. If You Don't Understand. Maybe That's The Point.",
                                          "poster": ["firstName": "Lela", "lastName": "Burns"]],
                                         ["content": "It's Like I Always Say, Unlock The Large Hadron Collider In Your Mind. On An Unrelated Note, Has Anyone Seen The New Seth Rogan Film?",
                                          "poster": ["firstName": "May", "lastName": "Cunningham"]],
                                         ["content": "In conclusion, understanding still leaves you standing.",
                                          "poster": ["firstName": "Randall", "lastName": "Shelton"]],
                                         ["content": "Jaden says: Why do we go to school again? Epic.",
                                          "poster": ["firstName": "Lida", "lastName": "Nunez"]]]]
    
    private let updatedJSON = ["posts": [["content": "In Conclusion, You Sound Like You Still Think Mirrors Are Real. I Know This From First Hand Experience.",
                                          "poster": ["firstName": "Lela", "lastName": "Burns"]],
                                         ["content": "FYI Haters, A Mirror Is Only A Prison For Your Reflection. And No, My Twitter Has Not Been Hacked.",
                                          "poster": ["firstName": "Lela", "lastName": "Burns"]],
                                         ["content": "Girl, You So Fine. But A Mirror Is Only A Prison For Your Reflection. Now, If You Excuse Me, I Have To Go Stare In The Mirror And Cry.",
                                          "poster": ["firstName": "Shahin", "lastName": "Zangenehpour"]],
                                         ["content": "No One Teaches School To Teach. This Is Why Nobody Gets Me.",
                                          "poster": ["firstName": "Randall", "lastName": "Shelton"]],
                                         ["content": "We Are All Time Travellers.",
                                          "poster": ["firstName": "Lida", "lastName": "Nunez"]],
                                         ["content": "Jaden Says: A Mindframe Is Still A Frame. You're Welcome.",
                                           "poster": ["firstName": "Shahin", "lastName": "Zangenehpour"]],
                                          ["content": "FYI Haters, These Thoughts Are Immortal. You Can Have That One For Free.",
                                           "poster": ["firstName": "Lela", "lastName": "Burns"]],
                                          ["content": "There Ain't Room In This Oxygen Chamber For Two. Totally Unrelated, I Just Saw Day After Tomorrow Again. Shit Is Dope.",
                                           "poster": ["firstName": "May", "lastName": "Cunningham"]],
                                          ["content": "Meet Me On FaceTime And Let's Talk About SpaceTime.",
                                           "poster": ["firstName": "Shahin", "lastName": "Zangenehpour"]],
                                          ["content": "Listen, Age Isn't A Religion. You Can Have That One For Free.",
                                           "poster": ["firstName": "Randall", "lastName": "Shelton"]],
                                          ["content": "Those who can make you believe absurdities, can make you commit atrocities. ~Voltaire",
                                           "poster": ["firstName": "Shahin", "lastName": "Zangenehpour"]]]]
    
    // MARK: - Init
    init()
    {
        generatePosts(from: initialJSON)
    }
    
    // MARK: - Helpers
    func fetchNewPosts()
    {
        generatePosts(from: updatedJSON)
        mockedPosts.shuffle()
    }
    
    fileprivate func generatePosts(from json: [String: Any])
    {
        mockedPosts.removeAll()
        
        if let jsonPosts = json["posts"] as? [[String: Any]]
        {
            for jsonPost in jsonPosts
            {
                let post = Post.parse(jsonPost)
                mockedPosts.append(post)
            }
        }
    }
}
