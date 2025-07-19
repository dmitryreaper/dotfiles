{
  config.services.postgresql = {
    enable = true;
    package = pkgs.postgresql_15;
    ensureDatabases = [ "mydatabase" ];
    authentication = pkgs.lib.mkOverride 10 ''
      #type database  DBuser  auth-method
      local all       all     trust
    '';
  };
}
