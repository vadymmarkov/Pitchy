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

      describe(".indexBounds") {
        it("has bounds based on min and max frequencies from the config") {
          let minimum = try! NoteCalculator.index(forFrequency: FrequencyValidator.minimumFrequency)
          let maximum = try! NoteCalculator.index(forFrequency: FrequencyValidator.maximumFrequency)
          let expected = (minimum: minimum, maximum: maximum)
          let result = NoteCalculator.indexBounds

          expect(result.minimum).to(equal(expected.minimum))
          expect(result.maximum).to(equal(expected.maximum))
        }
      }

      describe(".octaveBounds") {
        it("has bounds based on min and max frequencies from the config") {
          let bounds = NoteCalculator.indexBounds
          let minimum = try! NoteCalculator.octave(forIndex: bounds.minimum)
          let maximum = try! NoteCalculator.octave(forIndex: bounds.maximum)
          let expected = (minimum: minimum, maximum: maximum)
          let result = NoteCalculator.octaveBounds

          expect(result.minimum).to(equal(expected.minimum))
          expect(result.maximum).to(equal(expected.maximum))
        }
      }

      describe(".isValid:index") {
        it("is invalid if value is higher than maximum") {
          let value = 1000
          expect(NoteCalculator.isValid(index: value)).to(beFalse())
        }

        it("is invalid if value is lower than minimum") {
          let value = -100
          expect(NoteCalculator.isValid(index: value)).to(beFalse())
        }

        it("is valid if value is within valid bounds") {
          let value = 6
          expect(NoteCalculator.isValid(index: value)).to(beTrue())
        }
      }

      describe(".isValid:octave") {
        it("is invalid if value is higher than maximum") {
          let value = 10
          expect(NoteCalculator.isValid(octave: value)).to(beFalse())
        }

        it("is invalid if value is lower than minimum") {
          let value = -1
          expect(NoteCalculator.isValid(octave: value)).to(beFalse())
        }

        it("is valid if value is within valid bounds") {
          let value = 2
          expect(NoteCalculator.isValid(octave: value)).to(beTrue())
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

      describe(".frequency:forIndex") {
        it("returns a correct frequency by pitch index") {
          notes.forEach {
            expect(try! NoteCalculator.frequency(forIndex: $0.index)) ≈ ($0.frequency, 0.01)
          }
        }
      }

      describe(".note:forIndex") {
        it("returns a correct note letter by pitch index") {
          notes.forEach {
            expect(try! NoteCalculator.letter(forIndex: $0.index)).to(equal($0.note))
          }
        }
      }

      describe(".octave:forIndex") {
        it("returns a correct octave by pitch index") {
          notes.forEach {
            expect(try! NoteCalculator.octave(forIndex: $0.index)).to(equal($0.octave))
          }
        }
      }

      describe(".index:forFrequency") {
        it("returns a correct pitch index by frequency") {
          notes.forEach {
            expect(try! NoteCalculator.index(forFrequency: $0.frequency)).to(equal($0.index))
          }
        }
      }

      describe(".index:forLetter:octave") {
        it("returns a correct pitch index by note letter and octave") {
          notes.forEach {
            expect(try! NoteCalculator.index(forLetter: $0.note, octave: $0.octave)).to(equal($0.index))
          }
        }
      }
    }
  }
}
