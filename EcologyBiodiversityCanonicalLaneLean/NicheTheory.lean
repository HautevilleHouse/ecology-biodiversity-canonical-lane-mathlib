import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyBiodiversityCanonicalLaneLean

structure NicheTheoryPackage where
  species : Type u
  resources : Type v
  competitionMatrix : species -> species -> ℝ
  competitiveExclusion : Prop
  stableCoexistence : Prop
  competitiveExclusionTerm : competitiveExclusion
  stableCoexistenceTerm : stableCoexistence

structure NicheTheoryEvidence (NT : NicheTheoryPackage) where
  competitiveExclusionClosed : NT.competitiveExclusion
  stableCoexistenceClosed : NT.stableCoexistence

def NicheTheoryClosed (NT : NicheTheoryPackage) : Prop :=
  NT.competitiveExclusion ∧ NT.stableCoexistence

theorem niche_theory_closed_from_evidence
    (NT : NicheTheoryPackage) (E : NicheTheoryEvidence NT) :
    NicheTheoryClosed NT := by
  exact And.intro E.competitiveExclusionClosed E.stableCoexistenceClosed

end EcologyBiodiversityCanonicalLaneLean
end HautevilleHouse