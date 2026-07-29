import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyBiodiversityCanonicalLaneLean

structure CommunityAssemblyFilterPackage where
  environmentalFilters : Type u
  bioticInteractions : Type v
  dispersalLimitation : Prop
  abioticTolerance : Prop
  traitBasedAssembly : Prop
  priorityEffects : Prop
  successionalTrajectory : Prop

def FilterHierarchy (C : CommunityAssemblyFilterPackage) : Prop :=
  C.dispersalLimitation ∧ C.abioticTolerance ∧ C.traitBasedAssembly

structure CommunityAssemblyEvidence (C : CommunityAssemblyFilterPackage) where
  dispersalLimitationClosed : C.dispersalLimitation
  abioticToleranceClosed : C.abioticTolerance
  traitBasedAssemblyClosed : C.traitBasedAssembly
  priorityEffectsClosed : C.priorityEffects
  successionalTrajectoryClosed : C.successionalTrajectory

def CommunityAssemblyClosed (C : CommunityAssemblyFilterPackage) : Prop :=
  FilterHierarchy C ∧ C.priorityEffects ∧ C.successionalTrajectory

theorem community_assembly_closed_from_evidence
    (C : CommunityAssemblyFilterPackage) (E : CommunityAssemblyEvidence C) :
    CommunityAssemblyClosed C := by
  have hFilter : FilterHierarchy C := And.intro E.dispersalLimitationClosed
    (And.intro E.abioticToleranceClosed E.traitBasedAssemblyClosed)
  exact And.intro hFilter (And.intro E.priorityEffectsClosed E.successionalTrajectoryClosed)

end EcologyBiodiversityCanonicalLaneLean
end HautevilleHouse
