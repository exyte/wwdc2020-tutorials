import SwiftUI

extension AnyTransition {

    static var moveAndFade: AnyTransition {
        let animation = AnyTransition.scale
            .combined(with: .move(edge: .bottom))
            .combined(with: .opacity)
        return .asymmetric(insertion: animation, removal: animation)
    }

}
