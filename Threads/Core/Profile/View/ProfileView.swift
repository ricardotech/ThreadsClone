//
//  ProfileView.swift
//  Threads
//
//  Created by Ricardo Fonseca on 10/12/23.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @StateObject var viewModel = ProfileViewModel()
    @State private var selectedFilter: ProfileThreadFilter = .threads
    
    @Namespace var animation
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
    }
    
    private var currentUser: User? {
        return viewModel.currentUser
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    HStack(alignment: .top) {
                        // fullname and username
                        VStack(alignment: .leading, spacing: 12) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(currentUser?.name ?? "")
                                    .font(.title2)
                                    .foregroundColor(UIUtils.textForegroundColor(for: colorScheme))
                                    .fontWeight(.semibold)
                                
                                Text(currentUser?.username ?? "")
                                    .font(.subheadline)
                                    .foregroundColor(UIUtils.textForegroundColor(for: colorScheme))
                            }
                            
                            
                            if let bio = currentUser?.bio {
                                Text(bio)
                                    .font(.footnote)
                                    .foregroundColor(UIUtils.textForegroundColor(for: colorScheme))
                            }
                            
                            Text("2 Followers")
                                .font(.caption)
                                .foregroundColor(UIUtils.textForegroundColor(for: colorScheme))
                        }
                        Spacer()
                        
                        CircularProfileImageView()
                    }
                    
                    NavigationLink {
                        EditProfileView()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Text("Edit")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(UIUtils.buttonForegroundColor(for: colorScheme))
                            .frame(maxWidth: .infinity)
                            .frame(height: 32)
                            .background(UIUtils.buttonBackgroundColor(for: colorScheme))
                            .cornerRadius(8)
                    }
                    
                    VStack {
                        HStack {
                            ForEach(ProfileThreadFilter.allCases) { filter in
                                Button {
                                    withAnimation(.spring()) {
                                        selectedFilter = filter
                                    }
                                } label: {
                                    VStack {
                                        Text(filter.title)
                                            .font(.subheadline)
                                            .foregroundColor(UIUtils.textForegroundColor(for: colorScheme))
                                            .fontWeight(selectedFilter == filter ? .semibold : .regular)
                                        
                                        if selectedFilter == filter {
                                            Rectangle()
                                                .foregroundColor(UIUtils.textForegroundColor(for: colorScheme))
                                                .frame(width: filterBarWidth, height: 1)
                                                .matchedGeometryEffect(id: "item", in: animation)
                                        } else {
                                            Rectangle()
                                                .foregroundColor(.clear)
                                                .frame(width: filterBarWidth, height: 1)
                                        }
                                    }
                                    .padding(.top, 5)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .background(Color.clear) // Make the entire VStack tappable
                                }
                            }
                        }
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            AuthService.shared.signOut()
                        } label: {
                            Image(systemName: "line.3.horizontal")
                        }
                    }
                }
                .padding(.horizontal)
                LazyVStack {
                    ForEach(0 ... 10, id: \.self) { thread in
                        ThreadCell()
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
