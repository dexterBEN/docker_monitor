class DockerContainer {
  DockerContainer({
    this.appArmorProfile,
    this.args,
    this.config,
    this.created,
    this.driver,
    this.execIDs,
    this.graphDriver,
    this.hostConfig,
    this.hostnamePath,
    this.hostsPath,
    this.id,
    this.image,
    this.logPath,
    this.mountLabel,
    this.mounts,
    this.name,
    this.networkSettings,
    this.path,
    this.platform,
    this.processLabel,
    this.resolvConfPath,
    this.restartCount,
    this.state,
  });

  String? appArmorProfile;
  List<String>? args;
  Config? config;
  DateTime? created;
  String? driver;
  dynamic? execIDs;
  GraphDriver? graphDriver;
  HostConfig? hostConfig;
  String? hostnamePath;
  String? hostsPath;
  String? id;
  String? image;
  String? logPath;
  String? mountLabel;
  List<dynamic>? mounts;
  String? name;
  NetworkSettings? networkSettings;
  String? path;
  String? platform;
  String? processLabel;
  String? resolvConfPath;
  int? restartCount;
  ContainerState? state;

  factory DockerContainer.fromJson(Map<String, dynamic> json) =>
      DockerContainer(
        appArmorProfile: json["AppArmorProfile"],
        args: List<String>.from(json["Args"]!.map((x) => x)),
        config: Config.fromJson(json["Config"]),
        created: DateTime.parse(json["Created"]),
        driver: json["Driver"],
        execIDs: json["ExecIDs"],
        graphDriver: GraphDriver.fromJson(json["GraphDriver"]),
        hostConfig: HostConfig.fromJson(json["HostConfig"]),
        hostnamePath: json["HostnamePath"],
        hostsPath: json["HostsPath"],
        id: json["Id"],
        image: json["Image"],
        logPath: json["LogPath"],
        mountLabel: json["MountLabel"],
        mounts: List<dynamic>.from(json["Mounts"]!.map((x) => x)),
        name: json["Name"],
        networkSettings: NetworkSettings.fromJson(json["NetworkSettings"]),
        path: json["Path"],
        platform: json["Platform"],
        processLabel: json["ProcessLabel"],
        resolvConfPath: json["ResolvConfPath"],
        restartCount: json["RestartCount"],
        state: ContainerState.fromJson(json["State"]),
      );

  Map<String, dynamic> toJson() => {
        "AppArmorProfile": appArmorProfile,
        "Args": List<dynamic>.from(args!.map((x) => x)),
        "Config": config?.toJson(),
        "Created": created?.toIso8601String(),
        "Driver": driver,
        "ExecIDs": execIDs,
        "GraphDriver": graphDriver?.toJson(),
        "HostConfig": hostConfig?.toJson(),
        "HostnamePath": hostnamePath,
        "HostsPath": hostsPath,
        "Id": id,
        "Image": image,
        "LogPath": logPath,
        "MountLabel": mountLabel,
        "Mounts": List<dynamic>.from(mounts!.map((x) => x)),
        "Name": name,
        "NetworkSettings": networkSettings?.toJson(),
        "Path": path,
        "Platform": platform,
        "ProcessLabel": processLabel,
        "ResolvConfPath": resolvConfPath,
        "RestartCount": restartCount,
        "State": state?.toJson(),
      };
}

class Config {
  Config({
    this.attachStderr,
    this.attachStdin,
    this.attachStdout,
    this.cmd,
    this.domainname,
    this.entrypoint,
    this.env,
    this.hostname,
    this.image,
    this.labels,
    this.onBuild,
    this.openStdin,
    this.stdinOnce,
    this.tty,
    this.user,
    this.volumes,
    this.workingDir,
  });

  bool? attachStderr;
  bool? attachStdin;
  bool? attachStdout;
  List<String>? cmd;
  String? domainname;
  dynamic? entrypoint;
  List<String>? env;
  String? hostname;
  String? image;
  dynamic? labels;
  dynamic? onBuild;
  bool? openStdin;
  bool? stdinOnce;
  bool? tty;
  String? user;
  dynamic? volumes;
  String? workingDir;

