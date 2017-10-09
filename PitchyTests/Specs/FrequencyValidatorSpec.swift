@testable import Pitchy
import Quick
import Nimble

class FrequencyValidatorSpec: QuickSpec {
  override func spec() {
    describe("FrequencyValidator") {
      describe(".isValid:frequency") {
        it("is invalid if frequency is higher than maximum") {
          let frequency = 5000.0
          expect(FrequencyValidator.isValid(frequency: frequency)).to(beFalse())
        }

        it("is invalid if frequency is lower than minimum") {
          let frequency = 10.0
          expect(FrequencyValidator.isValid(frequency: frequency)).to(beFalse())
        }

        it("is invalid if frequency is zero") {
          let frequency = 0.0
          expect(FrequencyValidator.isValid(frequency: frequency)).to(beFalse())
        }

        it("is valid if frequency is within valid bounds") {
          let frequency = 440.0
          expect(FrequencyValidator.isValid(frequency: frequency)).to(beTrue())
        }
      }
    }
  }
}

