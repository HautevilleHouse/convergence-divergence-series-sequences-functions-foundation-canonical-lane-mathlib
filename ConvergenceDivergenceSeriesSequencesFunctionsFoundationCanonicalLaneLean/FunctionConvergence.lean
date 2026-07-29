import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean

structure FunctionConvergencePackage where
  pointwiseConvergence : (Nat -> ℝ -> ℝ) -> ℝ -> Prop
  uniformConvergence : (Nat -> ℝ -> ℝ) -> ℝ -> Prop
  uniformCauchyCriterion : Prop
  continuityPreserved : Prop
  differentiableLimit : Prop

structure FunctionConvergenceEvidence (F : FunctionConvergencePackage) where
  pointwiseConvergenceClosed : F.pointwiseConvergence
  uniformConvergenceClosed : F.uniformConvergence
  uniformCauchyCriterionClosed : F.uniformCauchyCriterion
  continuityPreservedClosed : F.continuityPreserved
  differentiableLimitClosed : F.differentiableLimit

def FunctionConvergenceClosed (F : FunctionConvergencePackage) : Prop :=
  F.pointwiseConvergence ∧ F.uniformConvergence ∧ F.uniformCauchyCriterion ∧
  F.continuityPreserved ∧ F.differentiableLimit

theorem function_convergence_closed_from_evidence
    (F : FunctionConvergencePackage) (E : FunctionConvergenceEvidence F) :
    FunctionConvergenceClosed F := by
  exact And.intro E.pointwiseConvergenceClosed
    (And.intro E.uniformConvergenceClosed
      (And.intro E.uniformCauchyCriterionClosed
        (And.intro E.continuityPreservedClosed E.differentiableLimitClosed)))

end ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean
end HautevilleHouse