import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean

structure SeriesConvergencePackage where
  termSequence : ℕ → ℝ
  partialSums : ℕ → ℝ
  limitExists : Prop
  limitValue : ℝ
  cauchyCriterionSatisfied : Prop

structure SeriesConvergenceEvidence (S : SeriesConvergencePackage) where
  limitExistsClosed : S.limitExists
  limitValueClosed : S.limitValue = 0
  cauchyCriterionSatisfiedClosed : S.cauchyCriterionSatisfied

def SeriesConvergenceClosed (S : SeriesConvergencePackage) : Prop :=
  S.limitExists ∧ (S.limitValue = 0) ∧ S.cauchyCriterionSatisfied

theorem series_convergence_closed_from_evidence (S : SeriesConvergencePackage)
    (E : SeriesConvergenceEvidence S) : SeriesConvergenceClosed S := by
  exact And.intro E.limitExistsClosed (And.intro E.limitValueClosed E.cauchyCriterionSatisfiedClosed)

def ConvergenceAdmissibleClass : AdmissibleClass := {
  object := ()
  endpointSatisfied := True
  remainderRecorded := True
  gateWitness := Or.inl trivial
}

end ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean
end HautevilleHouse