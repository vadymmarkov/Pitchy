@testable import Pitchy
import Quick
import Nimble

class NoteCalculatorSpec: QuickSpec {

  override func spec() {
    let notes = [
      (index: 0, note: Note.Letter.A, octave: 4, frequency: 440.0),
      (index: 12, note: Note.Letter.A, octave: 5, frequency: 880.000),
      (index: 2, note: Note.Letter.B, octave: 4, frequency: 493.883),
      (index: -10, note: Note.Letter.B, octave: 3, frequency: 246.942),
      (index: -9, note: Note.Letter.C, octave: 4, frequency: 261.626),
      (index: -30, note: Note.Letter.DSharp, octave: 2, frequency: 77.7817),
      (index: 11, note: Note.Letter.GSharp, octave: 5, frequency: 830.609),
      (index: 29, note: Note.Letter.D, octave: 7, frequency: 2349.32)
    ]

    describe("NoteCalculator") {
      describe("Standard") {
        it("has base constant values") {
          expect(NoteCalculator.Standard.frequency).to(equal(440))
          expect(NoteCalculator.Standard.octave).to(equal(4))
        }
      }

      describe(".notes") {
        it("returns an array of 12 notes") {
          let letters = NoteCalculator.letters
          expect(letters.count).to(equal(12))
        }

        it("returns an array of note letters in the correct order") {
          let letters = NoteCalculator.letters
          expect(letters[0]).to(equal(Note.Letter.A))
          expect(letters[1]).to(equal(Note.Letter.ASharp))
          expect(letters[2]).to(equal(Note.Letter.B))
          expect(letters[3]).to(equal(Note.Letter.C))
          expect(letters[4]).to(equal(Note.Letter.CSharp))
          expect(letters[5]).to(equal(Note.Letter.D))
          expect(letters[6]).to(equal(Note.Letter.DSharp))
          expect(letters[7]).to(equal(Note.Letter.E))
          expect(letters[8]).to(equal(Note.Letter.F))
          expect(letters[9]).to(equal(Note.Letter.FSharp))
          expect(letters[10]).to(equal(Note.Letter.G))
          expect(letters[11]).to(equal(Note.Letter.GSharp))
        }
      }

      describe(".frequency:index") {
        it("returns a correct frequency by pitch index") {
          notes.forEach {
            expect(NoteCalculator.frequency(index: $0.index)) ≈ ($0.frequency, 0.01)
          }
        }
      }

      describe(".note:index") {
        it("returns a correct note letter by pitch index") {
          notes.forEach {
            expect(NoteCalculator.letter(index: $0.index)).to(equal($0.note))
          }
        }
      }

      describe(".octave:index") {
        it("returns a correct octave by pitch index") {
          notes.forEach {
            expect(NoteCalculator.octave(index: $0.index)).to(equal($0.octave))
          }
        }
      }

      describe(".index:frequency") {
        it("returns a correct pitch index by frequency") {
          notes.forEach {
            expect(try! NoteCalculator.index(frequency: $0.frequency)).to(equal($0.index))
          }
        }
      }

      describe(".index:note:octave") {
        it("returns a correct pitch index by note letter and octave") {
          notes.forEach {
            expect(NoteCalculator.index(letter: $0.note, octave: $0.octave)).to(equal($0.index))
          }
        }
      }
    }
  }
}
