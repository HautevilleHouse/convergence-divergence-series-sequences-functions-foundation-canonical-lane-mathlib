import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ConvergenceWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.convergenceWitness

end ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean
end HautevilleHouse