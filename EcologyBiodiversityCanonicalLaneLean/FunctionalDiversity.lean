import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyBiodiversityCanonicalLaneLean

structure FunctionalDiversityPackage (R : SpeciesRichnessPackage) where
  traitSpace : Type u
  traitDistance : Type v
  functionalDispersion : Prop
  nicheComplementarity : Prop

structure FunctionalDiversityEvidence {R : SpeciesRichnessPackage} (F : FunctionalDiversityPackage R) where
  functionalDispersionClosed : F.functionalDispersion
  nicheComplementarityClosed : F.nicheComplementarity

def FunctionalDiversityClosed {R : SpeciesRichnessPackage} (F : FunctionalDiversityPackage R) : Prop :=
  F.functionalDispersion ∧ F.nicheComplementarity

theorem functional_diversity_closed_from_evidence {R : SpeciesRichnessPackage} (F : FunctionalDiversityPackage R) (E : FunctionalDiversityEvidence F) : FunctionalDiversityClosed F := by
  exact And.intro E.functionalDispersionClosed E.nicheComplementarityClosed

end EcologyBiodiversityCanonicalLaneLean
end HautevilleHouse