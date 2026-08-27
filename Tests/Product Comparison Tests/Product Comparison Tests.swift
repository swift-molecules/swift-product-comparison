import Product
import Comparison
import Product_Comparison
import Testing

@Suite
struct `Product Comparison Tests` {

    @Test
    func `conforms to Comparison_Protocol when each element does`() {
        func less<T: Comparison.`Protocol`>(_ a: borrowing T, _ b: borrowing T) -> Bool { a < b }
        let a = Product(1, 2, 0)
        let b = Product(1, 3, 0)
        #expect(less(a, b))
        #expect(!less(b, a))
    }
}
