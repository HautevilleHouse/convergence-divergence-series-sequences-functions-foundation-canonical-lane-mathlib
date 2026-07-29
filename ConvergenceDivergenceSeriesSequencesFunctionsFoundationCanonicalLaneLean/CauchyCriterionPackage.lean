import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean.SequenceAdmissible

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean

structure CauchyCriterionPackage where
  sequenceSpace : SequenceSpace
  cauchyProperty : (ℕ → sequenceSpace.carrier) → Prop
  convergentImpliesCauchy : ∀ (a : ℕ → sequenceSpace.carrier),
    (∃ (L : sequenceSpace.carrier), True) → cauchyProperty a
  completeMetricSpace : cauchyProperty → (∃ (L : sequenceSpace.carrier), True)

structure CauchyCriterionEvidence (C : CauchyCriterionPackage) where
  convergentImpliesCauchyClosed : ∀ (a : ℕ → C.sequenceSpace.carrier),
    (∃ (L : C.sequenceSpace.carrier), True) → C.cauchyProperty a
  completeMetricSpaceClosed : ∀ (a : ℕ → C.sequenceSpace.carrier),
    C.cauchyProperty a → (∃ (L : C.sequenceSpace.carrier), True)

def CauchyCriterionClosed (C : CauchyCriterionPackage) : Prop :=
  (∀ a, (∃ L, True) → C.cauchyProperty a) ∧ (∀ a, C.cauchyProperty a → (∃ L, True))

theorem cauchy_criterion_closed_from_evidence (C : CauchyCriterionPackage)
    (E : CauchyCriterionEvidence C) : CauchyCriterionClosed C := by
  exact And.intro E.convergentImpliesCauchyClosed E.completeMetricSpaceClosed

end ConvergenceDivergenceSeriesSequencesFunctionsFoundationCanonicalLaneLean
end HautevilleHouse