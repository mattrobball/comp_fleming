import topology.maps
import topology.constructions
import topology.separation
import topology.continuous_function.cocompact_map

/- 

2021/2022 Math 738/748 Comprehensive Exam 

Instructions: In the given time fill in as many of the sorries as 
possible. We will cover those not completed in the oral 
component.

All resources are allowed. 

-/

open function 

universes u

variables {α : Type u } [topological_space α] 
variables {β : Type u } [topological_space β] 
variables {γ : Type u } [topological_space γ] 

def is_closed_map_base_change (f : α → β) (δ : Type u) [topological_space δ] : Prop := 
is_closed_map ( prod.map (@id δ) f )

structure proper_map (f : α → β) : Prop :=
(is_cont : continuous f)
(is_univ_closed : ∀ (δ : Type u) (_ : topological_space δ), 
is_closed_map_base_change f δ) 

theorem closed_of_proper (f : α → β) [h : proper_map f] : (is_closed_map f) := sorry 

variables (f : α → β) (g : β → γ) 

lemma proper_comp [proper_map f] [proper_map g] : proper_map (g ∘ f) := sorry  

lemma proper_cancel_surj [proper_map (g ∘ f)] [surjective f] : proper_map g := sorry 

lemma proper_cancel_inj [proper_map (g ∘ f)] [injective g] : proper_map f := sorry 

lemma proper_cancel_haus [proper_map (g ∘ f)] [t2_space β] : proper_map f := sorry 

theorem proper_of_to_cpt [compact_space α] [t2_space β] : proper_map f := sorry 

def cocpt_of_proper_haus [t2_space α] [t2_space β] [proper_map f] : cocompact_map α β := sorry 