  factory Config.fromJson(Map<String, dynamic> json) => Config(
        attachStderr: json["AttachStderr"],
        attachStdin: json["AttachStdin"],
        attachStdout: json["AttachStdout"],
        cmd: List<String>.from(json["Cmd"]!.map((x) => x)),
        domainname: json["Domainname"],
        entrypoint: json["Entrypoint"],
        env: List<String>.from(json["Env"]!.map((x) => x)),
        hostname: json["Hostname"],
        image: json["Image"],
        labels: json["Labels"],
        onBuild: json["OnBuild"],
        openStdin: json["OpenStdin"],
        stdinOnce: json["StdinOnce"],
        tty: json["Tty"],
        user: json["User"],
        volumes: json["Volumes"],
        workingDir: json["WorkingDir"],
      );

  Map<String, dynamic> toJson() => {
        "AttachStderr": attachStderr,
        "AttachStdin": attachStdin,
        "AttachStdout": attachStdout,
        "Cmd": List<dynamic>.from(cmd!.map((x) => x)),
        "Domainname": domainname,
        "Entrypoint": entrypoint,
        "Env": List<dynamic>.from(env!.map((x) => x)),
        "Hostname": hostname,
        "Image": image,
        "Labels": labels,
        "OnBuild": onBuild,
        "OpenStdin": openStdin,
        "StdinOnce": stdinOnce,
        "Tty": tty,
        "User": user,
        "Volumes": volumes,
        "WorkingDir": workingDir,
      };
}

class GraphDriver {
  GraphDriver({
    this.data,
    this.name,
  });

  Data? data;
  String? name;

  factory GraphDriver.fromJson(Map<String, dynamic> json) => GraphDriver(
        data: Data.fromJson(json["Data"]),
        name: json["Name"],
      );

  Map<String, dynamic> toJson() => {
        "Data": data?.toJson(),
        "Name": name,
      };
}

class Data {
  Data({
    this.lowerDir,
    this.mergedDir,
    this.upperDir,
    this.workDir,
  });

  String? lowerDir;
  String? mergedDir;
  String? upperDir;
  String? workDir;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        lowerDir: json["LowerDir"],
        mergedDir: json["MergedDir"],
        upperDir: json["UpperDir"],
        workDir: json["WorkDir"],
      );

  Map<String, dynamic> toJson() => {
        "LowerDir": lowerDir,
        "MergedDir": mergedDir,
        "UpperDir": upperDir,
        "WorkDir": workDir,
      };
}

class HostConfig {
  HostConfig({
    this.autoRemove,
    this.binds,
    this.blkioDeviceReadBps,
    this.blkioDeviceReadIOps,
    this.blkioDeviceWriteBps,
    this.blkioDeviceWriteIOps,
    this.blkioWeight,
    this.blkioWeightDevice,
    this.capAdd,
    this.capDrop,
    this.cgroup,
    this.cgroupParent,
    this.cgroupnsMode,
    this.consoleSize,
    this.containerIdFile,
    this.cpuCount,
    this.cpuPercent,
    this.cpuPeriod,
    this.cpuQuota,
    this.cpuRealtimePeriod,
    this.cpuRealtimeRuntime,
    this.cpuShares,
    this.cpusetCpus,
    this.cpusetMems,
    this.deviceCgroupRules,
    this.deviceRequests,
    this.devices,
    this.dns,
    this.dnsOptions,
    this.dnsSearch,
    this.extraHosts,
    this.groupAdd,
    this.ioMaximumBandwidth,
    this.ioMaximumIOps,
    this.ipcMode,
    this.isolation,
    this.kernelMemory,
    this.kernelMemoryTcp,
    this.links,
    this.logConfig,
    this.maskedPaths,
    this.memory,
    this.memoryReservation,
    this.memorySwap,
    this.memorySwappiness,
    this.nanoCpus,
    this.networkMode,
    this.oomKillDisable,
    this.oomScoreAdj,
    this.pidMode,
    this.pidsLimit,
    this.portBindings,
    this.privileged,
    this.publishAllPorts,
    this.readonlyPaths,
    this.readonlyRootfs,
    this.restartPolicy,
    this.runtime,
    this.securityOpt,
    this.shmSize,
    this.utsMode,
    this.ulimits,
    this.usernsMode,
    this.volumeDriver,
    this.volumesFrom,
  });

