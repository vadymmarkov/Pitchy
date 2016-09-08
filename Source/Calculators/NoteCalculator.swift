import Foundation

public struct NoteCalculator {

  // MARK: - Constants

  public struct Standard {
    public static let frequency = 440.0
    public static let octave = 4
  }

  public static var letters: [Note.Letter] = [
    .A, .ASharp, .B, .C, .CSharp, .D,
    .DSharp, .E, .F, .FSharp, .G, .GSharp
  ]

  // MARK: - Bounds

  public static var indexBounds: (minimum: Int, maximum: Int) {
    let minimum = try! index(Config.minimumFrequency)
    let maximum = try! index(Config.maximumFrequency)

    return (minimum: minimum, maximum: maximum)
  }

  public static var octaveBounds: (minimum: Int, maximum: Int) {
    let bounds = indexBounds
    let minimum = try! octave(bounds.minimum)
    let maximum = try! octave(bounds.maximum)

    return (minimum: minimum, maximum: maximum)
  }

  // MARK: - Validators

  public static func isValidIndex(_ index: Int) -> Bool {
    let bounds = indexBounds

    return index >= bounds.minimum
      && index <= bounds.maximum
  }

  public static func isValidOctave(_ octave: Int) -> Bool {
    let bounds = octaveBounds

    return octave >= bounds.minimum
      && octave <= bounds.maximum
  }

  // MARK: - Pitch Notations

  public static func frequency(_ index: Int) throws -> Double {
    guard isValidIndex(index) else {
      throw PitchError.invalidPitchIndex
    }

    let count = letters.count
    let power = Double(index) / Double(count)

    return pow(2, power) * Standard.frequency
  }

  public static func letter(_ index: Int) throws -> Note.Letter {
    guard isValidIndex(index) else {
      throw PitchError.invalidPitchIndex
    }

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

  public static func octave(_ index: Int) throws -> Int {
    guard isValidIndex(index) else {
      throw PitchError.invalidPitchIndex
    }

    let count = letters.count

    let resNegativeIndex = Standard.octave - (abs(index) + 2) / count
    let resPositiveIndex = Standard.octave + (index + 9) / count

    return index < 0
      ? resNegativeIndex
      : resPositiveIndex
  }

  // MARK: - Pitch Index

  public static func index(_ frequency: Double) throws -> Int {
    guard PitchCalculator.isValidFrequency(frequency) else {
      throw PitchError.invalidFrequency
    }

    let count = Double(letters.count)

    return Int(round(count * log2(frequency / Standard.frequency)))
  }

  public static func index(_ letter: Note.Letter, octave: Int) throws -> Int {
    guard isValidOctave(octave) else {
      throw PitchError.invalidOctave
    }

    let count = letters.count
    let letterIndex = letters.index(of: letter) ?? 0
    let offset = letterIndex < 3 ? 0 : count

    return letterIndex + count * (octave - Standard.octave) - offset
  }
}
