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
    self.frequency = PitchCalculator.frequency(<#T##index: Int##Int#>)
  }

  public init(frequency: Float) {
    self.frequency

    self.octave = n < 0
      ? Base.octave - (abs(n) + 2) / 12
      : Base.octave + (n + 9) / 12
  }
}
