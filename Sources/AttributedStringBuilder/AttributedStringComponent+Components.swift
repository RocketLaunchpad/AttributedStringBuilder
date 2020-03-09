//
//  AttributedStringComponent+Components.swift
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

extension AttributedStringComponent {

    public var bold: AttributedStringComponent {
        return adding(traits: .traitBold)
    }

    public var italic: AttributedStringComponent {
        return adding(traits: .traitItalic)
    }

    public var underline: AttributedStringComponent {
        return adding(attribute: .underlineStyle, withValue: NSUnderlineStyle.single.rawValue)
    }

    public func foregroundColor(_ color: UIColor) -> AttributedStringComponent {
        return adding(attribute: .foregroundColor, withValue: color)
    }

    public func backgroundColor(_ color: UIColor) -> AttributedStringComponent {
        return adding(attribute: .backgroundColor, withValue: color)
    }
}

public let Space = " "

public func Space(count: Int = 1) -> AttributedStringComponent {
    return String(repeating: " ", count: count)
}

public let Tab = "\t"

public func Tab(count: Int = 1) -> AttributedStringComponent {
    return String(repeating: "\t", count: count)
}

public let Newline = "\n"

public func Newline(count: Int = 1) -> AttributedStringComponent {
    return String(repeating: "\n", count: count)
}
