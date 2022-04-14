// To parse this JSON data, do
//
//     final container = containerFromJson(jsonString);

import 'dart:convert';

DockerContainer containerFromJson(String str) =>
    DockerContainer.fromJson(json.decode(str));

String containerToJson(DockerContainer data) => json.encode(data.toJson());

class DockerContainer {
  DockerContainer({
    required this.appArmorProfile,
    required this.args,
    required this.config,
    required this.created,
    required this.driver,
    required this.execIDs,
    required this.graphDriver,
    required this.hostConfig,
    required this.hostnamePath,
    required this.hostsPath,
    required this.id,
    required this.image,
    required this.logPath,
    required this.mountLabel,
    required this.mounts,
    required this.name,
    required this.networkSettings,
    required this.path,
    required this.platform,
    required this.processLabel,
    required this.resolvConfPath,
    required this.restartCount,
    required this.state,
  });

  String appArmorProfile;
  List<dynamic> args;
  Config config;
  DateTime created;
  String driver;
  dynamic execIDs;
  GraphDriver graphDriver;
  HostConfig hostConfig;
  String hostnamePath;
  String hostsPath;
  String id;
  String image;
  String logPath;
  String mountLabel;
  List<Mount> mounts;
  String name;
  NetworkSettings networkSettings;
  String path;
  String platform;
  String processLabel;
  String resolvConfPath;
  int restartCount;
  ContainerState state;

  factory DockerContainer.fromJson(Map<String, dynamic> json) =>
      DockerContainer(
        appArmorProfile: json["AppArmorProfile"],
        args: List<dynamic>.from(json["Args"].map((x) => x)),
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
        mounts: List<Mount>.from(json["Mounts"].map((x) => Mount.fromJson(x))),
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
        "Args": List<dynamic>.from(args.map((x) => x)),
        "Config": config.toJson(),
        "Created": created.toIso8601String(),
        "Driver": driver,
        "ExecIDs": execIDs,
        "GraphDriver": graphDriver.toJson(),
        "HostConfig": hostConfig.toJson(),
        "HostnamePath": hostnamePath,
        "HostsPath": hostsPath,
        "Id": id,
        "Image": image,
        "LogPath": logPath,
        "MountLabel": mountLabel,
        "Mounts": List<dynamic>.from(mounts.map((x) => x.toJson())),
        "Name": name,
        "NetworkSettings": networkSettings.toJson(),
        "Path": path,
        "Platform": platform,
        "ProcessLabel": processLabel,
        "ResolvConfPath": resolvConfPath,
        "RestartCount": restartCount,
        "State": state.toJson(),
      };
}

class Config {
  Config({
    required this.attachStderr,
    required this.attachStdin,
    required this.attachStdout,
    this.cmd,
    required this.domainname,
    required this.entrypoint,
    required this.env,
    required this.exposedPorts,
    required this.hostname,
    required this.image,
    required this.labels,
    required this.onBuild,
    required this.openStdin,
    required this.stdinOnce,
    required this.tty,
    required this.user,
    required this.volumes,
    required this.workingDir,
  });

  bool attachStderr;
  bool attachStdin;
  bool attachStdout;
  dynamic cmd;
  String domainname;
  List<String> entrypoint;
  List<String> env;
  ExposedPorts exposedPorts;
  String hostname;
  String image;
  Labels labels;
  dynamic onBuild;
  bool openStdin;
  bool stdinOnce;
  bool tty;
  String user;
  Volumes volumes;
  String workingDir;

  factory Config.fromJson(Map<String, dynamic> json) => Config(
        attachStderr: json["AttachStderr"],
        attachStdin: json["AttachStdin"],
        attachStdout: json["AttachStdout"],
        cmd: json["Cmd"],
        domainname: json["Domainname"],
        entrypoint: List<String>.from(json["Entrypoint"].map((x) => x)),
        env: List<String>.from(json["Env"].map((x) => x)),
        exposedPorts: ExposedPorts.fromJson(json["ExposedPorts"]),
        hostname: json["Hostname"],
        image: json["Image"],
        labels: Labels.fromJson(json["Labels"]),
        onBuild: json["OnBuild"],
        openStdin: json["OpenStdin"],
        stdinOnce: json["StdinOnce"],
        tty: json["Tty"],
        user: json["User"],
        volumes: Volumes.fromJson(json["Volumes"]),
        workingDir: json["WorkingDir"],
      );

