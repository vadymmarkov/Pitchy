@testable import Pitchy
import Quick
import Nimble

class ValidatorSpec: QuickSpec {

  override func spec() {
    describe("Validator") {
      describe(".isValidFrequency") {
        it("is invalid if frequency is higher than maximum") {
          let frequency = 5000.0
          expect(Validator.isValidFrequency(frequency).to(beFalse()))
        }

        it("is invalid if frequency is lower than minimum") {
          let frequency = 10.0
          expect(Validator.isValidFrequency(frequency).to(beFalse()))
        }

        it("is invalid if frequency is zero") {
          let frequency = 0.0
          expect(Validator.isValidFrequency(frequency).to(beFalse()))
        }

        it("is valids if frequency is within valid bounds") {
          let frequency = 440.0
          expect(Validator.isValidFrequency(frequency).to(beTrue()))
        }
      }
    }
  }
}
