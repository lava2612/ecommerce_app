# Step 1: Use the official Flutter image
FROM cirrusci/flutter:stable

# Step 2: Set the working directory
WORKDIR C:/Users/DELL/StudioProjects/ecommerce_application/app

# Step 3: Create and switch to a non-root user
RUN useradd -m flutteruser
USER flutteruser

# Step 5: Ensure Flutter's cache directory is accessible
#RUN chown -R flutteruser:flutteruser /sdks/flutter/bin/cache

# Step 5: Add /sdks/flutter as a safe directory to avoid ownership issues
RUN git config --global --add safe.directory /sdks/flutter

# Step 6: Copy the project files into the Docker image
COPY . .

# Step 7: Install dependencies
RUN flutter doctor -v
RUN flutter pub get

# Step 8: Expose the necessary port
EXPOSE 8080

# Step 9: Run the app (optional step if you want to run it inside Docker)
CMD ["flutter", "run"]
