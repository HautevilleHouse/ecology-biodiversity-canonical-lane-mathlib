import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyBiodiversityCanonicalLaneLean

structure SpeciesInteractionsPackage where
  competitionCoefficients : ℝ × ℝ
  mutualismCoefficients : ℝ × ℝ
  predatorPreyRate : ℝ
  interactionMatrix : List (List ℝ)
  equivalencePrinciple : Prop

structure SpeciesInteractionsEvidence (S : SpeciesInteractionsPackage) where
  competitionCoefficientsNonnegative : S.competitionCoefficients.1 ≥ 0 ∧ S.competitionCoefficients.2 ≥ 0
  mutualismCoefficientsNonnegative : S.mutualismCoefficients.1 ≥ 0 ∧ S.mutualismCoefficients.2 ≥ 0
  predatorPreyRateNonnegative : S.predatorPreyRate ≥ 0
  interactionMatrixConsistent : S.interactionMatrix ≠ [] ∧ (∀ row ∈ S.interactionMatrix, row ≠ [])
  equivalencePrincipleClosed : S.equivalencePrinciple

def SpeciesInteractionsClosed (S : SpeciesInteractionsPackage) : Prop :=
  (S.competitionCoefficients.1 ≥ 0 ∧ S.competitionCoefficients.2 ≥ 0) ∧
  (S.mutualismCoefficients.1 ≥ 0 ∧ S.mutualismCoefficients.2 ≥ 0) ∧
  S.predatorPreyRate ≥ 0 ∧
  (S.interactionMatrix ≠ [] ∧ (∀ row ∈ S.interactionMatrix, row ≠ [])) ∧
  S.equivalencePrinciple

theorem species_interactions_closed_from_evidence (S : SpeciesInteractionsPackage) (E : SpeciesInteractionsEvidence S) :
    SpeciesInteractionsClosed S := by
  exact And.intro E.competitionCoefficientsNonnegative
    (And.intro E.mutualismCoefficientsNonnegative
      (And.intro E.predatorPreyRateNonnegative
        (And.intro E.interactionMatrixConsistent E.equivalencePrincipleClosed)))

end EcologyBiodiversityCanonicalLaneLean
end HautevilleHouse