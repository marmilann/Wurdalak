//
//  GameView.swift
//  Wurdalak
//
//  Created by Nariman on 22.06.2023.
//

import Foundation
import SwiftUI

struct GameView: View {
    @State private var balls: [Ball] = []
    @GestureState private var dragState = DragState.inactive
    @State private var playerPosition: CGPoint = .zero
    @State private var caughtBalls: Int = 0
    
    private let ballSize: CGSize = CGSize(width: 50, height: 50)
    private let playerSize: CGSize = CGSize(width: 110, height: 110)
    
    private let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                ForEach(balls) { ball in
                    Image(ball.image)
                        .resizable()
                        .frame(width: ballSize.width, height: ballSize.height)
                        .position(ball.position)
                        .animation(.linear(duration: 4))
                        .onAppear {
                            animate(ball: ball, in: geometry.size)
                        }
                }
                Text("Caught balls: \(caughtBalls)")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(20)
                    .position(x: geometry.size.width / 2, y: geometry.size.height - 40)
                Image("adel")
                    .resizable()
                    .frame(width: playerSize.width, height: playerSize.height)
                    .padding(.top, 1350)
                    .position(playerPosition)
                    .gesture(
                        DragGesture()
                            .updating($dragState) { value, state, _ in
                                state = .dragging(translation: value.translation)
                            }
                            .onChanged { value in
                                playerPosition.x = value.location.x
                            }
                            .onEnded { _ in
                                checkCollision()
                            }
                    )
            }
            .onAppear {
                AudioPlayer.shared.playSound(soundName: "WurdalakMusic", soundExtension: "mp3")
            }
            .onDisappear {
                AudioPlayer.shared.stopSound()
            }
        }
        .edgesIgnoringSafeArea(.all)
        .onReceive(timer) { _ in
            createBall(in: UIScreen.main.bounds.width)
        }
    }
    
    private func createBall(in width: CGFloat) {
        let images: [String] = ["adren", "coctik", "protik"]
        let randomImage = images.randomElement() ?? "adrenaline"
        let randomX = CGFloat.random(in: ballSize.width/2...(width - ballSize.width/2))
        let newBall = Ball(image: randomImage, position: CGPoint(x: randomX, y: -ballSize.height))
        balls.append(newBall)
    }
    
    private func checkCollision() {
        for ball in balls {
            let ballRect = CGRect(x: ball.position.x - ballSize.width/2, y: ball.position.y - ballSize.height/2, width: ballSize.width, height: ballSize.height)
            let playerRect = CGRect(x: playerPosition.x - playerSize.width/2, y: playerPosition.y - playerSize.height/2, width: playerSize.width, height: playerSize.height)
            
            if ballRect.intersects(playerRect) {
                balls.removeAll { $0.id == ball.id }
                caughtBalls += 1
                print("Ball caught! Caught balls: \(caughtBalls)")
            }
        }
    }
    
    private func animate(ball: Ball, in frame: CGSize) {
        balls[balls.firstIndex(where: { $0.id == ball.id })!].position.y = frame.height + ballSize.height/2
    }
}
