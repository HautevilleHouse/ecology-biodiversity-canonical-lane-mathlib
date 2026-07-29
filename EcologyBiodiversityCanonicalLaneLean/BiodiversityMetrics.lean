import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyBiodiversityCanonicalLaneLean

structure BiodiversityMetricsPackage where
  speciesRichness : ℕ
  shannonIndex : ℝ
  simpsonIndex : ℝ
  evennessMeasure : ℝ
  diversityPrinciple : Prop

structure BiodiversityMetricsEvidence (B : BiodiversityMetricsPackage) where
  speciesRichnessPositive : B.speciesRichness > 0
  shannonIndexInRange : 0 ≤ B.shannonIndex ∧ B.shannonIndex ≤ log (B.speciesRichness : ℝ)
  simpsonIndexInRange : 0 ≤ B.simpsonIndex ∧ B.simpsonIndex ≤ 1
  evennessMeasureInRange : 0 ≤ B.evennessMeasure ∧ B.evennessMeasure ≤ 1
  diversityPrincipleClosed : B.diversityPrinciple

def BiodiversityMetricsClosed (B : BiodiversityMetricsPackage) : Prop :=
  B.speciesRichness > 0 ∧
  (0 ≤ B.shannonIndex ∧ B.shannonIndex ≤ log (B.speciesRichness : ℝ)) ∧
  (0 ≤ B.simpsonIndex ∧ B.simpsonIndex ≤ 1) ∧
  (0 ≤ B.evennessMeasure ∧ B.evennessMeasure ≤ 1) ∧
  B.diversityPrinciple

theorem biodiversity_metrics_closed_from_evidence (B : BiodiversityMetricsPackage) (E : BiodiversityMetricsEvidence B) :
    BiodiversityMetricsClosed B := by
  exact And.intro E.speciesRichnessPositive
    (And.intro E.shannonIndexInRange
      (And.intro E.simpsonIndexInRange
        (And.intro E.evennessMeasureInRange E.diversityPrincipleClosed)))

end EcologyBiodiversityCanonicalLaneLean
end HautevilleHouse