  bool? autoRemove;
  dynamic? binds;
  dynamic? blkioDeviceReadBps;
  dynamic? blkioDeviceReadIOps;
  dynamic? blkioDeviceWriteBps;
  dynamic? blkioDeviceWriteIOps;
  int? blkioWeight;
  List<dynamic>? blkioWeightDevice;
  dynamic? capAdd;
  dynamic? capDrop;
  String? cgroup;
  String? cgroupParent;
  String? cgroupnsMode;
  List<int>? consoleSize;
  String? containerIdFile;
  int? cpuCount;
  int? cpuPercent;
  int? cpuPeriod;
  int? cpuQuota;
  int? cpuRealtimePeriod;
  int? cpuRealtimeRuntime;
  int? cpuShares;
  String? cpusetCpus;
  String? cpusetMems;
  dynamic? deviceCgroupRules;
  dynamic? deviceRequests;
  List<dynamic>? devices;
  List<dynamic>? dns;
  List<dynamic>? dnsOptions;
  List<dynamic>? dnsSearch;
  dynamic? extraHosts;
  dynamic? groupAdd;
  int? ioMaximumBandwidth;
  int? ioMaximumIOps;
  String? ipcMode;
  String? isolation;
  int? kernelMemory;
  int? kernelMemoryTcp;
  dynamic? links;
  LogConfig? logConfig;
  List<String>? maskedPaths;
  int? memory;
  int? memoryReservation;
  int? memorySwap;
  dynamic? memorySwappiness;
  int? nanoCpus;
  String? networkMode;
  bool? oomKillDisable;
  int? oomScoreAdj;
  String? pidMode;
  dynamic? pidsLimit;
  dynamic? portBindings;
  bool? privileged;
  bool? publishAllPorts;
  List<String>? readonlyPaths;
  bool? readonlyRootfs;
  RestartPolicy? restartPolicy;
  String? runtime;
  List<String>? securityOpt;
  int? shmSize;
  String? utsMode;
  dynamic? ulimits;
  String? usernsMode;
  String? volumeDriver;
  dynamic? volumesFrom;

  factory HostConfig.fromJson(Map<String, dynamic> json) => HostConfig(
        autoRemove: json["AutoRemove"],
        binds: json["Binds"],
        blkioDeviceReadBps: json["BlkioDeviceReadBps"],
        blkioDeviceReadIOps: json["BlkioDeviceReadIOps"],
        blkioDeviceWriteBps: json["BlkioDeviceWriteBps"],
        blkioDeviceWriteIOps: json["BlkioDeviceWriteIOps"],
        blkioWeight: json["BlkioWeight"],
        blkioWeightDevice:
            List<dynamic>.from(json["BlkioWeightDevice"].map((x) => x)),
        capAdd: json["CapAdd"],
        capDrop: json["CapDrop"],
        cgroup: json["Cgroup"],
        cgroupParent: json["CgroupParent"],
        cgroupnsMode: json["CgroupnsMode"],
        consoleSize: List<int>.from(json["ConsoleSize"].map((x) => x)),
        containerIdFile: json["ContainerIDFile"],
        cpuCount: json["CpuCount"],
        cpuPercent: json["CpuPercent"],
        cpuPeriod: json["CpuPeriod"],
        cpuQuota: json["CpuQuota"],
        cpuRealtimePeriod: json["CpuRealtimePeriod"],
        cpuRealtimeRuntime: json["CpuRealtimeRuntime"],
        cpuShares: json["CpuShares"],
        cpusetCpus: json["CpusetCpus"],
        cpusetMems: json["CpusetMems"],
        deviceCgroupRules: json["DeviceCgroupRules"],
        deviceRequests: json["DeviceRequests"],
        devices: List<dynamic>.from(json["Devices"].map((x) => x)),
        dns: List<dynamic>.from(json["Dns"].map((x) => x)),
        dnsOptions: List<dynamic>.from(json["DnsOptions"].map((x) => x)),
        dnsSearch: List<dynamic>.from(json["DnsSearch"].map((x) => x)),
        extraHosts: json["ExtraHosts"],
        groupAdd: json["GroupAdd"],
        ioMaximumBandwidth: json["IOMaximumBandwidth"],
        ioMaximumIOps: json["IOMaximumIOps"],
        ipcMode: json["IpcMode"],
        isolation: json["Isolation"],
        kernelMemory: json["KernelMemory"],
        kernelMemoryTcp: json["KernelMemoryTCP"],
        links: json["Links"],
        logConfig: LogConfig.fromJson(json["LogConfig"]),
        maskedPaths: List<String>.from(json["MaskedPaths"].map((x) => x)),
        memory: json["Memory"],
        memoryReservation: json["MemoryReservation"],
        memorySwap: json["MemorySwap"],
        memorySwappiness: json["MemorySwappiness"],
        nanoCpus: json["NanoCpus"],
        networkMode: json["NetworkMode"],
        oomKillDisable: json["OomKillDisable"],
        oomScoreAdj: json["OomScoreAdj"],
        pidMode: json["PidMode"],
        pidsLimit: json["PidsLimit"],
        portBindings: json["PortBindings"],
        privileged: json["Privileged"],
        publishAllPorts: json["PublishAllPorts"],
        readonlyPaths: List<String>.from(json["ReadonlyPaths"].map((x) => x)),
        readonlyRootfs: json["ReadonlyRootfs"],
        restartPolicy: RestartPolicy.fromJson(json["RestartPolicy"]),
        runtime: json["Runtime"],
        securityOpt: json["SecurityOpt"],
        shmSize: json["ShmSize"],
        utsMode: json["UTSMode"],
        ulimits: json["Ulimits"],
        usernsMode: json["UsernsMode"],
        volumeDriver: json["VolumeDriver"],
        volumesFrom: json["VolumesFrom"],
      );

