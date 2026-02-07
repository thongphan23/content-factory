# Hook Formula Library — Universal
# Version: v18.0
# Purpose: 15 công thức hook phổ quát, không gắn voice cụ thể

formulas:
  F1:
    name: "Counter-Intuitive Statement"
    pattern: "[Hành động ai cũng khuyên] thực ra đang [hậu quả tiêu cực ngầm]."
    when: "Phản bác niềm tin phổ biến"
    example_structure: "Anh em càng cố gắng [X] thì càng [Y tiêu cực]."

  F2:
    name: "Shocking Statistic"
    pattern: "[Con số bất ngờ] + [implication cho reader]"
    when: "Có data point mạnh, gây sốc"
    example_structure: "[X]% người [hành động phổ biến] nhưng [kết quả ngược]."

  F3:
    name: "Personal Failure Story"
    pattern: "[Tui/Tôi/Mình] từng [sai lầm cụ thể]... cho đến khi [turning point]."
    when: "Có câu chuyện cá nhân thật (verified)"
    requires: "Authenticated story from vault/database"

  F4:
    name: "Famous Person Quote"
    pattern: "[Expert name], [credentials]... [ổng/bả/họ] nói: '[quote powerful]'."
    when: "Có expert authority mạnh"
    requires: "Expert from authorities library"

  F5:
    name: "Myth Buster"
    pattern: "Ai cũng bảo [niềm tin phổ biến], nhưng [sự thật ngược lại]."
    when: "Đập vỡ hiểu lầm phổ biến"

  F6:
    name: "Future Prediction"
    pattern: "[Thời điểm] nữa, [X]% người sẽ [hậu quả]... vì [lý do ít ai biết]."
    when: "Chủ đề liên quan trends, technology"

  F7:
    name: "Confession/Vulnerability"
    pattern: "Nói thiệt nha, [tui/tôi/mình] [thừa nhận yếu điểm]... và đây là [bài học]."
    when: "Muốn tạo kết nối sâu, vulnerability"

  F8:
    name: "Achievement Reveal"
    pattern: "[Kết quả ấn tượng] mà không cần [cách thông thường]."
    when: "Có case study với số liệu mạnh"

  F9:
    name: "Social Proof"
    pattern: "[Số lượng người] đã [hành động]... [kết quả đáng kể]."
    when: "Có social proof numbers"

  F10:
    name: "Contrarian Question"
    pattern: "Tại sao [người thành công] lại [hành động ngược thông thường]?"
    when: "Có paradox thú vị"

  F11:
    name: "Loss Aversion"
    pattern: "Mỗi ngày [reader], [mất đi X cụ thể]... mà không hề biết."
    when: "Muốn trigger loss aversion"

  F12:
    name: "Authority Borrowing"
    pattern: "[Expert, credentials, cascade]... [quote hoặc discovery]."
    when: "Expert authority là điểm mạnh nhất của bài"

  F13:
    name: "Scenario Paint"
    pattern: "[Vivid scene]... [reader thấy chính mình]... và [twist]."
    when: "Muốn reader identify ngay từ đầu"

  F14:
    name: "Identity Challenge"
    pattern: "Anh em tự nhận là [identity]... nhưng [reality check]."
    when: "Challenge reader's self-image"

  F15:
    name: "Direct Desire/Pain (PLATINUM)"
    pattern: "Muốn [desire cụ thể] thì [hành động ngược trực giác]."
    when: "Desire rõ ràng + Contrarian angle"
    note: "Strongest formula, dùng cho flagship posts"

# Rotation Rule
rotation:
  rule: "Không dùng cùng formula 2 lần trong 3 bài liên tiếp"
  check_file: "production/[user]/hook-history.yaml"
