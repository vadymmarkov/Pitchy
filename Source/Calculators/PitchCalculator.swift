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
      percentage: abs(
        (frequency - note.frequency) * 100
          / (note.frequency - closestNote.frequency))
    )

    let secondOffset = Pitch.Offset(
      note: closestNote,
      frequency: frequency - closestNote.frequency,
      percentage: abs(
        (frequency - closestNote.frequency) * 100
          / (note.frequency - closestNote.frequency))
    )

    return Pitch.Offsets(firstOffset, secondOffset)
  }
}
