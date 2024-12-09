<header class="header">
    <h1 class="header-title">FortranPeg</h1>
</header>
<div class="p-5 flex flex-col h-full max-h-full space-y-4">
    <div class="flex items-center justify-between">
        <h2 class="subheader">Editor de Texto</h2>
        <button class="clear-button mx-2" on:click={clearEditor}>Limpiar</button>
    </div>
    <div class="editor-container h-2/3 rounded-md border border-black overflow-y-scroll relative">
        <CodeMirror bind:value={editorText} on:change={parse} class="code-mirror" />
        <div class="placeholder" bind:this={placeholder}>Escribe el texto aquí</div>
    </div>
    <h2 class="subheader">Resultado</h2>
    <div class="h-1/3 rounded-md border border-black flex items-start justify-start p-4">
        <p class="{result === 'Codigo fuente parseado, todo bien...' ? 'text-lime' : 'text-red'}">
            {result}
        </p>
    </div>
</div>

<script lang="ts">
    import parseInput from "$lib/parser";
    import CodeMirror from "svelte-codemirror-editor";
    import { onMount } from "svelte";

    let editorText = "";
    let result = "";
    let placeholder;

    function parse() {
        result = parseInput(editorText.trim());
        updatePlaceholder();
    }

    function updatePlaceholder() {
        if (editorText.trim() === "") {
            placeholder.style.display = "block";
        } else {
            placeholder.style.display = "none";
        }
    }

    function clearEditor() {
        editorText = "";
        result = "";
        updatePlaceholder();
    }

    onMount(() => {
        updatePlaceholder();
    });
</script>

<style>
    .header {
        background: linear-gradient(to right,rgb(182, 164, 215), transparent);
        padding: 20px;
        text-align: left;
        border-radius: 0;
    }

    .header-title {
        margin: 0;
        font-size: 2.5rem;
        font-family: 'Roboto', sans-serif;
        color: #000000;
    }

    .subheader {
        font-size: 1.5rem;
        font-family: 'Roboto', sans-serif;
        color: #333;
        margin-bottom: 10px;
    }

    .clear-button {
        padding: 5px 50px;
        font-size: 1rem;
        background-color: #7934ef;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .clear-button:hover {
        background-color: #ff4c4c;
    }

    .text-lime {
        color: #3a7c64;
    }

    .text-red {
        color: red;
    }

    .editor-container {
        position: relative;
    }

    .placeholder {
        position: absolute;
        top: 50%;
        left: 44%;
        transform: translateY(-50%);
        color: rgba(0, 0, 0, 0.5);
        pointer-events: none;
        font-family: 'Roboto', sans-serif;
        font-size: 1.5rem;
    }

    .code-mirror {
        transition: background-color 0.3s ease;
    }

    .code-mirror:focus {
        background-color: #f0f0f0; /* Change this color as needed */
    }
</style>
