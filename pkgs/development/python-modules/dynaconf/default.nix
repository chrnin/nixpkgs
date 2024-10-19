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
    hash = "sha256-MBb8yCIs9DW77TKiV3qOHidt8/zi9m2dgyfB3xrdg3A=";
  };

  build-system = [ setuptools ];

  #nativeCheckInputs = [ pytestCheckHook ];

  #pythonImportsCheck = [ "dynaconf" ];
  doCheck = false;

  meta = with lib; {
    description = "configuration management for Python";
    homepage = "https://www.dynaconf.com/";
    changelog = "https://github.com/dynaconf/dynaconf/releases/tag/${version}";
    license = licenses.mit;
    maintainers = with maintainers; [ chrnin ];
  };
}
