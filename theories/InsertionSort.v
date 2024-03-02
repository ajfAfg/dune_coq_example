Require Import List.
Require Import PeanoNat.
Require Import Arith.
Require Import Sorting.Permutation.
Require Import Sorting.Sorted.

Fixpoint insert (a : nat)(l : list nat) : list nat :=
  match l with
  | nil => a :: nil
  | x :: xs => if Nat.leb a x then a :: l else x :: insert a xs
  end.

Fixpoint insertion_sort (l : list nat) : list nat :=
  match l with
  | nil => nil
  | x :: xs => insert x (insertion_sort xs)
  end.

(******************************************
  isort_permutation
*******************************************)
Lemma insert_perm : forall (x : nat)(l : list nat), Permutation (x :: l) (insert x l).
Proof.
  intros.
  induction l.
  - simpl.
    apply Permutation_refl.

  - simpl.
    destruct (Nat.leb x a).
    + apply Permutation_refl.

    + apply perm_trans with (a :: x :: l).
      * constructor.

      * constructor.
        apply IHl.
Qed.

Theorem isort_permutation : forall (l : list nat), Permutation l (insertion_sort l).
Proof.
  intros.
  induction l.
  - simpl.
    constructor.

  - simpl.
    apply perm_trans with (a :: insertion_sort l).
    * constructor.
      apply IHl.

    * apply insert_perm.
Qed.

(******************************************
  isort_sorted
*******************************************)
Lemma insert_sorted : forall (a : nat)(l : list nat),
  LocallySorted le l -> LocallySorted le (insert a l).
Proof.
  intros.
  induction l.
  - simpl.
    constructor.

  - simpl.
    remember (Nat.leb a a0).
    destruct b.
    + constructor.
      * apply H.

      * apply Nat.leb_le.
        apply eq_sym.
        apply Heqb.

    + inversion H.
      * subst.
        simpl.
        constructor.
        -- constructor.

        -- apply Nat.lt_le_incl.
           apply leb_complete_conv.
           apply eq_sym.
           apply Heqb.

      * subst.
        simpl.
        simpl in IHl.
        remember (Nat.leb a b).
        destruct b0.
        -- constructor.
           ++ apply (IHl H2).
           ++ apply Nat.lt_le_incl.
              apply leb_complete_conv.
              congruence.

        -- constructor.
           ++ apply (IHl H2).
           ++ apply H3.

Qed.

Theorem isort_sorted : forall (l : list nat), LocallySorted le (insertion_sort l).
Proof.
  induction l.
  - simpl.
    constructor.

  - simpl.
    apply insert_sorted.
    apply IHl.
Qed.
