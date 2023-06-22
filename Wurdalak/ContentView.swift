//
//  ContentView.swift
//  Wurdalak
//
//  Created by Nariman on 21.06.2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var showsDetailViewController = false
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("wurdalak_wallpapper")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 500)
                VStack {
                    Text ("WURDALAK")
                        .foregroundColor(.green)
                        .padding(.bottom, 550)
                        .font(.system(size: 65))
                    
                    Button(action: {
                        showsDetailViewController.toggle()
                    }, label: {
                        Text("PLAY WITH WURDALAK")
                            .frame(width: 350, height: 80)
                            .foregroundColor(.green)
                            .background(Color.brown)
                            .cornerRadius(20)
                            .font(.system(size: 30))
                    })
                }
                NavigationLink(destination: GameView(), isActive: $showsDetailViewController) { EmptyView() }
                    
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
