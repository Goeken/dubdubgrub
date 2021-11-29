//
//  OnBoardView.swift
//  DubDubGrub
//
//  Created by Cody Goeken on 11/23/21.
//

import SwiftUI

struct OnBoardView: View {
    
    @Binding var isShowingOnboardingView: Bool
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    isShowingOnboardingView = false
                } label: {
                    XDismissButton()
                }
                .padding()
            }
            Spacer()
            
            LogoView(frameWidth: 250)
                .padding(.bottom)
            
            VStack(alignment: .leading, spacing: 32) {
                OnboardInfoView(imageName: "building.2.crop.circle", title: "Restaurant Locations", description: "Find places to dine around the convention center")
                OnboardInfoView(imageName: "checkmark.circle", title: "Check In", description: "Let other IOS Devs know where you are")
                OnboardInfoView(imageName: "person.2.circle", title: "Find Friends", description: "See where other IOS Devs are and join the party")
            }
            .padding(.horizontal, 30)
            
            Spacer()
            
        }
    }
}

struct OnBoardView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardView(isShowingOnboardingView: .constant(true))
    }
}

struct OnboardInfoView: View {
    
    var imageName: String
    var title: String
    var description: String
    
    var body: some View {
        HStack(spacing: 26) {
            Image(systemName: imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.brandPrimary)
            VStack(alignment: .leading, spacing: 4) {
                Text(title).bold()
                Text(description)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                    .minimumScaleFactor(0.75)
            }
        }
    }
}