  Map<String, dynamic> toJson() => {
        "AutoRemove": autoRemove,
        "Binds": binds,
        "BlkioDeviceReadBps": blkioDeviceReadBps,
        "BlkioDeviceReadIOps": blkioDeviceReadIOps,
        "BlkioDeviceWriteBps": blkioDeviceWriteBps,
        "BlkioDeviceWriteIOps": blkioDeviceWriteIOps,
        "BlkioWeight": blkioWeight,
        "BlkioWeightDevice":
            List<dynamic>.from(blkioWeightDevice!.map((x) => x)),
        "CapAdd": capAdd,
        "CapDrop": capDrop,
        "Cgroup": cgroup,
        "CgroupParent": cgroupParent,
        "CgroupnsMode": cgroupnsMode,
        "ConsoleSize": List<dynamic>.from(consoleSize!.map((x) => x)),
        "ContainerIDFile": containerIdFile,
        "CpuCount": cpuCount,
        "CpuPercent": cpuPercent,
        "CpuPeriod": cpuPeriod,
        "CpuQuota": cpuQuota,
        "CpuRealtimePeriod": cpuRealtimePeriod,
        "CpuRealtimeRuntime": cpuRealtimeRuntime,
        "CpuShares": cpuShares,
        "CpusetCpus": cpusetCpus,
        "CpusetMems": cpusetMems,
        "DeviceCgroupRules": deviceCgroupRules,
        "DeviceRequests": deviceRequests,
        "Devices": List<dynamic>.from(devices!.map((x) => x)),
        "Dns": List<dynamic>.from(dns!.map((x) => x)),
        "DnsOptions": List<dynamic>.from(dnsOptions!.map((x) => x)),
        "DnsSearch": List<dynamic>.from(dnsSearch!.map((x) => x)),
        "ExtraHosts": extraHosts,
        "GroupAdd": groupAdd,
        "IOMaximumBandwidth": ioMaximumBandwidth,
        "IOMaximumIOps": ioMaximumIOps,
        "IpcMode": ipcMode,
        "Isolation": isolation,
        "KernelMemory": kernelMemory,
        "KernelMemoryTCP": kernelMemoryTcp,
        "Links": links,
        "LogConfig": logConfig?.toJson(),
        "MaskedPaths": List<dynamic>.from(maskedPaths!.map((x) => x)),
        "Memory": memory,
        "MemoryReservation": memoryReservation,
        "MemorySwap": memorySwap,
        "MemorySwappiness": memorySwappiness,
        "NanoCpus": nanoCpus,
        "NetworkMode": networkMode,
        "OomKillDisable": oomKillDisable,
        "OomScoreAdj": oomScoreAdj,
        "PidMode": pidMode,
        "PidsLimit": pidsLimit,
        "PortBindings": portBindings?.toJson(),
        "Privileged": privileged,
        "PublishAllPorts": publishAllPorts,
        "ReadonlyPaths": List<dynamic>.from(readonlyPaths!.map((x) => x)),
        "ReadonlyRootfs": readonlyRootfs,
        "RestartPolicy": restartPolicy?.toJson(),
        "Runtime": runtime,
        "SecurityOpt": securityOpt,
        "ShmSize": shmSize,
        "UTSMode": utsMode,
        "Ulimits": ulimits,
        "UsernsMode": usernsMode,
        "VolumeDriver": volumeDriver,
        "VolumesFrom": volumesFrom,
      };
}

