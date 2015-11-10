import Quick
import Nimble

class PitchCalculatorSpec: QuickSpec {

  override func spec() {
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
      
      describe(".frequency") {
        it("returns a correct frequency by pitch index") {
          expect(PitchCalculator.frequency(index: 0)) ≈ 440.00
          expect(PitchCalculator.frequency(index: -9)) ≈ 261.626
          expect(PitchCalculator.frequency(index: -30)) ≈ 77.7817
          expect(PitchCalculator.frequency(index: 11)) ≈ 830.609
          expect(PitchCalculator.frequency(index: 29)) ≈ 2349.32
        }
      }
    }
  }
}
