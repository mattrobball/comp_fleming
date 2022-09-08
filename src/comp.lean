import topology.connected
import topology.order
import data.set 

open function set

variables α β : Type*
variable f: α → β 

class indiscrete_topology (α : Type*) [t : topological_space α] : Prop :=
(eq_top [] : t = ⊤)

@[priority 100]
instance indiscrete_topology_top (α : Type*) : @indiscrete_topology α ⊤ :=
{ eq_top := rfl }

lemma top_or_bot_is_open_indiscrete [topological_space α] [indiscrete_topology α] 
[s : set α] [h : is_open s] : 
(s = univ) ∨ (s = ∅) := sorry  

lemma continuous_of_indiscrete_of_surjective [topological_space α] 
[topological_space β] [indiscrete_topology β] 
(f : α → β) [h : surjective f] : continuous f := 
begin
  refine continuous_def.mpr _,
  intros s h, 
  have h₁ : (s = univ) ∨ (s = ∅) := by apply top_or_bot_is_open_indiscrete _,
  sorry,
end

lemma something [topological_space α] [topological_space β] (f : α → β) 
[continuous f] [indiscrete_topology α] 
