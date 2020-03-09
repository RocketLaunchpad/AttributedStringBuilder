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

public protocol AttributedStringComponent {

    var value: String { get }

    var traits: UIFontDescriptor.SymbolicTraits { get }

    var attributes: [NSAttributedString.Key: Any] { get }
}

extension AttributedStringComponent {

    public func adding(traits toAdd: UIFontDescriptor.SymbolicTraits) -> AttributedStringComponent {
        var traits = self.traits
        traits.insert(toAdd)

        return DefaultAttributedStringComponent(value, traits: traits, attributes: attributes)
    }

    public func adding(attribute key: NSAttributedString.Key, withValue value: Any) -> AttributedStringComponent {
        var attributes = self.attributes
        attributes[key] = value

        return DefaultAttributedStringComponent(self.value, traits: traits, attributes: attributes)
    }

    public func attributes(for font: UIFont) -> [NSAttributedString.Key: Any] {
        var attrs: [NSAttributedString.Key: Any] = [
            .font: font.with(traits: traits)
        ]
        attrs.merge(self.attributes, uniquingKeysWith: { $1 })

        return attrs
    }

    public func render(font: UIFont) -> NSAttributedString {
        return NSAttributedString(string: value, attributes: attributes(for: font))
    }
}
