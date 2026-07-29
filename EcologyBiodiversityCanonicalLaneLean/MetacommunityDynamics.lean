import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyBiodiversityCanonicalLaneLean

structure MetacommunityPackage where
  patchCount : Nat
  colonizationRate : Float
  extinctionRate : Float
  dispersalKernel : Float
  patchDistanceMatrix : Type u
  colonizationExtinctionEquilibrium : Prop
  propaguleRain : Prop

def MetacommunityEquilibrium (M : MetacommunityPackage) : Prop :=
  M.colonizationRate > M.extinctionRate ∧ M.colonizationRate > 0.0

structure MetacommunityEvidence (M : MetacommunityPackage) where
  colonizationExtinctionEquilibriumClosed : M.colonizationExtinctionEquilibrium
  propaguleRainClosed : M.propaguleRain
  dispersalKernelPositive : M.dispersalKernel > 0.0

def MetacommunityClosed (M : MetacommunityPackage) : Prop :=
  M.colonizationExtinctionEquilibrium ∧ M.propaguleRain ∧ M.dispersalKernel > 0.0

theorem metacommunity_closed_from_evidence (M : MetacommunityPackage)
    (E : MetacommunityEvidence M) : MetacommunityClosed M := by
  exact And.intro E.colonizationExtinctionEquilibriumClosed
    (And.intro E.propaguleRainClosed E.dispersalKernelPositive)

end EcologyBiodiversityCanonicalLaneLean
end HautevilleHouse
