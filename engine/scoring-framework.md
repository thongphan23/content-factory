# Scoring Framework — Universal
# Version: v18.0
# Purpose: Khung chấm điểm phổ quát, custom rules đọc từ persona pack

---

## Framework Structure (4 Sections, Total variable)

### Section 1: Voice DNA Compliance (Weight: 25%)
Đọc từ `personas/[user]/scoring-rules.yaml`

**Template checks**:
- Pronoun compliance (đúng self/audience/expert pronouns)
- Filler count (trong min-max range)
- Parenthetical count (trong min-max range)
- Engagement frequency (mỗi N câu phải engage)
- Custom banned words check

### Section 2: Anti-AI Patterns (Weight: 17%)
Phổ quát — áp dụng cho mọi user

**Fixed checks**:
- No dash connector (universal AI signature)
- No staccato patterns (2+ câu <= 4 từ liên tiếp)
- No repetitive structure (X là Y lặp >= 3 lần)
- Language purity (theo setting trong voice-dna.yaml)
- No generic AI transitions

### Section 3: Content Quality (Weight: 42%)
Phổ quát + persona-specific

**Template checks**:
- Hook effectiveness (counter-intuitive + specific anchor)
- Authority citation (diverse, credential cascade)
- Killer Statements (min 1-2 per post)
- Concrete imagery (min 3+)
- Reader engagement consistency
- Language compliance
- Story/atom authentication

### Section 4: Poetic Mastery (Weight: 17%)
Phổ quát

**Fixed checks**:
- Emotional adjective depth (Layer 3 preferred)
- Sting Test (hook targets deep fear/desire)
- Verb diversity (no repeat in 3 sentences)
- Redefinition (LÀ GÌ / KHÔNG PHẢI / HIỂU LẦM)
- No-list prose for symptoms

---

## Verdict Logic (Universal)

```yaml
verdicts:
  PASS:
    condition: "score >= threshold AND zero auto-fail items"
    action: "→ Phase 7 (Format)"
    threshold_source: "personas/[user]/scoring-rules.yaml"

  REVISE:
    condition: "score between (threshold-15) and threshold, OR auto-fail fixable"
    action: "→ Phase 5 (Writing) with revision notes"
    max_retries: 3

  FAIL:
    condition: "score < (threshold-15) OR unfixable auto-fail"
    action: "→ Phase 1/2 restart or escalate to user"
```

---

## How Persona Pack Customizes Scoring

```yaml
# Example: personas/thong-phan/scoring-rules.yaml
scoring:
  total_points: 120
  pass_threshold: 95
  
  sections:
    voice_dna:
      max_points: 30
      auto_fail_items:
        - rule: "pronoun_self_violation"   # tôi thay vì tui
        - rule: "pronoun_audience_violation" # các bạn thay vì anh em
        - rule: "filler_missing"           # < min fillers
    
    anti_ai:
      max_points: 20
      # Universal rules, no customization needed
    
    content_quality:
      max_points: 50
      auto_fail_items:
        - rule: "engagement_gap_exceeded"  # > max_gap sentences
        - rule: "language_purity_violated" # mixed language
        - rule: "story_fabricated"         # unverified story
    
    poetic_mastery:
      max_points: 20
      # Universal rules, no customization needed
```
