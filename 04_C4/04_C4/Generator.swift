// Copyright © 2014 C4
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to
// deal in the Software without restriction, including without limitation the
// rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
// sell copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions: The above copyright
// notice and this permission notice shall be included in all copies or
// substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
// IN THE SOFTWARE.

import CoreImage

///  The Generator protocol declares a variable and a method that are required by Generator object so it can properly interface with Core Image.
public protocol Generator {
    /// The name of the Core Image filter (e.g. "CICheckerboardGenerator")
    var filterName: String { get }

    ///  Creates a Core Image filter using specified input image.
    ///
    ///  This method is used internally by Image when applying filters to its layer's contents.
    ///
    ///  ````
    ///  public func createCoreImageFilter(inputImage: CIImage) -> CIFilter {
    ///      let filter = CIFilter(name: filterName)!
    ///      filter.setDefaults()
    ///      filter.setValue(CIColor(colors[0]), forKey:"inputColor0")
    ///      filter.setValue(CIColor(colors[1]), forKey:"inputColor1")
    ///      filter.setValue(width, forKey: "inputWidth")
    ///      filter.setValue(CIVector(CGPoint: CGPoint(center)), forKey:"inputCenter")
    ///      filter.setValue(sharpness, forKey: "inputSharpness")
    ///      return filter
    ///  }
    ///  ````
    ///
    ///  A specific filter will have internal properties whose values are applied to the CIFilter being generated. However, those properties are object / filter specific and so cannot be defined in the protocol.
    ///
    ///  - returns: A CIFilter whose name is `filterName` and whose contents are generated by the filter itself.
    func createCoreImageFilter() -> CIFilter
}
