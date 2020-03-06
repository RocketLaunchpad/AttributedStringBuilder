//
//  AttributedStringComponent.swift
//  AttributedStringBuilder
//
//  Copyright (c) 2020 Rocket Insights, Inc.
//
//  Permission is hereby granted, free of charge, to any person obtaining a
//  copy of this software and associated documentation files (the "Software"),
//  to deal in the Software without restriction, including without limitation
//  the rights to use, copy, modify, merge, publish, distribute, sublicense,
//  and/or sell copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
//  DEALINGS IN THE SOFTWARE.
//

import UIKit

public typealias AString = AttributedStringComponent

public struct AttributedStringComponent {

    public enum Style {

        case bold

        case italic

        case underline

        case foregroundColor(UIColor)

        case backgroundColor(UIColor)

        var traits: UIFontDescriptor.SymbolicTraits? {
            switch self {
            case .bold:
                return .traitBold

            case .italic:
                return .traitItalic

            default:
                return nil
            }
        }

        var attributeTuple: (NSAttributedString.Key, Any)? {
            switch self {
            case .underline:
                return (.underlineStyle, NSUnderlineStyle.single.rawValue)

            case .foregroundColor(let color):
                return (.foregroundColor, color)

            case .backgroundColor(let color):
                return (.backgroundColor, color)

            default:
                return nil
            }
        }
    }

    public var value: String

    public var styles: [Style]

    public init(_ value: String, _ styles: Style...) {
        self.value = value
        self.styles = styles
    }

    private var traits: UIFontDescriptor.SymbolicTraits {
        var result = UIFontDescriptor.SymbolicTraits()

        styles.compactMap {
            $0.traits
        }
        .forEach {
            result.insert($0)
        }

        return result
    }

    private func attributes(for font: UIFont) -> [NSAttributedString.Key: Any] {
        var attrs: [NSAttributedString.Key: Any] = [
            .font: font.with(traits: traits)
        ]

        styles.compactMap {
            $0.attributeTuple
        }
        .forEach {
            attrs[$0.0] = $0.1
        }

        return attrs
    }

    public func render(font: UIFont) -> NSAttributedString {
        return NSAttributedString(string: value, attributes: attributes(for: font))
    }
}

fileprivate extension UIFont {

    func with(traits: UIFontDescriptor.SymbolicTraits) -> UIFont {
        // If we can't get a descriptor with the specified traits, fall back to self
        guard let descriptor = fontDescriptor.withSymbolicTraits(traits) else {
            return self
        }
        return UIFont(descriptor: descriptor, size: 0)
    }
}
