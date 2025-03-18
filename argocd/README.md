# Blue-Green Deployment ด้วย ArgoCD

ไฟล์และคำอธิบายการใช้งาน ArgoCD เพื่อทำ Blue-Green Deployment

## ไฟล์ที่เกี่ยวข้อง

1. `argocd/application.yaml` - คอนฟิกของ ArgoCD Application
2. `deployment/kustomization.yaml` - รายการทรัพยากรที่จะถูกจัดการโดย ArgoCD
3. `deployment/blue-deployment.yaml` - Deployment สำหรับ Blue version
4. `deployment/green-deployment.yaml` - Deployment สำหรับ Green version
5. `deployment/service.yaml` - Service ที่จะชี้ไปยัง Blue หรือ Green deployment

## วิธีการใช้งาน

1. ติดตั้ง ArgoCD ในคลัสเตอร์
2. นำไฟล์ `argocd/application.yaml` ไปใช้งาน:
   ```
   kubectl apply -f argocd/application.yaml
   ```
3. ArgoCD จะดึงไฟล์จาก Git repository และสร้างทรัพยากรตามที่กำหนดไว้

## วิธีสลับระหว่าง Blue และ Green

เพื่อสลับจาก Blue เป็น Green หรือกลับกัน คุณสามารถแก้ไขไฟล์ `service.yaml` โดยเปลี่ยน selector:

สำหรับ Blue:
```yaml
spec:
  selector:
    app: poc-blue-green
    version: blue
```

สำหรับ Green:
```yaml
spec:
  selector:
    app: poc-blue-green
    version: green
```

หลังจากแก้ไขไฟล์ คุณจะต้อง commit และ push การเปลี่ยนแปลงไปยัง Git repository เพื่อให้ ArgoCD ซิงค์การเปลี่ยนแปลง 