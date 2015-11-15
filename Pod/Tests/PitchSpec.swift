import Quick
import Nimble

class PitchSpec: QuickSpec {

  override func spec() {
    describe("Pitch") {
      var pitch: Pitch!

      describe("#init") {
        context("with frequency") {

          it("creates C4") {
            pitch = Pitch(frequency: 261.626)

            expect(pitch).toNot(beNil())
            expect(pitch.index).to(equal(-9))
            expect(pitch.note).to(equal(Note.C))
            expect(pitch.octave).to(equal(4))
            expect(pitch.frequency) ≈ (261.626, 0.01)
          }

          it("creates C#6") {
            pitch = Pitch(frequency: 1108.73)

            expect(pitch.index).to(equal(16))
            expect(pitch).toNot(beNil())
            expect(pitch.note).to(equal(Note.CSharp))
            expect(pitch.octave).to(equal(6))
            expect(pitch.frequency) ≈ (1108.73, 0.01)
          }

          it("creates D5") {
            pitch = Pitch(frequency: 587.330)

            expect(pitch.index).to(equal(5))
            expect(pitch).toNot(beNil())
            expect(pitch.note).to(equal(Note.D))
            expect(pitch.octave).to(equal(5))
            expect(pitch.frequency) ≈ (587.330, 0.01)
          }

          it("creates D#6") {
            pitch = Pitch(frequency: 1244.51)

            expect(pitch.index).to(equal(18))
            expect(pitch).toNot(beNil())
            expect(pitch.note).to(equal(Note.DSharp))
            expect(pitch.octave).to(equal(6))
            expect(pitch.frequency) ≈ (1244.51, 0.01)
          }

          it("creates E7") {
            pitch = Pitch(frequency: 2637.02)

            expect(pitch.index).to(equal(31))
            expect(pitch).toNot(beNil())
            expect(pitch.note).to(equal(Note.E))
            expect(pitch.octave).to(equal(7))
            expect(pitch.frequency) ≈ (2637.02, 0.01)
          }

          it("creates F3") {
            pitch = Pitch(frequency: 174.614)

            expect(pitch.index).to(equal(-16))
            expect(pitch).toNot(beNil())
            expect(pitch.note).to(equal(Note.F))
            expect(pitch.octave).to(equal(3))
            expect(pitch.frequency) ≈ (174.614, 0.01)
          }

          it("creates F#2") {
            pitch = Pitch(frequency: 92.4986)

            expect(pitch.index).to(equal(-27))
            expect(pitch).toNot(beNil())
            expect(pitch.note).to(equal(Note.FSharp))
            expect(pitch.octave).to(equal(2))
            expect(pitch.frequency) ≈ (92.4986, 0.01)
          }

          it("creates G1") {
            pitch = Pitch(frequency: 48.9994)

            expect(pitch.index).to(equal(-38))
            expect(pitch).toNot(beNil())
            expect(pitch.note).to(equal(Note.G))
            expect(pitch.octave).to(equal(1))
            expect(pitch.frequency) ≈ (48.9994, 0.01)
          }

          it("creates G#3") {
            pitch = Pitch(frequency: 207.652)

            expect(pitch.index).to(equal(-13))
            expect(pitch).toNot(beNil())
            expect(pitch.note).to(equal(Note.GSharp))
            expect(pitch.octave).to(equal(3))
            expect(pitch.frequency) ≈ (207.652, 0.01)
          }

          it("creates A4") {
            pitch = Pitch(frequency: 440)

            expect(pitch.index).to(equal(0))
            expect(pitch).toNot(beNil())
            expect(pitch.note).to(equal(Note.A))
            expect(pitch.octave).to(equal(4))
            expect(pitch.frequency) ≈ (440, 0.01)
          }

          it("creates A#0") {
            pitch = Pitch(frequency: 29.1352)

            expect(pitch.index).to(equal(-47))
            expect(pitch).toNot(beNil())
            expect(pitch.note).to(equal(Note.ASharp))
            expect(pitch.octave).to(equal(0))
            expect(pitch.frequency) ≈ (29.1352, 0.01)
          }

          it("creates B4") {
            pitch = Pitch(frequency: 493.883)

            expect(pitch.index).to(equal(2))
            expect(pitch).toNot(beNil())
            expect(pitch.note).to(equal(Note.B))
            expect(pitch.octave).to(equal(4))
            expect(pitch.frequency) ≈ (493.883, 0.01)
          }
        }
      }
    }
  }
}
