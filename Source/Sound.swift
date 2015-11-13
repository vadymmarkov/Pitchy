import Foundation

public struct Sound {

  public var pitch: Pitch
  public var adjoinedPitch: Pitch
  public var frequency: Double
  public var frequencyOffset: Double
  public var percentageOffset: Double

  // MARK: - Initialization

  public init(note: Note, octave: Int) {
    self.note = note
    self.octave = octave
    index = PitchCalculator.index(note: note, octave: octave)
    frequency = PitchCalculator.frequency(index: index)
  }

  public init(frequency: Double) {
    self.frequency = frequency
    index = PitchCalculator.index(frequency: frequency)
    note = PitchCalculator.note(index: index)
    octave = PitchCalculator.octave(index: index)
  }
}
