//
//  File.swift
//  DynamicStackViewSDK
//
//  Created by Filip Vukadinovic on 2/1/25.
//

import SwiftUI

public struct DynamicStackView<Data: RandomAccessCollection, Content: View>: View where Data.Element: Identifiable {
    private let data: Data
    private let spacing: CGFloat
    private let content: (Data.Element) -> Content
    private let fillWidth: Bool
    private let alignment: HorizontalAlignment
    private let rowSpacing: CGFloat?
    private let maxWidth: CGFloat
    private let minItemSpacing: CGFloat

    public init(
        data: Data,
        spacing: CGFloat = 10,
        fillWidth: Bool = false,
        alignment: HorizontalAlignment = .leading,
        rowSpacing: CGFloat? = nil,
        maxWidth: CGFloat = UIScreen.main.bounds.width,
        minItemSpacing: CGFloat = 4,
        @ViewBuilder content: @escaping (Data.Element) -> Content
    ) {
        self.data = data
        self.spacing = spacing
        self.content = content
        self.fillWidth = fillWidth
        self.alignment = alignment
        self.rowSpacing = rowSpacing
        self.maxWidth = maxWidth
        self.minItemSpacing = minItemSpacing
    }

    public var body: some View {
        var currentRowWidth: CGFloat = 0
        var rows: [[Data.Element]] = [[]]

        for item in data {
            let itemWidth = measureWidth(for: item)

            if currentRowWidth + itemWidth + spacing > UIScreen.main.bounds.width {
                rows.append([item])
                currentRowWidth = itemWidth + spacing
            } else {
                rows[rows.count - 1].append(item)
                currentRowWidth += itemWidth + spacing
            }
        }

        return VStack(alignment: alignment, spacing: rowSpacing ?? spacing) {
            ForEach(0..<rows.count, id: \.self) { rowIndex in
                HStack(spacing: max(minItemSpacing, spacing)) {
                    ForEach(rows[rowIndex].indices, id: \.self) { itemIndex in
                        let item = rows[rowIndex][itemIndex]
                        if fillWidth {
                            if itemIndex == rows[rowIndex].count - 1 {
                                self.content(item)
                            } else {
                                self.content(item)
                                    Spacer()
                            }
                        } else {
                            self.content(item)
                        }
                    }
                }
            }
        }
        .frame(maxWidth: maxWidth, alignment: Alignment(horizontal: alignment, vertical: .center))
    }

    private func measureWidth(for item: Data.Element) -> CGFloat {
        let hostingController = UIHostingController(rootView: content(item))
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        let targetSize = hostingController.view.systemLayoutSizeFitting(
            CGSize(width: UIScreen.main.bounds.width, height: .greatestFiniteMagnitude)
        )
        return targetSize.width
    }
}

extension DynamicStackView {
    public func dynamicAlignment(_ alignment: HorizontalAlignment) -> Self {
        DynamicStackView(
            data: data,
            spacing: spacing,
            fillWidth: fillWidth,
            alignment: alignment,
            rowSpacing: rowSpacing,
            maxWidth: maxWidth,
            minItemSpacing: minItemSpacing,
            content: content
        )
    }
    
    public func rowSpacing(_ spacing: CGFloat) -> Self {
        DynamicStackView(
            data: data,
            spacing: self.spacing,
            fillWidth: fillWidth,
            alignment: alignment,
            rowSpacing: spacing,
            maxWidth: maxWidth,
            minItemSpacing: minItemSpacing,
            content: content
        )
    }
}
