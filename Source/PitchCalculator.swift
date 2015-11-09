import Foundation

public struct PitchCalculator {

  public struct Standard {
    public static let frequency: Float = 440
    public static let octave = 4
  }

  public static var notes: [Note] = [
    .A, .ASharp, .B, .C, .CSharp, .D,
    .DSharp, .E, .F, .FSharp, .G, .GSharp
  ]

  public static func index(frequency frequency: Float) -> Int {
    let count = Float(notes.count)
    return Int(round(count * log2(frequency / Standard.frequency)))
  }

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
}