//
//  ArticleModel.swift
//  QiitaListApp-Part1
//
//  Created by 渡邊魁優 on 2023/03/06.
//

import Foundation

struct ArticleModel: Identifiable {
    let id = UUID()
    let title: String
    let createdAt: String
}
