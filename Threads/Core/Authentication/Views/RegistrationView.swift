//
//  LoginView.swift
//  Threads
//
//  Created by Ricardo Fonseca on 10/12/23.
//
import UIKit
import SwiftUI

struct RegistrationView: View {
    
    @StateObject var viewModel = RegistrationViewModel()
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Image("threads-app-icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding()
            
                VStack {
                    
                    TextField("Enter your username", text: $viewModel.username)
                        .modifier(TextFieldModifier())
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .autocorrectionDisabled()
                    
                    TextField("Enter your name", text: $viewModel.name)
                        .modifier(TextFieldModifier())
                    
                    TextField("Enter your email", text: $viewModel.email)
                        .modifier(TextFieldModifier())
                        .keyboardType(.emailAddress)
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .autocorrectionDisabled()
                    
                    SecureField("Enter your password", text: $viewModel.password)
                        .modifier(TextFieldModifier())
                }
                
                Button {
                    Task { try await viewModel.createUser() }
                } label: {
                    Text("Register")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(UIUtils.buttonForegroundColor(for: colorScheme))
                        .frame(maxWidth: .infinity)
                        .frame(height: 44)
                        .background(UIUtils.buttonBackgroundColor(for: colorScheme))
                        .cornerRadius(10)
                }
                .padding(.top, 15)
                .padding(.horizontal, 22)
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    LoginView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3) {
                        Text("Already have an account?")
                        
                        Text("Sign In")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(UIUtils.textForegroundColor(for: colorScheme))
                    .font(.footnote)
                }
                .padding(.vertical, 16)
                
            }
        }
    }
}

#Preview {
    RegistrationView()
}
