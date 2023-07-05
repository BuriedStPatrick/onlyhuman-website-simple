import esbuild from "esbuild";

esbuild
    .build({
        entryPoints: [
            "src/styles/style.css",
            "src/scripts/script.js"
        ],
        outdir: "dist",
        bundle: true,
        plugins: [],
    })
    .then(() => console.log("⚡ Build complete! ⚡"))
    .catch(() => process.exit(1));