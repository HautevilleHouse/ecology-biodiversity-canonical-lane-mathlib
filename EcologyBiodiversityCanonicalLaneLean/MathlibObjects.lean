import EcologyBiodiversityCanonicalLaneLean.TheoremStatement
import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace EcologyBiodiversityCanonicalLaneLean

structure BiodiversitySpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure BiodiversityAdmittedObject where
  space : BiodiversitySpace
  closedThreeManifold : Prop
  simplyConnected : Prop
  sphereModel : Type
  sphereTopology : TopologicalSpace sphereModel
  homeomorphicToSphere : Prop
  conclusion : homeomorphicToSphere

structure BiodiversityEndgameState where
  object : BiodiversityAdmittedObject

def BiodiversityWitnessClosed (O : BiodiversityAdmittedObject) : Prop :=
  O.homeomorphicToSphere

end EcologyBiodiversityCanonicalLaneLean
end HautevilleHouse