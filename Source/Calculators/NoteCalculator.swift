import Foundation

public struct NoteCalculator {

  // MARK: - Bounds

  public static var indexBounds: (minimum: Int, maximum: Int) {
    let minimum = try! index(frequency: Config.minimumFrequency)
    let maximum = try! index(frequency: Config.maximumFrequency)

    return (minimum: minimum, maximum: maximum)
  }

  public static var octaveBounds: (minimum: Int, maximum: Int) {
    let bounds = indexBounds
    let minimum = try! octave(index: bounds.minimum)
    let maximum = try! octave(index: bounds.maximum)

    return (minimum: minimum, maximum: maximum)
  }

  // MARK: - Validators

  public static func isValidIndex(index: Int) -> Bool {
    let bounds = indexBounds

    return index >= bounds.minimum
      && index <= bounds.maximum
  }

  public static func isValidOctave(octave: Int) -> Bool {
    let bounds = octaveBounds

    return octave >= bounds.minimum
      && octave <= bounds.maximum
  }

  // MARK: - Constants

  public struct Standard {
    public static let frequency = 440.0
    public static let octave = 4
  }

  public static var letters: [Note.Letter] = [
    .A, .ASharp, .B, .C, .CSharp, .D,
    .DSharp, .E, .F, .FSharp, .G, .GSharp
  ]

  // MARK: - Pitch Notations

  public static func frequency(index index: Int) throws -> Double {
    guard isValidIndex(index) else {
      throw Error.InvalidPitchIndex
    }

    let count = letters.count
    let power = Double(index) / Double(count)

    return pow(2, power) * Standard.frequency
  }

  public static func letter(index index: Int) throws -> Note.Letter {
    guard isValidIndex(index) else {
      throw Error.InvalidPitchIndex
    }

    let count = letters.count
    var lettersIndex = index < 0
      ? count - abs(index) % count
      : index % count

    if lettersIndex == 12 {
      lettersIndex = 0
    }

    guard lettersIndex >= 0 && lettersIndex < letters.count else {
      throw Error.InvalidPitchIndex
    }

    return letters[lettersIndex]
  }

  public static func octave(index index: Int) throws -> Int {
    guard isValidIndex(index) else {
      throw Error.InvalidPitchIndex
    }

    let count = letters.count

    return index < 0
      ? Standard.octave - (abs(index) + 2) / count
      : Standard.octave + (index + 9) / count
  }

  // MARK: - Pitch Index

  public static func index(frequency frequency: Double) throws -> Int {
    guard PitchCalculator.isValidFrequency(frequency) else {
      throw Error.InvalidFrequency
    }

    let count = Double(letters.count)

    return Int(round(count * log2(frequency / Standard.frequency)))
  }

  public static func index(letter letter: Note.Letter, octave: Int) throws -> Int {
    guard isValidOctave(octave) else {
      throw Error.InvalidOctave
    }

    let count = letters.count
    let letterIndex = letters.indexOf(letter) ?? 0
    let offset = letterIndex < 3 ? 0 : count

    return letterIndex + count * (octave - Standard.octave) - offset
  }
}
