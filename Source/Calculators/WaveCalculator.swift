import Foundation

public struct WaveCalculator {

  // MARK: - Conversions

  public static func frequency(wavelength wavelength: Double) -> Double {
    return AcousticWave.speed / wavelength
  }

  public static func wavelength(frequency frequency: Double) -> Double {
    return AcousticWave.speed / frequency
  }

  public static func wavelength(period period: Double) -> Double {
    return period * AcousticWave.speed
  }

  public static func period(wavelength wavelength: Double) -> Double {
    return wavelength / AcousticWave.speed
  }
}
