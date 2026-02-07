# Obsidian DIKW Bridge — Knowledge Injection Rules
# Version: v18.2
# Purpose: Quy trình inject knowledge từ Obsidian vault vào bài viết
# Includes: SAS (Story Authentication Standard) + FCS (Framework Credibility Standard)

---

## Nguyên Tắc DIKW

```
DATA        → Biết WHAT (số liệu, trích dẫn)
INFORMATION → Biết HOW (khái niệm, phân loại)
KNOWLEDGE   → Biết WHY (insights, patterns, frameworks)
WISDOM      → Biết WHEN/IF (stories = knowledge + experience)
```

**Content "trí tuệ" = Knowledge + Wisdom layer**
- Bài viết bình thường: chỉ có D + I (copy-paste facts)
- Bài viết sâu: có D + I + K (phân tích + framework)
- Bài viết trí tuệ: có D + I + K + **W** (trải nghiệm thật khiến reader cảm nhận sự thấu hiểu)

---

## Injection Flow trong Pipeline

### Phase 2 (Research — insight-agent):

```
1. NHẬN topic từ Phase 1

2. SCAN vault theo config:
   - Đọc obsidian-bridge/config.yaml
   - Lấy vault_path và scan_folders
   - Đọc YAML frontmatter mỗi .md file trong scan_folders

3. MATCH atoms:
   - So sánh post_topic_keywords ↔ atom.topic[] (frontmatter)
   - Tính relevance = overlap_count × dikw_weight
   - Sắp xếp theo relevance DESC

4. FILTER:
   - Chỉ lấy atoms có confidence >= 0.5
   - Chỉ lấy atoms có status != "rejected"
   - Max 5 atoms

5. OUTPUT → Research Brief bao gồm:
   - External research (experts, studies)
   - DIKW atoms (injected from vault)
   - Atom metadata (source, type, dikw_layer)
```

### Phase 5 (Writing — writing-agent):

```
1. NHẬN Research Brief (có atoms)

2. XỬ LÝ theo DIKW layer:

   WISDOM (Stories):
   → Dùng trực tiếp trong bài. Rewrite theo Voice DNA.
   → Đặt ở Section 2 (Story) hoặc Section 5 (Closing)
   → Ví dụ: "Tui có quen người bạn làm content... bả [story from vault]"

   KNOWLEDGE (Insights, Frameworks):
   → Tái diễn giải theo Voice DNA. Dùng làm backbone cho deep dive.
   → Đặt ở Section 3 (Deep Dive) hoặc Section 4 (Framework)
   → Ví dụ: "Và đây mới là cái ghê nha... [insight from vault]"

   INFORMATION (Concepts):
   → Weave into narrative. Dùng để giải thích thuật ngữ.
   → Đặt ở bất kỳ section nào cần context
   → Ví dụ: "[concept name] là cái mà ổng gọi là..."

   DATA (Quotes, Data-Points):
   → Dùng để làm "gia vị". Cụ thể hóa argument.
   → Đặt ở nơi cần evidence cụ thể

3. POKA-YOKE CHECK:
   ⛔ Không có atom liên quan? → BỎ QUA. KHÔNG BỊA.
   ⛔ Atom là story? → Verify type == "story" trong frontmatter
   ⛔ Atom confidence < 0.5 → KHÔNG dùng
   # --- SAS v18.2 ---
   ⛔ [SAS] Writing Agent KHÔNG ĐƯỢC TỰ TẠO stories personal/observed
   ⛔ [SAS] Story KHÔNG có trong vault → dùng famous world stories HOẶC bỏ qua
   ⛔ [SAS] KHÔNG dùng người Việt Nam làm nhân vật (trừ vault verified)
   ✅ [FCS] Framework/formula PHẢI có credibility intro (ai tạo + credential HOẶC ai dùng + thành tựu)
```

---

## Ví Dụ Thực Tế

### Topic: "Tập trung vào 1 thứ duy nhất"