class LogConfig {
  LogConfig({
    this.config,
    this.type,
  });

  dynamic? config;
  String? type;

  factory LogConfig.fromJson(Map<String, dynamic> json) => LogConfig(
        config: json["Config"],
        type: json["Type"],
      );

  Map<String, dynamic> toJson() => {
        "Config": config!.toJson(),
        "Type": type,
      };
}

class RestartPolicy {
  RestartPolicy({
    this.maximumRetryCount,
    this.name,
  });

  int? maximumRetryCount;
  String? name;

  factory RestartPolicy.fromJson(Map<String, dynamic> json) => RestartPolicy(
        maximumRetryCount: json["MaximumRetryCount"],
        name: json["Name"],
      );

  Map<String, dynamic> toJson() => {
        "MaximumRetryCount": maximumRetryCount,
        "Name": name,
      };
}

class NetworkSettings {
  NetworkSettings({
    this.bridge,
    this.endpointId,
    this.gateway,
    this.globalIPv6Address,
    this.globalIPv6PrefixLen,
    this.hairpinMode,
    this.ipAddress,
    this.ipPrefixLen,
    this.iPv6Gateway,
    this.linkLocalIPv6Address,
    this.linkLocalIPv6PrefixLen,
    this.macAddress,
    this.networks,
    this.ports,
    this.sandboxId,
    this.sandboxKey,
    this.secondaryIpAddresses,
    this.secondaryIPv6Addresses,
  });

  String? bridge;
  String? endpointId;
  String? gateway;
  String? globalIPv6Address;
  int? globalIPv6PrefixLen;
  bool? hairpinMode;
  String? ipAddress;
  int? ipPrefixLen;
  String? iPv6Gateway;
  String? linkLocalIPv6Address;
  int? linkLocalIPv6PrefixLen;
  String? macAddress;
  Networks? networks;
  dynamic? ports;
  String? sandboxId;
  String? sandboxKey;
  dynamic? secondaryIpAddresses;
  dynamic? secondaryIPv6Addresses;

  factory NetworkSettings.fromJson(Map<String, dynamic> json) =>
      NetworkSettings(
        bridge: json["Bridge"],
        endpointId: json["EndpointID"],
        gateway: json["Gateway"],
        globalIPv6Address: json["GlobalIPv6Address"],
        globalIPv6PrefixLen: json["GlobalIPv6PrefixLen"],
        hairpinMode: json["HairpinMode"],
        ipAddress: json["IPAddress"],
        ipPrefixLen: json["IPPrefixLen"],
        iPv6Gateway: json["IPv6Gateway"],
        linkLocalIPv6Address: json["LinkLocalIPv6Address"],
        linkLocalIPv6PrefixLen: json["LinkLocalIPv6PrefixLen"],
        macAddress: json["MacAddress"],
        networks: Networks.fromJson(json["Networks"]),
        ports: json["Ports"],
        sandboxId: json["SandboxID"],
        sandboxKey: json["SandboxKey"],
        secondaryIpAddresses: json["SecondaryIPAddresses"],
        secondaryIPv6Addresses: json["SecondaryIPv6Addresses"],
      );

