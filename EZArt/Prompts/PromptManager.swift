import Combine
import SwiftUI
import Observation

@Observable class PromptManager {
    private(set) var currentPrompt: Prompt?
    private var prompts: [Prompt]
    private var timer: AnyCancellable?
    private var displayedPromptIndices: Set<Int> = []

    private let lastPromptDateKey = "lastPromptDate"
    private let lastPromptIndexKey = "lastPromptIndex"
    
    init() {
        self.prompts = loadPrompts()
        print("Loaded prompts: \(self.prompts)")
        loadLastPrompt()
        startDailyTimer()
//        startTestTimer()
    }

    private func displayNextPrompt() {
        guard !prompts.isEmpty else { return }

        if displayedPromptIndices.count == prompts.count {
            displayedPromptIndices.removeAll() // Reset if all prompts have been displayed
        }

        var nextIndex: Int
        repeat {
            nextIndex = Int.random(in: 0..<prompts.count)
        } while displayedPromptIndices.contains(nextIndex)

        displayedPromptIndices.insert(nextIndex)
        currentPrompt = prompts[nextIndex]
        print("Displaying next prompt: \(currentPrompt?.text ?? "None")")
        saveLastPrompt(index: nextIndex)
    }

    private func startDailyTimer() {
        let nextMidnight = Calendar.current.nextDate(after: Date(), matching: DateComponents(hour: 0), matchingPolicy: .nextTime)!
        let timeInterval = nextMidnight.timeIntervalSinceNow

        timer = Timer.publish(every: 86400, on: .main, in: .common)
            .autoconnect()
            .prepend(Date(timeIntervalSinceNow: timeInterval))
            .sink { [weak self] _ in
                self?.updatePromptIfNeeded()
            }
    }
    
//TESTER
//    private func startTestTimer() {
//          // Set the timer to trigger every 30 seconds for testing
//          timer = Timer.publish(every: 30, on: .main, in: .common)
//              .autoconnect()
//              .sink { [weak self] _ in
//                  self?.updatePromptIfNeeded()
//              }
//      }

    
    private func updatePromptIfNeeded() {
            let lastPromptDate = UserDefaults.standard.object(forKey: lastPromptDateKey) as? Date ?? Date.distantPast
            let currentDate = Date()

            // Calculate the time interval since the last prompt
            let timeIntervalSinceLastPrompt = currentDate.timeIntervalSince(lastPromptDate)
            let secondsSinceLastPrompt = timeIntervalSinceLastPrompt // Change to seconds for testing

            // Check if 30 seconds have passed (for testing)
            if secondsSinceLastPrompt >= 86400 {
                displayNextPrompt()
            } else {
                print("Not enough time has passed to update the prompt.")
            }
        }
    
    
    private func loadLastPrompt() {
        let lastPromptIndex = UserDefaults.standard.integer(forKey: lastPromptIndexKey)
        let lastPromptDate = UserDefaults.standard.object(forKey: lastPromptDateKey) as? Date ?? Date.distantPast
        
        let currentDate = Date()
        
        let timeIntervalSinceLastPrompt = currentDate.timeIntervalSince(lastPromptDate)
        let hoursSinceLastPrompt = timeIntervalSinceLastPrompt / 3600

//        let secondsSinceLastPrompt = timeIntervalSinceLastPrompt
        
        if hoursSinceLastPrompt >= 24 || !prompts.indices.contains(lastPromptIndex) {
            displayNextPrompt()
        } else {
            currentPrompt = prompts[lastPromptIndex]
            displayedPromptIndices.insert(lastPromptIndex)
        }
        
//        if secondsSinceLastPrompt >= 30 || !prompts.indices.contains(lastPromptIndex) {
//                    displayNextPrompt()
//                } else {
//                    currentPrompt = prompts[lastPromptIndex]
//                    displayedPromptIndices.insert(lastPromptIndex)
//                    print("Loaded last prompt: \(currentPrompt?.text ?? "None")")
//                }
    }

    private func saveLastPrompt(index: Int) {
        UserDefaults.standard.set(index, forKey: lastPromptIndexKey)
        UserDefaults.standard.set(Date(), forKey: lastPromptDateKey)
    }
}
