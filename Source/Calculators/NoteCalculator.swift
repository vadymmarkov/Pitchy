import Foundation

public struct NoteCalculator {
  public struct Standard {
    public static let frequency = 440.0
    public static let octave = 4
  }

  public static var letters: [Note.Letter] = [
    .A,
    .ASharp,
    .B,
    .C,
    .CSharp,
    .D,
    .DSharp,
    .E,
    .F,
    .FSharp,
    .G,
    .GSharp
  ]

  // MARK: - Bounds

  public static var indexBounds: (minimum: Int, maximum: Int) {
    let minimum = try! index(forFrequency: FrequencyValidator.minimumFrequency)
    let maximum = try! index(forFrequency: FrequencyValidator.maximumFrequency)

    return (minimum: minimum, maximum: maximum)
  }

  public static var octaveBounds: (minimum: Int, maximum: Int) {
    let bounds = indexBounds
    let minimum = try! octave(forIndex: bounds.minimum)
    let maximum = try! octave(forIndex: bounds.maximum)

    return (minimum: minimum, maximum: maximum)
  }

  // MARK: - Validators

  public static func isValid(index: Int) -> Bool {
    let bounds = indexBounds
    return index >= bounds.minimum
      && index <= bounds.maximum
  }

  public static func validate(index: Int) throws {
    if !isValid(index: index) {
      throw PitchError.invalidPitchIndex
    }
  }

  public static func isValid(octave: Int) -> Bool {
    let bounds = octaveBounds

    return octave >= bounds.minimum
      && octave <= bounds.maximum
  }

  public static func validate(octave: Int) throws {
    if !isValid(octave: octave) {
      throw PitchError.invalidOctave
    }
  }

  // MARK: - Pitch Notations

  public static func frequency(forIndex index: Int) throws -> Double {
    try validate(index: index)

    let count = letters.count
    let power = Double(index) / Double(count)

    return pow(2, power) * Standard.frequency
  }

  public static func letter(forIndex index: Int) throws -> Note.Letter {
    try validate(index: index)

    let count = letters.count
    var lettersIndex = index < 0
      ? count - abs(index) % count
      : index % count

    if lettersIndex == 12 {
      lettersIndex = 0
    }

    guard lettersIndex >= 0 && lettersIndex < letters.count else {
      throw PitchError.invalidPitchIndex
    }

    return letters[lettersIndex]
  }

  public static func octave(forIndex index: Int) throws -> Int {
    try validate(index: index)

    let count = letters.count
    let resNegativeIndex = Standard.octave - (abs(index) + 2) / count
    let resPositiveIndex = Standard.octave + (index + 9) / count

    return index < 0
      ? resNegativeIndex
      : resPositiveIndex
  }

  // MARK: - Pitch Index

  public static func index(forFrequency frequency: Double) throws -> Int {
    try FrequencyValidator.validate(frequency: frequency)
    let count = Double(letters.count)

    return Int(round(count * log2(frequency / Standard.frequency)))
  }

  public static func index(forLetter letter: Note.Letter, octave: Int) throws -> Int {
    try validate(octave: octave)

    let count = letters.count
    let letterIndex = letters.index(of: letter) ?? 0
    let offset = letterIndex < 3 ? 0 : count

    return letterIndex + count * (octave - Standard.octave) - offset
  }
}
