import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean

structure FunctionSequencePackage where
  domainType : Type
  functions : ℕ → domainType → ℝ
  pointwiseLimit : domainType → ℝ
  uniformLimit : domainType → ℝ
  uniformCauchyCondition : Prop
  uniformConvergenceCondition : Prop

structure FunctionSequenceEvidence (F : FunctionSequencePackage) where
  uniformCauchyConditionClosed : F.uniformCauchyCondition
  uniformConvergenceConditionClosed : F.uniformConvergenceCondition

def FunctionSequenceClosed (F : FunctionSequencePackage) : Prop :=
  F.uniformCauchyCondition ∧ F.uniformConvergenceCondition

theorem function_sequence_closed_from_evidence (F : FunctionSequencePackage)
    (E : FunctionSequenceEvidence F) : FunctionSequenceClosed F := by
  exact And.intro E.uniformCauchyConditionClosed E.uniformConvergenceConditionClosed

def functionBridgeClosed (A : AdmissibleClass) : Prop :=
  FunctionSequenceClosed (A.object : FunctionSequencePackage)

theorem function_bridge_from_admissible_class (A : AdmissibleClass) :
    functionBridgeClosed A := by
  sorry

def functionGateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem function_gate_from_admissible_class (A : AdmissibleClass) :
    functionGateClosed A := by
  exact A.gateWitness

def ConstrainedFunctionClosure (A : AdmissibleClass) : Prop :=
  functionBridgeClosed A ∧ functionGateClosed A

theorem constrained_function_endgame (A : AdmissibleClass) :
    ConstrainedFunctionClosure A := by
  exact And.intro (function_bridge_from_admissible_class A) (function_gate_from_admissible_class A)

end ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean
end HautevilleHouse