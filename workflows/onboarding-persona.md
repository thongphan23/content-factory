---
description: 🎨 Onboarding Persona Pack - Tạo cấu hình cá nhân cho Content Factory
---

# Onboarding Persona Pack v18.1 — Progressive 3-Tier System

> User có thể bắt đầu dùng Content Factory CHỈ VỚI 3 THÔNG TIN.
> Phần còn lại sẽ dùng Default Persona. Cá nhân hóa dần theo thời gian.

---

## ⚡ TIER 1: Quick Start (5 phút — BẮT ĐẦU NGAY)

### Bước 1: Tạo folder persona

// turbo
```bash
# Tạo trong thư mục personas/ của Content Factory
mkdir -p "personas/[username]"
```

### Bước 2: Copy templates

// turbo
```bash
# Copy từ _template vào persona mới
Copy-Item "personas/_template/*" "personas/[username]/" -Recurse
```

### Bước 3: Hỏi 3 câu bắt buộc — CHỈ 3 CÂU

Điền vào `profile.yaml` và `voice-dna.yaml`:

1. **Tên/bút danh là gì?** (→ `profile.yaml > personal.name`)
2. **Xưng gì khi viết?** Ví dụ: "tui", "tôi", "mình" (→ `voice-dna.yaml > pronouns.self`)
3. **Giọng viết muốn là gì?** (→ `voice-dna.yaml > tone.primary`)
   - `confident-direct`: Thẳng thắn, quyết đoán
   - `warm-friendly`: Thân thiện, gần gũi
   - `academic`: Chuyên sâu, học thuật
   - `casual`: Thoải mái, vui vẻ

**→ XONG! User có thể chạy pipeline ngay. Phần còn lại dùng Default Persona.**

> Giải thích cho user: "Hệ thống sẽ dùng giọng mặc định (gọi audience là 'bạn', không dùng fillers, scoring dễ dãi hơn). Bạn có thể cá nhân hóa thêm bất cứ lúc nào."

### Bước 4: Test ngay

```
/content-post
Topic: [topic bất kỳ]
Persona: [username]
```

---

## 🎨 TIER 2: Personalized (30 phút — khi user sẵn sàng)

Hướng dẫn user bổ sung **khi họ muốn**, theo thứ tự ưu tiên:

### 2.1. Voice DNA chi tiết (`voice-dna.yaml`) ⭐ QUAN TRỌNG NHẤT
- Gọi audience là gì? (anh em, các bạn, mọi người...)
- Sau khi giới thiệu expert, gọi lại thế nào? (ổng/bả, anh ấy/chị ấy...)
- Có dùng fillers không? Liệt kê? (há há, cơ mà, nha...)
- Có dùng ngoặc đơn bình luận không?
- Từ nào BỊ CẤM?

### 2.2. Content Pillars (`pillars.yaml`)
- 3-4 chủ đề chính viết content?
- Mỗi chủ đề: tên, mô tả, pain points audience?

### 2.3. Target Audience (`audience.yaml`)
- Độ tuổi, giới tính, vị trí?
- Nỗi sợ lớn nhất, khát vọng lớn nhất?
- Đọc content ở đâu? (FB, LinkedIn, Blog...)

### 2.4. Authority Library (`authorities.yaml`)
- Experts/tác giả hay trích dẫn?
- Mỗi expert: tên, lĩnh vực, credentials?

---

## 🏆 TIER 3: Mastery (tự động qua thời gian)

Hệ thống tự học và bổ sung:

### 3.1. Vivid Library (`vivid-library.yaml`)
- Thu thập tự động từ bài đã viết (vivid phrases hay nhất)
- User cũng có thể thêm thủ công

### 3.2. Scoring Rules (`scoring-rules.yaml`)
- Tự điều chỉnh dựa trên Performance Feedback Agent
- Ví dụ: bài có stories viral hơn → tăng weight cho stories

### 3.3. Story Database
- Tự scan Obsidian vault cho personal stories
- Mỗi story mới → thêm vào pool injection

---

## 🔧 (Optional) Cấu hình Obsidian Bridge

Nếu user có Obsidian vault:
1. Mở `obsidian-bridge/config.yaml`
2. Sửa `vault.path` thành đường dẫn vault
3. Điều chỉnh `scan_folders` nếu cấu trúc vault khác

---

## 📊 Completeness Report

Mỗi lần chạy pipeline, hệ thống sẽ báo:

```
Persona Pack: [username]
Completeness: 30% | Tier: 1 (Quick Start)
Missing: pillars, audience, authorities, vivid-library
Tip: Chạy /onboarding-persona để bổ sung → nâng Tier 2
```
