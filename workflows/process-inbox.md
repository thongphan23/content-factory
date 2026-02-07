---
description: 📥 Xử lý Knowledge Inbox - Antigravity trực tiếp phân tích và tạo atoms
---

# Process Knowledge Inbox Workflow

Workflow này để Antigravity xử lý các notes pending trong `{{VAULT_PATH}}/00-Inbox/`.

> ⚠️ `{{VAULT_PATH}}` = đường dẫn Obsidian vault, cấu hình trong `obsidian-bridge/config.yaml`

## Khi nào sử dụng
- Sau khi sync content từ `inb.thongphan.com`
- User nói: "xử lý inbox", "process inbox", hoặc dùng `/process-inbox`

## Quy trình xử lý

### 1. Đọc files pending
```
Folder: {{VAULT_PATH}}/00-Inbox/
Filter: Files có `status: pending` trong frontmatter
```

### 2. Phân tích mỗi file
Với mỗi file, xác định các loại knowledge có thể extract:

| Type | Mô tả | Output folder |
|------|-------|---------------|
| **quote** | Câu nói đáng nhớ từ người nổi tiếng | `01-Atomic/Quotes/` |
| **concept** | Khái niệm, định nghĩa | `01-Atomic/Concepts/` |
| **insight** | Nhận thức sâu sắc, bài học | `01-Atomic/Insights/` |
| **story** | Câu chuyện, ví dụ minh họa | `01-Atomic/Stories/` |
| **framework** | Mô hình, quy trình | `01-Atomic/Frameworks/` |
| **pain-point** | Vấn đề, khó khăn | `01-Atomic/Pain-Points/` |
| **data-point** | Số liệu, thống kê | `01-Atomic/Data-Points/` |

### 3. Tạo atom files
Mỗi atom file có format:

```markdown
---
type: [quote|concept|insight|story|framework|pain-point|data-point]
topic: ["topic1", "topic2"]
status: processed
created: YYYY-MM-DD
source_file: [tên file gốc]
confidence: 0.8
---

# [Tiêu đề ngắn gọn]

## 📝 Nội dung
[Nội dung chính của atom]

## 💡 Giải thích
[Diễn giải thêm nếu cần]

## 🔗 Liên kết
- [[Related-Concept-1]]
- [[Related-Concept-2]]
```

### 4. Cập nhật file gốc
Sau khi xử lý, update frontmatter của file gốc:
```yaml
status: processed
processed_at: YYYY-MM-DD
atoms_created: 3
```

### 5. Báo cáo
Report cho user:
- Số files đã xử lý
- Số atoms đã tạo
- Danh sách files mới trong 01-Atomic/

## Ví dụ

**Input** (file trong 00-Inbox):
```
Sau lần mất hết dữ liệu... các nhà sư Tây Tạng... bức tranh cát...
```

**Output** (atoms tạo ra):
1. `01-Atomic/Insights/impermanence-lesson-data-loss.md`
2. `01-Atomic/Stories/tibetan-sand-mandala.md`
3. `01-Atomic/Concepts/non-attachment-buddhism.md`
