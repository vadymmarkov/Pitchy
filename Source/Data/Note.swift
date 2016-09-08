public struct Note {

  public enum Letter: String {
    case C = "C"
    case CSharp = "C#"
    case D = "D"
    case DSharp = "D#"
    case E = "E"
    case F = "F"
    case FSharp = "F#"
    case G = "G"
    case GSharp = "G#"
    case A = "A"
    case ASharp = "A#"
    case B = "B"

    public static var values = [
      C, CSharp, D, DSharp, E, F,
      FSharp, G, GSharp, A, ASharp, B,
    ]
  }

  public let index: Int
  public let letter: Letter
  public let octave: Int
  public let frequency: Double
  public let wave: AcousticWave

  public var string: String {
    return "\(self.letter.rawValue)\(self.octave)"
  }

  // MARK: - Initialization

  public init(index: Int) throws {
    self.index = index
    letter = try NoteCalculator.letter(index)
    octave = try NoteCalculator.octave(index)
    frequency = try NoteCalculator.frequency(index)
    wave = try AcousticWave(frequency: frequency)
  }

  public init(frequency: Double) throws {
    index = try NoteCalculator.index(frequency)
    letter = try NoteCalculator.letter(index)
    octave = try NoteCalculator.octave(index)
    self.frequency = try NoteCalculator.frequency(index)
    wave = try AcousticWave(frequency: frequency)
  }

  public init(letter: Letter, octave: Int) throws {
    self.letter = letter
    self.octave = octave
    index = try NoteCalculator.index(letter, octave: octave)
    frequency = try NoteCalculator.frequency(index)
    wave = try AcousticWave(frequency: frequency)
  }

  // MARK: - Closest Notes

  public func lower() throws -> Note {
    return try Note(index: index - 1)
  }

  public func higher() throws -> Note {
    return try Note(index: index + 1)
  }
}
