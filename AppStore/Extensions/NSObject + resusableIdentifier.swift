import Foundation

extension NSObject {
    static var resusableIdentifier: String {
        return String(describing: self)
    }
}
