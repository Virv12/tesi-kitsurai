import tempfile
import textwrap
from pathlib import Path
from subprocess import run
from rich import print
import re
import typer

main = typer.Typer()


@main.command()
def convert(svg: Path, chrome: Path = Path('/Applications/Google Chrome.app/Contents/MacOS/Google Chrome')):
    print(f'Converting {svg!s}')
    with tempfile.NamedTemporaryFile(suffix='.svg') as tmp:
        tmp = Path(tmp.name)
        svg_src = svg.read_text()

        width, = next(re.finditer(r'width="(.+?)"', svg_src)).groups()
        if re.match(r'^\d+$', width):
            width = f'{width}px'
        height, = next(re.finditer(r'height="(.+?)"', svg_src)).groups()
        if re.match(r'^\d+$', height):
            height = f'{height}px'
        print(f'({width}, {height})')

        tmp.write_text(re.sub(
            r'</\s*svg\s*>',
            textwrap.dedent(f'''
                        <style>
                            @page {{
                                size: {width} {height};
                                margin: 0;
                            }}
                            svg {{
                                width: 100%;
                                height: 100%;
                            }}
                        </style>
                    </svg>
                   '''),
            svg_src
        ))
        run([
            f'{chrome!s}',
            f'--headless',
            f'--disable-gpu',
            f'--no-pdf-header-footer',
            f'--print-to-pdf={svg.with_suffix(".pdf")!s}',
            f'{tmp!s}'
        ], check=True)


if __name__ == "__main__":
    main()
