import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean

structure ConvergenceDivergenceSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure ConvergenceDivergenceAdmittedObject where
  space : ConvergenceDivergenceSpace
  sequenceConvergent : Prop
  seriesConvergent : Prop
  functionContinuous : Prop
  conclusion : sequenceConvergent ∨ seriesConvergent ∨ functionContinuous

def ConvergenceDivergenceWitnessClosed (O : ConvergenceDivergenceAdmittedObject) : Prop :=
  O.sequenceConvergent ∨ O.seriesConvergent ∨ O.functionContinuous

end ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean
end HautevilleHouse