# Anti-AI Pattern Detection Guide
# Version: v19.0
# Purpose: Danh sách đầy đủ các pattern AI để phát hiện và loại bỏ

---

## AUTO-FAIL Patterns (Phát hiện = Fail ngay)

### 1. Dash Connector
```
❌ "Sáng dậy sớm - tập gym - ăn healthy"
✅ "Sáng dậy sớm rồi tập gym, xong ăn uống lành mạnh"
```

### 2. Staccato Sentences — AUTO-FAIL (v19.0 nâng cấp)
```
❌ "Sáng mở mắt. Cả ngày chạy. Tối nằm. Lặp lại."
✅ "Sáng mở mắt ra đã thấy mệt, cả ngày chạy như điên rồi tối về nằm bẹp... cứ vậy lặp lại."
```

### 2b. Micro-Staccato (v19.0 MỚI) — AUTO-FAIL
```
Rule: 2+ câu ≤ 8 từ kề nhau = AUTO-FAIL
❌ "Sau đó tui đạt bài 12.000 lượt chia sẻ. Đổi đời luôn."
✅ "Và bài đó đạt 12.000 lượt chia sẻ, con số mà tui chưa bao giờ nghĩ mình đạt được."

❌ "Một. Viết ra giấy."
✅ "Chỉ một thứ duy nhất thôi, viết ra giấy cho rõ ràng."

❌ "Chỉ 1 thứ thôi. Không phải 5. Không phải 3. Một."
✅ "Chỉ 1 thứ thôi nha, không phải 5, không phải 3, mà là một thứ duy nhất."
```

### 2c. Anaphora Overload (v19.0 MỚI) — AUTO-FAIL
```
Rule: 3+ câu bắt đầu bằng cùng 1 cụm từ = AUTO-FAIL
❌ "Không chạy theo xu hướng. Không nhảy dự án. Không cố làm tất cả."
✅ "Dẹp hết mấy cái xu hướng, cũng không nhảy qua dự án nào mới, và
    chắc chắn không cố ôm đồm tất cả cùng lúc."
```

### 3. Repetitive Structure
```
❌ "Sức khỏe là vốn. Thời gian là vốn. Kiến thức là vốn."
✅ "Sức khỏe, thời gian, kiến thức... tất cả đều là vốn, nhưng mỗi thứ mất đi theo cách khác nhau."
```

### 4. QA Pattern (Question-Answer)
```
❌ "Kết quả? 35 tuổi kiệt sức."
✅ "Và cái giá là, 35 tuổi, kiệt sức không còn sức để leo lên."
```

### 5. Numbered/Bullet Lists in Body
```
❌ "1. Dậy 5h  2. Tập gym  3. Ăn sáng"
✅ "Chuông báo thức réo lúc 5h, tui lết ra khỏi giường rồi lao vào gym..."
```

---

## High-Risk Patterns (Cần kiểm tra kỹ)

### 6. AI Stutter / Parallel Structure
```
❌ "Không phải là thiếu tài năng. Không phải là thiếu nỗ lực."
✅ "Tài năng thì có. Nỗ lực cũng không thiếu. Vấn đề nằm ở chỗ khác."
```

### 7. Logic Symbols
```
❌ "Effort + Time = Results"
✅ "Nỗ lực cộng thêm thời gian, nghe đơn giản nhưng đời không vậy."
```

### 8. Generic Transitions
```
❌ "First... Second... Third... Finally..."
✅ Dùng narrative bridges: "Rồi...", "Và anh em biết gì không", "Cái ghê nhất là..."
```

### 9. Excessive Metaphor Stacking
```
❌ "Cuộc sống như một cuốn sách, mỗi chương là một bài học, mỗi trang là một trải nghiệm."
✅ 1 metaphor mạnh, kéo sâu, không stack nhiều.
```

### 10. Over-structured Paragraphs
```
❌ Mỗi paragraph bắt đầu bằng topic sentence + support + conclusion
✅ Mix: story → insight → punch... Flow tự nhiên như nói chuyện
```

---

## Detection Checklist

```yaml
auto_fail_scan:
  - pattern: "dấu '-' nối câu"
    regex: '\w+ - \w+'
    action: "Replace with comma or period"

  - pattern: "2+ câu <= 8 từ kề nhau (Micro-Staccato)"
    check: "manual + auto"
    action: "AUTO-FAIL — Merge into single flowing sentence"

  - pattern: "3+ câu cùng cấu trúc mở đầu (Anaphora Overload)"
    check: "manual"
    action: "AUTO-FAIL — Rewrite with varied sentence openers"

  - pattern: "X là Y lặp >= 3 lần"
    regex: '\w+ là \w+'
    action: "Rewrite with variety"

  - pattern: "English words (ngoài proper nouns)"
    blacklist: [sync, mindset, team, happy, focus, hustle, passion, brand, content, trend, viral, insight, level up, achieve]
    action: "Translate to Vietnamese"

  - pattern: "Ellipsis > 3 per post"
    action: "Reduce to max 3"

  - pattern: "Exclamation > 3 per post"
    action: "Reduce to max 3"
```
