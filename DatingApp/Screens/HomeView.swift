//
//  HomeView.swift
//  DatingApp
//
//  Created by Arman Abkar on 7/23/21.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var homeViewModel = HomeViewModel()
    @GestureState private var dragState = DragState.inactive
    
    var body: some View {
        VStack(spacing: 30) {
            HeaderView(showGuideView: $homeViewModel.showGuide,
                       showInfoView: $homeViewModel.showInfo)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default, value: dragState.isDragging)
            
            HomeCardsView(homeViewModel: homeViewModel)
            
            FooterView(showSuggestionAlert: $homeViewModel.showAlert)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default, value: dragState.isDragging)
        }
        .alert(isPresented: $homeViewModel.showAlert) {
            Alert(
                title: Text(homeViewModel.generateRandomSuggestion()),
                dismissButton: .default(Text("Close")))
        }
        .onAppear(perform: {
            homeViewModel.fetchAll()
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice("iPhone 13 Pro")
    }
}
