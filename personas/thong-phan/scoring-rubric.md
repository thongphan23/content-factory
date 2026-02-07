# Quality Scoring Rubric - Content Factory
# Version: v19.0
# Total: 127 points (107 base + 20 poetic mastery)
# Pass Threshold: 102/127

---

## Section 1: Voice DNA (30 points)

| ID | Rule | Points | Auto-Fail? |
|:---|:---|:---|:---|
| WR-01 | tui (không tôi) | 6 | ✅ YES |
| WR-02 | anh em (không các bạn) | 6 | ✅ YES |
| WR-03 | ổng/bả sau tên expert | 6 | ✅ YES |
| WR-04 | 5-7 fillers per post | 6 | ✅ YES |
| WR-05 | 6-10 parentheticals | 6 | ❌ No |

---

## Section 2: Anti-AI Patterns (20 points)

| ID | Rule | Points | Auto-Fail? |
|:---|:---|:---|:---|
| WR-06 | Không AI signatures (generic phrases) | 5 | ✅ YES |
| WR-33 | Không dấu '-' connector | 5 | ✅ YES |
| WR-34 | No staccato patterns | 5 | ✅ YES |
| WR-36 | Rhetorical questions only (no real questions) | 3 | ❌ No |
| WR-37 | No repetitive structure | 2 | ❌ No |
| WR-38 | No micro-staccato (2+ câu ≤8 từ kề nhau) | 3 | ✅ YES |
| WR-39 | No anaphora overload (3+ câu cùng mở đầu) | 2 | ✅ YES |

---

## Section 3: Content Quality (50 points)

| ID | Rule | Points | Auto-Fail? |
|:---|:---|:---|:---|
| CQ-01 | Hook hit (counter-intuitive + specific anchor) | 10 | ❌ No |
| CQ-02 | Authority citation (tên + credentials + ổng/bả) | 8 | ❌ No |
| CQ-03 | 1-2 Killer Statements | 8 | ❌ No |
| CQ-04 | Concrete imagery >= 3 | 8 | ❌ No |
| CQ-05 | Reader engagement mỗi 2-3 câu | 6 | ✅ YES |
| CQ-06 | Tiếng Việt thuần tuý (English chỉ trong ngoặc đơn) | 5 | ✅ YES |
| CQ-07 | Personal story authenticated | 5 | ✅ YES |
| CQ-08 | Value Threading (value signal mỗi 3-5 câu) | 7 | ❌ No |
| CQ-09 | Closing diversity (không lặp dạng 3 bài) | 3 | ❌ No |

---

## Section 4: Poetic Mastery (20 points)

| ID | Rule | Points | Auto-Fail? |
|:---|:---|:---|:---|
| PM-01 | Emotional adjectives Layer 3 (Vivid) | 5 | ❌ No |
| PM-02 | Sting Test (hook hit Deep Fear) | 5 | ❌ No |
| PM-03 | Verb diversity (no repeat in 3 sentences) | 4 | ❌ No |
| PM-04 | Redefinition (LÀ GÌ / KHÔNG PHẢI / HIỂU LẦM) | 3 | ❌ No |
| PM-05 | No-list prose for symptoms | 3 | ❌ No |

---

## Scoring Summary

```yaml
sections:
  voice_dna: 30
  anti_ai: 25
  content_quality: 52
  poetic_mastery: 20
  total: 127

verdicts:
  PASS:
    score: ">= 102"
    condition: "AND zero auto-fail items"
    action: "Chuyển sang Phase 7 (Format)"

  REVISE:
    score: "86-101"
    condition: "OR có auto-fail items có thể fix"
    action: "Quay lại Phase 5 (Writing) với revision notes"
    max_retries: 3

  FAIL:
    score: "< 86"
    condition: "OR có auto-fail items không fix được"
    action: "Quay lại Phase 1/2 hoặc escalate cho user"

auto_fail_list:
  - "tôi hoặc các bạn (thay vì tui/anh em)"
  - "Không có fillers"
  - "Dấu '-' làm connector"
  - "Bất kỳ AI signature rõ ràng"
  - "Staccato patterns (2+ câu ngắn kề nhau)"
  - "Micro-staccato (2+ câu ≤ 8 từ kề nhau)"
  - "Anaphora overload (3+ câu cùng mở đầu)"
  - "> 3 câu không có reader engagement"
  - "English words đan xen không ngoặc (proper nouns giữ nguyên)"
  - "Câu cụt lủn (1-2 từ + dấu ? hoặc !): Thu nhập? Sao vậy?"
  - "Personal story bịa (không từ database)"
```
