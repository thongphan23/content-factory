---
description: ✍️ Viết bài Thông Phan viral post theo chuẩn v19.0 (Closing Library + VTS + Anti-Staccato v2)
---

# Thông Phan Viral Post Workflow v19.0

> **Tạo bài viết viral theo chuẩn Thông Phan DNA với Formula 15 Hook**
> **Source of Truth:** `.agent/agents/orchestrator.agent.md` v3.0.0

---

## ⚡ SUBCOMMANDS

### `/thongphan-post [topic]` - Bắt đầu mới
1. Đọc User Brief / Research Data.
2. Kích hoạt Pipeline 7 Phases tuần tự.
3. POKA-YOKE enforcement tại mỗi phase.

### `/thongphan-post tiếp tục` - Resume từ handoff
1. Tìm `knowledge/content-factory/production/handoff.yaml` trong workspace.
2. Đọc trạng thái (Phase hiện tại, Artifacts đã duyệt).
3. Tiếp tục ngay từ phase dang dở không hỏi lại user.

---

## 📋 INPUT CẦN THIẾT

Trước khi bắt đầu, cần xác định:

1. **Chủ đề/Topic**: Anh muốn viết về gì?
2. **Target Audience**: Nhân viên văn phòng? Freelancer? Startup founder?
3. **Desire/Pain chính**: Họ MUỐN gì hoặc SỢ gì nhất?
4. **Authority để mượn uy tín**: Người nổi tiếng/nghiên cứu nào liên quan?

---

## 🏃 PIPELINE 7 PHASES (Đồng bộ với Orchestrator v3.0.0)

### Phase 1: Idea Curation
// turbo
- **Agent**: `idea-curator-agent`
- **Đọc**: `knowledge/content-factory/persona/content-pillars.yaml`
- **Việc làm**: Map topic → content pillar, tìm contrarian angle, xác định transformation promise
- **POKA-YOKE Gate**: Contrarian angle rõ ràng? Viral potential >= 7?
- **Output**: `idea-brief`

### Phase 2: Research & Insight
// turbo
- **Agent**: `insight-agent`
- **Đọc**: `knowledge/content-factory/research/authority-library.md`
- **Việc làm**: Thu thập 2+ studies, 1+ expert, scan vault cho stories, 5+ specific numbers
- **[SAS v18.2] Story Source Check**:
  - Scan Obsidian vault cho stories liên quan (01-Atomic/Stories/, Viral Posts/, Posted/)
  - Nếu có vault story → đánh dấu `source: vault`
  - Nếu KHÔNG có → tìm famous world stories (Steve Jobs, Toyota, etc.) + ghi nguồn
  - ⛔ **TUYỆT ĐỐI KHÔNG BỊA** stories personal/observed
- **POKA-YOKE Gate**: Đủ data? Có hidden mechanism? Story từ vault hoặc famous world?
- **Output**: `research-brief` (bao gồm story_source tag)

### Phase 3: Hook Engineering
// turbo
- **Agent**: `hook-agent`
- **Đọc**: `knowledge/content-factory/samples/hook-samples.md`, `production/hook-history.yaml`
- **Việc làm**: Chọn formula (check rotation), viết 3 versions, score/select
- **POKA-YOKE Gate**: Score >= 8? Sting Test hit Layer 3? Không trùng 3 bài gần nhất?
- **Output**: `hook` (2-5 câu)

### Phase 4: Structure Design
// turbo
- **Agent**: `structure-agent`
- **Việc làm**: Outline 5 phần, phân bổ word count, plan emotional beats
- **Word Count**: 1500-1800 từ (KHÔNG quá 1800)
- **POKA-YOKE Gate**: Đủ 5 phần? Story trước research? Framework 3+ bước?
- **[VTS v19.0] Value Thread Planning**: Mỗi section PHẢI có value signal được plan trước
- **[Closing v19.0] Chọn Closing Type**: 1 trong 6 dạng (check rotation với 2 bài trước)
- **Output**: `outline` (bao gồm value_thread + closing_type)

### Phase 5: Writing (Voice DNA Enforcement)
// turbo
- **Agent**: `writing-agent` (CRITICAL AGENT)
- **Đọc**: `knowledge/content-factory/standards/thong-phan-dna.md`
- **Tuân thủ TRIỆT ĐỂ:**

**Voice DNA (BẮT BUỘC — AUTO-FAIL):**
- Dùng "tui" (không tôi)
- Dùng "anh em" (không các bạn)
- Dùng "ổng/bả" sau khi đề cập tên
- 5-7 fillers: nha, há há, khẹc khẹc, đúng không
- 6-10 parentheticals (...)

**TUYỆT ĐỐI KHÔNG ĐƯỢC — AUTO-FAIL:**
- ❌ Dấu "-" làm connector
- ❌ Câu hỏi thật ("Nghe quen không?") → dùng "Anh em biết mà."
- ❌ Staccato: "Sáng mở mắt. Cả ngày chạy." → dùng narrative
- ❌ Micro-Staccato: "12k shares. Đổi đời luôn." → merge thành 1 câu dài
- ❌ Anaphora: "Không X. Không Y. Không Z." → viết liền mạch
- ❌ Cấu trúc lặp: "X là Y. X là Z."
- ❌ Tiếng Anh đan xen không ngoặc (proper nouns OK, còn lại PHẢI trong ngoặc đơn)
- ❌ Dấu "—" em dash làm connector
- ❌ Câu cụt lủn (1-2 từ + dấu ?/!): "Thu nhập?", "Sao vậy?"

