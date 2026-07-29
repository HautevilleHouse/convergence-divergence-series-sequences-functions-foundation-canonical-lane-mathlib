import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean

structure SequenceConvergencePackage where
  terms : ℕ → ℝ
  limitValue : ℝ
  epsilonCondition : Prop
  cauchyCondition : Prop

structure SequenceConvergenceEvidence (S : SequenceConvergencePackage) where
  epsilonConditionClosed : S.epsilonCondition
  cauchyConditionClosed : S.cauchyCondition

def SequenceConvergenceClosed (S : SequenceConvergencePackage) : Prop :=
  S.epsilonCondition ∧ S.cauchyCondition

theorem sequence_convergence_closed_from_evidence (S : SequenceConvergencePackage)
    (E : SequenceConvergenceEvidence S) : SequenceConvergenceClosed S := by
  exact And.intro E.epsilonConditionClosed E.cauchyConditionClosed

def convergenceBridgeClosed (A : AdmissibleClass) : Prop :=
  SequenceConvergenceClosed (A.object : SequenceConvergencePackage)

theorem convergence_bridge_from_admissible_class (A : AdmissibleClass) :
    convergenceBridgeClosed A := by
  sorry

def convergenceGateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem convergence_gate_from_admissible_class (A : AdmissibleClass) :
    convergenceGateClosed A := by
  exact A.gateWitness

def ConstrainedConvergenceClosure (A : AdmissibleClass) : Prop :=
  convergenceBridgeClosed A ∧ convergenceGateClosed A

theorem constrained_convergence_endgame (A : AdmissibleClass) :
    ConstrainedConvergenceClosure A := by
  exact And.intro (convergence_bridge_from_admissible_class A) (convergence_gate_from_admissible_class A)

end ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean
end HautevilleHouse