//
// Wire
// Copyright (C) 2017 Wire Swiss GmbH
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
import SafariServices

class SetTeamNameStepSecondaryView: AuthenticationSecondaryViewDescription {
    let views: [ViewDescriptor]
    weak var actioner: AuthenticationActioner?

    init() {
        let whatIsWire = ButtonDescription(title: "team.name.whatiswireforteams".localized, accessibilityIdentifier: "wire_for_teams_button")
        views = [whatIsWire]

        whatIsWire.buttonTapped = { [weak self] in
            let url = URL.wr_createTeamFeatures.appendingLocaleParameter
            self?.actioner?.executeAction(.openURL(url))
        }
    }
}

final class SetTeamNameStepDescription: AuthenticationStepDescription {

    let backButton: BackButtonDescription?
    let mainView: ViewDescriptor & ValueSubmission
    let headline: String
    let subtext: String?
    let secondaryView: AuthenticationSecondaryViewDescription?

    init() {
        backButton = BackButtonDescription()
        mainView = TextFieldDescription(placeholder: "team.name.textfield.placeholder".localized, actionDescription: "general.next".localized, kind: .name(isTeam: true))
        headline = "team.name.headline".localized
        subtext = "team.name.subheadline".localized
        secondaryView = SetTeamNameStepSecondaryView()
    }
}

