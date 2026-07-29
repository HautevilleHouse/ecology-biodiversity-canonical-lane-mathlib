import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyBiodiversityCanonicalLaneLean

structure NichePartitioningPackage where
  resourceTypes : Nat
  speciesCount : Nat
  nicheBreadth : Float
  nicheOverlap : Float
  competitiveExclusion : Prop
  limitingSimilarity : Prop
  gaussianResourceUtilization : Prop

def CoexistenceCondition (N : NichePartitioningPackage) : Prop :=
  N.nicheOverlap < 1.0 / N.speciesCount.toFloat

structure NichePartitioningEvidence (N : NichePartitioningPackage) where
  competitiveExclusionClosed : N.competitiveExclusion
  limitingSimilarityClosed : N.limitingSimilarity
  gaussianResourceUtilizationClosed : N.gaussianResourceUtilization

def NichePartitioningClosed (N : NichePartitioningPackage) : Prop :=
  N.competitiveExclusion ∧ N.limitingSimilarity ∧ N.gaussianResourceUtilization

theorem niche_partitioning_closed_from_evidence (N : NichePartitioningPackage)
    (E : NichePartitioningEvidence N) : NichePartitioningClosed N := by
  exact And.intro E.competitiveExclusionClosed
    (And.intro E.limitingSimilarityClosed E.gaussianResourceUtilizationClosed)

end EcologyBiodiversityCanonicalLaneLean
end HautevilleHouse
