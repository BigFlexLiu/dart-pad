# Use Google's official Dart image.
FROM dart

# Copy local code to the container image.
WORKDIR /app
COPY . .

# Install production dependencies.
RUN dart pub get

# Build the project for production.
RUN dart run build_runner build  --delete-conflicting-outputs --output web:build

# Expose the port on which the app will be running.
EXPOSE 8000

# You might want to use a Dart server like `shelf`
# Or you can serve static files with a server like nginx

# Using Dart's shelf package
# Assuming that the server script is in the `bin/` directory
CMD ["dart", "bin/serve.dart"]
