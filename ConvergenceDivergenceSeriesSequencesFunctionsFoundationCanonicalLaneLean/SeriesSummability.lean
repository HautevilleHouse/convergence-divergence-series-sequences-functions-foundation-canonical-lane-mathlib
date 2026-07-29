import HautevilleHouse.ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean.ConvergenceCriteria

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean

structure SeriesPackage where
  termSequence : Type u → Type v
  partialSums : Type w
  convergenceType : Prop
  absoluteConvergence : Prop
  conditionalConvergence : Prop

structure SeriesEvidence (S : SeriesPackage) where
  convergenceTypeClosed : S.convergenceType
  absoluteConvergenceClosed : S.absoluteConvergence
  conditionalConvergenceClosed : S.conditionalConvergence

def SeriesClosed (S : SeriesPackage) : Prop :=
  S.convergenceType ∧ S.absoluteConvergence ∧ S.conditionalConvergence

theorem series_closed_from_evidence (S : SeriesPackage) (E : SeriesEvidence S) :
    SeriesClosed S := by
  exact And.intro E.convergenceTypeClosed (And.intro E.absoluteConvergenceClosed E.conditionalConvergenceClosed)

end ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean
end HautevilleHouse
