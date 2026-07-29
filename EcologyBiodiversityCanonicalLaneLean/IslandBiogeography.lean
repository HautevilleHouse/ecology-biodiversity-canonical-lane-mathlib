import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyBiodiversityCanonicalLaneLean

structure IslandBiogeographyPackage where
  island : Type u
  speciesRichness : island -> Nat
  immigrationRate : island -> ℝ
  extinctionRate : island -> ℝ
  equilibriumRichness : island -> ℝ
  equilibriumRichnessTerm : equilibriumRichness = fun i => (immigrationRate i) / (extinctionRate i)

structure IslandBiogeographyEvidence (IB : IslandBiogeographyPackage) where
  equilibriumRichnessClosed : IB.equilibriumRichness = fun i => (IB.immigrationRate i) / (IB.extinctionRate i)

def IslandBiogeographyClosed (IB : IslandBiogeographyPackage) : Prop :=
  IB.equilibriumRichness = fun i => (IB.immigrationRate i) / (IB.extinctionRate i)

theorem island_biogeography_closed_from_evidence
    (IB : IslandBiogeographyPackage) (E : IslandBiogeographyEvidence IB) :
    IslandBiogeographyClosed IB := by
  exact E.equilibriumRichnessClosed

end EcologyBiodiversityCanonicalLaneLean
end HautevilleHouse