public struct Pitch {

  // MARK: - Offsets

  public typealias Offset = (
    note: Note,
    frequency: Double,
    percentage: Double,
    cents: Int
  )

  public struct Offsets {
    let lower: Pitch.Offset
    let higher: Pitch.Offset

    public var closest: Pitch.Offset {
      return abs(lower.frequency) < abs(higher.frequency)
        ? lower : higher
    }

    // MARK: - Initialization

    public init(_ first: Offset, _ second: Offset) {
      if first.note.frequency < second.note.frequency {
        self.lower = first
        self.higher = second
      } else {
        self.lower = second
        self.higher = first
      }
    }
  }

  public let frequency: Double
  public let wave: AcousticWave
  public let offsets: Offsets

  // MARK: - Initialization

  public init(frequency: Double) {
    self.frequency = frequency
    wave = AcousticWave(frequency: frequency)
    offsets = PitchCalculator.offsets(frequency)
  }
}
