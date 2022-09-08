/- def proper' (f : C(α, β)) : Π (γ : Type u₃), (topological_space γ) → Prop :=  -/
/- λ γ x, proper_aux f γ x  -/
/--/
/- def proper (f : C(α,β)) : Prop := ∀ (γ : Type u₃) (x: topological_space γ),  -/
/- proper_aux f γ x  -/
/--/
/- variable f : C(α ,β ) -/
/--/
/- #check proper' f β     -/
def proper_aux (f : C(α,β)) (γ : Type u₃) (x: topological_space γ) : Prop :=
is_closed_map (continuous_map.prod_map f (continuous_map.id γ)) 



