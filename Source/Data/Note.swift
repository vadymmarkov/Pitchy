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
    let string = "\(self.letter.rawValue)\(self.octave)"
    return string
  }

  // MARK: - Initialization

  public init(index: Int) throws {
    self.index = index
    letter = NoteCalculator.letter(index: index)
    octave = NoteCalculator.octave(index: index)
    frequency = NoteCalculator.frequency(index: index)
    wave = try AcousticWave(frequency: frequency)
  }

  public init(frequency: Double) throws {
    index = try NoteCalculator.index(frequency: frequency)
    letter = NoteCalculator.letter(index: index)
    octave = NoteCalculator.octave(index: index)
    self.frequency = NoteCalculator.frequency(index: index)
    wave = try AcousticWave(frequency: frequency)
  }

  public init(letter: Letter, octave: Int) throws {
    self.letter = letter
    self.octave = octave
    index = NoteCalculator.index(letter: letter, octave: octave)
    frequency = NoteCalculator.frequency(index: index)
    wave = try AcousticWave(frequency: frequency)
  }

  // MARK: - Closest notes

  public func lower() throws -> Note {
    let pitch = try Note(index: index - 1)
    return pitch
  }

  public func higher() throws -> Note {
    let pitch = try Note(index: index + 1)
    return pitch
  }
}