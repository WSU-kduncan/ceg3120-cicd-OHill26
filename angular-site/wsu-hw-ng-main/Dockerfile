# Use Node.js version 18 as the base image
FROM node:18-bullseye

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json (if present)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the project files into the container
COPY . .

# Expose port 4200 for Angular's development server
EXPOSE 4200

# Start the Angular app using ng serve
CMD ["npx", "ng", "serve", "--host", "0.0.0.0"]
