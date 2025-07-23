{pkgs, ...}:

{
  services.postgresql = {
  enable = true;
  ensureDatabases = [ "mydb" ];
  enableTCPIP = true;
  # port = 5432;
  authentication = pkgs.lib.mkOverride 10 ''
    #...
    #type database DBuser origin-address auth-method
    local all       all     trust
    # ipv4
    host  all      all     127.0.0.1/32   trust
    # ipv6
    host all       all     ::1/128        trust
  '';
  # initialScript = pkgs.writeText "backend-initScript" ''
  #   CREATE ROLE dima WITH LOGIN PASSWORD 'zxc011' CREATEDB;
  #   CREATE DATABASE file_manager_db;
  #   GRANT ALL PRIVILEGES ON DATABASE dima TO file_manager_db;
  # '';
};
  
}
