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

  public var string: String {
    let string = "\(self.letter.rawValue)\(self.octave)"
    return string
  }

  public var lower: Note {
    let pitch = Note(index: index - 1)
    return pitch
  }

  public var higher: Note {
    let pitch = Note(index: index + 1)
    return pitch
  }

  // MARK: - Initialization

  public init(index: Int) {
    self.index = index
    self.letter = NoteCalculator.letter(index: index)
    self.octave = NoteCalculator.octave(index: index)
    self.frequency = NoteCalculator.frequency(index: index)
  }

  public init(frequency: Double) {
    index = NoteCalculator.index(frequency: frequency)
    letter = NoteCalculator.letter(index: index)
    octave = NoteCalculator.octave(index: index)
    self.frequency = NoteCalculator.frequency(index: index)
  }

  public init(letter: Letter, octave: Int) {
    self.letter = letter
    self.octave = octave
    index = NoteCalculator.index(letter: letter, octave: octave)
    frequency = NoteCalculator.frequency(index: index)
  }
}
