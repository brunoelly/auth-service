# Etapa de construção
FROM eclipse-temurin:17-jdk-alpine AS builder
WORKDIR /app
COPY . .

CMD ["echo", "Hello, Docker!"]
#RUN ./mvnw clean package -DskipTests

# Etapa de execução
#FROM eclipse-temurin:17-jdk-alpine
#WORKDIR /app
#COPY --from=builder /app/target/*.jar app.jar
#EXPOSE 8080
#ENTRYPOINT ["java", "-jar", "app.jar"]
ENTRYPOINT ["tail", "-f", "/dev/null"]