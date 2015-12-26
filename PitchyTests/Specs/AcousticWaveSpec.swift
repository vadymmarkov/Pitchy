@testable import Pitchy
import Quick
import Nimble

class AcousticWaveSpec: QuickSpec {

  override func spec() {
    let waves = [
      (frequency: 440.0,
        wavelength: 0.7795,
        period: 0.00227259
      ),
      (frequency: 1000.0,
        wavelength: 0.343,
        period: 0.001
      )
    ]

    describe("AcousticWave") {

      describe(".speed") {
        expect(AcousticWave.speed) ≈ (343, 0.001)
      }

      describe("#init") {
        context("with frequency") {
          it("sets correct values") {
            waves.forEach {
              let wave = AcousticWave(frequency: $0.frequency)

              expect(wave.frequency) ≈ ($0.frequency, 0.01)
              expect(wave.wavelength) ≈ ($0.wavelength, 0.01)
              expect(wave.period) ≈ ($0.period, 0.01)

              for (index, value) in wave.harmonics.enumerate() {
                expect(value.frequency) ≈ (Double(index + 1) * $0.frequency, 0.01)
              }
            }
          }
        }

        context("with wavelength") {
          it("sets correct values") {
            waves.forEach {
              let wave = AcousticWave(wavelength: $0.wavelength)

              expect(wave.frequency) ≈ ($0.frequency, 0.1)
              expect(wave.wavelength) ≈ ($0.wavelength, 0.01)
              expect(wave.period) ≈ ($0.period, 0.01)

              for (index, value) in wave.harmonics.enumerate() {
                expect(value.frequency) ≈ (Double(index + 1) * $0.frequency, 1)
              }
            }
          }
        }

        context("with period") {
          it("sets correct values") {
            waves.forEach {
              let wave = AcousticWave(period: $0.period)

              expect(wave.frequency) ≈ ($0.frequency, 0.1)
              expect(wave.wavelength) ≈ ($0.wavelength, 0.01)
              expect(wave.period) ≈ ($0.period, 0.01)

              for (index, value) in wave.harmonics.enumerate() {
                expect(value.frequency) ≈ (Double(index + 1) * $0.frequency, 1)
              }
            }
          }
        }
      }
    }
  }
}
