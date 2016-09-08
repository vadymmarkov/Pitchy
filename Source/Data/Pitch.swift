public struct Pitch {

  // MARK: - Offsets

  public typealias Offset = (
    note: Note,
    frequency: Double,
    percentage: Double,
    cents: Double
  )

  public struct Offsets {
    public let lower: Pitch.Offset
    public let higher: Pitch.Offset

    public var closest: Pitch.Offset {
      return abs(lower.frequency) < abs(higher.frequency)
        ? lower : higher
    }

    // MARK: - Initialization

    public init(_ first: Offset, _ second: Offset) {
      let lowerFirst = first.note.frequency < second.note.frequency

      self.lower = lowerFirst ? first : second
      self.higher = lowerFirst ? second : first
    }
  }

  public let frequency: Double
  public let wave: AcousticWave
  public let offsets: Offsets

  public var note: Note {
    return offsets.closest.note
  }

  public var closestOffset: Offset {
    return offsets.closest
  }

  // MARK: - Initialization

  public init(frequency: Double) throws {
    guard PitchCalculator.isValidFrequency(frequency) else {
      throw PitchError.invalidFrequency
    }

    self.frequency = frequency
    wave = try AcousticWave(frequency: frequency)
    offsets = try PitchCalculator.offsets(frequency)
  }
}
