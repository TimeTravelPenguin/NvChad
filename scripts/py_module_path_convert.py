from argparse import ArgumentParser
from pathlib import Path
from typing import Any

import tomlkit
from tomlkit import TOMLDocument


def get_pyproj_info(root: Path):
    path = root / "pyproject.toml"
    path = path.resolve(strict=True)

    with path.open() as f:
        data: TOMLDocument = tomlkit.load(f)

    poetry: dict[str, Any] = data["tool"]["poetry"]
    name: str = poetry["name"]

    if not poetry.get("packages"):
        return name

    package = poetry["packages"][0]

    include = package.get("include")
    from_ = package.get("from")

    if from_:
        p = root / from_ / (include or name)
        return p.resolve()

    if include:
        p = root / include
        return p.resolve()

    p = root / name
    return p.resolve()


def convert_path(module: Path):
    module.resolve(strict=True)


if __name__ == "__main__":
    parser = ArgumentParser()
    parser.add_argument("project_root", type=Path, required=True)
    parser.add_argument("module_path", type=Path, required=True)

    args = parser.parse_args()

    pkg_path = get_pyproj_info(args.project_root)
    module_rel_no_prefix = args.module_path.relative_to(pkg_path.parent).with_suffix("")
    result = str(module_rel_no_prefix).replace("/", ".")

    return result
