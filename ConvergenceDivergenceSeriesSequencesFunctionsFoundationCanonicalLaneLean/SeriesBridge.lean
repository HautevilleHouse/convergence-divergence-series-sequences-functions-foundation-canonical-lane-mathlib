import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean.SequenceAdmissible

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean

def bridgeClosed (A : ConvergenceAdmissibleClass) : Prop :=
  A.object.convergenceType ∧ A.object.limitExistence

theorem bridge_from_admissible_class (A : ConvergenceAdmissibleClass) : bridgeClosed A := by
  exact And.intro A.object.convergenceType A.object.limitExistence

end ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean
end HautevilleHouse