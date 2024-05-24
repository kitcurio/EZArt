//
//  Onboarding.swift
//  EZArt
//
//  Created by Kasia Rivers on 5/22/24.
//

import Foundation
import SwiftUI

struct OnboardingView: View {
    @Binding var shouldShowOnboarding: Bool
    
    var body: some View {
        TabView {
            PageView(
            title: "Push Notifications",
            message: "Enable notifications to stay up to date with our app.",
            imageName: "bell",
            showDismissButton: false,
            showNotifButton: true,
            shouldShowOnboarding: $shouldShowOnboarding
            )
            
            PageView(
            title: "Bookmarks",
            message: "Save your favorite pieces of art.",
            imageName: "bookmark",
            showDismissButton: false,
            showNotifButton: false,
            shouldShowOnboarding: $shouldShowOnboarding
            )
            
            PageView(
            title: "Flights",
            message: "Book flights idk",
            imageName: "airplane",
            showDismissButton: false,
            showNotifButton: false,
            shouldShowOnboarding:
                $shouldShowOnboarding
            )
            
            PageView(
            title: "Home",
            message: "Get the fuck out of here.",
            imageName: "house",
            showDismissButton: true,
            showNotifButton: false,
            shouldShowOnboarding: $shouldShowOnboarding
            )
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct PageView: View {
    let title: String
    let message: String
    let imageName: String
    let showDismissButton: Bool
    let showNotifButton: Bool
    @Binding var shouldShowOnboarding: Bool
    
    var body: some View {
        VStack{
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .padding()
            
            Text(title)
                .font(.system(size: 32))
                .padding()
            
            Text(message)
                .font(.system(size: 24))
                .multilineTextAlignment(.center)
                .foregroundStyle(Color(.secondaryLabel))
                .padding()
            
            if showNotifButton {
                NotificationsView()
            }
            if showDismissButton {
                Button(action: {
                    shouldShowOnboarding.toggle()
                }, label: {
                    Text("Get Started")
                        .bold()
                        .foregroundStyle(Color.white)
                        .frame(width: 200, height: 50)
                        .background(Color.mainBlue)
                        .clipShape(Capsule(style: .continuous))

                })
            }
        }
    }
}
