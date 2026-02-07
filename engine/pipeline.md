# Content Factory — Universal Pipeline Engine v18.0
# Purpose: 7-phase pipeline phổ quát, đọc Voice DNA từ Persona Pack

---

## Overview

Pipeline này là **engine trung tâm** của Content Factory. Nó KHÔNG chứa thông tin cá nhân (voice, persona, audience). Tất cả được đọc từ **Persona Pack** tại `personas/[user]/`.

---

## 7-Phase Pipeline

```
PHASE 1 → PHASE 2 → PHASE 3 → PHASE 4 → PHASE 5 → PHASE 6 → PHASE 7
  IDEA     RESEARCH    HOOK    STRUCTURE  WRITING     QA      FORMAT
```

### Phase 1: Idea Curation
- **Agent**: idea-curator-agent
- **Input**: Topic thô từ user
- **Process**: 
  1. Đọc `personas/[user]/pillars.yaml` → xác định pillar phù hợp
  2. Xác định core tension, hidden belief, contrarian angle
  3. Check diversity: không trùng pillar 3 bài liên tiếp (từ `production/[user]/`)
- **Output**: Idea brief (topic, pillar, angle, promise)
- **POKA-YOKE Gate**: Phải có contrarian angle + viral score >= 7/10

### Phase 2: Research & Insight
- **Agent**: insight-agent
- **Input**: Idea brief
- **Process**:
  1. Đọc `personas/[user]/authorities.yaml` → tìm experts phù hợp
  2. **[DIKW Bridge]** Scan Obsidian vault → tìm atoms liên quan (xem `obsidian-bridge/`)
  3. Thu thập: 2+ nghiên cứu, 1+ expert, 5+ con số cụ thể
  4. Rank atoms theo DIKW layer: Stories (W) > Insights (K) > Frameworks (K) > Concepts (I)
- **Output**: Research brief + injected atoms
- **POKA-YOKE Gate**: Đủ evidence, expert có credentials, atoms verified

### Phase 3: Hook Engineering
- **Agent**: hook-agent
- **Input**: Idea brief + Research brief
- **Process**:
  1. Chọn formula từ 15 hook formulas (`engine/hook-formulas.md`)
  2. Check rotation: không dùng cùng formula 2 lần trong 3 bài (`production/[user]/hook-history.yaml`)
  3. Viết 3 phiên bản, chấm điểm, chọn tốt nhất
  4. Đọc `personas/[user]/vivid-library.yaml` → chọn vivid anchor
- **Output**: Hook (câu hook + 2 câu promise + authority tease)
- **POKA-YOKE Gate**: Score >= 8/10, Sting Layer 3, rotation check

### Phase 4: Structure Design
- **Agent**: structure-agent
- **Input**: Idea brief + Research + Hook
- **Process**:
  1. Thiết kế 5-part structure: Hook → Story → Deep Dive → Framework → Closing
  2. Phân bổ cảm xúc: empathy → tension → insight → action → hope
  3. Chỉ định atoms inject vào section nào
- **Output**: Outline chi tiết
- **POKA-YOKE Gate**: 5 parts, empathy first, word allocation

### Phase 5: Writing (Voice DNA)
- **Agent**: writing-agent
- **Input**: Outline + Research + Atoms
- **Process**:
  1. **Đọc `personas/[user]/voice-dna.yaml`** → áp dụng pronouns, fillers, parentheticals, tone
  2. Inject atoms: Stories → dùng trực tiếp, Insights → tái diễn giải theo voice
  3. Viết theo Anti-AI rules
  4. Thêm Killer Statements, Concrete Imagery, Reader Engagement
  5. **Nếu không có atom liên quan → bỏ qua, KHÔNG BỊA**
- **Output**: Draft bài viết
- **POKA-YOKE Gate**: Voice DNA 100%, Anti-AI 100%, min 3 vivid images

### Phase 6: Quality Assurance
- **Agent**: quality-check-agent
- **Input**: Draft
- **Process**:
  1. **Đọc `personas/[user]/scoring-rules.yaml`** → áp dụng custom auto-fail rules
  2. Chấm điểm theo scoring framework (4 sections)
  3. Check atom attribution (nếu dùng atom, phải trung thực)
- **Output**: Quality report + score
- **POKA-YOKE Gate**: Score >= threshold (từ scoring-rules.yaml), zero auto-fail

### Phase 7: Polish & Format
- **Agent**: format-agent
- **Input**: Approved draft + Quality report
- **Process**:
  1. Format paragraphs, breaks, bold
  2. Log vào `production/[user]/production-log.yaml`
  3. Update `production/[user]/hook-history.yaml`
  4. Check pillar diversity
- **Output**: Final post (ready to publish)
- **POKA-YOKE Gate**: Formatting rules, diversity check

---

## Rollback Rules

| Verdict | Action |
|:---|:---|
| Phase 6 REVISE (80-94) | → Quay Phase 5, max 3 retries |
| Phase 6 FAIL (<80) | → Quay Phase 1/2, escalate |
| Phase 3 Hook < 8 | → Retry hook, max 2 retries |
| Phase 2 insufficient evidence | → Research thêm, max 2 retries |

---

## Execution Modes

| Mode | Description |
|:---|:---|
| **Single Post** | 1 post, đầy đủ 7 phases |
| **Batch** | N posts, Phase 1 tất cả trước → sequential phases sau |
| **Quick Draft** | Skip Phase 6 (QA), output = draft chưa review |
