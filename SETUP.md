# Hướng Dẫn Cài Đặt & Onboarding

## Bước 1: Cài đặt môi trường

### 1.1 Cài Antigravity Agent
Nếu chưa có, cài Antigravity Agent theo hướng dẫn tại [github.com/thongphan23/antigravity-agent](https://github.com/thongphan23/antigravity-agent)

### 1.2 Cài Obsidian
Tải miễn phí tại [obsidian.md](https://obsidian.md). Sau khi cài, tạo vault mới hoặc dùng vault hiện có.

---

## Bước 2: Chọn chế độ

### Chế độ A: Dùng ngay DNA Thông Phan

Phù hợp nếu bạn muốn:
- Thử nghiệm hệ thống ngay lập tức
- Học cách hệ thống hoạt động với dữ liệu thực
- Viết bài theo phong cách Thông Phan

**Làm gì:**
1. Copy toàn bộ thư mục `vault-sample/01-Atomic/Stories/` vào Obsidian vault của bạn
2. Bắt đầu dùng workflow `/content-post`
3. Hệ thống sẽ dùng DNA Thông Phan + stories Thông Phan

### Chế độ B: Tạo DNA riêng cho bạn

Phù hợp nếu bạn muốn:
- Viết bài với giọng riêng của mình
- Hướng đến đối tượng riêng
- Dùng câu chuyện thật từ cuộc đời mình

**Làm gì:**
1. Chạy workflow `/onboarding-persona`
2. Trả lời các câu hỏi Agent đưa ra (xưng hô, giọng điệu, đối tượng...)
3. Kể ít nhất 10 câu chuyện → `/story-bank`
4. Bắt đầu viết bài → `/content-post`

---

## Bước 3: Cấu hình DNA riêng (Chế độ B)

### 3.1 Voice DNA — Giọng nói riêng

Mở file `personas/_template/voice-dna.yaml` và điền:

```yaml
voice:
  pronouns:
    self: ""           # Ví dụ: "tui", "mình", "tôi"
    audience: ""       # Ví dụ: "anh em", "bạn", "mọi người"
    expert_after_intro: ""  # Ví dụ: "ổng/bả", "anh ấy"
    
  tone:
    primary: ""        # confident-direct | warm-friendly | motivational
    personality: ""    # Mô tả ngắn: "đàn anh nói thẳng"
    
  fillers:
    library: []        # Ví dụ: ["nha", "há há", "cơ mà"]
    
  parentheticals:
    library: []        # Ví dụ: ["(tin mình đi)", "(và đây mới hay)"]
```

### 3.2 Content Pillars — Trụ cột nội dung

Mở `personas/_template/pillars.yaml` và chọn 3-5 trụ cột:

```yaml
pillars:
  - name: ""           # Ví dụ: "Sức khoẻ & Dinh dưỡng"
    description: ""    # Mô tả ngắn
    topics: []         # Ví dụ: ["dinh dưỡng", "tập luyện", "giấc ngủ"]
```

### 3.3 Target Audience — Đối tượng

Mở `personas/_template/audience.yaml`:

```yaml
audience:
  age_range: ""        # Ví dụ: "25-40"
  income: ""           # Ví dụ: "15-50 triệu/tháng"
  pain_points: []      # Nỗi đau chính
  daily_reality: ""    # Hoàn cảnh hàng ngày
```

### 3.4 Authority Library — Chuyên gia

Mở `personas/_template/authorities.yaml` và thêm 5-10 chuyên gia uy tín trong ngành:

```yaml
authorities:
  - name: ""           # Tên đầy đủ
    credential: ""     # Credential ngắn gọn
    field: ""          # Lĩnh vực
```

---

## Bước 4: Xây kho stories (QUAN TRỌNG NHẤT)

Stories (câu chuyện thật) là nguyên liệu quý nhất. Bạn nên có ít nhất **10 stories** trước khi viết bài đầu tiên.

### Cách kể story cho AI:

Chạy `/story-bank` rồi kể thô, tự nhiên. Ví dụ:

> "Hồi 2019 tui đang làm ở công ty A, bị sếp chê trước mặt cả team. Lúc đó tui muốn bỏ việc luôn. Nhưng thay vì bỏ, tui quyết định im lặng, về nhà nghĩ lại và viết ra 3 điều cần cải thiện. 2 tháng sau tui được thăng chức..."

AI sẽ:
1. Phân tích: ai, khi nào, chủ đề gì
2. Cấu trúc thành 5 phần (Bối cảnh → Vấn đề → Bước ngoặt → Kết quả → Bài học)
3. Lưu vào vault, sẵn sàng inject vào bài

### 10 chủ đề gợi ý kể story:

1. **Tiền bạc đầu tiên** — Lần đầu kiếm tiền bằng sức mình
2. **Sai lầm tài chính** — Mất tiền vì quyết định sai
3. **Bỏ cuộc đúng lúc** — Dừng 1 thứ và cuộc đời tốt hơn
4. **Thất bại lớn nhất** — Cụ thể: mất gì, đau thế nào
5. **Người thay đổi cuộc đời** — Ai ảnh hưởng đến bạn nhất
6. **Thói quen thay đổi tất cả** — Routine nào giúp bạn thành công
7. **Cuốn sách/bài giảng mở nắp** — Đọc/nghe gì thay đổi tư duy
8. **Bị chê/phản đối mạnh** — Phản ứng thế nào, giờ nhìn lại sao
9. **Burnout** — Kiệt sức và hồi phục
10. **Khoảnh khắc "đúng đường"** — Biết mình đang đi đúng

---

## Bước 5: Viết bài đầu tiên

Chạy workflow `/content-post` và bài viết sẽ được sản xuất qua 7 bước:

1. **Ý tưởng** — Chọn chủ đề, góc nhìn
2. **Nghiên cứu** — Scan vault, tìm stories + data
3. **Hook** — Viết câu mở đầu hấp dẫn
4. **Dàn bài** — Outline 5 phần, 1500-1800 từ
5. **Viết** — Voice DNA + inject stories
6. **Kiểm tra** — Chấm điểm, check auto-fail
7. **Hoàn thiện** — Format, sẵn sàng đăng

---

## Bước 6: Cải tiến liên tục

- Thêm stories mỗi tuần (mục tiêu 3-5/tuần)
- Review bài đã viết → calibrate tiêu chuẩn
- Mở rộng Authority Library khi tìm được chuyên gia mới
- Cập nhật Pain-Points khi hiểu audience sâu hơn

---

## FAQ

**Q: Có cần biết lập trình không?**
A: Không. Bạn chỉ cần Antigravity Agent và Obsidian.

**Q: Mất bao lâu để có hệ thống hoạt động?**
A: 1-2 tuần nếu siêng kể stories. Kho stories QUAN TRỌNG nhất.

**Q: Có thể dùng cùng lúc DNA Thông Phan VÀ DNA riêng không?**
A: Có. Hệ thống hỗ trợ nhiều persona cùng lúc.

**Q: Stories có bị ai đọc được không?**
A: Stories lưu trong Obsidian vault trên MÁY CỦA BẠN. Không upload đi đâu cả.
