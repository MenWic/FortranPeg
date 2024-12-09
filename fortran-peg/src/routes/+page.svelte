<header class="header">
    <h1 class="header-title">FortranPeg</h1>
</header>
<div class="p-5 flex flex-col h-full max-h-full space-y-4">
    <h2 class="subheader">Text Editor</h2>
    <div class="h-2/3 rounded-md border border-black overflow-y-scroll">
        <CodeMirror bind:value={editorText} on:change={parse} />
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

    let editorText = "";
    let result = "";

    function parse() {
        result = parseInput(editorText.trim());
    }
</script>

<style>
    .header {
        background-color: rgba(239, 227, 227, 0.5);
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

    .text-lime {
        color: #3a7c64;
    }

    .text-red {
        color: red;
    }
</style>
