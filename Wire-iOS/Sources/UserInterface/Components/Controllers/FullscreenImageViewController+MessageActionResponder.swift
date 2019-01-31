//
// Wire
// Copyright (C) 2019 Wire Swiss GmbH
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program. If not, see http://www.gnu.org/licenses/.
//

import Foundation

extension FullscreenImageViewController {
    private func perform(action: MessageAction) {
        delegate?.perform(action: action, for: message, view: scrollView)
    }

    func saveImage() {
        perform(action: .save)
    }

    func likeImage() {
        perform(action: .like)
    }

    func deleteImage() {
        perform(action: .delete)
    }
}

extension FullscreenImageViewController: MessageActionResponder {
    public func perform(action: MessageAction, for message: ZMConversationMessage!, view: UIView) {
        switch action {
        case .forward,
             .showInConversation,
             .reply:
            dismiss(animated: true) {
                self.perform(action: action)
            }
        case .openDetails:
            let detailsViewController = MessageDetailsViewController(message: message)
            present(detailsViewController, animated: true)
        default:
            perform(action: action)
        }
    }
}