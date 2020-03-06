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

public struct AttributedStringComponent {

    public var value: String

    public var traits: UIFontDescriptor.SymbolicTraits

    public var attributes: [NSAttributedString.Key: Any]

    public init(_ value: String, traits: UIFontDescriptor.SymbolicTraits = [], attributes: [NSAttributedString.Key: Any] = [:]) {
        self.value = value
        self.traits = traits
        self.attributes = attributes
    }

    public func render(font: UIFont) -> NSAttributedString {
        // build an attributes dictionary with the specified font updated with the traits passed to the initializer
        // then overwrite that dictionary with anything in the attributes dictionary passed to the initializer
        let attr = [.font: font.with(traits: traits)].merging(attributes, uniquingKeysWith: { $1 })
        return NSAttributedString(string: value, attributes: attr)
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
