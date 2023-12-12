//
//  UserCell.swift
//  Threads
//
//  Created by Ricardo Fonseca on 10/12/23.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            CircularProfileImageView()
            
            VStack(alignment: .leading) {
                Text("maxverstappen1")
                    .fontWeight(.semibold)
                
                Text("Max Verstappen")
            }
            .font(.footnote)
            
            Spacer()
            
            Text("Follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 100, height: 32)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
        }}
}


#Preview {
    UserCell()
}
