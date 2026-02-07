# Story Schema — Chuẩn Hoá Format Câu Chuyện
# Version: v18.2
# Purpose: Định nghĩa format chuẩn cho tất cả stories trong vault
# Includes: Story Authentication Standard (SAS)

---

## Story Types

### 1. Personal Self — Tác giả kể chuyện mình
```yaml
---
type: story
subtype: personal
protagonist: "self"
topic: ["career", "focus"]
verified: true              # TÁC GIẢ tự xác nhận
created: 2026-02-07
confidence: 0.95
timeline: "11 tháng"        # Khoảng thời gian cụ thể
outcome_measurable: true    # Có kết quả đo được
---

# [Story Title]

## 📖 Bối cảnh (Situation)
Khi nào, ở đâu, hoàn cảnh gì.

## ⚡ Vấn đề (Problem)
Chuyện gì xảy ra, xung đột gì.

## 🔄 Bước ngoặt (Turning Point)
Cái gì thay đổi nhận thức/hành động.

## 🎯 Hành động & Kết quả (Action + Outcome)
Làm gì cụ thể. Kết quả đo được bằng số.

## 💎 Bài học (Lesson Learned)
Một câu duy nhất, đúng trọng tâm.
```

### 2. Observed — Tác giả chứng kiến/nghe kể
```yaml
---
type: story
subtype: observed
protagonist: "Anh Minh"     # Tên thật hoặc bút danh
topic: ["business", "risk"]
verified: true              # Tác giả xác nhận đã gặp/chứng kiến
relationship: "friend"      # friend | colleague | mentor | client
---
```

### 3. Secondhand — Tác giả đọc/nghe từ nguồn khác
```yaml
---
type: story
subtype: secondhand
protagonist: "Cal Newport"
topic: ["productivity"]
verified: true
source: "Deep Work, Chapter 3"   # Nguồn cụ thể
---
```

### 4. Historical — Câu chuyện lịch sử/nổi tiếng
```yaml
---
type: story
subtype: historical
protagonist: "Steve Jobs"
topic: ["innovation", "leadership"]
verified: true
source: "Walter Isaacson biography"
---
```

### 5. Famous World — Người/tổ chức nổi tiếng thế giới (SAS v18.2)

> Dùng khi vault KHÔNG có story liên quan. Chỉ dùng người/tổ chức
> nổi tiếng mà đa số người đọc đã biết. KHÔNG dùng người Việt Nam
> (trừ khi đã có trong vault).

```yaml
---
type: story
subtype: famous_world
protagonist: "Ray Dalio"       # Tên người/tổ chức nổi tiếng
topic: ["investment", "principles"]
verified: true                  # Đã public, có sách/bài báo
source: "Principles, Chapter 2" # PHẢI có nguồn cụ thể
fame_level: "global"            # global | regional (no local)
---
```

**Ví dụ hợp lệ:**
- Ray Dalio kể trong cuốn Principles...
- Toyota thập niên 50 suýt phá sản, rồi...
- Jeff Bezos từ garage đến đế chế nghìn tỷ đô...

**Ví dụ KHÔNG hợp lệ:**
- ❌ "Tui có quen một bạn làm thiết kế..." (bịa)
- ❌ "Có anh Minh ở công ty cũ tui..." (bịa, không trong vault)
- ❌ "Chị Hoa, chủ quán cà phê..." (bịa, người Việt không nổi tiếng)

---

## Injection Priority Matrix

| Priority | SubType | Protagonist | Weight | Placement | Voice Rule |
|:---|:---|:---|:---|:---|:---|
| 🥇 1 | personal | self | **15** | Hook/Story section | Ngôi 1, có chi tiết cảm xúc |
| 🥈 2 | observed | friend/name | **12** | Deep Dive hỗ trợ argument | "Tui có quen người..." |
| 🥉 3 | secondhand | expert_name | **8** | Anywhere hỗ trợ evidence | "Tui có đọc bài..." |
| 4 | famous_world | famous_person/org | **7** | Framework minh họa | Kể lại + nguồn cụ thể |
| 5 | historical | historical_figure | **5** | Anywhere | Ngắn, làm "gia vị" |

