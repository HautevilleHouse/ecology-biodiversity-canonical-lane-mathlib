import EcologyBiodiversityCanonicalLaneLean.SpeciesInteraction

namespace HautevilleHouse
namespace EcologyBiodiversityCanonicalLaneLean

structure BiodiversityIndexPackage where
  speciesRichness : ℕ
  shannonIndex : ℝ
  simpsonIndex : ℝ
  evenness : ℝ
  indexRelations : Prop

structure BiodiversityIndexEvidence (B : BiodiversityIndexPackage) where
  speciesRichnessPositive : B.speciesRichness > 0
  shannonIndexNonnegative : B.shannonIndex ≥ 0
  simpsonIndexBetween : 0 ≤ B.simpsonIndex ∧ B.simpsonIndex ≤ 1
  evennessDefined : B.evenness ≥ 0 ∧ B.evenness ≤ 1
  indexRelationsClosed : B.indexRelations

def BiodiversityIndexClosed (B : BiodiversityIndexPackage) : Prop :=
  B.speciesRichness > 0 ∧ B.shannonIndex ≥ 0 ∧ (0 ≤ B.simpsonIndex ∧ B.simpsonIndex ≤ 1) ∧ (B.evenness ≥ 0 ∧ B.evenness ≤ 1) ∧ B.indexRelations

theorem biodiversity_index_closed_from_evidence (B : BiodiversityIndexPackage) (E : BiodiversityIndexEvidence B) : BiodiversityIndexClosed B := by
  have hsimpson : 0 ≤ B.simpsonIndex ∧ B.simpsonIndex ≤ 1 := E.simpsonIndexBetween
  have hevenness : B.evenness ≥ 0 ∧ B.evenness ≤ 1 := E.evennessDefined
  exact And.intro E.speciesRichnessPositive (And.intro E.shannonIndexNonnegative (And.intro hsimpson (And.intro hevenness E.indexRelationsClosed)))

end EcologyBiodiversityCanonicalLaneLean
end HautevilleHouse