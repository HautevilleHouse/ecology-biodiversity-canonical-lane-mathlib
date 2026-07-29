import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyBiodiversityCanonicalLaneLean

structure BetaDiversityPackage (R : SpeciesRichnessPackage) where
  communityPairs : Type u
  dissimilarityMeasure : Type v
  turnoverComponent : Prop
  nestednessComponent : Prop

structure BetaDiversityEvidence {R : SpeciesRichnessPackage} (B : BetaDiversityPackage R) where
  turnoverComponentClosed : B.turnoverComponent
  nestednessComponentClosed : B.nestednessComponent

def BetaDiversityClosed {R : SpeciesRichnessPackage} (B : BetaDiversityPackage R) : Prop :=
  B.turnoverComponent ∧ B.nestednessComponent

theorem beta_diversity_closed_from_evidence {R : SpeciesRichnessPackage} (B : BetaDiversityPackage R) (E : BetaDiversityEvidence B) : BetaDiversityClosed B := by
  exact And.intro E.turnoverComponentClosed E.nestednessComponentClosed

end EcologyBiodiversityCanonicalLaneLean
end HautevilleHouse