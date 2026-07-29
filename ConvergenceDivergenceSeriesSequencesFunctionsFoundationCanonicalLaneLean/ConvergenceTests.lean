import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean

structure ConvergenceTestPackage where
  ratioTest : Prop
  rootTest : Prop
  integralTest : Prop
  comparisonTest : Prop
  alternatingSeriesTest : Prop

structure ConvergenceTestEvidence (T : ConvergenceTestPackage) where
  ratioTestClosed : T.ratioTest
  rootTestClosed : T.rootTest
  integralTestClosed : T.integralTest
  comparisonTestClosed : T.comparisonTest
  alternatingSeriesTestClosed : T.alternatingSeriesTest

def ConvergenceTestClosed (T : ConvergenceTestPackage) : Prop :=
  T.ratioTest ∧ T.rootTest ∧ T.integralTest ∧ T.comparisonTest ∧ T.alternatingSeriesTest

theorem convergence_test_closed_from_evidence
    (T : ConvergenceTestPackage) (E : ConvergenceTestEvidence T) :
    ConvergenceTestClosed T := by
  exact And.intro E.ratioTestClosed
    (And.intro E.rootTestClosed
      (And.intro E.integralTestClosed
        (And.intro E.comparisonTestClosed E.alternatingSeriesTestClosed)))

end ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean
end HautevilleHouse