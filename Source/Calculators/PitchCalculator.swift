import Foundation

public struct PitchCalculator {

  // MARK: - Offsets

  public static func offsets(frequency: Double) -> Pitch.Offsets {
    let note = Note(frequency: frequency)
    let higherNote = note.higher
    let lowerNote = note.lower
    let closestNote = abs(higherNote.frequency - frequency)
      < abs(lowerNote.frequency - frequency)
      ? higherNote
      : lowerNote

    let firstOffset = Pitch.Offset(
      note: note,
      frequency: frequency - note.frequency,
      percentage: (frequency - note.frequency) * 100
        / abs(note.frequency - closestNote.frequency),
      cents: cents(note.frequency, frequency2: frequency)
    )

    let secondOffset = Pitch.Offset(
      note: closestNote,
      frequency: frequency - closestNote.frequency,
      percentage: (frequency - closestNote.frequency) * 100
        / abs(note.frequency - closestNote.frequency),
      cents: cents(closestNote.frequency, frequency2: frequency)
    )

    return Pitch.Offsets(firstOffset, secondOffset)
  }

  public static func cents(frequency1: Double, frequency2: Double) -> Double {
    return 1200.0 * log2(frequency2 / frequency1)
  }
}
