//
//  StepUpHabitTrackerWidgetBundle.swift
//  StepUpHabitTrackerWidget
//
//  Created by Alex  Kisch on 7/27/24.
//

import WidgetKit
import SwiftUI

@main
struct StepUpHabitTrackerWidgetBundle: WidgetBundle {
    var body: some Widget {
        StepUpHabitTrackerWidget()
        StepUpHabitTrackerWidgetLiveActivity()
    }
}
