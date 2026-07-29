import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean

structure SequenceSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure AdmittedSequenceObject where
  space : SequenceSpace
  sequence : ℕ → space.carrier
  convergenceType : Prop  -- e.g., converges to some limit
  limitExistence : Prop
  conclusion : convergenceType ∧ limitExistence

structure ConvergenceAdmissibleClass where
  object : AdmittedSequenceObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : ConvergenceAdmissibleClass) : Prop :=
  (A.object.convergenceType ∧ A.object.limitExistence) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean
end HautevilleHouse