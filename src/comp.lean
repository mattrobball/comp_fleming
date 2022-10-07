import topology.maps
import topology.constructions
import topology.separation
import topology.continuous_function.cocompact_map
import topology.subset_properties

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

theorem closed_of_proper' (f : α → β) [hf : proper_map f] [hb : locally_compact_space β] : (is_closed_map f) :=
begin 
  
end 
theorem closed_of_proper (f : α → β) [hf : proper_map f] [hb : locally_compact_space β] : (is_closed_map f) :=
begin

  --- this problem will take a while because I don't see a quick way to prove it beyond
  --- getting into the nitty gritty of nbhds and the local compactness definition
  --- but I'm confident I can do this one given enough time to look at docs
  introsI u hu,
  rw [←is_open_compl_iff, is_open_iff_mem_nhds],
  introsI x hx,
  sorry
end


-- Quasi-proper iff inverse image of compacts are compact
def quasi_proper (f: α → β) : Prop :=
(∀ u: set β, is_compact u → is_compact (f⁻¹' u))


-- Equivalence of Bourbaki proper and Quasi proper. 
theorem proper_iff_quasi_proper (f: α → β): proper_map f ↔ quasi_proper f := sorry


variables (f : α → β) (g : β → γ) 

lemma proper_comp (hf: proper_map f) (hg: proper_map g) : proper_map (g ∘ f) := 
begin
  constructor,
  {
    exact hg.is_cont.comp hf.is_cont,
  },
  {
    introsI _ _,
    obtain hg₁ := hg.is_univ_closed _ _,
    obtain hf₁ := hf.is_univ_closed _ _,
    exact hg₁.comp hf₁,
  }
end
lemma proper_cancel_surj [hgf : proper_map (g ∘ f)] [hf : surjective f] : proper_map g := 
begin
  constructor,
  -- might need to be an assumption f and g are continuous on their own.
  {sorry},
  have h : continuous f := sorry,


  {
    introsI δ hd u hu,
    sorry,

  },
end

lemma proper_cancel_inj [proper_map (g ∘ f)] [injective g] : proper_map f := sorry 

lemma proper_cancel_haus [proper_map (g ∘ f)] [t2_space β] : proper_map f := sorry 

theorem proper_of_to_cpt [hf : continuous f] [ha : compact_space α] [hb : t2_space β] : proper_map f :=
begin
  rw proper_iff_quasi_proper,
  introsI u hu,
  -- compacts in T2 spaces are closed cant find this in mathlib 
  have h₁ : is_closed u, {sorry},
  exact is_closed.is_compact (h₁.preimage hf),
end

def cocpt_of_proper_haus [t2_space α] [t2_space β] [proper_map f] : cocompact_map α β := sorry
/- 
begin
  constructor,
  { 
    -- should be something like the following but I'm not sure exactly how to use this structure yet
    -- exact cocompact_map.tendsto_of_forall_preimage (quasi_proper f),
    sorry,
  },

  {constructor,},
end
-/

