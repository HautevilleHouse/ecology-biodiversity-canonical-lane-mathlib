import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyBiodiversityCanonicalLaneLean

structure SpeciesRichnessPackage where
  community : Type u
  abundanceDistribution : Type v
  richnessIndex : Nat
  shannonEntropy : Float
  simpsonIndex : Float
  evennessMeasure : Float
  samplingCoverage : Prop
  rarefactionCurve : Prop
  logNormalFit : Prop

structure SpeciesRichnessEvidence (S : SpeciesRichnessPackage) where
  samplingCoverageClosed : S.samplingCoverage
  rarefactionCurveClosed : S.rarefactionCurve
  logNormalFitClosed : S.logNormalFit

def SpeciesRichnessClosed (S : SpeciesRichnessPackage) : Prop :=
  S.samplingCoverage ∧ S.rarefactionCurve ∧ S.logNormalFit

theorem species_richness_closed_from_evidence (S : SpeciesRichnessPackage)
    (E : SpeciesRichnessEvidence S) : SpeciesRichnessClosed S := by
  exact And.intro E.samplingCoverageClosed
    (And.intro E.rarefactionCurveClosed E.logNormalFitClosed)

end EcologyBiodiversityCanonicalLaneLean
end HautevilleHouse
