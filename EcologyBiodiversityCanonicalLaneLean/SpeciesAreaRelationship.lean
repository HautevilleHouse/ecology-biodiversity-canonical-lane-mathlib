import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyBiodiversityCanonicalLaneLean

structure SpeciesAreaPackage where
  islandArea : Type u
  speciesRichness : Type v
  powerLawConstant : Prop
  exponent : Prop
  areaRichnessLogLinear : Prop
  zValueGiven : Prop

structure SpeciesAreaEvidence (S : SpeciesAreaPackage) where
  powerLawConstantClosed : S.powerLawConstant
  exponentClosed : S.exponent
  areaRichnessLogLinearClosed : S.areaRichnessLogLinear
  zValueGivenClosed : S.zValueGiven

def SpeciesAreaClosed (S : SpeciesAreaPackage) : Prop :=
  S.powerLawConstant ∧ S.exponent ∧ S.areaRichnessLogLinear ∧ S.zValueGiven

theorem species_area_closed_from_evidence (S : SpeciesAreaPackage) (E : SpeciesAreaEvidence S) :
    SpeciesAreaClosed S := by
  exact And.intro E.powerLawConstantClosed
    (And.intro E.exponentClosed
      (And.intro E.areaRichnessLogLinearClosed E.zValueGivenClosed))

end EcologyBiodiversityCanonicalLaneLean
end HautevilleHouse