**BẮT BUỘC CÓ:**
- ✅ 1-2 Killer Statements: "Ngày mà anh em [action], là ngày [consequence]"
- ✅ Authority citation đa dạng (tên chính xác, info phụ mờ)
- ✅ Proper Noun: giữ nguyên + dịch trong ngoặc
- ✅ Reader engagement mỗi 2-3 câu
- ✅ Min 3+ concrete imagery

**[VTS v19.0] VALUE THREADING — BẮT BUỘC:**
- ✅ Mỗi 3-5 câu PHẢI có value signal (reader được/tránh gì)
- ✅ Hook: Value Promise mạnh nhất
- ✅ Story: Result Preview
- ✅ Deep Dive: Pain Avoidance xen Value Promise
- ✅ Framework: Social Proof + Value Promise
- ✅ Closing: Result Preview hoặc Personal Commitment

**[SAS v18.2] STORY AUTHENTICATION — AUTO-FAIL:**
- ⛔ CHỈ dùng stories từ 2 nguồn: Obsidian Vault (verified) HOẶC Người/tổ chức nổi tiếng thế giới
- ⛔ KHÔNG ĐƯỢC BỊA câu chuyện "Tui có quen một bạn..." khi bạn đó KHÔNG CÓ trong vault
- ⛔ KHÔNG dùng người Việt Nam (trừ khi đã có trong vault)
- ✅ Vault trống story → dùng famous world stories (Ray Dalio, Toyota, Jeff Bezos...)
- ✅ Không có story phù hợp → viết bằng data/research, KHÔNG CẦN STORY CŨNG OK

**[FCS v18.2] FRAMEWORK CREDIBILITY — BẮT BUỘC:**
- ✅ Mọi framework/formula/matrix PHẢI có ít nhất 1 trong 3:
  - Ai tạo ra + credential ngắn gọn
  - Ai dùng thành công + kết quả
  - Bao nhiêu người/tổ chức áp dụng
- Ví dụ: "Ma trận Nỗ lực-Giá trị, được Stephen Covey phổ biến trong The 7 Habits..."

**Writing Agent tích hợp:**
- Personal knowledge injection (đọc Obsidian data khi viết)
- Natural language smoothing (áp dụng Voice DNA khi viết)
- **Output**: Draft 1200-1500 words

### Phase 6: Quality Assurance
// turbo
- **Agent**: `quality-check-agent`
- **Rubric** (120 điểm):
  - Voice DNA: 30 pts
  - Anti-AI Patterns: 20 pts
  - Content Quality: 50 pts
  - Poetic Mastery: 20 pts

```yaml
# Verdicts:
PASS: "Score >= 95 AND zero auto-fail → Phase 7"
REVISE: "Score 80-94 → quay lại Phase 5 (max 3 lần)"
FAIL: "Score < 80 → quay lại Phase 1/2 hoặc escalate"
```

### Phase 7: Polish, Format & Production Log
// turbo
- **Agent**: `format-agent`
- **Việc làm**: Paragraph check, visual breaks, punctuation, diversity check
- **Post-production**: Tự động cập nhật `production-log.yaml` và `hook-history.yaml`
- **Output**: **BÀI VIẾT HOÀN CHỈNH READY TO PUBLISH**

---

## 🔧 CLOSING LIBRARY (v19.0) — 6 DẠNG

```yaml
# KHÔNG MẶC ĐỊNH. Phải CHỌN 1 trong 6, rotation mỗi 3 bài.
# Đọc chi tiết: knowledge/content-factory/standards/thong-phan-dna.md > Section 5

1. Thoải Mái: "Làm hết thì tuyệt, 1-2 cái cũng ok" (bài nhiều steps)
2. Personal Commitment: "Tui đang đi con đường này" (bài có personal story mạnh)
3. Kết Quả Thật Hừng Hực: Kể số liệu + cảm xúc (bài có success story)
4. Quote Đóng Đinh: Câu nói expert + personal reflection (bài có authority)
5. CTA Cộng Đồng: Mời comment/tham gia (bài muốn conversation)
6. 2 Con Đường: So sánh 2 tương lai (CHỈ 1 trong 6, không mặc định)

# POKA-YOKE: Dùng cùng dạng 2 bài liên tiếp = phải đổi
```

---

## 🔄 MULTI-SESSION (POKA-YOKE)

Khi context đạt 70%, agent tự động:
1. Ghi `knowledge/content-factory/production/handoff.yaml`
2. Lưu checkpoint artifacts
3. Handoff Message: "Context 70%. Nhập '/thongphan-post tiếp tục' ở phiên mới."

---

## 🔧 XỬ LÝ LỖI

1. **FAIL POKA-YOKE gate** → Agent nguồn tự sửa → Retry (max 3)
2. **FAIL 3 lần** → Escalate cho user
3. **Agent drifting** → Revert + ghi log
