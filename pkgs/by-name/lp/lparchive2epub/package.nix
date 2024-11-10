{
  fetchFromGitHub,
  lib,
  pkgs,
  python3,
}:

python3.pkgs.buildPythonApplication rec {
  pname = "lparchive2epub";
  version = "1.2.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Arwalk";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-t7QmQkNvkb5PaXCzRr9psdg410s5spciYuyWOrzI5tQ=";
  };

  build-system = with python3.pkgs; [ poetry-core ];

  dependencies = with python3.pkgs; [
    ebooklib
    beautifulsoup4
    tqdm
    aiohttp
  ];

  meta = with lib; {
    description = "Transform any LP from lparchive into an epub document.";
    homepage = "https://github.com/Arwalk/lparchive2epub";
    license = with licenses; [ mit ];
    maintainers = with maintainers; [ nsnelson ];
  };
}
