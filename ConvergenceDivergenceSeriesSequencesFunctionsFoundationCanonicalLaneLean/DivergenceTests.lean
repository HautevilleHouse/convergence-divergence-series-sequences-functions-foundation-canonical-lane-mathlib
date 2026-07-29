import HautevilleHouse.ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean.SeriesSummability

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean

structure DivergenceTestPackage where
  series : Type u
  termTest : Prop
  comparisonTest : Prop
  ratioTest : Prop
  rootTest : Prop
  integralTest : Prop

structure DivergenceTestEvidence (D : DivergenceTestPackage) where
  termTestClosed : D.termTest
  comparisonTestClosed : D.comparisonTest
  ratioTestClosed : D.ratioTest
  rootTestClosed : D.rootTest
  integralTestClosed : D.integralTest

def DivergenceTestClosed (D : DivergenceTestPackage) : Prop :=
  D.termTest ∧ D.comparisonTest ∧ D.ratioTest ∧ D.rootTest ∧ D.integralTest

theorem divergence_test_closed_from_evidence (D : DivergenceTestPackage) (E : DivergenceTestEvidence D) :
    DivergenceTestClosed D := by
  exact And.intro E.termTestClosed
    (And.intro E.comparisonTestClosed
      (And.intro E.ratioTestClosed (And.intro E.rootTestClosed E.integralTestClosed)))

end ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean
end HautevilleHouse
