import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyBiodiversityCanonicalLaneLean

structure PhylogeneticDiversityPackage (R : SpeciesRichnessPackage) where
  phylogeneticTree : Type u
  branchLengthMeasure : Type v
  evolutionaryDistinctiveness : Prop
  conservationPriority : Prop

structure PhylogeneticDiversityEvidence {R : SpeciesRichnessPackage} (P : PhylogeneticDiversityPackage R) where
  evolutionaryDistinctivenessClosed : P.evolutionaryDistinctiveness
  conservationPriorityClosed : P.conservationPriority

def PhylogeneticDiversityClosed {R : SpeciesRichnessPackage} (P : PhylogeneticDiversityPackage R) : Prop :=
  P.evolutionaryDistinctiveness ∧ P.conservationPriority

theorem phylogenetic_diversity_closed_from_evidence {R : SpeciesRichnessPackage} (P : PhylogeneticDiversityPackage R) (E : PhylogeneticDiversityEvidence P) : PhylogeneticDiversityClosed P := by
  exact And.intro E.evolutionaryDistinctivenessClosed E.conservationPriorityClosed

end EcologyBiodiversityCanonicalLaneLean
end HautevilleHouse