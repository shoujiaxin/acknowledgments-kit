//
//  AcknowledgmentItem.swift
//  AcknowledgmentsKit
//
//  Created by Jiaxin Shou on 2024/11/23.
//

import Foundation

public struct AcknowledgmentItem: Hashable {
    let title: String

    let link: String

    let repository: String?

    public init(
        title: String,
        link: String,
        repository: String? = nil
    ) {
        self.title = title
        self.link = link
        self.repository = repository
    }
}

extension AcknowledgmentItem: Identifiable {
    public typealias ID = String

    public var id: ID {
        title
    }
}