> **SAS v18.2**: Priority 1-2 (personal, observed) CHỈ khi có trong vault.
> Nếu vault trống → nhảy xuống Priority 4 (famous_world). KHÔNG BỊA 1-2.

---

## Story Authentication Standard (SAS) — v18.2

> ⚠️ **TIÊU CHUẨN TUYỆT ĐỐI — AUTO-FAIL KHI VI PHẠM**

### Nguyên tắc cốt lõi

Agent **KHÔNG ĐƯỢC TẠO** bất kỳ câu chuyện nào liên quan đến tác giả
(self, friend, colleague, client) mà **KHÔNG CÓ TRONG VAULT**.

### 2 nguồn story hợp lệ DUY NHẤT

```
┌─────────────────────────────────────────────┐
│ NGUỒN 1: Obsidian Vault (authenticated)     │
│ → 01-Atomic/Stories/ (structured atoms)     │
│ → Viral Posts/ (extracted anecdotes)         │
│ → Posted/ (extracted anecdotes)             │
│ Điều kiện: verified: true + confidence ≥ 0.5│
├─────────────────────────────────────────────┤
│ NGUỒN 2: Người/Tổ chức nổi tiếng THẾ GIỚI  │
│ → Steve Jobs, Ray Dalio, Toyota, Google...  │
│ → PHẢI có nguồn cụ thể (sách, bài báo)     │
│ → KHÔNG dùng người Việt Nam (trừ khi có     │
│   trong vault đã verified)                   │
└─────────────────────────────────────────────┘
```

### Khi vault TRỐNG story liên quan

```
Thứ tự ưu tiên thay thế:
1. Dùng story người/tổ chức NỔI TIẾNG THẾ GIỚI (có nguồn cụ thể)
2. Dùng dữ liệu/nghiên cứu thay thế story
3. Viết bằng framework + logic thuần (không story cũng OK)

TUYỆT ĐỐI KHÔNG:
❌ "Tui có quen một bạn..." (mà bạn đó không có trong vault)
❌ "Có 1 anh developer..." (bịa nhân vật)
❌ "Chị Lan ở công ty tui..." (nhân vật ảo)
```

---

## POKA-YOKE Rules (KHÔNG ĐƯỢC PHÉP VI PHẠM)

1. ⛔ `verified: false` → **KHÔNG inject**, dù relevance rất cao
2. ⛔ `protagonist: "self"` nhưng user KHÔNG phải tác giả → **KHÔNG inject**
3. ⛔ Vault KHÔNG có story liên quan → **Dùng famous_world story hoặc bỏ qua**, **KHÔNG BỊA**
4. ⛔ Story `confidence < 0.5` → **KHÔNG inject**
5. ⛔ Cùng 1 story KHÔNG được dùng trong 2 bài liên tiếp
6. ⛔ **[SAS v18.2]** Agent TỰ TẠO câu chuyện personal/observed → **AUTO-FAIL, BÀI BỊ LOẠI**
7. ⛔ **[FCS v18.2]** Framework/formula không có credibility intro → **REVISE**

---

## Story Extraction từ Bài Đã Viết

Khi scan `Viral Posts/` và `Posted/`:

```
1. ĐỌC bài viết
2. TÌM đoạn bắt đầu bằng patterns:
   - "Tui có quen..."
   - "Bản thân tui..."
   - "Chuyện là..."
   - "Hồi đó tui..."
   - "Có ông/bà..."
   - "Cẻm ơn anh/chị [Tên]..."
3. EXTRACT thành story atom:
   - situation → problem → turning_point → outcome → lesson
4. TAG với metadata:
   - source_post: "bài gốc"
   - subtype: personal/observed
   - verified: true (đã public rồi = verified)
5. SAVE vào 01-Atomic/Stories/
   (CHƯA có trong vault → tạo mới)
   (ĐÃ có → skip duplicate)
```

---

## Thống Kê Vault Hiện Tại

| Source | Số lượng | Quality |
|:---|:---|:---|
| `01-Atomic/Stories/` | 4 atoms | Mixed (2 structured, 2 JSON raw) |
| `Viral Posts/` | 6 bài (597-3400 shares) | Chưa extract stories |
| `Posted/` | 7 bài | Chưa extract stories |
| **Tiềm năng sau extract** | **~15-20 stories** | Verified (đã public) |
