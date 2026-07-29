import EcologyBiodiversityCanonicalLaneLean.PopulationDynamics

namespace HautevilleHouse
namespace EcologyBiodiversityCanonicalLaneLean

structure SpeciesInteractionPackage {P : PopulationDynamicsPackage} where
  interactionMatrix : Matrix ℝ ℕ ℕ
  competitionCoeff : ℝ → ℝ → ℝ
  mutualismCoeff : ℝ → ℝ → ℝ
  predationCoeff : ℝ → ℝ → ℝ
  interactionEquation : Prop

structure SpeciesInteractionEvidence {P : PopulationDynamicsPackage} (S : SpeciesInteractionPackage P) where
  interactionMatrixDefined : S.interactionMatrix.rows > 0 ∧ S.interactionMatrix.cols > 0
  competitionCoeffDefined : ∀ x y, S.competitionCoeff x y ≥ 0
  mutualismCoeffDefined : ∀ x y, S.mutualismCoeff x y ≥ 0
  predationCoeffDefined : ∀ x y, S.predationCoeff x y ≥ 0
  interactionEquationClosed : S.interactionEquation

def SpeciesInteractionClosed {P : PopulationDynamicsPackage} (S : SpeciesInteractionPackage P) : Prop :=
  (S.interactionMatrix.rows > 0 ∧ S.interactionMatrix.cols > 0) ∧
  (∀ x y, S.competitionCoeff x y ≥ 0) ∧
  (∀ x y, S.mutualismCoeff x y ≥ 0) ∧
  (∀ x y, S.predationCoeff x y ≥ 0) ∧
  S.interactionEquation

theorem species_interaction_closed_from_evidence {P : PopulationDynamicsPackage} (S : SpeciesInteractionPackage P) (E : SpeciesInteractionEvidence S) : SpeciesInteractionClosed S := by
  exact And.intro E.interactionMatrixDefined (And.intro E.competitionCoeffDefined (And.intro E.mutualismCoeffDefined (And.intro E.predationCoeffDefined E.interactionEquationClosed)))

end EcologyBiodiversityCanonicalLaneLean
end HautevilleHouse