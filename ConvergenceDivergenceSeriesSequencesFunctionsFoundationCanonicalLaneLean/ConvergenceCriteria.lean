import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean

structure ConvergencePackage where
  sequenceType : Type u
  limitType : Type v
  convergenceDefined : Prop
  cauchyCriterion : Prop
  limitUniqueness : Prop

structure ConvergenceEvidence (C : ConvergencePackage) where
  convergenceDefinedClosed : C.convergenceDefined
  cauchyCriterionClosed : C.cauchyCriterion
  limitUniquenessClosed : C.limitUniqueness

def ConvergenceClosed (C : ConvergencePackage) : Prop :=
  C.convergenceDefined ∧ C.cauchyCriterion ∧ C.limitUniqueness

theorem convergence_closed_from_evidence (C : ConvergencePackage) (E : ConvergenceEvidence C) :
    ConvergenceClosed C := by
  exact And.intro E.convergenceDefinedClosed (And.intro E.cauchyCriterionClosed E.limitUniquenessClosed)

end ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean
end HautevilleHouse
