//
//  ThreadCell.swift
//  Threads
//
//  Created by Ricardo Fonseca on 10/12/23.
//

import SwiftUI

struct ThreadCell: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                Image("max-verstappen")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .cornerRadius(10)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("maxverstappen1")
                            .font(.footnote)
                            .foregroundColor(UIUtils.textForegroundColor(for: colorScheme))
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text("10m")
                            .font(.caption)
                            .foregroundColor(UIUtils.textForegroundColor(for: colorScheme))
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(UIUtils.textForegroundColor(for: colorScheme))
                        }
                    }
                    
                    Text("Formula 1 champion")
                        .font(.footnote)
                        .foregroundColor(UIUtils.textForegroundColor(for: colorScheme))
                        .multilineTextAlignment(.leading)
                    
                    HStack(spacing: 16) {
                        Button {
                            
                        } label: {
                            Image(systemName: "heart")
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "bubble.right")
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "arrow.rectanglepath")
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "paperplane")
                        }
                    }
                    .foregroundColor(UIUtils.textForegroundColor(for: colorScheme))
                    .padding(.top, 5)
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 5)
            Divider()
        }
    }
}

#Preview {
    ThreadCell()
}
