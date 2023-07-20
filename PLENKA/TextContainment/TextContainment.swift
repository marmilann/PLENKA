//
//  TextContainment.swift
//  PLENKA
//
//  Created by Nariman on 19.07.2023.
//

import Foundation

enum TextContainment: String {
    case userName = "USER_NAME"
    case location = "LOCATION"
    case likedby = "LIKED_BY"
    case userlikes = "USER_LIKES"
    case otherlikes = "OTHER_LIKES"
    case discriptionComment = "DISCRIPTION_COMMENT"
    case allcomments = "ALL_COMMENTS"
    case commentTime = "COMMENT_TIME"
    case bio = "BIO"
    case post = "POST"
    case followers = "FOLLOWERS"
    case following = "FOLLOWING"
    case subscribe = "SUBSCRIBE"
    case yousubscribe = "YOU_SUBSCRIBE"
}

extension TextContainment {
    var text: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}
