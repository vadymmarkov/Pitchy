import Quick
import Nimble

class CalculatorSpec: QuickSpec {

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

    let offsets = [
      (frequency: 445.0,
        lower: Sound.Offset(note: Note(index: 0), frequency: 5, percentage: 19.1),
        higher: Sound.Offset(note: Note(index: 1), frequency: 21.164, percentage: 80.9),
        closest: "A4"
      ),
      (frequency: 108.0,
        lower: Sound.Offset(note: Note(index: -25), frequency: 4.174, percentage: 67.6),
        higher: Sound.Offset(note: Note(index: -24), frequency: 2, percentage: 32.39),
        closest: "A2"
      )
    ]

    describe("PitchCalculator") {

      describe("Standard") {
        it("has base constant values") {
          expect(Calculator.Standard.frequency).to(equal(440))
          expect(Calculator.Standard.octave).to(equal(4))
        }
      }

      describe(".notes") {
        it("returns an array of 12 notes") {
          let notes = Calculator.notes
          expect(notes.count).to(equal(12))
        }

        it("returns an array of notes in the correct order") {
          let notes = Calculator.notes
          expect(notes[0]).to(equal(Note.Letter.A))
          expect(notes[1]).to(equal(Note.Letter.ASharp))
          expect(notes[2]).to(equal(Note.Letter.B))
          expect(notes[3]).to(equal(Note.Letter.C))
          expect(notes[4]).to(equal(Note.Letter.CSharp))
          expect(notes[5]).to(equal(Note.Letter.D))
          expect(notes[6]).to(equal(Note.Letter.DSharp))
          expect(notes[7]).to(equal(Note.Letter.E))
          expect(notes[8]).to(equal(Note.Letter.F))
          expect(notes[9]).to(equal(Note.Letter.FSharp))
          expect(notes[10]).to(equal(Note.Letter.G))
          expect(notes[11]).to(equal(Note.Letter.GSharp))
        }
      }
      
      describe(".frequency:index") {
        it("returns a correct frequency by pitch index") {
          notes.forEach {
            expect(Calculator.frequency(index: $0.index)) ≈ ($0.frequency, 0.01)
          }
        }
      }

      describe(".note:index") {
        it("returns a correct note by pitch index") {
          notes.forEach {
            expect(Calculator.letter(index: $0.index)).to(equal($0.note))
          }
        }
      }

      describe(".octave:index") {
        it("returns a correct octave by pitch index") {
          notes.forEach {
            expect(Calculator.octave(index: $0.index)).to(equal($0.octave))
          }
        }
      }

      describe(".index:frequency") {
        it("returns a correct pitch index by frequency") {
          notes.forEach {
            expect(Calculator.index(frequency: $0.frequency)).to(equal($0.index))
          }
        }
      }

      describe(".index:note:octave") {
        it("returns a correct pitch index by note and octave") {
          notes.forEach {
            expect(Calculator.index(letter: $0.note, octave: $0.octave)).to(equal($0.index))
          }
        }
      }

      describe(".offsets") {
        it("returns a correct offsets for the specified frequency") {
          offsets.forEach {
            let result = Calculator.offsets($0.frequency)

            expect(result.lower.frequency) ≈ ($0.lower.frequency, 0.01)
            expect(result.lower.percentage) ≈ ($0.lower.percentage, 0.1)
            expect(result.lower.note.index).to(equal($0.lower.note.index))

            expect(result.higher.frequency) ≈ (-$0.higher.frequency, 0.01)
            expect(result.higher.percentage) ≈ ($0.higher.percentage, 0.1)
            expect(result.higher.note.index).to(equal($0.higher.note.index))

            expect(result.closest.note.string).to(equal($0.closest))
          }
        }
      }
    }
  }
}