  Map<String, dynamic> toJson() => {
        "AttachStderr": attachStderr,
        "AttachStdin": attachStdin,
        "AttachStdout": attachStdout,
        "Cmd": cmd,
        "Domainname": domainname,
        "Entrypoint": List<dynamic>.from(entrypoint.map((x) => x)),
        "Env": List<dynamic>.from(env.map((x) => x)),
        "ExposedPorts": exposedPorts.toJson(),
        "Hostname": hostname,
        "Image": image,
        "Labels": labels.toJson(),
        "OnBuild": onBuild,
        "OpenStdin": openStdin,
        "StdinOnce": stdinOnce,
        "Tty": tty,
        "User": user,
        "Volumes": volumes.toJson(),
        "WorkingDir": workingDir,
      };
}

class ExposedPorts {
  ExposedPorts({
    required this.the1337Tcp,
  });

  Labels the1337Tcp;

  factory ExposedPorts.fromJson(Map<String, dynamic> json) => ExposedPorts(
        the1337Tcp: Labels.fromJson(json["1337/tcp"]),
      );

  Map<String, dynamic> toJson() => {
        "1337/tcp": the1337Tcp.toJson(),
      };
}

class Labels {
  Labels();

  factory Labels.fromJson(Map<String, dynamic> json) => Labels();

  Map<String, dynamic> toJson() => {};
}

class Volumes {
  Volumes({
    required this.appKongadata,
  });

  Labels appKongadata;

  factory Volumes.fromJson(Map<String, dynamic> json) => Volumes(
        appKongadata: Labels.fromJson(json["/app/kongadata"]),
      );

  Map<String, dynamic> toJson() => {
        "/app/kongadata": appKongadata.toJson(),
      };
}

class GraphDriver {
  GraphDriver({
    required this.data,
    required this.name,
  });

  Data data;
  String name;

  factory GraphDriver.fromJson(Map<String, dynamic> json) => GraphDriver(
        data: Data.fromJson(json["Data"]),
        name: json["Name"],
      );

  Map<String, dynamic> toJson() => {
        "Data": data.toJson(),
        "Name": name,
      };
}

class Data {
  Data({
    required this.lowerDir,
    required this.mergedDir,
    required this.upperDir,
    required this.workDir,
  });

