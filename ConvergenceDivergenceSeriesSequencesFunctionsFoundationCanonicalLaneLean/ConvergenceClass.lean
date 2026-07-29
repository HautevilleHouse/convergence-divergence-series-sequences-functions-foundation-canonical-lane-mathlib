import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean

structure ConvergenceObject where
  space : Type
  sequence : Nat -> space
  limit : space
  convergenceWitness : Prop

structure AdmissibleClass where
  object : ConvergenceObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ConvergenceWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

def ConvergenceWitnessClosed (O : ConvergenceObject) : Prop :=
  O.convergenceWitness

end ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean
end HautevilleHouse