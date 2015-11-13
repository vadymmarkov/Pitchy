import Foundation

public struct Pitch {

  public let index: Int
  public let note: Note
  public let octave: Int
  public let frequency: Double

  public var previousPitch: Pitch {
    let pitch = Pitch(index: index - 1)
    return pitch
  }

  public var nextPitch: Pitch {
    let pitch = Pitch(index: index + 1)
    return pitch
  }

  // MARK: - Initialization

  public init(index: Int) {
    self.index = index
    self.note = PitchCalculator.note(index: index)
    self.octave = PitchCalculator.octave(index: index)
    self.frequency = PitchCalculator.frequency(index: index)
  }

  public init(frequency: Double) {
    index = PitchCalculator.index(frequency: frequency)
    note = PitchCalculator.note(index: index)
    octave = PitchCalculator.octave(index: index)
    self.frequency = PitchCalculator.frequency(index: index)
  }

  public init(note: Note, octave: Int) {
    self.note = note
    self.octave = octave
    index = PitchCalculator.index(note: note, octave: octave)
    frequency = PitchCalculator.frequency(index: index)
  }
}
