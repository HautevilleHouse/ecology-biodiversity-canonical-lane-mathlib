import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyBiodiversityCanonicalLaneLean

structure EcosystemFunctionBiodiversityPackage where
  productivityMeasure : Float
  stabilityIndex : Float
  nutrientCyclingRate : Float
  functionalDiversity : Float
  speciesRichness : Nat
  functionalRedundancy : Prop
  complementarityEffect : Prop
  samplingEffect : Prop

def BEFRelationship (E : EcosystemFunctionBiodiversityPackage) : Prop :=
  E.productivityMeasure > 0.0 ∧ E.functionalDiversity > 0.0

structure EcosystemFunctionEvidence (E : EcosystemFunctionBiodiversityPackage) where
  functionalRedundancyClosed : E.functionalRedundancy
  complementarityEffectClosed : E.complementarityEffect
  samplingEffectClosed : E.samplingEffect
  befRelationshipClosed : BEFRelationship E

def EcosystemFunctionBiodiversityClosed (E : EcosystemFunctionBiodiversityPackage) : Prop :=
  E.functionalRedundancy ∧ E.complementarityEffect ∧ E.samplingEffect ∧ BEFRelationship E

theorem ecosystem_function_closed_from_evidence
    (E : EcosystemFunctionBiodiversityPackage) (Ev : EcosystemFunctionEvidence E) :
    EcosystemFunctionBiodiversityClosed E := by
  exact And.intro Ev.functionalRedundancyClosed
    (And.intro Ev.complementarityEffectClosed
      (And.intro Ev.samplingEffectClosed Ev.befRelationshipClosed))

end EcologyBiodiversityCanonicalLaneLean
end HautevilleHouse
