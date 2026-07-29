import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyBiodiversityCanonicalLaneLean

structure NeutralTheoryPackage where
  speciationRate : Type u
  communitySize : Type v
  relativeAbundanceDistribution : Prop
  metacommunityDynamics : Prop
  dispersalLimitation : Prop
  zeroSumAssumption : Prop

structure NeutralTheoryEvidence (N : NeutralTheoryPackage) where
  relativeAbundanceDistributionClosed : N.relativeAbundanceDistribution
  metacommunityDynamicsClosed : N.metacommunityDynamics
  dispersalLimitationClosed : N.dispersalLimitation
  zeroSumAssumptionClosed : N.zeroSumAssumption

def NeutralTheoryClosed (N : NeutralTheoryPackage) : Prop :=
  N.relativeAbundanceDistribution ∧ N.metacommunityDynamics ∧
  N.dispersalLimitation ∧ N.zeroSumAssumption

theorem neutral_theory_closed_from_evidence (N : NeutralTheoryPackage) (E : NeutralTheoryEvidence N) :
    NeutralTheoryClosed N := by
  exact And.intro E.relativeAbundanceDistributionClosed
    (And.intro E.metacommunityDynamicsClosed
      (And.intro E.dispersalLimitationClosed E.zeroSumAssumptionClosed))

end EcologyBiodiversityCanonicalLaneLean
end HautevilleHouse
