# Bat
Pria theme for bat.

1. Create a theme folder in bat's by running:
   ```bash
   mkdir -p "$(bat --config-dir)/themes"
   ```

2. Copy the theme file from this repository into `~/.config/bat/themes`

3.  Edit your configuration file, located at `bat --config-file` (usually `~/.config/bat/config`):
    ```
    --theme="pria"
    ```

4. Rebuild bat's cache:
   ```bash
   bat cache --build
   ```
