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

  // MARK: - Pitch Notations

  public static func frequency(index index: Int) -> Double {
    let count = letters.count
    let power = Double(index) / Double(count)

    return pow(2, power) * Standard.frequency
  }

  public static func letter(index index: Int) -> Note.Letter {
    let count = letters.count
    var lettersIndex = index < 0
      ? count - abs(index) % count
      : index % count

    if lettersIndex == 12 {
      lettersIndex = 0
    }

    return letters[lettersIndex]
  }

  public static func octave(index index: Int) -> Int {
    let count = letters.count

    return index < 0
      ? Standard.octave - (abs(index) + 2) / count
      : Standard.octave + (index + 9) / count
  }

  // MARK: - Pitch Index

  public static func index(frequency frequency: Double) -> Int {
    let count = Double(letters.count)
    return Int(round(count * log2(frequency / Standard.frequency)))
  }

  public static func index(letter letter: Note.Letter, octave: Int) -> Int {
    let count = letters.count
    let letterIndex = letters.indexOf(letter) ?? 0
    let offset = letterIndex < 3 ? 0 : count

    return letterIndex + count * (octave - Standard.octave) - offset
  }
}
