# Persona Merge Logic — Engine Documentation
# Version: v18.1
# Purpose: Cách pipeline merge Default + User persona pack

---

## Nguyên Tắc Merge

Pipeline đọc persona pack theo thứ tự ưu tiên:

```
PRIORITY:  User Pack  >  Default Pack
PATH:      personas/[user]/  >  personas/_default/
```

### Merge Strategy

```yaml
merge_rules:
  # Rule 1: User value có → dùng user value
  - condition: "User field has non-empty/non-null value"
    action: "Use user value"
    example:
      user: { self: "tui" }
      default: { self: "mình" }
      result: { self: "tui" }      # ← User wins

  # Rule 2: User value trống/null → dùng default value
  - condition: "User field is empty string, null, or missing"
    action: "Use default value"
    example:
      user: { audience: "" }
      default: { audience: "bạn" }
      result: { audience: "bạn" }  # ← Default fallback

  # Rule 3: User array trống → dùng default array
  - condition: "User array field is empty []"
    action: "Use default array"
    example:
      user: { banned_words: [] }
      default: { banned_words: [] }
      result: { banned_words: [] }

  # Rule 4: User file không tồn tại → dùng toàn bộ default file
  - condition: "User YAML file does not exist"
    action: "Use entire default file"
    example: "User không có vivid-library.yaml → skip vivid library injection"
```

---

## Completeness Levels (Tính Đầy Đủ)

Pipeline tự đánh giá Persona Pack hoàn thiện bao nhiêu %:

```yaml
completeness_check:
  tier_1_minimum:             # 3 fields → CÓ THỂ CHẠY PIPELINE
    required:
      - profile.yaml → personal.name
      - voice-dna.yaml → voice.pronouns.self
      - voice-dna.yaml → voice.tone.primary
    completeness: "30%"
    quality_note: "Content ok nhưng generic, cần improve"

  tier_2_personalized:        # 4 files → Content đã personalized
    required:
      - profile.yaml (full)
      - voice-dna.yaml (full)
      - pillars.yaml (ít nhất 2 pillars)
      - audience.yaml (demographics + psychographics)
    completeness: "65%"
    quality_note: "Content đã có voice riêng, topical focus"

  tier_3_mastery:             # 7 files → Full power
    required:
      - Tất cả Tier 2
      - authorities.yaml (3+ experts)
      - vivid-library.yaml (5+ anchors)
      - scoring-rules.yaml (custom thresholds)
    completeness: "100%"
    quality_note: "Content production-grade, competitive quality"
```

---

## Pipeline Resolution Flow

```
1. NHẬN persona_name từ input (default: "thong-phan")

2. CHECK folder tồn tại:
   personas/[persona_name]/ exists?
   ├── YES → Dùng persona pack
   └── NO  → Dùng personas/_default/ toàn bộ + báo cáo

3. LOAD mỗi YAML file:
   Với mỗi file trong [voice-dna, profile, pillars, audience, 
                         authorities, vivid-library, scoring-rules]:
   ├── User file exists? → Load user file
   │   └── Merge field-by-field với default
   └── User file missing? → Load default file
   
4. REPORT completeness level:
   "Persona Pack: [persona_name] | Completeness: [X]% | Tier: [1/2/3]"
   
5. PROCEED with merged persona → inject vào pipeline phases
```

---

## Ví Dụ Thực Tế

### User mới: "minh-anh" chỉ điền 3 fields (Tier 1)

```yaml
# personas/minh-anh/profile.yaml
personal:
  name: "Minh Anh"
  title: "Marketing Manager"

# personas/minh-anh/voice-dna.yaml
voice:
  pronouns:
    self: "tôi"
  tone:
    primary: "confident-direct"
```

**Merged result:**
```yaml
# Pipeline sẽ dùng:
name: "Minh Anh"           # ← user
title: "Marketing Manager"  # ← user
self: "tôi"                 # ← user
audience: "bạn"             # ← DEFAULT (user chưa điền)
fillers: disabled            # ← DEFAULT
engagement: every_3_4        # ← DEFAULT
pass_threshold: 80           # ← DEFAULT (dễ dãi hơn)
```

→ Bài viết sẽ: xưng "tôi", gọi "bạn", giọng confident, không fillers, engagement nhẹ.
→ Chất lượng OK (~60% so với full persona), user có thể dùng NGAY.
