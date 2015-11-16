import Quick
import Nimble

class PitchSpec: QuickSpec {

  override func spec() {
    let piches = [
      (index: -9, note: Note.C, octave: 4, frequency: 261.626, string: "C4", lower: "B3", higher: "C#4"),
      (index: 16, note: Note.CSharp, octave: 6, frequency: 1108.73, string: "C#6", lower: "C6", higher: "D6"),
      (index: 5, note: Note.D, octave: 5, frequency: 587.330, string: "D5", lower: "C#5", higher: "D#5"),
      (index: 18, note: Note.DSharp, octave: 6, frequency: 1244.51, string: "D#6", lower: "D6", higher: "E6"),
      (index: 31, note: Note.E, octave: 7, frequency: 2637.02, string: "E7", lower: "D#7", higher: "F7"),
      (index: -16, note: Note.F, octave: 3, frequency: 174.614, string: "F3", lower: "E3", higher: "F#3"),
      (index: -27, note: Note.FSharp, octave: 2, frequency: 92.4986, string: "F#2", lower: "F2", higher: "G2"),
      (index: -38, note: Note.G, octave: 1, frequency: 48.9994, string: "G1", lower: "F#1", higher: "G#1"),
      (index: -13, note: Note.GSharp, octave: 3, frequency: 207.652, string: "G#3", lower: "G3", higher: "A3"),
      (index: 0, note: Note.A, octave: 4, frequency: 440, string: "A4", lower: "G#4", higher: "A#4"),
      (index: -47, note: Note.ASharp, octave: 0, frequency: 29.1352, string: "A#0", lower: "A0", higher: "B0"),
      (index: 2, note: Note.B, octave: 4, frequency: 493.883, string: "B4", lower: "A#4", higher: "C5")
    ]

    describe("Pitch") {
      var pitch: Pitch!

      describe("#init") {

        it("creates note with index") {
          piches.forEach {
            pitch = Pitch(index: $0.index)

            expect(pitch).toNot(beNil())
            expect(pitch.index).to(equal($0.index))
            expect(pitch.note).to(equal($0.note))
            expect(pitch.octave).to(equal($0.octave))
            expect(pitch.frequency) ≈ ($0.frequency, 0.01)
            expect(pitch.string).to(equal($0.string))
            expect(pitch.lowerPitch.string).to(equal($0.lower))
            expect(pitch.higherPitch.string).to(equal($0.higher))
          }
        }

        it("creates note with frequency") {
          piches.forEach {
            pitch = Pitch(frequency: $0.frequency)

            expect(pitch).toNot(beNil())
            expect(pitch.index).to(equal($0.index))
            expect(pitch.note).to(equal($0.note))
            expect(pitch.octave).to(equal($0.octave))
            expect(pitch.frequency) ≈ ($0.frequency, 0.01)
            expect(pitch.string).to(equal($0.string))
            expect(pitch.lowerPitch.string).to(equal($0.lower))
            expect(pitch.higherPitch.string).to(equal($0.higher))
          }
        }

        it("creates note with note and octave") {
          piches.forEach {
            pitch = Pitch(note: $0.note, octave: $0.octave)

            expect(pitch).toNot(beNil())
            expect(pitch.index).to(equal($0.index))
            expect(pitch.note).to(equal($0.note))
            expect(pitch.octave).to(equal($0.octave))
            expect(pitch.frequency) ≈ ($0.frequency, 0.01)
            expect(pitch.string).to(equal($0.string))
            expect(pitch.lowerPitch.string).to(equal($0.lower))
            expect(pitch.higherPitch.string).to(equal($0.higher))
          }
        }
      }
    }
  }
}
