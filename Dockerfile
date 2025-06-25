# Usa una imagen con Java 17 y Maven
FROM eclipse-temurin:17-jdk

# Crea una carpeta de trabajo
WORKDIR /app

# Copia todo tu proyecto
COPY . .

# Da permisos de ejecución al wrapper de Maven
RUN chmod +x mvnw

# Compila el proyecto y genera el JAR (sin ejecutar tests)
RUN ./mvnw clean package -DskipTests

# Comando para arrancar tu backend
CMD ["java", "-jar", "target/backend-0.0.1-SNAPSHOT.jar"]
