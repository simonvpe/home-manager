{ pkgs, ...}:
{
  home.packages = with pkgs; [
    buildah            # builds OCI containers
    docker             # runs OCI containers
    docker-compose     # start collections of docker containers
    git                # versions source code
  ];
}
