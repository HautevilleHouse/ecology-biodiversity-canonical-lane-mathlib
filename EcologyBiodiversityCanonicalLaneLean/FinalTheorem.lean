import canonicalLaneMathlib.AdmissibleClass
import EcologyBiodiversityCanonicalLaneLean.SpeciesAreaRelationship
import EcologyBiodiversityCanonicalLaneLean.IslandBiogeographyEquilibrium
import EcologyBiodiversityCanonicalLaneLean.NeutralTheoryofBiodiversity

namespace HautevilleHouse
namespace EcologyBiodiversityCanonicalLaneLean

def ConstrainedEcologyBiodiversityClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_ecology_biodiversity_endgame (A : AdmissibleClass) :
    ConstrainedEcologyBiodiversityClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end EcologyBiodiversityCanonicalLaneLean
end HautevilleHouse
