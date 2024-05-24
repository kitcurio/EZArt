//
//  PromptManager.swift
//  EZArt
//
//  Created by Kasia Rivers on 5/23/24.
//

import Foundation
import Observation
import Combine

struct Prompt: Identifiable {
    let id = UUID()
    let text: String
}

@Observable class PromptManager  {
    
    private(set) var currentPrompt: Prompt?
    private var prompts: [Prompt]
    private var displayedPrompts: Set<Int>
    private var timer: AnyCancellable?
    private let userDefaultsKey = "LastPromptIndex"
    private let userDefaultsDateKey = "LastPromptDate"

    
    init(prompts: [Prompt]) {
        self.prompts = prompts
        self.displayedPrompts = Set<Int>()
        loadLastPrompt()
        startDailyTimer()
    }
    
    private func loadLastPrompt() {
        let lastPromptIndex = UserDefaults.standard.integer(forKey: userDefaultsKey)
        let lastPromptDate = UserDefaults.standard.object(forKey: userDefaultsDateKey) as? Date
        
        // check that the lastPromptDate isn't nil and is the same day as today, otherwise show the next prompt
        if let lastPromptDate = lastPromptDate, Calendar.current.isDateInToday(lastPromptDate) {
            currentPrompt = prompts[safe: lastPromptIndex]
        } else {
            displayNextPrompt()
        }
    }
    
    private func startDailyTimer() {
        let nextMidnight = Calendar.current.nextDate(after: Date(), matching: DateComponents(hour: 0), matchingPolicy: .nextTime)!
        let timeInterval = nextMidnight.timeIntervalSinceNow
        
        timer = Timer.publish(every: 86400, on: .main, in: .common)
            .autoconnect()
            .prepend(Date(timeIntervalSinceNow: timeInterval))
            .sink { [weak self] _ in
                self?.displayNextPrompt()
            }
    }
    
    func displayNextPrompt() {
        if displayedPrompts.count == prompts.count {
            // All prompts have been shown, reset the state
            displayedPrompts.removeAll()
        }
        
        var nextPromptIndex: Int
        repeat {
            nextPromptIndex = Int.random(in: 0..<prompts.count)
        } while displayedPrompts.contains(nextPromptIndex)
        
        displayedPrompts.insert(nextPromptIndex)
        currentPrompt = prompts[nextPromptIndex]
        
        // Save the current prompt index and date to UserDefaults
        UserDefaults.standard.set(nextPromptIndex, forKey: userDefaultsKey)
        UserDefaults.standard.set(Date(), forKey: userDefaultsDateKey)
    }
}

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

