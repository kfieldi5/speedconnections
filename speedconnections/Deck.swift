//
//  Deck.swift
//  speedconnections
//
//  Created by kfielding on 2/22/21.
//

import Foundation
import SwiftUI

struct Deck: Hashable, Codable {
    var id: String
    var name: String
    var state: String
    var description: String
    var questions = [String]()
    private var imageName: String
        var image: Image {
            Image(imageName)
        }

}
