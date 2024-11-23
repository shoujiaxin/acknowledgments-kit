//
//  AcknowledgmentsList.swift
//  AcknowledgmentsKit
//
//  Created by Jiaxin Shou on 2024/11/23.
//

import SwiftUI

public struct AcknowledgmentsList: View {
    private let items: [AcknowledgmentItem]

    public init(items: [AcknowledgmentItem]) {
        self.items = items
    }

    // MARK: - Private States

    @State
    private var selection: AcknowledgmentItem? = nil

    // MARK: - Views

    public var body: some View {
        List(items, selection: $selection) { item in
            Text(item.title)
                .tag(item)
        }
        .navigationTitle("Acknowledgments")
        .navigationDestination(item: $selection) {
            AcknowledgmentContentView(item: $0)
        }
    }
}

#if DEBUG

#Preview {
    NavigationStack {
        AcknowledgmentsList(
            items: [
                .init(
                    title: "shoujiaxin/acknowledgments-kit",
                    link: "https://raw.githubusercontent.com/shoujiaxin/acknowledgments-kit/main/LICENSE",
                    repository: "https://github.com/shoujiaxin/acknowledgments-kit"
                ),
            ]
        )
    }
}

#endif
