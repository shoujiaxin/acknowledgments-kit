//
//  AcknowledgmentsNavigationView.swift
//  AcknowledgmentsKit
//
//  Created by Jiaxin Shou on 2024/12/9.
//

import SwiftUI

public struct AcknowledgmentsNavigationView: View {
    private let items: [AcknowledgmentItem]

    public init(items: [AcknowledgmentItem]) {
        self.items = items
    }

    // MARK: - Private States

    @State
    private var selection: AcknowledgmentItem? = nil

    // MARK: - Views

    public var body: some View {
        NavigationSplitView {
            List(items, selection: $selection) { item in
                Text(item.title)
                    .tag(item)
            }
            .navigationTitle("Acknowledgments")
        } detail: {
            if let selection {
                AcknowledgmentContentView(item: selection)
            } else {
                Text("This application makes use of these third-party software.")
            }
        }
    }
}

#if DEBUG

#Preview {
    AcknowledgmentsNavigationView(
        items: [
            .init(
                title: "shoujiaxin/acknowledgments-kit",
                link: "https://raw.githubusercontent.com/shoujiaxin/acknowledgments-kit/main/LICENSE",
                repository: "https://github.com/shoujiaxin/acknowledgments-kit"
            ),
        ]
    )
}

#endif
