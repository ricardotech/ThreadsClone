//
//  EditProfileView.swift
//  Threads
//
//  Created by Ricardo Fonseca on 10/12/23.
//

import SwiftUI

struct EditProfileView: View {
    
    @Environment(\.presentationMode) var presentationMode

    @Environment(\.colorScheme) var colorScheme
    
    @State private var bio = ""
    @State private var isPrivateProfile = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea([.bottom, .horizontal])
                
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.semibold)
                            
                            Text("Charles Leclerc")
                        }
                        .font(.footnote)
                        
                        Spacer()
                        
                        CircularProfileImageView()
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
                        Text("Bio")
                            .fontWeight(.semibold)
                        
                        TextField("Enter your bio", text: $bio, axis: .vertical)
                        
                    }
                    .font(.footnote)
                    .padding(.top, 4)
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
                        Text("Link")
                            .fontWeight(.semibold)
                        
                        TextField("Enter your link", text: $bio, axis: .vertical)
                        
                    }
                    .font(.footnote)
                    .padding(.top, 4)
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
                        
                        Toggle("Private profile", isOn: $isPrivateProfile)
                            .fontWeight(.semibold)
                        
                    }
                }
                .font(.footnote)
                .padding()
                .background(UIUtils.buttonForegroundColor(for: colorScheme))
                .cornerRadius(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10).stroke(Color(.systemGray4), lineWidth: 1)
                }
                .padding()
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .font(.subheadline)
                    .foregroundColor(UIUtils.textForegroundColor(for: colorScheme))
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        
                    }
                    .font(.subheadline)
                    .foregroundColor(UIUtils.textForegroundColor(for: colorScheme))
                }
            }
        }
    }
}

#Preview {
    EditProfileView()
}
