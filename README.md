# poc-blue-green
วิธีใช้งาน:
ติดตั้ง ArgoCD ในคลัสเตอร์
นำไฟล์ application.yaml ไปใช้งาน: kubectl apply -f argocd/application.yaml
เมื่อต้องการสลับระหว่าง Blue และ Green ให้ใช้สคริปต์: ./scripts/switch-deployment.sh blue หรือ ./scripts/switch-deployment.sh green
