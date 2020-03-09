//
//  ViewController.swift
//  AttributedStringBuilderExample
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

import AttributedStringBuilder
import UIKit

class ViewController: UITableViewController {

    @IBOutlet var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        label.render(AttributedString {
            "Plain"
            Space
            "Underline".underline

            Newline(count: 2)

            "Italic".italic
            Space
            "Bold".bold

            Newline(count: 2)

            "Blue Bold Italic"
                .bold
                .italic
                .foregroundColor(.blue)

            Newline(count: 2)

            "Red Underline"
                .underline
                .foregroundColor(.red)

            Newline(count: 2)

            "Bold Highlighted"
                .bold
                .foregroundColor(.black)
                .backgroundColor(.yellow)
        })
    }
}
