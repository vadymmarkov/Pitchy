// Pitchy

import Pitchy

// MARK: - Pitch
do {
  let pitch = try Pitch(frequency: 445.0)
  let pitchOffsets = pitch.offsets

  print(pitchOffsets.lower.frequency)     // 5 Hz
  print(pitchOffsets.lower.percentage)    // 19.1%
  print(pitchOffsets.lower.note.index)    // 0
  print(pitchOffsets.lower.cents)         // 19.56

  print(pitchOffsets.higher.frequency)    // -21.164 Hz
  print(pitchOffsets.higher.percentage)   // -80.9%
  print(pitchOffsets.higher.note.index)   // 1
  print(pitchOffsets.higher.cents)        // -80.4338

  print(pitchOffsets.closest.note.string) // "A4"

  print(pitch.wave.wavelength)            // 0.7795 meters
} catch {
  // Handle errors
}

// MARK: - Acoustic Wave

do {
  // AcousticWave(wavelength: 0.7795)
  // AcousticWave(period: 0.00227259)
  let wave = try AcousticWave(frequency: 440.0)

  print(wave.frequency)       // 440 Hz
  print(wave.wavelength)      // 0.7795 meters
  print(wave.period)          // 0.00227259 s
  print(wave.harmonics[0])    // 440 Hz
  print(wave.harmonics[1])    // 880 Hz
} catch {
  // Handle errors
}

// MARK: - Note

do {
  // Note(frequency: 261.626)
  // Note(letter: .C, octave: 4)
  let note = try Note(index: -9)

  print(note.index)                 // -9
  print(note.letter)                // .C
  print(note.octave)                // 4
  print(note.frequency)             // 261.626 Hz
  print(note.string)                // "C4"
  print(try note.lower().string)    // "B3"
  print(try note.higher().string)   // "C#4"
} catch {
  // Handle errors
}

// MARK: - Calculators

do {
  // PitchCalculator
  _ = try PitchCalculator.offsets(forFrequency: 445.0)
  _ = try PitchCalculator.cents(frequency1: 440.0,
    frequency2: 440.0) // 19.56

  // NoteCalculator
  _ = try NoteCalculator.frequency(forIndex: 0)       // 440.0 Hz
  _ = try NoteCalculator.letter(forIndex: 0)              // .A
  _ = try NoteCalculator.octave(forIndex: 0)              // 4
  _ = try NoteCalculator.index(forFrequency: 440.0)       // 0
  _ = try NoteCalculator.index(forLetter: .A, octave: 4)  // 0

  // WaveCalculator
  _ = try WaveCalculator.frequency(forWavelength: 0.7795)      // 440.0 Hz
  _ = try WaveCalculator.wavelength(forFrequency: 440.0)     // 0.7795 meters
  _ = try WaveCalculator.wavelength(forPeriod: 0.00227259)   // 0.7795 meters
  _ = try WaveCalculator.period(forWavelength: 0.7795)    // 0.00227259 s
} catch {
  // Handle errors
}
