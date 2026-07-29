import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean

structure SeriesUniformConvergencePackage where
  series : (Nat -> ℝ) -> ℝ
  termwiseConverges : Prop
  uniformConvergence : Prop
  cauchyCriterion : Prop
  weierstrassMTest : Prop

structure SeriesUniformConvergenceEvidence (S : SeriesUniformConvergencePackage) where
  termwiseConvergesClosed : S.termwiseConverges
  uniformConvergenceClosed : S.uniformConvergence
  cauchyCriterionClosed : S.cauchyCriterion
  weierstrassMTestClosed : S.weierstrassMTest

def SeriesUniformConvergenceClosed (S : SeriesUniformConvergencePackage) : Prop :=
  S.termwiseConverges ∧ S.uniformConvergence ∧ S.cauchyCriterion ∧ S.weierstrassMTest

theorem series_uniform_convergence_closed_from_evidence
    (S : SeriesUniformConvergencePackage) (E : SeriesUniformConvergenceEvidence S) :
    SeriesUniformConvergenceClosed S := by
  exact And.intro E.termwiseConvergesClosed
    (And.intro E.uniformConvergenceClosed
      (And.intro E.cauchyCriterionClosed E.weierstrassMTestClosed))

end ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean
end HautevilleHouse