//
//  AcknowledgmentContentView.swift
//  AcknowledgmentsKit
//
//  Created by Jiaxin Shou on 2024/11/23.
//

import SwiftUI

public struct AcknowledgmentContentView: View {
    let item: AcknowledgmentItem

    // MARK: - Private States

    @Environment(\.openURL)
    private var openURL

    @State
    private var content: String? = nil

    // MARK: - Views

    public var body: some View {
        Group {
            if let content {
                ScrollView(.vertical) {
                    Text(content)
                        .monospaced()
                        .padding()
                        .frame(maxWidth: .infinity)
                }
            } else {
                ProgressView()
            }
        }
        .navigationTitle(item.title)
        .toolbar {
            if let url = item.repository.flatMap(URL.init(string:)) {
                Button("Repository", systemImage: "link.circle") {
                    openURL(url)
                }
            }
        }
        .task(id: item.link, loadContent)
    }

    // MARK: - Actions

    private func loadContent() {
        content = nil
        guard let url = URL(string: item.link) else {
            assertionFailure("Invalid URL")
            return
        }

        Task.detached {
            do {
                let data = try Data(contentsOf: url)
                let newValue = String(data: data, encoding: .utf8)
                await MainActor.run {
                    content = newValue
                }
            } catch {
                await MainActor.run {
                    content = error.localizedDescription
                }
            }
        }
    }
}
