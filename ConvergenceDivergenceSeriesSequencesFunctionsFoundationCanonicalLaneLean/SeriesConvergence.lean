import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean

structure SeriesConvergencePackage where
  termTest : Prop
  partialSumBound : Prop
  absoluteConvergence : Prop
  termTestClosed : termTest
  partialSumBoundClosed : partialSumBound
  absoluteConvergenceClosed : absoluteConvergence

structure SeriesConvergenceEvidence (S : SeriesConvergencePackage) where
  termTestClosed : S.termTest
  partialSumBoundClosed : S.partialSumBound
  absoluteConvergenceClosed : S.absoluteConvergence

def SeriesConvergenceClosed (S : SeriesConvergencePackage) : Prop :=
  S.termTest ∧ S.partialSumBound ∧ S.absoluteConvergence

theorem series_convergence_closed_from_evidence (S : SeriesConvergencePackage) (E : SeriesConvergenceEvidence S) : SeriesConvergenceClosed S := by
  exact And.intro E.termTestClosed (And.intro E.partialSumBoundClosed E.absoluteConvergenceClosed)

end ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean
end HautevilleHouse