import { defineConfig } from "vite";
import laravel from "laravel-vite-plugin";

export default defineConfig({
    plugins: [laravel(["resources/js/app.jsx"])],
    resolve: {
        alias: {
            "@": "/resources/js"
        }
    },
    server: {
        host: "0.0.0.0", // Bind to all interfaces
        port: 5173, // Keep default Vite port
        strictPort: true, // Ensure it doesn't switch ports
        hmr: {
            host: "localhost" // Change this to WSL2 IP if needed
        }
    }
});
