import Foundation

public struct Pitch {

  public var index: Int
  public var note: Note
  public var octave: Int
  public var frequency: Float

  // MARK: - Initializers

  public init(note: Note, octave: Int) {
    self.note = note
    self.octave = octave
    index = PitchCalculator.index(note: note, octave: octave)
    frequency = PitchCalculator.frequency(index: index)
  }

  public init(frequency: Float) {
    self.frequency = frequency
    index = PitchCalculator.index(frequency: frequency)
    note = PitchCalculator.note(index: index)
    octave = PitchCalculator.octave(index: index)
  }
}
