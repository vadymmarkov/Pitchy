import Foundation

public struct PitchCalculator {

  // MARK: - Constants

  public struct Standard {
    public static let frequency = 440.0
    public static let octave = 4
  }

  public static var notes: [Note] = [
    .A, .ASharp, .B, .C, .CSharp, .D,
    .DSharp, .E, .F, .FSharp, .G, .GSharp
  ]

  // MARK: - Pitch Notations

  public static func frequency(index index: Int) -> Double {
    let count = notes.count
    let power = Double(index) / Double(count)
    
    return pow(2, power) * Standard.frequency
  }

  public static func note(index index: Int) -> Note {
    let count = notes.count
    var noteIndex = index < 0
      ? count - abs(index) % count
      : index % count

    if noteIndex == 12 {
      noteIndex = 0
    }

    return notes[noteIndex]
  }

  public static func octave(index index: Int) -> Int {
    let count = notes.count

    return index < 0
      ? Standard.octave - (abs(index) + 2) / count
      : Standard.octave + (index + 9) / count
  }

  // MARK: - Pitch Index

  public static func index(frequency frequency: Double) -> Int {
    let count = Double(notes.count)
    return Int(round(count * log2(frequency / Standard.frequency)))
  }

  public static func index(note note: Note, octave: Int) -> Int {
    let count = notes.count
    let noteIndex = notes.indexOf(note) ?? 0
    let offset = noteIndex < 3 ? 0 : count

    return noteIndex + count * (octave - Standard.octave) - offset
  }

  // MARK: - Offsets

  public static func offsets(frequency: Double) -> Sound.Offsets {
    let pitch = Pitch(frequency: frequency)
    let higherPitch = pitch.higherPitch
    let lowerPitch = pitch.lowerPitch
    let closestPitch = abs(higherPitch.frequency - frequency)
      < abs(lowerPitch.frequency - frequency)
      ? higherPitch
      : lowerPitch

    let firstOffset = Sound.Offset(
      pitch: pitch,
      frequency: frequency - pitch.frequency,
      percentage: (frequency - pitch.frequency) * 100
        / abs(pitch.frequency - closestPitch.frequency)
    )

    let secondOffset = Sound.Offset(
      pitch: closestPitch,
      frequency: frequency - closestPitch.frequency,
      percentage: (frequency - closestPitch.frequency) * 100
        / abs(pitch.frequency - closestPitch.frequency)
    )

    return Sound.Offsets(left: firstOffset, right: secondOffset)
  }
}