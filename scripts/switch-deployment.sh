#!/bin/bash
# สคริปต์สำหรับสลับระหว่าง Blue และ Green Deployment

# รับพารามิเตอร์จากผู้ใช้ (blue หรือ green)
TARGET=$1

if [ "$TARGET" = "blue" ]; then
  echo "กำลังสลับไปยัง BLUE deployment..."
  cp deployment/service-blue.yaml deployment/service.yaml
elif [ "$TARGET" = "green" ]; then
  echo "กำลังสลับไปยัง GREEN deployment..."
  cp deployment/service-green.yaml deployment/service.yaml
else
  echo "ค่าไม่ถูกต้อง ใช้ 'blue' หรือ 'green'"
  exit 1
fi

# Commit และ push การเปลี่ยนแปลงไปยัง Git repo
git add deployment/service.yaml
git commit -m "สลับไปยัง $TARGET deployment"
git push

echo "สลับไปยัง $TARGET deployment เรียบร้อยแล้ว ArgoCD จะซิงค์การเปลี่ยนแปลงโดยอัตโนมัติ" 