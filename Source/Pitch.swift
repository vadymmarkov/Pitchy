public struct Pitch {

  // MARK: - Offsets

  public typealias Offset = (
    note: Note,
    frequency: Double,
    percentage: Double
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
  public let offsets: Offsets

  public lazy var wave: AcousticWave = {
    let wave = AcousticWave(frequency: self.frequency)
    return wave
    }()

  // MARK: - Initialization

  public init(frequency: Double) {
    self.frequency = frequency
    offsets = PitchCalculator.offsets(frequency)
  }
}
