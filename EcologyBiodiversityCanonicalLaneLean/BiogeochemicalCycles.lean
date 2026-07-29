import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyBiodiversityCanonicalLaneLean

structure BiogeochemicalCyclesPackage where
  nitrogenFixationRate : ℝ
  phosphorusWeatheringRate : ℝ
  carbonSequestrationRate : ℝ
  organicDecompositionRate : ℝ
  closedLoopPrinciple : Prop

structure BiogeochemicalCyclesEvidence (B : BiogeochemicalCyclesPackage) where
  nitrogenFixationRateNonnegative : B.nitrogenFixationRate ≥ 0
  phosphorusWeatheringRateNonnegative : B.phosphorusWeatheringRate ≥ 0
  carbonSequestrationRateNonnegative : B.carbonSequestrationRate ≥ 0
  organicDecompositionRateNonnegative : B.organicDecompositionRate ≥ 0
  closedLoopPrincipleClosed : B.closedLoopPrinciple

def BiogeochemicalCyclesClosed (B : BiogeochemicalCyclesPackage) : Prop :=
  B.nitrogenFixationRate ≥ 0 ∧ B.phosphorusWeatheringRate ≥ 0 ∧
  B.carbonSequestrationRate ≥ 0 ∧ B.organicDecompositionRate ≥ 0 ∧ B.closedLoopPrinciple

theorem biogeochemical_cycles_closed_from_evidence (B : BiogeochemicalCyclesPackage) (E : BiogeochemicalCyclesEvidence B) :
    BiogeochemicalCyclesClosed B := by
  exact And.intro E.nitrogenFixationRateNonnegative
    (And.intro E.phosphorusWeatheringRateNonnegative
      (And.intro E.carbonSequestrationRateNonnegative
        (And.intro E.organicDecompositionRateNonnegative E.closedLoopPrincipleClosed)))

end EcologyBiodiversityCanonicalLaneLean
end HautevilleHouse