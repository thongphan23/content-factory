# POKA-YOKE Quality Gates — Universal
# Version: v18.2
# Purpose: Hệ thống quality gates phổ quát cho 7-phase pipeline
# Updates: SAS (Story Authentication Standard) + FCS (Framework Credibility Standard)

---

## Gate Philosophy

Mỗi phase có 1 POKA-YOKE gate. Output PHẢI pass gate trước khi chuyển sang phase tiếp theo. Nếu fail → rollback hoặc retry.

---

## Gate Definitions

### Gate 1: Idea Validation
```yaml
checks:
  - contrarian_angle: "Must have a twist/counter-intuitive element"
  - viral_score: ">= 7/10"
  - pillar_diversity: "Not same pillar as last 2 posts"
  - transformation_promise: "Clear before→after promise"
fail_action: "Regenerate idea with different angle"
max_retries: 3
```

### Gate 2: Research Sufficiency
```yaml
checks:
  - studies: ">= 2 scientific studies or research"
  - experts: ">= 1 named expert with credentials"
  - numbers: ">= 5 specific numbers/data points"
  - atom_check: "If DIKW atoms found, verify source_type != fabricated"
  # --- SAS v18.2 ---
  - story_authentication: |
      ALL stories MUST come from exactly 2 sources:
      1. Obsidian Vault (verified: true, confidence >= 0.5)
      2. Famous people/organizations worldwide (with cited source)
      ⛔ ZERO tolerance for fabricated personal anecdotes
      ⛔ NO Vietnamese individuals unless in vault
fail_action: "Research more, expand sources. If no vault story found, use famous world stories or data/research instead."
max_retries: 2
```

### Gate 3: Hook Quality
```yaml
checks:
  - score: ">= 8/10"
  - sting_layer: "Layer 3 (Vivid)"
  - core_length: "<= 15 words for core statement"
  - rotation: "Not same formula as last 2 posts"
fail_action: "Regenerate hook with different formula"
max_retries: 2
```

### Gate 4: Structure Integrity
```yaml
checks:
  - parts: "Exactly 5 sections"
  - empathy_first: "Section 1 must be empathy/pain"
  - emotion_arc: "empathy → tension → insight → action → hope"
  - word_allocation: "Each section has target word count"
fail_action: "Restructure outline"
max_retries: 2
```

### Gate 5: Writing Compliance
```yaml
checks:
  - voice_dna: "100% pronoun/filler/tone compliance (from persona pack)"
  - anti_ai: "Zero AI signatures detected"
  - imagery: ">= 3 concrete images"
  - engagement: "No gap > max_gap (from persona pack)"
  - atom_integrity: "No fabricated atoms, all verified"
  # --- SAS v18.2 ---
  - story_source_check: |
      EVERY story in draft MUST trace back to:
      ① Obsidian vault atom with verified: true, OR
      ② Named famous person/org with cited source (book, article, interview)
      ⛔ "Tui có quen một bạn..." without vault match = AUTO-FAIL
      ⛔ ANY fabricated anecdote = IMMEDIATE REJECTION
  # --- FCS v18.2 ---
  - framework_credibility: |
      EVERY framework/formula/matrix mentioned MUST have at least 1 of:
      ① Origin: Who created it + their credential (1 sentence)
      ② Achievement: Who used it successfully + result
      ③ Scale: How many people/orgs have adopted it
      ⛔ Unnamed/uncredited framework = REVISE (not auto-fail, but must fix)
fail_action: "If SAS violation: IMMEDIATE FAIL, rewrite from Phase 2. If FCS violation: add credibility intro."
max_retries: 3
```

### Gate 6: Quality Score
```yaml
checks:
  - total_score: ">= pass_threshold (from persona scoring-rules.yaml)"
  - auto_fail: "Zero auto-fail items triggered"
fail_action:
  revise: "→ Phase 5 rewrite with QA notes"
  fail: "→ Phase 1/2 restart or escalate"
max_retries: 3
```

### Gate 7: Format & Diversity
```yaml
checks:
  - paragraph_length: "<= 4 lines per paragraph"
  - line_breaks: "--- between major sections"
  - production_logged: "Entry added to production-log.yaml"
  - hook_history_updated: "Formula logged to hook-history.yaml"
  - pillar_logged: "Pillar diversity tracked"
fail_action: "Fix formatting issues (auto-fixable)"
max_retries: 1
```
