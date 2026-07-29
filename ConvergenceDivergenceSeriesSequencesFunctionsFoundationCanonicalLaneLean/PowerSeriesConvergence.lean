import HautevilleHouse.ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean.DivergenceTests

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean

structure PowerSeriesPackage where
  coefficientSequence : Type u → Type v
  center : Type w
  radiusOfConvergence : Prop
  intervalOfConvergence : Prop
  analyticFunction : Prop

structure PowerSeriesEvidence (P : PowerSeriesPackage) where
  radiusOfConvergenceClosed : P.radiusOfConvergence
  intervalOfConvergenceClosed : P.intervalOfConvergence
  analyticFunctionClosed : P.analyticFunction

def PowerSeriesClosed (P : PowerSeriesPackage) : Prop :=
  P.radiusOfConvergence ∧ P.intervalOfConvergence ∧ P.analyticFunction

theorem power_series_closed_from_evidence (P : PowerSeriesPackage) (E : PowerSeriesEvidence P) :
    PowerSeriesClosed P := by
  exact And.intro E.radiusOfConvergenceClosed (And.intro E.intervalOfConvergenceClosed E.analyticFunctionClosed)

end ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean
end HautevilleHouse