**Vault scan kết quả:**
```yaml
matched_atoms:
  - file: "career-insight-focusing-on-ones-circle-of-competence-is.md"
    type: insight
    dikw: knowledge
    relevance: 10
    topic_overlap: ["career", "focus"]

  - file: "career-concept-vng-trn-nng-lc.md"
    type: concept
    dikw: information
    relevance: 6
    topic_overlap: ["career", "focus"]

  - file: "marketing-story-the-facebook-content-strategists-story.md"
    type: story
    dikw: wisdom
    relevance: 4
    topic_overlap: ["marketing"]
```

**Injection vào bài viết:**
- **Insight (K)** → Deep Dive section: "Tập trung vào Vòng tròn năng lực thay vì cố giỏi mọi thứ"
- **Concept (I)** → Define: "Circle of Competence là biết ranh giới năng lực và chỉ hoạt động trong đó"
- **Story (W)** → Closing: "Tui có quen bả, làm content trên Facebook, mọi người bảo phải quay video mới viral... bả tập trung vào viết, hiểu sâu audience, rồi triệu view."

→ Bài viết có chiều sâu **trí tuệ** vì có cả trải nghiệm thật (W), không chỉ lý thuyết (I/K).

---

## Notes (v18.3 Updated)

- Vault hiện có **51 atoms** (17 Concepts, 12 Insights, **17 Stories structured**, 4 Frameworks)
- **Story Bank**: `01-Atomic/Stories/` — 17 story atoms covering 11 categories
- **Story Sources đã extract**: 6 Viral Posts ✅ + 7 Posted ✅ = 13 bài extracted
- **4-layer scanning**: Atomic Stories → Viral Posts → Posted → Reflections
- Topics covered: career (7), content (1), productivity (1), mindset (1), relationship (1), decision (1), writing (1), marketing (3), buddhism (1)
- **Workflow**: `/story-bank` — nhập raw story → structured atom
- **Gaps**: cần thêm stories cho pillars: life, business, learning

---

## Story Injection Priority (v18.1)

| Priority | SubType | Weight | Cách inject vào bài |
|:---|:---|:---|:---|
| 🥇 1 | `personal` (self) | **15** | Ngôi 1, có chi tiết cảm xúc, đặt ở Hook/Story section |
| 🥈 2 | `observed` (friend) | **12** | "Tui có quen người...", đặt ở Deep Dive |
| 🥉 3 | `secondhand` (expert) | **8** | "Tui có đọc bài...", anywhere hỗ trợ evidence |
| 4 | `historical` | **5** | Ngắn, chỉ làm "gia vị" minh họa |

### Nguyên tắc chọn story:

```
1. Có story personal_self liên quan? → DÙNG NGAY (weight 15)
2. Không có self? → Tìm observed story (weight 12)
3. Không có cả 2? → Tìm secondhand/historical (weight 5-8)
4. Vault trống story liên quan? → BỎ QUA, KHÔNG BỊA. Viết bằng expert evidence thay thế.
```

### Story Rewriting Rules:

```yaml
story_rewriting:
  personal_self:
    voice: "Ngôi thứ nhất, tự nhiên"
    detail: "Thêm chi tiết cảm xúc, timeline cụ thể"
    example: "Tui nhớ hồi đó, 11 tháng liên tục chỉ tập trung vào 1 thứ..."

  observed:
    voice: "Ngôi thứ ba, thân mật"
    detail: "Giữ tên thật (hoặc nickname), relationship rõ"
    example: "Tui có quen bả, làm content trên Facebook..."

  secondhand:
    voice: "Attribution rõ ràng"
    detail: "Ghi nguồn cụ thể"
    example: "Cal Newport kể trong cuốn Deep Work rằng..."

  historical:
    voice: "Ngắn gọn, compelling"
    detail: "Chỉ dùng chi tiết nổi bật nhất"
    example: "Các nhà sư Tây Tạng mất nhiều tuần tạo tranh cát rồi... quét đi."
```

