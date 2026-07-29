import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyBiodiversityCanonicalLaneLean

structure EcosystemFunctionPackage (R : SpeciesRichnessPackage) where
  ecosystemProcess : Type u
  functionMeasure : Type v
  productivity : Prop
  stability : Prop

structure EcosystemFunctionEvidence {R : SpeciesRichnessPackage} (E : EcosystemFunctionPackage R) where
  productivityClosed : E.productivity
  stabilityClosed : E.stability

def EcosystemFunctionClosed {R : SpeciesRichnessPackage} (E : EcosystemFunctionPackage R) : Prop :=
  E.productivity ∧ E.stability

theorem ecosystem_function_closed_from_evidence {R : SpeciesRichnessPackage} (E : EcosystemFunctionPackage R) (Ev : EcosystemFunctionEvidence E) : EcosystemFunctionClosed E := by
  exact And.intro Ev.productivityClosed Ev.stabilityClosed

end EcologyBiodiversityCanonicalLaneLean
end HautevilleHouse