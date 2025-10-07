#!/bin/bash
# unuse_glm.sh — GLM 설정 복구 스크립트

CLAUDE_DIR="$HOME/.claude"
SETTINGS_FILE="$CLAUDE_DIR/settings.json"
BACKUP_FILE="$SETTINGS_FILE.bak"

# === 1️⃣ GLM 설정파일 삭제 또는 복원 ===
if [ -f "$BACKUP_FILE" ]; then
  mv "$BACKUP_FILE" "$SETTINGS_FILE"
  echo "🔁 기존 Claude 설정 복원 완료: $SETTINGS_FILE"
else
  rm -f "$SETTINGS_FILE"
  echo "🧹 GLM 설정 제거 완료 (백업 없음)"
fi

# === 2️⃣ 환경변수 초기화 ===
unset ANTHROPIC_BASE_URL
unset ANTHROPIC_AUTH_TOKEN

echo "🧠 Claude Pro 기본 환경 복구 완료"

