import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean.SequenceAdmissible

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean

structure FunctionSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure FunctionSequencePackage (X : FunctionSpace) where
  functions : ℕ → (X.carrier → ℝ)
  pointwiseLimit : X.carrier → ℝ
  pointwiseConvergence : Prop
  uniformConvergence : Prop
  uniformLimit : X.carrier → ℝ
  uniformConvergenceImpliesPointwise : uniformConvergence → pointwiseConvergence

structure FunctionSequenceEvidence {X : FunctionSpace} (F : FunctionSequencePackage X) where
  pointwiseConvergenceClosed : F.pointwiseConvergence
  uniformConvergenceClosed : F.uniformConvergence
  uniformImpliesPointwiseClosed : F.uniformConvergenceImpliesPointwise F.uniformConvergenceClosed

def FunctionSequenceClosed {X : FunctionSpace} (F : FunctionSequencePackage X) : Prop :=
  F.pointwiseConvergence ∧ F.uniformConvergence

theorem function_sequence_closed_from_evidence
    {X : FunctionSpace} (F : FunctionSequencePackage X) (E : FunctionSequenceEvidence F) :
    FunctionSequenceClosed F := by
  exact And.intro E.pointwiseConvergenceClosed E.uniformConvergenceClosed

end ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean
end HautevilleHouse