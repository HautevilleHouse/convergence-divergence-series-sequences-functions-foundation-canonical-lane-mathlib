import HautevilleHouse.ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean.ConvergenceCriteria

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean

structure UniformConvergencePackage where
  functionSequence : Type u → Type v
  domain : Type w
  uniformLimit : Prop
  pointwiseLimit : Prop
  uniformCauchy : Prop

structure UniformConvergenceEvidence (U : UniformConvergencePackage) where
  uniformLimitClosed : U.uniformLimit
  pointwiseLimitClosed : U.pointwiseLimit
  uniformCauchyClosed : U.uniformCauchy

def UniformConvergenceClosed (U : UniformConvergencePackage) : Prop :=
  U.uniformLimit ∧ U.pointwiseLimit ∧ U.uniformCauchy

theorem uniform_convergence_closed_from_evidence (U : UniformConvergencePackage) (E : UniformConvergenceEvidence U) :
    UniformConvergenceClosed U := by
  exact And.intro E.uniformLimitClosed (And.intro E.pointwiseLimitClosed E.uniformCauchyClosed)

end ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean
end HautevilleHouse
