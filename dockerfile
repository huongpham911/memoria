FROM node:20-alpine AS builder

WORKDIR /app

# Cài git
RUN apk add --no-cache git

# Clone code từ repo gốc
RUN git clone https://github.com/xp4u1/memoria.git .

# Cài dependencies và build
RUN npm install -g pnpm && pnpm install && pnpm build

# Stage chạy app
FROM node:20-alpine

WORKDIR /app

COPY --from=builder /app/build ./build
COPY --from=builder /app/package*.json ./
RUN npm install -g pnpm && pnpm install --prod

EXPOSE 5173
ENV PORT=5173

CMD ["node", "build/index.js"]
