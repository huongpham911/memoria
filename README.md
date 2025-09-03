# Memoria — Private Journal (Dockerized)

Đây là repo chứa cấu hình Docker để chạy ứng dụng **[Memoria — Private Journal](https://github.com/xp4u1/memoria)** trên server (ví dụ Dokploy).

---

## 🚀 Triển khai

### 1. Clone repo này
```bash
git clone https://github.com/huongpham911/memoria.git
cd memoria

**2. Build & run với Docker**
docker build -t memoria .
docker run -d -p 5173:5173 memoria

App sẽ chạy tại:
👉 http://localhost:5173
