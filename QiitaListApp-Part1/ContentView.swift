//
//  ContentView.swift
//  QiitaListApp-Part1
//
//  Created by 渡邊魁優 on 2023/03/06.
//

import SwiftUI

struct ContentView: View {
    @StateObject var articleListData = ArticleData()
    var body: some View {
        List {
            ForEach(articleListData.articleList) { element in
                HStack {
                    Text(element.title)
                    Spacer()
                    Text(element.createdAt)
                }
            }
        }
        .onAppear(perform: articleListData.searchArticle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
