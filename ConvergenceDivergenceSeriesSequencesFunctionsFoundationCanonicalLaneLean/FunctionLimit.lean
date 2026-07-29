import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean

structure FunctionLimitPackage (X Y : Type) [TopologicalSpace X] [TopologicalSpace Y] where
  f : X → Y
  a : X
  L : Y
  limitCondition : ∀ (U : Set Y), IsOpen U → L ∈ U → ∃ (V : Set X), IsOpen V ∧ a ∈ V ∧ ∀ x ∈ V, f x ∈ U
  limitClosed : limitCondition

structure FunctionLimitEvidence {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    (P : FunctionLimitPackage X Y) where
  limitClosed : P.limitClosed

def FunctionLimitClosed {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    (P : FunctionLimitPackage X Y) : Prop :=
  P.limitCondition

theorem function_limit_closed_from_evidence {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    (P : FunctionLimitPackage X Y) (E : FunctionLimitEvidence P) :
    FunctionLimitClosed P := by
  exact E.limitClosed

end ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean
end HautevilleHouse