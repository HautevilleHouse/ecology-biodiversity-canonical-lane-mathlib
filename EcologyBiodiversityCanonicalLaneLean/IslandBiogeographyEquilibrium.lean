import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyBiodiversityCanonicalLaneLean

structure IslandBiogeographyPackage where
  immigrationRate : Type u
  extinctionRate : Type v
  equilibriumRichness : Prop
  turnoverRate : Prop
  areaEffect : Prop
  distanceEffect : Prop

structure IslandBiogeographyEvidence (I : IslandBiogeographyPackage) where
  equilibriumRichnessClosed : I.equilibriumRichness
  turnoverRateClosed : I.turnoverRate
  areaEffectClosed : I.areaEffect
  distanceEffectClosed : I.distanceEffect

def IslandBiogeographyClosed (I : IslandBiogeographyPackage) : Prop :=
  I.equilibriumRichness ∧ I.turnoverRate ∧ I.areaEffect ∧ I.distanceEffect

theorem island_biogeography_closed_from_evidence (I : IslandBiogeographyPackage) (E : IslandBiogeographyEvidence I) :
    IslandBiogeographyClosed I := by
  exact And.intro E.equilibriumRichnessClosed
    (And.intro E.turnoverRateClosed
      (And.intro E.areaEffectClosed E.distanceEffectClosed))

end EcologyBiodiversityCanonicalLaneLean
end HautevilleHouse
