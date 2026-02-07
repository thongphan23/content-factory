# 🏭 Content Factory × 🧠 Second Brain

### Hệ thống sản xuất nội dung Facebook viral — được cung cấp bởi kho câu chuyện thật từ cuộc đời bạn

---

## Hệ thống này làm gì?

Bạn gõ **1 dòng lệnh** → AI viết cho bạn bài Facebook hoàn chỉnh:
- ✅ Đúng giọng nói riêng (của bạn, không phải giọng AI)
- ✅ Có câu chuyện thật (tự lấy từ kho của bạn)
- ✅ Có chuyên gia + số liệu uy tín
- ✅ Qua 7 bước kiểm tra chất lượng (như dây chuyền Toyota)
- ✅ 1500-1800 từ, sẵn sàng đăng

**Ví dụ:** Bạn nói với AI: *"/content-post — viết bài về tư duy dài hạn"*

→ AI tự tìm trong kho stories của bạn → thấy có câu chuyện "9 tháng ngủ trên bàn ghế quán" phù hợp → inject vào bài → viết xong → kiểm tra chất lượng → giao cho bạn review.

---

## Cần gì để bắt đầu?

| Thứ cần cài | Miễn phí? | Link |
|---|---|---|
| **Antigravity Agent** | ✅ | [Hướng dẫn cài](https://github.com/thongphan23/antigravity-agent) |
| **Obsidian** (app ghi chú) | ✅ | [obsidian.md](https://obsidian.md) |
| **Repo này** | ✅ | Đọc tiếp bên dưới |

---

## 🚀 Hướng dẫn cài đặt (5 phút)

### Bước 1: Tải repo này về

Mở terminal trong Antigravity Agent, gõ:

```bash
git clone https://github.com/thongphan23/content-factory.git
```

Bạn sẽ thấy thư mục `content-factory/` xuất hiện, chứa toàn bộ hệ thống.

### Bước 2: Cài Obsidian (nếu chưa có)

1. Vào [obsidian.md](https://obsidian.md) → tải về → cài đặt
2. Mở Obsidian → chọn **"Create new vault"**
3. Đặt tên vault (ví dụ: `My-Second-Brain`)
4. Chọn nơi lưu (ví dụ: `C:\Obsidian\My-Second-Brain`)
5. **Ghi nhớ đường dẫn này** — sẽ dùng ở bước sau

### Bước 3: Tạo cấu trúc kho nguyên liệu

Copy thư mục `vault-template/` vào Obsidian vault:

```
Từ:  content-factory/vault-template/
Vào: C:\Obsidian\My-Second-Brain\
```

Sau khi copy, vault sẽ có cấu trúc:

```
My-Second-Brain/
├── 00-Inbox/              ← Ghi nhanh ý tưởng
├── 01-Atomic/
│   ├── Stories/           ← 📖 Kho câu chuyện thật (QUAN TRỌNG NHẤT)
│   ├── Insights/          ← 💡 Phân tích sâu
│   ├── Frameworks/        ← 🧩 Mô hình tư duy
│   ├── Concepts/          ← 📚 Khái niệm
│   ├── Quotes/            ← 💬 Trích dẫn
│   ├── Data-Points/       ← 📊 Số liệu
│   └── Pain-Points/       ← 😣 Nỗi đau đối tượng
└── 02-Sources/            ← 📄 Nguồn tham khảo
```

### Bước 4: Cấu hình đường dẫn vault

Mở file `obsidian-bridge/config.yaml`, tìm dòng:

```yaml
vault:
  path: "{{VAULT_PATH}}"    # ← THAY ĐƯỜNG DẪN VAULT CỦA BẠN VÀO ĐÂY
```

Thay `{{VAULT_PATH}}` bằng đường dẫn vault của bạn:

```yaml
# Ví dụ Windows:
vault:
  path: "C:\\Obsidian\\My-Second-Brain"

# Ví dụ Mac:
vault:
  path: "/Users/ten-ban/Obsidian/My-Second-Brain"
```

### Bước 5: Chọn chế độ sử dụng

---

## 🎯 2 chế độ sử dụng

### Chế độ A: "Dùng ngay DNA Thông Phan" (cho ai muốn thử nhanh)

Copy stories mẫu vào vault:
```
Từ:  content-factory/vault-sample/01-Atomic/Stories/
Vào: C:\Obsidian\My-Second-Brain\01-Atomic\Stories\
```

→ Bạn có ngay **24 stories** + DNA Thông Phan → viết bài kiểu anh Thông ngay.

**Thử viết bài đầu tiên:**
```
/content-post
Topic: tư duy dài hạn
```

### Chế độ B: "Tạo giọng riêng cho mình" (khuyến khích)

**5.1. Tạo persona:**
```
/onboarding-persona
```

AI sẽ hỏi bạn **chỉ 3 câu**:
1. Tên/bút danh? → *Ví dụ: "Minh Anh"*
2. Xưng gì khi viết? → *Ví dụ: "mình"*
3. Giọng muốn là gì? → *Ví dụ: "warm-friendly" (thân thiện)*

→ Xong! Bạn có thể viết bài ngay. Phần còn lại cá nhân hoá dần.

**5.2. Kể 10 câu chuyện đầu tiên:**
```
/story-bank
```

Rồi kể thô, tự nhiên. Ví dụ:

> *"Hồi 2020 mình đang làm ở công ty phần mềm, bị sếp chê trước mặt team vì dự án deliver chậm. Lúc đó muốn bỏ việc luôn. Nhưng thay vì bỏ, mình im lặng về nhà viết ra 3 thứ cần cải thiện. 6 tháng sau được thăng team lead..."*

AI sẽ tự:
- Phân tích: ai, khi nào, chủ đề gì
- Tạo thành story atom 5 phần
- Lưu vào `01-Atomic/Stories/`
- Sẵn sàng inject vào bài viết sau này

**10 chủ đề gợi ý kể story:**

| # | Chủ đề | Ví dụ gợi ý |
|---|---|---|
| 1 | 💰 Tiền đầu tiên | Lần đầu kiếm tiền bằng sức mình |
| 2 | 📉 Sai lầm tài chính | Mất tiền vì quyết định sai |
| 3 | 🛑 Bỏ cuộc đúng lúc | Dừng 1 thứ, cuộc đời tốt hơn |
| 4 | 💔 Thất bại lớn nhất | Mất gì, đau thế nào, học được gì |
| 5 | 🌟 Người thay đổi đời | Ai ảnh hưởng nhất đến bạn |
| 6 | ⏰ Thói quen vàng | Routine nào thay đổi tất cả |
| 7 | 📖 Sách mở nắp | Đọc gì thay đổi tư duy hoàn toàn |
| 8 | 🗣️ Bị chê nặng nề | Người ta nói gì, bạn làm gì |
| 9 | 🔥 Kiệt sức burnout | Cạn kiệt thế nào, hồi phục ra sao |
| 10 | ✅ Biết mình đúng đường | Khoảnh khắc nhận ra "đây rồi" |

**5.3. Viết bài đầu tiên:**
```
/content-post
Topic: [chủ đề bạn muốn viết]
```

---

## 📂 Cấu trúc repo chi tiết

```
content-factory/
│
├── 📄 README.md                 ← Bạn đang đọc file này
├── 📄 SETUP.md                  ← Hướng dẫn chi tiết hơn
├── 📄 install.ps1               ← Script tự động cài (Windows)
│
├── 🔧 engine/                   ← ĐỘNG CƠ (không cần sửa)
│   ├── pipeline.md              ← Dây chuyền 7 bước sản xuất
│   ├── hook-formulas.md         ← 15 công thức viết câu mở đầu
│   ├── poka-yoke-gates.md       ← Cổng kiểm tra chất lượng tự động
│   ├── scoring-framework.md     ← Khung chấm điểm 127 điểm
│   ├── story-schema.md          ← Cấu trúc story atom
│   └── persona-merge.md         ← Cách hợp nhất persona vào pipeline
│
├── 📏 standards/                ← TIÊU CHUẨN (không cần sửa)
│   ├── anti-ai-patterns.md      ← Danh sách patterns giọng AI bị cấm
│   └── vivid-library.md         ← Thư viện hình ảnh sống động
│
├── 🌉 obsidian-bridge/          ← CẦU NỐI (cần sửa vault path)
│   ├── config.yaml              ← ⚠️ SỬA VAULT PATH Ở ĐÂY
│   └── injection-rules.md       ← Quy tắc tìm + inject story vào bài
│
├── 🎭 personas/                 ← GIỌNG NÓI
│   ├── _template/               ← Template trống — cho bạn điền DNA riêng
│   │   ├── voice-dna.yaml       ← Xưng hô, fillers, tone
│   │   ├── pillars.yaml         ← Trụ cột nội dung (3-5 chủ đề)
│   │   ├── audience.yaml        ← Đối tượng bạn viết cho ai
│   │   ├── authorities.yaml     ← Chuyên gia bạn hay trích dẫn
│   │   ├── scoring-rules.yaml   ← Quy tắc chấm điểm tuỳ chỉnh
│   │   ├── vivid-library.yaml   ← Hình ảnh sống động riêng
│   │   └── profile.yaml         ← Thông tin cá nhân
│   │
│   └── thong-phan/              ← DNA Thông Phan (mẫu tham khảo)
│       ├── voice-dna.yaml       ← "tui", "anh em", "ổng/bả"...
│       ├── pillars.yaml         ← Career, AI, Mindset
│       ├── audience.yaml        ← NV 25-35 tuổi
│       ├── thong-phan-dna.md    ← Tiêu chuẩn viết đầy đủ
│       └── ...
│
├── 🔄 workflows/                ← CÁC LỆNH (dùng trong Antigravity)
│   ├── content-post.md          ← /content-post — viết bài viral
│   ├── story-bank.md            ← /story-bank — nhập stories
│   ├── process-inbox.md         ← /process-inbox — xử lý ghi chú
│   └── onboarding-persona.md   ← /onboarding-persona — tạo DNA riêng
│
├── 🌟 samples/                  ← BÀI MẪU (tham khảo)
│   ├── gold-standard-viral-posts.md  ← Mẫu câu kết + stories hay
│   ├── hook-samples.md               ← Mẫu câu mở đầu
│   ├── test-post-ai-tap-trung.md     ← Bài mẫu hoàn chỉnh
│   └── test-post-quality-report.md   ← Báo cáo chất lượng mẫu
│
├── 🧠 vault-template/           ← CẤU TRÚC second brain (TRỐNG)
│   └── 00-Inbox, 01-Atomic/... ← Copy vào Obsidian vault
│
└── 📖 vault-sample/             ← KHO MẪU (24 stories Thông Phan)
    └── 01-Atomic/Stories/...    ← Copy nếu dùng chế độ A
```

---

## ❓ Câu hỏi thường gặp

**Q: Mình chưa biết gì về Antigravity, có dùng được không?**
> Được. Bạn chỉ cần cài Antigravity Agent, mở nó lên, gõ lệnh. Nó là 1 AI assistant chạy trong IDE (VS Code hoặc Cursor).

**Q: Stories kể xong lưu ở đâu?**
> Lưu trên máy tính của bạn, trong Obsidian vault. Không upload lên đâu cả. An toàn 100%.

**Q: Mỗi bài viết mất bao lâu?**
> AI draft ~ 3-5 phút. Bạn review + chỉnh ~ 10-15 phút. Tổng ~ 15-20 phút/bài.

**Q: Có thể dùng cả DNA Thông Phan VÀ DNA riêng cùng lúc không?**
> Có. Hệ thống hỗ trợ nhiều persona. Lúc viết bài, chọn persona nào chạy persona đó.

**Q: Mình viết về ngành khác (sức khoẻ, giáo dục...) được không?**
> Được hoàn toàn. Engine (động cơ) giống nhau, bạn chỉ cần:
> - Tạo persona riêng → chọn pillars (trụ cột) phù hợp ngành
> - Thêm authorities (chuyên gia) trong ngành
> - Kể stories liên quan đến ngành
> - AI sẽ viết đúng giọng + đúng chuyên môn của bạn

**Q: Kho stories càng nhiều càng tốt?**
> Đúng. Bắt đầu với 10 stories. Mục tiêu 3 tháng: 30+. Mục tiêu 1 năm: 100+.
> Càng nhiều stories → AI càng dễ tìm câu chuyện phù hợp cho mỗi bài.

**Q: Bài viết có bị giống AI không?**
> Hệ thống có bộ **Anti-AI Patterns** kiểm tra tự động. Nếu phát hiện giọng AI → sửa lại trước khi giao. Cụ thể:
> - ❌ Không dùng dấu "-" làm connector
> - ❌ Không câu cụt "Thu nhập? Sao vậy?"
> - ❌ Không English đan xen
> - ❌ Không structure lặp AI-style

---

## 📊 Kết quả thực tế (Thông Phan)

| Chỉ số | Trước | Sau khi dùng |
|---|---|---|
| Kho stories | 0 | **24+** stories đã structured |
| Thời gian/bài | 4-6 giờ | **15-20 phút** review |
| Chất lượng | Không ổn định | **127 điểm kiểm tra** mỗi bài |
| Giọng viết | Hay bị AI hoá | **100% DNA riêng** |
| Bài viral | Không dự đoán được | **40+ bài, 80k+ shares** |

---

## 🔄 Quy trình hàng ngày

```
SÁNG (khi có cảm hứng)        TỐI (khi cần bài)
═══════════════════════        ════════════════════

📱 Nghĩ ra chuyện hay          💻 /content-post
     │                              │
     ▼                              ▼
📝 /story-bank                 🏭 AI chạy 7 bước:
"Kể chuyện hôm qua..."            Ý tưởng → Nghiên cứu
     │                              → Hook → Dàn bài
     ▼                              → Viết → Kiểm tra
🧠 Lưu vào vault                    → Hoàn thiện
(sẵn sàng cho bài sau)              │
                                     ▼
                                ✅ Bài viết xong
                                   Review → Đăng
```

---

## 🆘 Gặp lỗi?

| Lỗi | Nguyên nhân | Cách sửa |
|---|---|---|
| "Không tìm thấy vault" | Chưa sửa vault path | Sửa `obsidian-bridge/config.yaml` |
| "Không có stories" | Vault trống | Kể 10 stories qua `/story-bank` |
| "Persona not found" | Chưa tạo persona | Chạy `/onboarding-persona` |
| Bài giọng AI | Chưa cấu hình DNA | Điền `voice-dna.yaml` chi tiết hơn |

---

**Made with ❤️ by [Thông Phan](https://thongphan.com) × [Conan School](https://conanschool.com)**

**Hỗ trợ:** Liên hệ qua [Facebook Thông Phan](https://facebook.com/thongphan.page) hoặc nhóm Conan School
