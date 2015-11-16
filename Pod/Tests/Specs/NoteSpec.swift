import Quick
import Nimble

class NoteSpec: QuickSpec {

  override func spec() {

    describe("Note.Letter") {

      describe(".values") {
        it("returns an array of 12 note letters") {
          let letters = Note.Letter.values
          expect(letters.count).to(equal(12))
        }

        it("returns an array of notes in the correct order") {
          let letters = Note.Letter.values

          expect(letters[0]).to(equal(Note.Letter.C))
          expect(letters[1]).to(equal(Note.Letter.CSharp))
          expect(letters[2]).to(equal(Note.Letter.D))
          expect(letters[3]).to(equal(Note.Letter.DSharp))
          expect(letters[4]).to(equal(Note.Letter.E))
          expect(letters[5]).to(equal(Note.Letter.F))
          expect(letters[6]).to(equal(Note.Letter.FSharp))
          expect(letters[7]).to(equal(Note.Letter.G))
          expect(letters[8]).to(equal(Note.Letter.GSharp))
          expect(letters[9]).to(equal(Note.Letter.A))
          expect(letters[10]).to(equal(Note.Letter.ASharp))
          expect(letters[11]).to(equal(Note.Letter.B))
        }
      }
    }

    describe("Note") {
      var note: Note!

      describe("#init") {
        let notes = [
          (index: -9, letter: Note.Letter.C, octave: 4, frequency: 261.626, string: "C4", lower: "B3", higher: "C#4"),
          (index: 16, letter: Note.Letter.CSharp, octave: 6, frequency: 1108.73, string: "C#6", lower: "C6", higher: "D6"),
          (index: 5, letter: Note.Letter.D, octave: 5, frequency: 587.330, string: "D5", lower: "C#5", higher: "D#5"),
          (index: 18, letter: Note.Letter.DSharp, octave: 6, frequency: 1244.51, string: "D#6", lower: "D6", higher: "E6"),
          (index: 31, letter: Note.Letter.E, octave: 7, frequency: 2637.02, string: "E7", lower: "D#7", higher: "F7"),
          (index: -16, letter: Note.Letter.F, octave: 3, frequency: 174.614, string: "F3", lower: "E3", higher: "F#3"),
          (index: -27, letter: Note.Letter.FSharp, octave: 2, frequency: 92.4986, string: "F#2", lower: "F2", higher: "G2"),
          (index: -38, letter: Note.Letter.G, octave: 1, frequency: 48.9994, string: "G1", lower: "F#1", higher: "G#1"),
          (index: -13, letter: Note.Letter.GSharp, octave: 3, frequency: 207.652, string: "G#3", lower: "G3", higher: "A3"),
          (index: 0, letter: Note.Letter.A, octave: 4, frequency: 440, string: "A4", lower: "G#4", higher: "A#4"),
          (index: -47, letter: Note.Letter.ASharp, octave: 0, frequency: 29.1352, string: "A#0", lower: "A0", higher: "B0"),
          (index: 2, letter: Note.Letter.B, octave: 4, frequency: 493.883, string: "B4", lower: "A#4", higher: "C5")
        ]

        it("creates note with index") {
          notes.forEach {
            note = Note(index: $0.index)

            expect(note).toNot(beNil())
            expect(note.index).to(equal($0.index))
            expect(note.letter).to(equal($0.letter))
            expect(note.octave).to(equal($0.octave))
            expect(note.frequency) ≈ ($0.frequency, 0.01)
            expect(note.string).to(equal($0.string))
            expect(note.lower.string).to(equal($0.lower))
            expect(note.higher.string).to(equal($0.higher))
          }
        }

        it("creates note with frequency") {
          notes.forEach {
            note = Note(frequency: $0.frequency)

            expect(note).toNot(beNil())
            expect(note.index).to(equal($0.index))
            expect(note.letter).to(equal($0.letter))
            expect(note.octave).to(equal($0.octave))
            expect(note.frequency) ≈ ($0.frequency, 0.01)
            expect(note.string).to(equal($0.string))
            expect(note.lower.string).to(equal($0.lower))
            expect(note.higher.string).to(equal($0.higher))
          }
        }

        it("creates note with note and octave") {
          notes.forEach {
            note = Note(letter: $0.letter, octave: $0.octave)

            expect(note).toNot(beNil())
            expect(note.index).to(equal($0.index))
            expect(note.letter).to(equal($0.letter))
            expect(note.octave).to(equal($0.octave))
            expect(note.frequency) ≈ ($0.frequency, 0.01)
            expect(note.string).to(equal($0.string))
            expect(note.lower.string).to(equal($0.lower))
            expect(note.higher.string).to(equal($0.higher))
          }
        }
      }
    }
  }
}
