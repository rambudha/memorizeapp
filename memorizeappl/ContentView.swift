//
//  ContentView.swift
//  memorizeappl
//
//  Created by Ryamsey Ryam on 4/11/2022.
//

import SwiftUI

struct ContentView: View {
    
    var emojis = ["😃", "🥹", "✈️", "🛼", "⚾️", "🏉", "🤿", "🥊", "🪀", "🧘‍♂️"];
    
    @State var emojiCounter = 4;
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                    ForEach(emojis[0..<emojiCounter], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            Spacer();
            HStack {
                removeButton;
                Spacer();
                addButton;
               
            }
            .padding(10)
            .font(.largeTitle)
        }
        .padding(.horizontal)
        .foregroundColor(.red);
    }
    var addButton: some View{
        Button(
            action: {
                if emojiCounter < emojis.count {
                    emojiCounter += 1;
                }
            },
            label: {
                Image(systemName: "plus.circle")
        })
    }
    var removeButton: some View{
        Button(
            action: {
                if emojiCounter > 1 {
                    emojiCounter -= 1;
                }
            },
            label: {
                Image(systemName: "minus.circle")
        })
    }
    
    
}


struct CardView: View {
    var content: String;
    @State private var isTouched = true;
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 20)
        ZStack {
            if(isTouched) {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
//                shape.frame(width: 20, height: 20)
                Text(content).font(.largeTitle)
                
            }else {
                shape.fill();
            }
        }
        .onTapGesture {
            isTouched = !isTouched
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ContentView_Previews_Dark: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}