  String lowerDir;
  String mergedDir;
  String upperDir;
  String workDir;

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
    required this.autoRemove,
    this.binds,
    this.blkioDeviceReadBps,
    this.blkioDeviceReadIOps,
    this.blkioDeviceWriteBps,
    this.blkioDeviceWriteIOps,
    required this.blkioWeight,
    required this.blkioWeightDevice,
    this.capAdd,
    this.capDrop,
    required this.cgroup,
    required this.cgroupParent,
    required this.cgroupnsMode,
    required this.consoleSize,
    required this.containerIdFile,
    required this.cpuCount,
    required this.cpuPercent,
    required this.cpuPeriod,
    required this.cpuQuota,
    required this.cpuRealtimePeriod,
    required this.cpuRealtimeRuntime,
    required this.cpuShares,
    required this.cpusetCpus,
    required this.cpusetMems,
    this.deviceCgroupRules,
    this.deviceRequests,
    required this.devices,
    required this.dns,
    required this.dnsOptions,
    required this.dnsSearch,
    this.extraHosts,
    this.groupAdd,
    required this.ioMaximumBandwidth,
    required this.ioMaximumIOps,
    required this.ipcMode,
    required this.isolation,
    required this.kernelMemory,
    required this.kernelMemoryTcp,
    this.links,
    required this.logConfig,
    required this.maskedPaths,
    required this.memory,
    required this.memoryReservation,
    required this.memorySwap,
    required this.memorySwappiness,
    required this.nanoCpus,
    required this.networkMode,
    required this.oomKillDisable,
    required this.oomScoreAdj,
    required this.pidMode,
    required this.pidsLimit,
    required this.portBindings,
    required this.privileged,
    required this.publishAllPorts,
    required this.readonlyPaths,
    required this.readonlyRootfs,
    required this.restartPolicy,
    required this.runtime,
    required this.securityOpt,
    required this.shmSize,
    required this.utsMode,
    required this.ulimits,
    required this.usernsMode,
    required this.volumeDriver,
    required this.volumesFrom,
  });

  bool autoRemove;
  dynamic binds;
  dynamic blkioDeviceReadBps;
  dynamic blkioDeviceReadIOps;
  dynamic blkioDeviceWriteBps;
  dynamic blkioDeviceWriteIOps;
  int blkioWeight;
  List<dynamic> blkioWeightDevice;
  dynamic capAdd;
  dynamic capDrop;
  String cgroup;
  String cgroupParent;
  String cgroupnsMode;
  List<int> consoleSize;
  String containerIdFile;
  int cpuCount;
  int cpuPercent;
  int cpuPeriod;
  int cpuQuota;
  int cpuRealtimePeriod;
  int cpuRealtimeRuntime;
  int cpuShares;
  String cpusetCpus;
  String cpusetMems;
  dynamic deviceCgroupRules;
  dynamic deviceRequests;
  List<dynamic> devices;
  List<dynamic> dns;
  List<dynamic> dnsOptions;
  List<dynamic> dnsSearch;
  dynamic extraHosts;
  dynamic groupAdd;
  int ioMaximumBandwidth;
  int ioMaximumIOps;
  String ipcMode;
  String isolation;
  int kernelMemory;
  int kernelMemoryTcp;
  dynamic links;
  LogConfig logConfig;
  List<String> maskedPaths;
  int memory;
  int memoryReservation;
  int memorySwap;
  dynamic memorySwappiness;
  int nanoCpus;
  String networkMode;
  bool oomKillDisable;
  int oomScoreAdj;
  String pidMode;
  dynamic pidsLimit;
  Port portBindings;
  bool privileged;
  bool publishAllPorts;
  List<String> readonlyPaths;
  bool readonlyRootfs;
  RestartPolicy restartPolicy;
  String runtime;
  dynamic securityOpt;
  int shmSize;
  String utsMode;
  dynamic ulimits;
  String usernsMode;
  String volumeDriver;
  dynamic volumesFrom;

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
        portBindings: Port.fromJson(json["PortBindings"]),
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
            List<dynamic>.from(blkioWeightDevice.map((x) => x)),
        "CapAdd": capAdd,
        "CapDrop": capDrop,
        "Cgroup": cgroup,
        "CgroupParent": cgroupParent,
        "CgroupnsMode": cgroupnsMode,
        "ConsoleSize": List<dynamic>.from(consoleSize.map((x) => x)),
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
        "Devices": List<dynamic>.from(devices.map((x) => x)),
        "Dns": List<dynamic>.from(dns.map((x) => x)),
        "DnsOptions": List<dynamic>.from(dnsOptions.map((x) => x)),
        "DnsSearch": List<dynamic>.from(dnsSearch.map((x) => x)),
        "ExtraHosts": extraHosts,
        "GroupAdd": groupAdd,
        "IOMaximumBandwidth": ioMaximumBandwidth,
        "IOMaximumIOps": ioMaximumIOps,
        "IpcMode": ipcMode,
        "Isolation": isolation,
        "KernelMemory": kernelMemory,
        "KernelMemoryTCP": kernelMemoryTcp,
        "Links": links,
        "LogConfig": logConfig.toJson(),
        "MaskedPaths": List<dynamic>.from(maskedPaths.map((x) => x)),
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
        "PortBindings": portBindings.toJson(),
        "Privileged": privileged,
        "PublishAllPorts": publishAllPorts,
        "ReadonlyPaths": List<dynamic>.from(readonlyPaths.map((x) => x)),
        "ReadonlyRootfs": readonlyRootfs,
        "RestartPolicy": restartPolicy.toJson(),
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
    required this.config,
    required this.type,
  });

  Labels config;
  String type;

  factory LogConfig.fromJson(Map<String, dynamic> json) => LogConfig(
        config: Labels.fromJson(json["Config"]),
        type: json["Type"],
      );

  Map<String, dynamic> toJson() => {
        "Config": config.toJson(),
        "Type": type,
      };
}

class Port {
  Port({
    required this.the1337Tcp,
  });

  List<The1337Tcp> the1337Tcp;

