---
description: 📖 Story Bank — Nhập raw story → xuất structured atoms vào Obsidian vault
---

# /story-bank Workflow

Quy trình chuyển đổi câu chuyện thô (raw life stories) thành structured story atoms trong Obsidian vault.

// turbo-all

## Mục đích

Story Bank là hệ thống thu thập và chuẩn hóa câu chuyện cá nhân thật — phục vụ cho Content Factory (SAS v18.2). Mỗi story atom sẽ:
- Tuân theo Story Schema chuẩn
- Có frontmatter YAML đầy đủ metadata
- Sẵn sàng inject vào bài viết qua Obsidian Bridge

---

## Input

User cung cấp raw story theo 1 trong 2 cách:

### Cách 1: Kể trực tiếp
User kể câu chuyện thô, chưa cấu trúc. Ví dụ:
> "Hồi đó tui làm marketing cho công ty X, khách hàng chê giá đắt, team muốn giảm giá nhưng tui quyết giữ giá và thêm workshop miễn phí. Kết quả doanh thu tăng 40%..."

### Cách 2: File trong 00-Inbox
Raw story được ghi vào `{{VAULT_PATH}}/00-Inbox/` qua Knowledge Inbox app.

---

## Quy trình xử lý

### Bước 1: Phân tích raw story

Đọc raw story và xác định:
- **Protagonist**: self / người quen / nhân vật nổi tiếng?
- **SubType**: personal / observed / secondhand / historical?
- **Timeline**: thời gian cụ thể?
- **Topics**: career, content, productivity, mindset, relationship, decision-making, learning, emotion, business, marketing?
- **Measurable outcome**: có số liệu cụ thể không?

### Bước 2: Cấu trúc hóa theo Story Schema

Chuyển raw story → structured atom theo format:

```markdown
---
type: story
subtype: [personal/observed/secondhand/historical]
protagonist: "[self/tên người]"
topic: ["topic1", "topic2"]
status: processed
created: [YYYY-MM-DD]
source_file: "[đường dẫn nguồn nếu có]"
confidence: [0.5-1.0]
timeline: "[mô tả timeline ngắn]"
outcome_measurable: [true/false]
verified: true
---

# [Tiêu đề ngắn gọn, gợi cảm xúc]

## 📖 Bối cảnh (Situation)
[Ai, ở đâu, khi nào, làm gì]

## ⚡ Vấn đề (Problem)
[Khó khăn, thách thức, pain point]

## 🔄 Bước ngoặt (Turning Point)
[Sự kiện/insight khiến mọi thứ thay đổi]

## 🎯 Hành động & Kết quả (Action + Outcome)
[Cụ thể: làm gì → kết quả ra sao]

## 💎 Bài học (Lesson Learned)
[1-2 câu tinh gọn, sâu sắc]

## 📌 Câu hay trích dẫn (optional)
[Trích nguyên văn nếu có câu nói hay]
```

### Bước 3: Đặt tên file

Format: `{category}-story-{slug}.md`

Categories:
- `career` — sự nghiệp, công việc
- `content` — viết bài, content creation
- `productivity` — năng suất, tập trung
- `mindset` — tư duy, tâm lý
- `relationship` — quan hệ, networking
- `decision` — ra quyết định
- `learning` — học tập
- `business` — kinh doanh
- `marketing` — marketing, bán hàng
- `writing` — viết lách
- `life` — cuộc sống, trải nghiệm cá nhân

### Bước 4: Lưu vào vault

Lưu file vào: `{{VAULT_PATH}}/01-Atomic/Stories/`

> ⚠️ `{{VAULT_PATH}}` = đường dẫn Obsidian vault, cấu hình trong `obsidian-bridge/config.yaml`

### Bước 5: Xác nhận với user

Report kết quả:
- Tên file đã tạo
- SubType + Topics
- Câu tóm tắt 1 dòng
- Tổng số story atoms trong vault hiện tại

---

## POKA-YOKE Checks

```
⛔ Story KHÔNG CÓ protagonist → REJECT
⛔ Story KHÔNG CÓ turning point rõ ràng → YÊU CẦU bổ sung
⛔ SubType = personal nhưng protagonist ≠ "self" → FIX
⛔ Confidence < 0.5 → KHÔNG xử lý, yêu cầu user xác minh
✅ Mỗi story atom PHẢI có ít nhất 3/5 sections (Situation, Problem, Turning Point, Action, Lesson)
✅ Topics PHẢI match với ít nhất 1 pillar trong Content Factory
```

---

## Tips cho User

1. **Kể chi tiết cảm xúc**: "lúc đó tui thấy..." — càng raw càng tốt
2. **Nhắc đến số liệu**: "3 tháng", "tăng 40%", "12k shares"
3. **Nhắc đến bước ngoặt**: điều gì khiến anh thay đổi hướng?
4. **Không cần văn vẻ**: Agent sẽ rewrite theo Voice DNA khi inject vào bài
