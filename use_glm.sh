#!/bin/bash
# use_glm.sh — GLM-4.6 환경 설정 파일 생성 스크립트

# === 1️⃣ 경로 지정 ===
CLAUDE_DIR="$HOME/.claude"
SETTINGS_FILE="$CLAUDE_DIR/settings.json"

# === 2️⃣ 디렉토리 없으면 생성 ===
mkdir -p "$CLAUDE_DIR"

# === 3️⃣ 기존 설정 백업 ===
if [ -f "$SETTINGS_FILE" ]; then
  cp "$SETTINGS_FILE" "$SETTINGS_FILE.bak"
  echo "📦 기존 설정 백업됨: $SETTINGS_FILE.bak"
fi

# === 4️⃣ GLM용 설정 파일 작성 ===
cat > "$SETTINGS_FILE" <<EOF
{
  "env": {
    "ANTHROPIC_DEFAULT_HAIKU_MODEL": "glm-4.5-air",
    "ANTHROPIC_DEFAULT_SONNET_MODEL": "glm-4.6",
    "ANTHROPIC_DEFAULT_OPUS_MODEL": "glm-4.6"
  }
}
EOF

# === 5️⃣ API 연결정보 (필요시만) ===
export ANTHROPIC_BASE_URL="https://api.z.ai/api/anthropic"
export ANTHROPIC_AUTH_TOKEN="YOUR_ZAI_API_KEY"

echo "✅ GLM 환경 설정 완료"
echo " - 설정 파일: $SETTINGS_FILE"
echo " - 모델 기본값: glm-4.5-air / glm-4.6"
echo ""
echo "이제 claude를 자유롭게 실행하세요."
echo "환경 해제 시:  source unuse_glm.sh"

