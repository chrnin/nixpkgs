with import <nixpkgs> {};

{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pytestCheckHook,
  setuptools,
  wheel
}:

buildPythonPackage rec {
  pname = "dynaconf";
  version = "3.2.6";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "dynaconf";
    repo = "dynaconf";
    rev = "refs/tags/${version}";
    hash = "sha256-MHZziJdfCNKOltYIN3A/TazsK9sCYtb/GiMds4T5lIo=";
  };

  build-system = [ setuptools ];

  nativeCheckInputs = [ ];

  pythonImportsCheck = [ "dynaconf" ];
  

  meta = with lib; {
    description = "configuration management for Python";
    homepage = "https://www.dynaconf.com/";
    changelog = "https://github.com/dynaconf/dynaconf/releases/tag/${version}";
    license = licenses.mit;
    maintainers = with maintainers; [ chrnin ];
  };
}
