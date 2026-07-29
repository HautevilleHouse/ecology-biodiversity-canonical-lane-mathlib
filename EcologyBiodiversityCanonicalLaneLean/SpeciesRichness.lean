import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyBiodiversityCanonicalLaneLean

structure SpeciesRichnessPackage where
  area : Type u
  richness : area -> Nat
  richnessFinite : Prop
  richnessMonotone : Prop
  richnessFiniteTerm : richnessFinite
  richnessMonotoneTerm : richnessMonotone

structure SpeciesRichnessEvidence (R : SpeciesRichnessPackage) where
  richnessFiniteClosed : R.richnessFinite
  richnessMonotoneClosed : R.richnessMonotone

def SpeciesRichnessClosed (R : SpeciesRichnessPackage) : Prop :=
  R.richnessFinite ∧ R.richnessMonotone

theorem species_richness_closed_from_evidence
    (R : SpeciesRichnessPackage) (E : SpeciesRichnessEvidence R) :
    SpeciesRichnessClosed R := by
  exact And.intro E.richnessFiniteClosed E.richnessMonotoneClosed

end EcologyBiodiversityCanonicalLaneLean
end HautevilleHouse