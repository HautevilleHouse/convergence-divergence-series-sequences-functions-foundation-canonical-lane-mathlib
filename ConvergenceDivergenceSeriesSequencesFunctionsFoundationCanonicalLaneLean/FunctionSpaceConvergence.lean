import HautevilleHouse.ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean.UniformConvergence

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean

structure FunctionSpacePackage where
  functionSpace : Type u → Type v
  normType : Type w
  completeness : Prop
  compactConvergence : Prop
  weakConvergence : Prop

structure FunctionSpaceEvidence (F : FunctionSpacePackage) where
  completenessClosed : F.completeness
  compactConvergenceClosed : F.compactConvergence
  weakConvergenceClosed : F.weakConvergence

def FunctionSpaceClosed (F : FunctionSpacePackage) : Prop :=
  F.completeness ∧ F.compactConvergence ∧ F.weakConvergence

theorem function_space_closed_from_evidence (F : FunctionSpacePackage) (E : FunctionSpaceEvidence F) :
    FunctionSpaceClosed F := by
  exact And.intro E.completenessClosed (And.intro E.compactConvergenceClosed E.weakConvergenceClosed)

end ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean
end HautevilleHouse
