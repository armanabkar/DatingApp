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
        ZStack {
            Color.gray.opacity(0.1).ignoresSafeArea()
            VStack(spacing: 30) {
                HeaderView(showGuideView: $homeViewModel.showGuide,
                           showInfoView: $homeViewModel.showInfo)
                    .opacity(dragState.isDragging ? 0.0 : 1.0)
                    .animation(.default, value: dragState.isDragging)
                
                Cards()
                
                FooterView(showSuggestionAlert: $homeViewModel.showAlert)
                    .opacity(dragState.isDragging ? 0.0 : 1.0)
                    .animation(.default, value: dragState.isDragging)
            }
            .alert(isPresented: $homeViewModel.showAlert) {
                Alert(
                    title: Text(homeViewModel.generateRandomSuggestion()),
                    dismissButton: .default(Text("Close")))
            }
            .task {
                await homeViewModel.getCharacters()
                await homeViewModel.getSuggestions()
            }
        }
    }
    
    @ViewBuilder private func Cards() -> some View {
        ZStack {
            ForEach(homeViewModel.cardViews) { cardView in
                cardView
                    .zIndex(homeViewModel.isTopCard(cardView: cardView) ? 1 : 0)
                    .overlay(
                        ZStack {
                            Image(systemName: K.Icon.dismiss)
                                .foregroundColor(.red)
                                .modifier(SymbolModifier())
                                .opacity(dragState.translation.width < -homeViewModel.dragAreaThreshold && homeViewModel.isTopCard(cardView: cardView) ? 1.0 : 0.0)
                            
                            Image(systemName: K.Icon.like)
                                .foregroundColor(.green)
                                .modifier(SymbolModifier())
                                .opacity(dragState.translation.width > homeViewModel.dragAreaThreshold && homeViewModel.isTopCard(cardView: cardView) ? 1.0 : 0.0)
                        }
                    )
                    .offset(x: homeViewModel.isTopCard(cardView: cardView) ?  self.dragState.translation.width : 0, y: homeViewModel.isTopCard(cardView: cardView) ?  self.dragState.translation.height : 0)
                    .scaleEffect(self.dragState.isDragging && homeViewModel.isTopCard(cardView: cardView) ? 0.85 : 1.0)
                    .rotationEffect(Angle(degrees: homeViewModel.isTopCard(cardView: cardView) ? Double(self.dragState.translation.width / 12) : 0))
                    .animation(.default, value: dragState.translation)
                    .gesture(LongPressGesture(minimumDuration: 0.01)
                                .sequenced(before: DragGesture())
                                .updating(self.$dragState, body: { (value, state, transaction) in
                        switch value {
                            case .first(true):
                                state = .pressing
                            case .second(true, let drag):
                                state = .dragging(translation: drag?.translation ?? .zero)
                            default:
                                break
                        }
                    })
                                .onChanged({ (value) in
                        guard case .second(true, let drag?) = value else {
                            return
                        }
                        
                        if drag.translation.width < -homeViewModel.dragAreaThreshold {
                            homeViewModel.cardRemovalTransition = .leadingBottom
                        }
                        
                        if drag.translation.width > homeViewModel.dragAreaThreshold {
                            homeViewModel.cardRemovalTransition = .trailingBottom
                        }
                    })
                                .onEnded({ (value) in
                        guard case .second(true, let drag?) = value else {
                            return
                        }
                        
                        if drag.translation.width < -homeViewModel.dragAreaThreshold || drag.translation.width > homeViewModel.dragAreaThreshold {
                            homeViewModel.moveCards()
                        }
                    })
                    )
                    .transition(homeViewModel.cardRemovalTransition)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice("iPhone 13 Pro")
    }
}
