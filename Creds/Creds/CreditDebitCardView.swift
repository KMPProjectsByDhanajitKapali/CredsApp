//
//  CreditDebitCard.swift
//  Creds
//
//  Created by Dhanajit Kapali on 07/01/24.
//  Copyright © 2024 orgName. All rights reserved.
//

import SwiftUI

struct CreditDebitCardView: View {
    var cardHolderName: String
    var cardNumber: String
    var cardCVV: String
    var cardExpiry: String
    var cardLastUsedDate: String
    var cardLastUsedInterval: Int
    
    var body: some View {
        ZStack(alignment: .leading) {
            cardBackGroundView()
            VStack(alignment: .leading, spacing: 5) {
                Spacer()
                cardHolderNameView()
                cardNumberView()
                cardCVVView()
                cardExpiryView()
                
                HStack {
                    cardLastUsedDateView()
                    cardLastUsedIntervalView()
                }
            }
            .padding(.leading, 20)
            .padding(.bottom, 20)
        }
        .frame(width: width*0.95, height: height*0.25)
        .background(Color(hex: 0xDCF2F1))
        .cornerRadius( height*0.01)
    }
}

extension CreditDebitCardView {
    
    @ViewBuilder func cardBackGroundView() -> some View {
        Image("creditCardBackgroundView")
            .resizable()
            .scaledToFill()
            .cornerRadius(20)
            .frame(height: height*0.25, alignment: .top)
            .offset(x: -width*0.4)
            .clipped()
    }
    
    @ViewBuilder func cardHolderNameView() -> some View {
        Text(cardHolderName)
            .fontWeight(.bold)
            .foregroundColor(.black)
            .padding(.vertical, 2)
            .padding(.horizontal, 5)
            .background(
                Rectangle().fill(Color.white).opacity(0.6)
            )
            .cornerRadius(5.0)
            
    }
    
    @ViewBuilder func cardNumberView() -> some View {
        HStack(spacing: 5) {
            Text(cardNumber.chunked(withSpacing: 4))
                .fontWeight(.regular)
                .foregroundColor(.black)
                .padding(.vertical, 2)
                .padding(.horizontal, 5)
                .background(
                Rectangle().fill(Color.white).opacity(0.6)
            )
                .cornerRadius(5.0)
            
            Button {
                
            } label: {
                Image(systemName: "doc.on.doc")
                    .foregroundColor(.black)
                    
            }
        }
    }
    
    @ViewBuilder func cardCVVView() -> some View {
        HStack(spacing: 5) {
            Text("CVV: ")
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.vertical, 2)
                .padding(.horizontal, 5)
                .background(
                Rectangle().fill(Color.white).opacity(0.6)
            )
                .cornerRadius(5.0)
            
            Text(cardCVV)
                .fontWeight(.regular)
                .foregroundColor(.black)
                .padding(.vertical, 2)
                .padding(.horizontal, 5)
                .background(
                Rectangle().fill(Color.white).opacity(0.6)
            )
                .cornerRadius(5.0)
        }
    }
    
    @ViewBuilder func cardExpiryView() -> some View {
        HStack(spacing: 5) {
            Text("Expiry: ")
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.vertical, 2)
                .padding(.horizontal, 5)
                .background(
                Rectangle().fill(Color.white).opacity(0.6)
            )
                .cornerRadius(5.0)
            
            Text(cardExpiry)
                .fontWeight(.regular)
                .foregroundColor(.black)
                .padding(.vertical, 2)
                .padding(.horizontal, 5)
                .background(
                Rectangle().fill(Color.white).opacity(0.6)
            )
                .cornerRadius(5.0)
        }
    }
    
    @ViewBuilder func cardLastUsedDateView() -> some View {
        HStack(spacing: 5) {
            Text("LastUsed: ")
                .font(.system(size: 10))
                .fontWeight(.medium)
                .foregroundColor(.black)
                .padding(.vertical, 2)
                .padding(.horizontal, 5)
                .background(
                Rectangle().fill(Color.white).opacity(0.6)
            )
                .cornerRadius(5.0)
            
            Text(cardLastUsedDate)
                .font(.system(size: 10))
                .fontWeight(.regular)
                .foregroundColor(.black)
                .padding(.vertical, 2)
                .padding(.horizontal, 5)
                .background(
                Rectangle().fill(Color.white).opacity(0.6)
            )
                .cornerRadius(5.0)
        }
    }
    
    @ViewBuilder func cardLastUsedIntervalView() -> some View {
        HStack(spacing: 5) {
            Text("Used Since: ")
                .font(.system(size: 10))
                .fontWeight(.medium)
                .foregroundColor(.black)
                .padding(.vertical, 2)
                .padding(.horizontal, 5)
                .background(
                Rectangle().fill(Color.white).opacity(0.6)
            )
                .cornerRadius(5.0)
            
            Text("\(cardLastUsedInterval)")
                .font(.system(size: 10))
                .fontWeight(.regular)
                .foregroundColor(.black)
                .padding(.vertical, 2)
                .padding(.horizontal, 5)
                .background(
                Rectangle().fill(Color.white).opacity(0.6)
            )
                .cornerRadius(5.0)
        }
    }
    
}

#Preview {
    CreditDebitCardView(
        cardHolderName: "Dhanajit Kapali",
        cardNumber: "4342760053470128",
        cardCVV: "381",
        cardExpiry: "06/29",
        cardLastUsedDate: "09/01/2000",
        cardLastUsedInterval: 8
    )
}


extension View {
    var height: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    var width: CGFloat {
        return UIScreen.main.bounds.width
    }
}

extension Color {
    init(hex: UInt, alpha: Double = 1.0) {
        let red = Double((hex & 0xFF0000) >> 16) / 255.0
        let green = Double((hex & 0x00FF00) >> 8) / 255.0
        let blue = Double(hex & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }
}

extension String {
    func chunked(withSpacing spacing: Int) -> String {
        var result = ""
        var index = self.startIndex

        while index < self.endIndex {
            let endIndex = self.index(index, offsetBy: spacing, limitedBy: self.endIndex) ?? self.endIndex
            let chunk = String(self[index..<endIndex])
            result.append(chunk)

            if endIndex < self.endIndex {
                result.append(String(repeating: " ", count: spacing))
            }

            index = endIndex
        }

        return result
    }
}


