//
//  IconName.swift
//  Storage
//
//  Created by macbook on 01.02.2022.
//

import UIKit

enum IconName: String {
    // MARK: - Custom names
    case aboutProfile
    case addFolder
    case alert
    case autoloading
    case backButton
    case bottom
    case boxes
    case checkmarkSquare
    case checkedSquareOnSquare
    case chevronForward
    case chooseFile
    case close
    case closedEye
    case circleGrid
    case denetLogo
    case discord
    case dismiss
    case GameArea_wallpapper
    case downArrow
    case download
    case emptyTrash
    case exit
    case eye
    case folder
    case folderTemplate
    case fileTemplate
    case gallery
    case galleryAccesPlaceholder
    case instagram
    case mumbai
    case loader
    case more
    case onboardingAppIcon
    case onboardingBackupPicture
    case onboardingInfinityLimits
    case onboardingShowPrivacy
    case onboardingBackup
    case onboardingLogo
    case onboardingToken
    case onboardingForcedUpdate
    case pencil
    case pause
    case play
    case plus
    case polygon
    case profile
    case profileBanner
    case recover
    case replace
    case search
    case searchPlaceholder
    case secure
    case settings
    case squareOnSquare
    case share
    case square
    case storage
    case syncFolderTemplate
    case tbyIcon
    case telegram
    case trash
    case txt
    case twitter
    case unlock
    case info
    case web
    case xmark
    
    // MARK: - System names
    case arrowDownCircle = "arrow.down.circle"
    case arrowUpArrowDown = "arrow.up.arrow.down"
    case arrowUpCircle = "arrow.up.circle"
    case checkmark = "checkmark.circle.fill"
    case chevronBackward = "chevron.backward"
    case chevronDown = "chevron.down"
    case circle
    case circleInset = "circle.inset.filled"
    case deleteBackward = "delete.backward"
    case faceid
    case folderPlus = "folder.badge.plus"
    case multiplyCircleFill = "multiply.circle.fill"
    case touchid
    
    var type: IconType {
        switch self {
        case .arrowDownCircle,
                .arrowUpArrowDown,
                .arrowUpCircle,
                .checkmark,
                .chevronBackward,
                .chevronDown,
                .circle,
                .circleInset,
                .deleteBackward,
                .faceid,
                .folderPlus,
                .multiplyCircleFill,
                .plus,
                .touchid:
            return .system
        default:
            return .custom
        }
    }
}

enum IconType {
    case custom
    case system
}
