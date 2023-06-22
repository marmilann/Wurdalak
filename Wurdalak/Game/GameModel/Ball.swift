//
//  Ball.swift
//  Wurdalak
//
//  Created by Nariman on 22.06.2023.
//

import Foundation
import SwiftUI

struct Ball: Identifiable {
    let id = UUID()
    let image: String
    var position: CGPoint
}

public enum DragState {
    case inactive
    case dragging(translation: CGSize)
}
