{ lib, ... }:

let
  inherit (lib) mkOption types;
  nomad = import ./. types;
in
{
  # TODO: validate cores/cpu are set exclusively

  options.cpu = mkOption {
    type = types.ints.unsigned;
    default = 100;
    description = ''
      Specifies the CPU required to run this task in MHz.
    '';
  };

  options.cores = mkOption {
    type = types.nullOr types.ints.unsigned;
    default = null;
    description = ''
      Specifies the number of CPU cores to reserve for the task. This may not be used with cpu.
    '';
  };

  options.memory = mkOption {
    type = types.ints.unsigned;
    default = 300;
    description = ''
      Specifies the memory required in MB.
    '';
  };

  options.memoryMax = mkOption {
    type = types.nullOr types.ints.unsigned;
    default = null;
    description = ''
      Optionally, specifies the maximum memory the task may use, if the client has excess memory capacity, in MB.
      See Memory Oversubscription for more details.
    '';
  };

  options.devices = mkOption {
    type = types.attrsOf nomad.device;
    default = {};
    description = ''
       Specifies the device requirements. Multiple keys can be set to request multiple device types.
    '';
  };
}