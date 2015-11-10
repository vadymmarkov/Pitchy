import Quick
import Nimble

class PitchCalculatorSpec: QuickSpec {

  override func spec() {
    let piches = [
      (index: 0, note: Note.A, octave: 4, frequency: 440.0),
      (index: 12, note: Note.A, octave: 5, frequency: 880.000),
      (index: 2, note: Note.B, octave: 4, frequency: 493.883),
      (index: -10, note: Note.B, octave: 3, frequency: 246.942),
      (index: -9, note: Note.C, octave: 4, frequency: 261.626),
      (index: -30, note: Note.DSharp, octave: 2, frequency: 77.7817),
      (index: 11, note: Note.GSharp, octave: 5, frequency: 830.609),
      (index: 29, note: Note.D, octave: 7, frequency: 2349.32)
    ]

    describe("PitchCalculator") {

      describe("Standard") {
        it("has base constant values") {
          expect(PitchCalculator.Standard.frequency).to(equal(440))
          expect(PitchCalculator.Standard.octave).to(equal(4))
        }
      }

      describe(".notes") {
        it("returns an array of 12 notes") {
          let notes = PitchCalculator.notes
          expect(notes.count).to(equal(12))
        }

        it("returns an array of notes in the correct order") {
          let notes = PitchCalculator.notes
          expect(notes[0]).to(equal(Note.A))
          expect(notes[1]).to(equal(Note.ASharp))
          expect(notes[2]).to(equal(Note.B))
          expect(notes[3]).to(equal(Note.C))
          expect(notes[4]).to(equal(Note.CSharp))
          expect(notes[5]).to(equal(Note.D))
          expect(notes[6]).to(equal(Note.DSharp))
          expect(notes[7]).to(equal(Note.E))
          expect(notes[8]).to(equal(Note.F))
          expect(notes[9]).to(equal(Note.FSharp))
          expect(notes[10]).to(equal(Note.G))
          expect(notes[11]).to(equal(Note.GSharp))
        }
      }
      
      describe(".frequency:index") {
        it("returns a correct frequency by pitch index") {
          piches.forEach {
            expect(PitchCalculator.frequency(index: $0.index)) ≈ ($0.frequency, 0.01)
          }
        }
      }

      describe(".note:index") {
        it("returns a correct note by pitch index") {
          piches.forEach {
            expect(PitchCalculator.note(index: $0.index)).to(equal($0.note))
          }
        }
      }

      describe(".octave:index") {
        it("returns a correct octave by pitch index") {
          piches.forEach {
            expect(PitchCalculator.octave(index: $0.index)).to(equal($0.octave))
          }
        }
      }

      describe(".index:frequency") {
        it("returns a correct pitch index by frequency") {
          piches.forEach {
            expect(PitchCalculator.index(frequency: $0.frequency)).to(equal($0.index))
          }
        }
      }

      describe(".index:note:octave") {
        it("returns a correct pitch index by note and octave") {
          piches.forEach {
            expect(PitchCalculator.index(note: $0.note, octave: $0.octave)).to(equal($0.index))
          }
        }
      }
    }
  }
}
