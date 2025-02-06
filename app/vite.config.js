import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';

export default defineConfig({
    plugins: [
        laravel({
            input: ['resources/css/app.css', 'resources/js/app.js'],
            refresh: true,
        }),
    ],
    server: {
        host: '0.0.0.0',  // Bind to all interfaces
        port: 5173,        // Keep default Vite port
        strictPort: true,  // Ensure it doesn't switch ports
        hmr: {
            host: 'localhost', // Change this to WSL2 IP if needed
        }
    }
});
