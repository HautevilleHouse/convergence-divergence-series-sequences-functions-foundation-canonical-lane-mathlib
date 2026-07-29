import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean

structure AbsoluteConvergencePackage (α : Type) [NormedAddCommGroup α] [TopologicalSpace α] where
  s : Series α
  sum : α
  seriesConverges : SeriesConvergencePackage α
  absoluteSeries : Series ℝ
  absoluteConverges : SeriesConvergencePackage ℝ
  absoluteCondition : partialSum absoluteSeries = λ n => ∑_{i=0}^n ‖s.terms i‖
  absoluteConvergesClosed : absoluteConverges.limitClosed

structure AbsoluteConvergenceEvidence {α : Type} [NormedAddCommGroup α] [TopologicalSpace α]
    (P : AbsoluteConvergencePackage α) where
  absoluteConvergesClosed : P.absoluteConvergesClosed

def AbsoluteConvergenceClosed {α : Type} [NormedAddCommGroup α] [TopologicalSpace α]
    (P : AbsoluteConvergencePackage α) : Prop :=
  P.absoluteConvergesClosed

theorem absolute_convergence_closed_from_evidence {α : Type} [NormedAddCommGroup α] [TopologicalSpace α]
    (P : AbsoluteConvergencePackage α) (E : AbsoluteConvergenceEvidence P) :
    AbsoluteConvergenceClosed P := by
  exact E.absoluteConvergesClosed

end ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean
end HautevilleHouse