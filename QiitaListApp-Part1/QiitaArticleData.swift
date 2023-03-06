//
//  QiitaArticleData.swift
//  QiitaListApp-Part1
//
//  Created by 渡邊魁優 on 2023/03/06.
//

import Foundation

class ArticleData: ObservableObject {
    
    struct Item: Decodable {
        let title: String?
        let createdAt: String?
        
        enum CodingKeys: String, CodingKey {
            case title
            case createdAt = "created_at"
        }
    }
    
    @Published var articleList: [ArticleModel] = []
    
    func searchArticle() {
        Task {
            await search()
        }
    }
    
    @MainActor
    private func search() async {
        guard let reqestURL = URL(string: "https://qiita.com/api/v2/items?page=1&per_page=10") else {
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: reqestURL)
            let items = try JSONDecoder().decode([Item].self, from: data)

            for item in items {
                if let title = item.title,
                   let createdAt = item.createdAt {
                    let article = ArticleModel(title: title, createdAt: createdAt)
                    self.articleList.append(article)
                }
            }
        } catch {
            print("エラー")
        }
    }
}