  factory Port.fromJson(Map<String, dynamic> json) => Port(
        the1337Tcp: List<The1337Tcp>.from(
            json["1337/tcp"].map((x) => The1337Tcp.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "1337/tcp": List<dynamic>.from(the1337Tcp.map((x) => x.toJson())),
      };
}

class The1337Tcp {
  The1337Tcp({
    required this.hostIp,
    required this.hostPort,
  });

  String hostIp;
  String hostPort;

  factory The1337Tcp.fromJson(Map<String, dynamic> json) => The1337Tcp(
        hostIp: json["HostIp"],
        hostPort: json["HostPort"],
      );

  Map<String, dynamic> toJson() => {
        "HostIp": hostIp,
        "HostPort": hostPort,
      };
}

class RestartPolicy {
  RestartPolicy({
    required this.maximumRetryCount,
    required this.name,
  });

  int maximumRetryCount;
  String name;

  factory RestartPolicy.fromJson(Map<String, dynamic> json) => RestartPolicy(
        maximumRetryCount: json["MaximumRetryCount"],
        name: json["Name"],
      );

  Map<String, dynamic> toJson() => {
        "MaximumRetryCount": maximumRetryCount,
        "Name": name,
      };
}

class Mount {
  Mount({
    required this.destination,
    required this.driver,
    required this.mode,
    required this.name,
    required this.propagation,
    required this.rw,
    required this.source,
    required this.type,
  });

  String destination;
  String driver;
  String mode;
  String name;
  String propagation;
  bool rw;
  String source;
  String type;

  factory Mount.fromJson(Map<String, dynamic> json) => Mount(
        destination: json["Destination"],
        driver: json["Driver"],
        mode: json["Mode"],
        name: json["Name"],
        propagation: json["Propagation"],
        rw: json["RW"],
        source: json["Source"],
        type: json["Type"],
      );

  Map<String, dynamic> toJson() => {
        "Destination": destination,
        "Driver": driver,
        "Mode": mode,
        "Name": name,
        "Propagation": propagation,
        "RW": rw,
        "Source": source,
        "Type": type,
      };
}

class NetworkSettings {
  NetworkSettings({
    required this.bridge,
    required this.endpointId,
    required this.gateway,
    required this.globalIPv6Address,
    required this.globalIPv6PrefixLen,
    required this.hairpinMode,
    required this.ipAddress,
    required this.ipPrefixLen,
    required this.iPv6Gateway,
    required this.linkLocalIPv6Address,
    required this.linkLocalIPv6PrefixLen,
    required this.macAddress,
    required this.networks,
    required this.ports,
    required this.sandboxId,
    required this.sandboxKey,
    required this.secondaryIpAddresses,
    required this.secondaryIPv6Addresses,
  });

  String bridge;
  String endpointId;
  String gateway;
  String globalIPv6Address;
  int globalIPv6PrefixLen;
  bool hairpinMode;
  String ipAddress;
  int ipPrefixLen;
  String iPv6Gateway;
  String linkLocalIPv6Address;
  int linkLocalIPv6PrefixLen;
  String macAddress;
  Networks networks;
  Port ports;
  String sandboxId;
  String sandboxKey;
  dynamic secondaryIpAddresses;
  dynamic secondaryIPv6Addresses;

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
        ports: Port.fromJson(json["Ports"]),
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
        "Networks": networks.toJson(),
        "Ports": ports.toJson(),
        "SandboxID": sandboxId,
        "SandboxKey": sandboxKey,
        "SecondaryIPAddresses": secondaryIpAddresses,
        "SecondaryIPv6Addresses": secondaryIPv6Addresses,
      };
}

class Networks {
  Networks({
    required this.bridge,
  });

  Bridge bridge;

  factory Networks.fromJson(Map<String, dynamic> json) => Networks(
        bridge: Bridge.fromJson(json["bridge"]),
      );

  Map<String, dynamic> toJson() => {
        "bridge": bridge.toJson(),
      };
}

class Bridge {
  Bridge({
    required this.aliases,
    required this.driverOpts,
    required this.endpointId,
    required this.gateway,
    required this.globalIPv6Address,
    required this.globalIPv6PrefixLen,
    required this.ipamConfig,
    required this.ipAddress,
    required this.ipPrefixLen,
    required this.iPv6Gateway,
    required this.links,
    required this.macAddress,
    required this.networkId,
  });

  dynamic aliases;
  dynamic driverOpts;
  String endpointId;
  String gateway;
  String globalIPv6Address;
  int globalIPv6PrefixLen;
  dynamic ipamConfig;
  String ipAddress;
  int ipPrefixLen;
  String iPv6Gateway;
  dynamic links;
  String macAddress;
  String networkId;

  factory Bridge.fromJson(Map<String, dynamic> json) => Bridge(
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
    required this.dead,
    required this.error,
    required this.exitCode,
    required this.finishedAt,
    required this.oomKilled,
    required this.paused,
    required this.pid,
    required this.restarting,
    required this.running,
    required this.startedAt,
    required this.status,
  });

  bool dead;
  String error;
  int exitCode;
  DateTime finishedAt;
  bool oomKilled;
  bool paused;
  int pid;
  bool restarting;
  bool running;
  DateTime startedAt;
  String status;

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
        "FinishedAt": finishedAt.toIso8601String(),
        "OOMKilled": oomKilled,
        "Paused": paused,
        "Pid": pid,
        "Restarting": restarting,
        "Running": running,
        "StartedAt": startedAt.toIso8601String(),
        "Status": status,
      };
}
