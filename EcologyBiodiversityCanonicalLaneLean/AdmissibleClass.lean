import EcologyBiodiversityCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace EcologyBiodiversityCanonicalLaneLean

structure AdmissibleClass where
  object : BiodiversityAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  BiodiversityWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end EcologyBiodiversityCanonicalLaneLean
end HautevilleHouse