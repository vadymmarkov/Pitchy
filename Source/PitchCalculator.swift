import Foundation

public struct PitchCalculator {

  // MARK: - Constants

  public struct Standard {
    public static let frequency: Float = 440
    public static let octave = 4
  }

  public static var notes: [Note] = [
    .A, .ASharp, .B, .C, .CSharp, .D,
    .DSharp, .E, .F, .FSharp, .G, .GSharp
  ]

  // MARK: - Notations

  public static func frequency(index index: Int) -> Float {
    let count = notes.count

    return powf(2, Float(index / count)) * Standard.frequency
  }

  public static func note(index index: Int) -> Note {
    let count = notes.count
    let noteIndex = index < 0
      ? count - abs(index) % count
      : index % count

    return notes[noteIndex]
  }

  public static func octave(index index: Int) -> Int {
    let count = notes.count

    return index < 0
      ? Standard.octave - (abs(index) + 2) / count
      : Standard.octave + (index + 9) / count
  }

  // MARK: - Pitch Index

  public static func index(frequency frequency: Float) -> Int {
    let count = Float(notes.count)

    return Int(round(count * log2(frequency / Standard.frequency)))
  }

  public static func index(note note: Note, octave: Int) -> Int {
    let count = notes.count
    let noteIndex = notes.indexOf(note) ?? 0

    return noteIndex + count * (octave - Standard.octave)
  }
}