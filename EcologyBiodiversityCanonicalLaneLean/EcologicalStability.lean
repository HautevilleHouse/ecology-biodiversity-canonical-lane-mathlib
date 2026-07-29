import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyBiodiversityCanonicalLaneLean

structure EcologicalStabilityPackage where
  equilibrium : Prop
  resilience : Prop
  resistance : Prop
  equilibriumTerm : equilibrium
  resilienceTerm : resilience
  resistanceTerm : resistance

structure EcologicalStabilityEvidence (ES : EcologicalStabilityPackage) where
  equilibriumClosed : ES.equilibrium
  resilienceClosed : ES.resilience
  resistanceClosed : ES.resistance

def EcologicalStabilityClosed (ES : EcologicalStabilityPackage) : Prop :=
  ES.equilibrium ∧ ES.resilience ∧ ES.resistance

theorem ecological_stability_closed_from_evidence
    (ES : EcologicalStabilityPackage) (E : EcologicalStabilityEvidence ES) :
    EcologicalStabilityClosed ES := by
  exact And.intro E.equilibriumClosed (And.intro E.resilienceClosed E.resistanceClosed)

end EcologyBiodiversityCanonicalLaneLean
end HautevilleHouse