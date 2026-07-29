import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyBiodiversityCanonicalLaneLean

structure PopulationDynamicsPackage where
  carryingCapacity : ℕ
  growthRate : ℝ
  initialPopulation : ℕ
  predationPressure : ℝ
  logisticEquation : Prop

structure PopulationDynamicsEvidence (P : PopulationDynamicsPackage) where
  carryingCapacityPositive : P.carryingCapacity > 0
  growthRatePositive : P.growthRate > 0
  initialPopulationNonnegative : P.initialPopulation ≥ 0
  predationPressureNonnegative : P.predationPressure ≥ 0
  logisticEquationClosed : P.logisticEquation

def PopulationDynamicsClosed (P : PopulationDynamicsPackage) : Prop :=
  P.carryingCapacity > 0 ∧ P.growthRate > 0 ∧ P.initialPopulation ≥ 0 ∧ P.predationPressure ≥ 0 ∧ P.logisticEquation

theorem population_dynamics_closed_from_evidence (P : PopulationDynamicsPackage) (E : PopulationDynamicsEvidence P) :
    PopulationDynamicsClosed P := by
  exact And.intro E.carryingCapacityPositive
    (And.intro E.growthRatePositive
      (And.intro E.initialPopulationNonnegative
        (And.intro E.predationPressureNonnegative E.logisticEquationClosed)))

end EcologyBiodiversityCanonicalLaneLean
end HautevilleHouse