import Foundation

public struct Calculator {

  // MARK: - Constants

  public struct Standard {
    public static let frequency = 440.0
    public static let octave = 4
  }

  public static var notes: [Note.Letter] = [
    .A, .ASharp, .B, .C, .CSharp, .D,
    .DSharp, .E, .F, .FSharp, .G, .GSharp
  ]

  // MARK: - Pitch Notations

  public static func frequency(index index: Int) -> Double {
    let count = notes.count
    let power = Double(index) / Double(count)
    
    return pow(2, power) * Standard.frequency
  }

  public static func letter(index index: Int) -> Note.Letter {
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

  public static func index(letter letter: Note.Letter, octave: Int) -> Int {
    let count = notes.count
    let letterIndex = notes.indexOf(letter) ?? 0
    let offset = letterIndex < 3 ? 0 : count

    return letterIndex + count * (octave - Standard.octave) - offset
  }

  // MARK: - Offsets

  public static func offsets(frequency: Double) -> Sound.Offsets {
    let note = Note(frequency: frequency)
    let higherNote = note.higher
    let lowerNote = note.lower
    let closestNote = abs(higherNote.frequency - frequency)
      < abs(lowerNote.frequency - frequency)
      ? higherNote
      : lowerNote

    let firstOffset = Sound.Offset(
      note: note,
      frequency: frequency - note.frequency,
      percentage: abs(
        (frequency - note.frequency) * 100
        / (note.frequency - closestNote.frequency))
    )

    let secondOffset = Sound.Offset(
      note: closestNote,
      frequency: frequency - closestNote.frequency,
      percentage: abs(
        (frequency - closestNote.frequency) * 100
        / (note.frequency - closestNote.frequency))
    )

    return Sound.Offsets(firstOffset, secondOffset)
  }
}