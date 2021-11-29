//
//  ProfileView.swift
//  DubDubGrub
//
//  Created by Cody Goeken on 11/21/21.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var companyName = ""
    @State private var bio = ""
    @State private var avatar = PlaceholderImage.avatar
    @State private var isShowingPhotoPicker = false
    @State private var alertItem: AlertItem?
    
    var body: some View {
        VStack {
            ZStack {
                BackgroundView()
                
                HStack(spacing: 16) {
                    ZStack {
                        AvatarView(size: 84, image: avatar)
                        EditImage()
                    }
                    .padding(.leading, 12)
                    .onTapGesture {
                        isShowingPhotoPicker = true
                    }
                    
                    VStack(spacing: 1) {
                        TextField("First Name", text: $firstName)
                            .modifier(ProfileNameText())
                        TextField("Last Name", text: $lastName)
                            .modifier(ProfileNameText())
                        
                        TextField("Company", text: $companyName)
                    }
                    .padding(.trailing, 16)
                }
                .padding()
            }
            
            VStack(alignment: .leading, spacing: 6) {

                CharactersRemainView(currentCount: bio.count)
                
                TextEditor(text: $bio)
                    .frame(height: 100)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.secondary, lineWidth: 1))
            }
            .padding(.horizontal, 20)
            
            Spacer()
            
            Button {
                createProfile()
            } label: {
                DDGButton(title: "Create Profile")
            }
            .padding(.bottom)

        }
        .navigationTitle("Profile")
        .toolbar {
            Button {
                dismissKeyboard()
            } label: {
                Image(systemName: "keyboard.chevron.compact.down")
            }

        }
        .alert(item: $alertItem, content: { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        })
        .sheet(isPresented: $isShowingPhotoPicker ,content: {
            PhotoPicker(image: $avatar)
        })
        
    }
    
    
    func isValidProfile() -> Bool {
        guard !firstName.isEmpty,
              !lastName.isEmpty,
              !companyName.isEmpty,
              !bio.isEmpty,
              avatar != PlaceholderImage.avatar,
              bio.count < 100 else { return false }
        
        
        return true
    }
    
    func createProfile() {
        guard isValidProfile() else {
            alertItem = AlertContext.invalidProfile
            return
        }
        
        // Create and send to cloudkit
    }
}


struct ProfileNameText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 32, weight: .bold))
            .lineLimit(1)
            .minimumScaleFactor(0.75)
    }
}

struct BackgroundView: View {
    var body: some View {
        Color(.secondarySystemBackground)
            .frame(height: 130)
            .cornerRadius(12)
            .padding(.horizontal)
    }
}

struct EditImage: View {
    var body: some View {
        Image(systemName: "square.and.pencil")
            .resizable()
            .scaledToFit()
            .frame(width: 14, height: 14)
            .foregroundColor(.white)
            .offset(y: 30)
    }
}


struct CharactersRemainView: View {
    var currentCount: Int
    
    var body: some View {
        Text("Bio: ")
            .font(.callout)
            .foregroundColor(.secondary)
        +
        Text("\(100 - currentCount)")
            .font(.callout)
            .foregroundColor(currentCount <= 100 ? .brandPrimary : Color(.systemPink))
        +
        Text(" Characters Remain")
            .font(.callout)
            .foregroundColor(.secondary)
    }
}