  Map<String, dynamic> toJson() => {
        "Bridge": bridge,
        "EndpointID": endpointId,
        "Gateway": gateway,
        "GlobalIPv6Address": globalIPv6Address,
        "GlobalIPv6PrefixLen": globalIPv6PrefixLen,
        "HairpinMode": hairpinMode,
        "IPAddress": ipAddress,
        "IPPrefixLen": ipPrefixLen,
        "IPv6Gateway": iPv6Gateway,
        "LinkLocalIPv6Address": linkLocalIPv6Address,
        "LinkLocalIPv6PrefixLen": linkLocalIPv6PrefixLen,
        "MacAddress": macAddress,
        "Networks": networks?.toJson(),
        "Ports": ports?.toJson(),
        "SandboxID": sandboxId,
        "SandboxKey": sandboxKey,
        "SecondaryIPAddresses": secondaryIpAddresses,
        "SecondaryIPv6Addresses": secondaryIPv6Addresses,
      };
}

class Networks {
  Networks({
    this.host,
  });

  Host? host;

  factory Networks.fromJson(Map<String, dynamic> json) => Networks(
        host: Host.fromJson(json["host"]),
      );

  Map<String, dynamic> toJson() => {
        "host": host?.toJson(),
      };
}

class Host {
  Host({
    this.aliases,
    this.driverOpts,
    this.endpointId,
    this.gateway,
    this.globalIPv6Address,
    this.globalIPv6PrefixLen,
    this.ipamConfig,
    this.ipAddress,
    this.ipPrefixLen,
    this.iPv6Gateway,
    this.links,
    this.macAddress,
    this.networkId,
  });

  dynamic? aliases;
  dynamic? driverOpts;
  String? endpointId;
  String? gateway;
  String? globalIPv6Address;
  int? globalIPv6PrefixLen;
  dynamic? ipamConfig;
  String? ipAddress;
  int? ipPrefixLen;
  String? iPv6Gateway;
  dynamic? links;
  String? macAddress;
  String? networkId;

  factory Host.fromJson(Map<String, dynamic> json) => Host(
        aliases: json["Aliases"],
        driverOpts: json["DriverOpts"],
        endpointId: json["EndpointID"],
        gateway: json["Gateway"],
        globalIPv6Address: json["GlobalIPv6Address"],
        globalIPv6PrefixLen: json["GlobalIPv6PrefixLen"],
        ipamConfig: json["IPAMConfig"],
        ipAddress: json["IPAddress"],
        ipPrefixLen: json["IPPrefixLen"],
        iPv6Gateway: json["IPv6Gateway"],
        links: json["Links"],
        macAddress: json["MacAddress"],
        networkId: json["NetworkID"],
      );

  Map<String, dynamic> toJson() => {
        "Aliases": aliases,
        "DriverOpts": driverOpts,
        "EndpointID": endpointId,
        "Gateway": gateway,
        "GlobalIPv6Address": globalIPv6Address,
        "GlobalIPv6PrefixLen": globalIPv6PrefixLen,
        "IPAMConfig": ipamConfig,
        "IPAddress": ipAddress,
        "IPPrefixLen": ipPrefixLen,
        "IPv6Gateway": iPv6Gateway,
        "Links": links,
        "MacAddress": macAddress,
        "NetworkID": networkId,
      };
}

class ContainerState {
  ContainerState({
    this.dead,
    this.error,
    this.exitCode,
    this.finishedAt,
    this.oomKilled,
    this.paused,
    this.pid,
    this.restarting,
    this.running,
    this.startedAt,
    this.status,
  });

  bool? dead;
  String? error;
  int? exitCode;
  DateTime? finishedAt;
  bool? oomKilled;
  bool? paused;
  int? pid;
  bool? restarting;
  bool? running;
  DateTime? startedAt;
  String? status;

  factory ContainerState.fromJson(Map<String, dynamic> json) => ContainerState(
        dead: json["Dead"],
        error: json["Error"],
        exitCode: json["ExitCode"],
        finishedAt: DateTime.parse(json["FinishedAt"]),
        oomKilled: json["OOMKilled"],
        paused: json["Paused"],
        pid: json["Pid"],
        restarting: json["Restarting"],
        running: json["Running"],
        startedAt: DateTime.parse(json["StartedAt"]),
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "Dead": dead,
        "Error": error,
        "ExitCode": exitCode,
        "FinishedAt": finishedAt?.toIso8601String(),
        "OOMKilled": oomKilled,
        "Paused": paused,
        "Pid": pid,
        "Restarting": restarting,
        "Running": running,
        "StartedAt": startedAt?.toIso8601String(),
        "Status": status,
      };
}
