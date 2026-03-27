# --- GIAI ĐOẠN 1: BUILD (Sử dụng JDK để biên dịch) ---
FROM maven:3.9-eclipse-temurin-17 AS builder
WORKDIR /app

# Copy file cấu hình trước để tận dụng Docker Cache cho dependencies
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy toàn bộ code và build
COPY src ./src
RUN mvn package -DskipTests

# --- GIAI ĐOẠN 2: RUN (Chỉ sử dụng JRE để chạy - cực nhẹ) ---
FROM eclipse-temurin:17-jre-jammy
LABEL authors="NguyenTranDucAnh"

WORKDIR /app

# Chỉ lấy duy nhất file .jar từ giai đoạn builder
COPY --from=builder /app/target/*.jar app.jar

# Mở cổng 8080 cho ứng dụng
EXPOSE 8080

# Lệnh chạy ứng dụng
ENTRYPOINT ["java", "-jar", "app.jar"]