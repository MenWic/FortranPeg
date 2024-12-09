import { sveltekit } from '@sveltejs/kit/vite';
import { defineConfig } from 'vite';

export default defineConfig({
	plugins: [sveltekit()]
});


// export default {
//   plugins: [sveltekit()],
//   optimizeDeps: {
//     include: ['svelte-codemirror-editor'], // Incluye el paquete aquí
//   },
//   resolve: {
//     extensions: ['.mjs', '.js', '.ts', '.json', '.svelte'],
//   },
// };
