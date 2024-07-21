import SwiftUI

//struct Stage {
//    let width: Int
//    let depth: Int
//}

struct StageView: View {
    let stage: Stage
    let platformWidth: CGFloat = 50
    let platformHeight: CGFloat = 25

    var body: some View {
        VStack {
            ZStack {
                // Draw 2x1 platforms
                ForEach(0..<stage.depth, id: \.self) { row in
                    ForEach(0..<(stage.width / 2), id: \.self) { col in
                        Rectangle()
                            .stroke(Color.black, lineWidth: 2)
                            .background(Color.gray.opacity(0.5))
                            .frame(width: platformWidth, height: platformHeight)
                            .position(x: CGFloat(col) * platformWidth + platformWidth / 2, y: CGFloat(row) * platformHeight + platformHeight / 2)
                    }
                }
                // Draw 1x1 platforms
                if stage.width % 2 != 0 {
                    ForEach(0..<stage.depth, id: \.self) { row in
                        Rectangle()
                            .stroke(Color.black, lineWidth: 2)
                            .background(Color.gray.opacity(0.5))
                            .frame(width: platformWidth / 2, height: platformHeight)
                            .position(x: CGFloat(stage.width / 2) * platformWidth + platformWidth / 4, y: CGFloat(row) * platformHeight + platformHeight / 2)
                    }
                }
                // Draw 2x0.5 platforms
                if stage.width % 2 != 0 {
                    ForEach(0..<(stage.depth / 2), id: \.self) { row in
                        Rectangle()
                            .stroke(Color.black, lineWidth: 2)
                            .background(Color.gray.opacity(0.5))
                            .frame(width: platformWidth, height: platformHeight / 2)
                            .position(x: CGFloat(stage.width / 2) * platformWidth + platformWidth / 2, y: CGFloat(row) * platformHeight / 2 + platformHeight / 4)
                    }
                }
            }
            .frame(width: platformWidth * CGFloat(stage.width) / 2, height: platformHeight * CGFloat(stage.depth))
        }
    }
}

