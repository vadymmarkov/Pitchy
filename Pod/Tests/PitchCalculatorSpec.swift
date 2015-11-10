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
          expect(PitchCalculator.frequency(index: 0)) ≈ (440.0, 0.01)
          expect(PitchCalculator.frequency(index: -9)) ≈ (261.626, 0.01)
          expect(PitchCalculator.frequency(index: -30)) ≈ ( 77.7817, 0.01)
          expect(PitchCalculator.frequency(index: 11)) ≈ (830.609, 0.01)
          expect(PitchCalculator.frequency(index: 29)) ≈ (2349.32, 0.01)
        }
      }

      describe(".note") {
        it("returns a correct note by pitch index") {
          expect(PitchCalculator.note(index: 0)).to(equal(Note.A))
          expect(PitchCalculator.note(index: -9)).to(equal(Note.C))
          expect(PitchCalculator.note(index: -30)).to(equal(Note.DSharp))
          expect(PitchCalculator.note(index: 11)).to(equal(Note.GSharp))
          expect(PitchCalculator.note(index: 29)).to(equal(Note.D))
        }
      }

      describe(".octave") {
        it("returns a correct octave by pitch index") {
          expect(PitchCalculator.octave(index: 0)).to(equal(4))
          expect(PitchCalculator.octave(index: -9)).to(equal(4))
          expect(PitchCalculator.octave(index: -30)).to(equal(2))
          expect(PitchCalculator.octave(index: 11)).to(equal(5))
          expect(PitchCalculator.octave(index: 29)).to(equal(7))
        }
      }
    }
  }
}


