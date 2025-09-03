# Stage 1: Build app
FROM node:20-alpine AS builder

WORKDIR /app

# Cài dependencies
COPY package*.json ./
RUN npm install -g pnpm && pnpm install

# Copy source và build
COPY . .
RUN pnpm build

# Stage 2: Run app
FROM node:20-alpine

WORKDIR /app

# Copy kết quả build từ stage 1
COPY --from=builder /app/build ./build
COPY --from=builder /app/package*.json ./
RUN npm install -g pnpm && pnpm install --prod

# Đổi port sang 5173
EXPOSE 5173
ENV PORT=5173

CMD ["node", "build/index.js"]
