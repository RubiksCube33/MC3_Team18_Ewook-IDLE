//
//  BubbleGumGameOverView.swift
//  MC3Team18
//
//  Created by Minkyung Kim on 2023/07/11.
//

import SwiftUI

struct BubbleGumGameOverView: View {
    @Binding var bubbleGumStatus: BubbleGumStatus
    @Binding var gameSelection: GameSelection
    @Binding var score: String
    @Binding var bubbleHighScore: String
    @Binding var isBestScore: Bool
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5).ignoresSafeArea()
            
            VStack(spacing:209){
                VStack(spacing: 13){
                    if isBestScore {
                        Text("Best Score!")
                            .pretendardBold20()
                        .foregroundColor(.Yellow)
                    }
                    Text("Your Score")
                        .pretendardLight32()
                        .foregroundColor(.white)
                    Text(score)
                        .postNoBillsJaffnaRegular64()
                        .foregroundColor(.white)
                    
                    HStack{
                        Text("Best Score")
                            .pretendardRegular24()
                            .foregroundColor(.LightGray)
                        Text(bubbleHighScore)
                            .pretendardSemiBold24()
                            .foregroundColor(.Yellow)
                    }
                }
                .shadow(color: .black.opacity(0.25), radius: 12, x: 1, y: 2)
                
                HStack(){
                    Button {
                        gameSelection = .none
                    } label: {
                        bubbleGumGameOverViewButton(systemName: "house", text: "Home")
                    }
                    
                    Spacer()
                    
                    Button {
                        //TODO: 튜토리얼 변수 따라 튜토리얼로 넘어가는 케이스 추가
                        bubbleGumStatus = .waiting
                    } label: {
                        bubbleGumGameOverViewButton(systemName: "arrow.clockwise", text: "Retry")
                    }
                }.padding(.horizontal, 62)
            }
        }
    }
}

struct BubbleGumGameOverView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleGumGameOverView(bubbleGumStatus: .constant(.gameover), gameSelection: .constant(.bubbleGum), score: .constant("23.0"), bubbleHighScore: .constant("22.0"), isBestScore: .constant(true))
    }
}

extension BubbleGumGameOverView {
    func bubbleGumGameOverViewButton(systemName: String, text: String) -> some View {
        return GlassMorphicCard()
            .overlay {
                Image("ButtonGameOverBorder")
                VStack(spacing:9){
                    Image(systemName: systemName)
                        .foregroundColor(.white)
                        .pretendardSemiBold20()
                        .frame(height: 25).scaledToFit()
                        .bold()
                    Text(text)
                        .foregroundColor(.white)
                        .pretendardBold24()
                }
            }
    }
    
    @ViewBuilder
    func GlassMorphicCard() -> some View {
        ZStack {
            CustomBlurView(effect: .systemUltraThinMaterialLight) { view in
                view.gaussianBlurRadius = 4.5
            }
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        }
        .frame(width: 104, height: 137)
        .shadow(
            color: Color(.white).opacity(0.4), radius: 16
        )
    }
}
