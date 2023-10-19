Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0895032C6B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 16:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IGHwngGV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697733499; x=1729269499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qUC79aAAfXX3uGpExJllOgH2H6uCt7WckddLMLyRTnI=;
  b=IGHwngGVUuMlmocUNhap6MrbxtkO6uzRx0QL353K/AF0x5c0ruoY6E4u
   sz3FBjRfQNjz24Ril1/lxid092Z+ZAWU8FNPCyt/AgC2uBMXzmVZ5FKkj
   wlA1sm08Sy4APvwAy0eSBlNtcB4G0moY405rcp6mS+y3sITabYbfke1pG
   urTqs4jpqvw0WnM/wNGWSIb55FBUVIOcPBGs1LSTduqKf9DlREIERX1h0
   hCtD+1UPRKMsmV/rkrrnMuYqitsC1Whlf3VHo9hhhYznVHDdmp1ShvObQ
   km0YV7jsx0jEcX17SP/RtYiN8dv9Po40Cil8EnEw0+nPoAz6UkqL9U1IC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="472534027"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="472534027"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 09:38:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="930679880"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="930679880"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 19 Oct 2023 09:38:16 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtW2H-0002GQ-2f;
	Thu, 19 Oct 2023 16:38:13 +0000
Date: Fri, 20 Oct 2023 00:37:23 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:auto-update-v3 5/7] drivers/firmware/Kconfig:313: can't open
 file "drivers/firmware/microchip/Kconfig"
Message-ID: <202310200030.xeSQEXjK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git auto-update-v3
head:   a8af8669af872b36c2bc40d6bcada0f4b7c2e292
commit: f8fe63fba09c8ae8b90b423073227977a14bccb0 [5/7] firmware: microchip: add PolarFire SoC Auto Update support
config: parisc-allyesconfig (attached as .config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310200030.xeSQEXjK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310200030.xeSQEXjK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/Kconfig:313: can't open file "drivers/firmware/microchip/Kconfig"
   make[3]: *** [scripts/kconfig/Makefile:77: allyesconfig] Error 1
   make[2]: *** [Makefile:697: allyesconfig] Error 2
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'allyesconfig' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'allyesconfig' not remade because of errors.
--
>> drivers/firmware/Kconfig:313: can't open file "drivers/firmware/microchip/Kconfig"
   make[3]: *** [scripts/kconfig/Makefile:77: oldconfig] Error 1
   make[2]: *** [Makefile:697: oldconfig] Error 2
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'oldconfig' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'oldconfig' not remade because of errors.
--
>> drivers/firmware/Kconfig:313: can't open file "drivers/firmware/microchip/Kconfig"
   make[3]: *** [scripts/kconfig/Makefile:77: olddefconfig] Error 1
   make[2]: *** [Makefile:697: olddefconfig] Error 2
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'olddefconfig' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'olddefconfig' not remade because of errors.


vim +313 drivers/firmware/Kconfig

    10	
    11	config ARM_SCPI_PROTOCOL
    12		tristate "ARM System Control and Power Interface (SCPI) Message Protocol"
    13		depends on ARM || ARM64 || COMPILE_TEST
    14		depends on MAILBOX
    15		help
    16		  System Control and Power Interface (SCPI) Message Protocol is
    17		  defined for the purpose of communication between the Application
    18		  Cores(AP) and the System Control Processor(SCP). The MHU peripheral
    19		  provides a mechanism for inter-processor communication between SCP
    20		  and AP.
    21	
    22		  SCP controls most of the power management on the Application
    23		  Processors. It offers control and management of: the core/cluster
    24		  power states, various power domain DVFS including the core/cluster,
    25		  certain system clocks configuration, thermal sensors and many
    26		  others.
    27	
    28		  This protocol library provides interface for all the client drivers
    29		  making use of the features offered by the SCP.
    30	
    31	config ARM_SCPI_POWER_DOMAIN
    32		tristate "SCPI power domain driver"
    33		depends on ARM_SCPI_PROTOCOL || (COMPILE_TEST && OF)
    34		default y
    35		select PM_GENERIC_DOMAINS if PM
    36		help
    37		  This enables support for the SCPI power domains which can be
    38		  enabled or disabled via the SCP firmware
    39	
    40	config ARM_SDE_INTERFACE
    41		bool "ARM Software Delegated Exception Interface (SDEI)"
    42		depends on ARM64
    43		depends on ACPI_APEI_GHES
    44		help
    45		  The Software Delegated Exception Interface (SDEI) is an ARM
    46		  standard for registering callbacks from the platform firmware
    47		  into the OS. This is typically used to implement RAS notifications.
    48	
    49	config EDD
    50		tristate "BIOS Enhanced Disk Drive calls determine boot disk"
    51		depends on X86
    52		help
    53		  Say Y or M here if you want to enable BIOS Enhanced Disk Drive
    54		  Services real mode BIOS calls to determine which disk
    55		  BIOS tries boot from.  This information is then exported via sysfs.
    56	
    57		  This option is experimental and is known to fail to boot on some
    58	          obscure configurations. Most disk controller BIOS vendors do
    59	          not yet implement this feature.
    60	
    61	config EDD_OFF
    62		bool "Sets default behavior for EDD detection to off"
    63		depends on EDD
    64		default n
    65		help
    66		  Say Y if you want EDD disabled by default, even though it is compiled into the
    67		  kernel. Say N if you want EDD enabled by default. EDD can be dynamically set
    68		  using the kernel parameter 'edd={on|skipmbr|off}'.
    69	
    70	config FIRMWARE_MEMMAP
    71	    bool "Add firmware-provided memory map to sysfs" if EXPERT
    72	    default X86
    73	    help
    74	      Add the firmware-provided (unmodified) memory map to /sys/firmware/memmap.
    75	      That memory map is used for example by kexec to set up parameter area
    76	      for the next kernel, but can also be used for debugging purposes.
    77	
    78	      See also Documentation/ABI/testing/sysfs-firmware-memmap.
    79	
    80	config EFI_PCDP
    81		bool "Console device selection via EFI PCDP or HCDP table"
    82		depends on ACPI && EFI && IA64
    83		default y if IA64
    84		help
    85		  If your firmware supplies the PCDP table, and you want to
    86		  automatically use the primary console device it describes
    87		  as the Linux console, say Y here.
    88	
    89		  If your firmware supplies the HCDP table, and you want to
    90		  use the first serial port it describes as the Linux console,
    91		  say Y here.  If your EFI ConOut path contains only a UART
    92		  device, it will become the console automatically.  Otherwise,
    93		  you must specify the "console=hcdp" kernel boot argument.
    94	
    95		  Neither the PCDP nor the HCDP affects naming of serial devices,
    96		  so a serial console may be /dev/ttyS0, /dev/ttyS1, etc, depending
    97		  on how the driver discovers devices.
    98	
    99		  You must also enable the appropriate drivers (serial, VGA, etc.)
   100	
   101		  See DIG64_HCDPv20_042804.pdf available from
   102		  <http://www.dig64.org/specifications/> 
   103	
   104	config DMIID
   105	    bool "Export DMI identification via sysfs to userspace"
   106	    depends on DMI
   107	    default y
   108		help
   109		  Say Y here if you want to query SMBIOS/DMI system identification
   110		  information from userspace through /sys/class/dmi/id/ or if you want
   111		  DMI-based module auto-loading.
   112	
   113	config DMI_SYSFS
   114		tristate "DMI table support in sysfs"
   115		depends on SYSFS && DMI
   116		default n
   117		help
   118		  Say Y or M here to enable the exporting of the raw DMI table
   119		  data via sysfs.  This is useful for consuming the data without
   120		  requiring any access to /dev/mem at all.  Tables are found
   121		  under /sys/firmware/dmi when this option is enabled and
   122		  loaded.
   123	
   124	config DMI_SCAN_MACHINE_NON_EFI_FALLBACK
   125		bool
   126	
   127	config ISCSI_IBFT_FIND
   128		bool "iSCSI Boot Firmware Table Attributes"
   129		depends on X86 && ISCSI_IBFT
   130		default n
   131		help
   132		  This option enables the kernel to find the region of memory
   133		  in which the ISCSI Boot Firmware Table (iBFT) resides. This
   134		  is necessary for iSCSI Boot Firmware Table Attributes module to work
   135		  properly.
   136	
   137	config ISCSI_IBFT
   138		tristate "iSCSI Boot Firmware Table Attributes module"
   139		select ISCSI_BOOT_SYSFS
   140		select ISCSI_IBFT_FIND if X86
   141		depends on ACPI && SCSI && SCSI_LOWLEVEL
   142		default	n
   143		help
   144		  This option enables support for detection and exposing of iSCSI
   145		  Boot Firmware Table (iBFT) via sysfs to userspace. If you wish to
   146		  detect iSCSI boot parameters dynamically during system boot, say Y.
   147		  Otherwise, say N.
   148	
   149	config RASPBERRYPI_FIRMWARE
   150		tristate "Raspberry Pi Firmware Driver"
   151		depends on BCM2835_MBOX
   152		help
   153		  This option enables support for communicating with the firmware on the
   154		  Raspberry Pi.
   155	
   156	config FW_CFG_SYSFS
   157		tristate "QEMU fw_cfg device support in sysfs"
   158		depends on SYSFS && (ARM || ARM64 || PARISC || PPC_PMAC || SPARC || X86)
   159		depends on HAS_IOPORT_MAP
   160		default n
   161		help
   162		  Say Y or M here to enable the exporting of the QEMU firmware
   163		  configuration (fw_cfg) file entries via sysfs. Entries are
   164		  found under /sys/firmware/fw_cfg when this option is enabled
   165		  and loaded.
   166	
   167	config FW_CFG_SYSFS_CMDLINE
   168		bool "QEMU fw_cfg device parameter parsing"
   169		depends on FW_CFG_SYSFS
   170		help
   171		  Allow the qemu_fw_cfg device to be initialized via the kernel
   172		  command line or using a module parameter.
   173		  WARNING: Using incorrect parameters (base address in particular)
   174		  may crash your system.
   175	
   176	config INTEL_STRATIX10_SERVICE
   177		tristate "Intel Stratix10 Service Layer"
   178		depends on ARCH_INTEL_SOCFPGA && ARM64 && HAVE_ARM_SMCCC
   179		default n
   180		help
   181		  Intel Stratix10 service layer runs at privileged exception level,
   182		  interfaces with the service providers (FPGA manager is one of them)
   183		  and manages secure monitor call to communicate with secure monitor
   184		  software at secure monitor exception level.
   185	
   186		  Say Y here if you want Stratix10 service layer support.
   187	
   188	config INTEL_STRATIX10_RSU
   189		tristate "Intel Stratix10 Remote System Update"
   190		depends on INTEL_STRATIX10_SERVICE
   191		help
   192		  The Intel Remote System Update (RSU) driver exposes interfaces
   193		  access through the Intel Service Layer to user space via sysfs
   194		  device attribute nodes. The RSU interfaces report/control some of
   195		  the optional RSU features of the Stratix 10 SoC FPGA.
   196	
   197		  The RSU provides a way for customers to update the boot
   198		  configuration of a Stratix 10 SoC device with significantly reduced
   199		  risk of corrupting the bitstream storage and bricking the system.
   200	
   201		  Enable RSU support if you are using an Intel SoC FPGA with the RSU
   202		  feature enabled and you want Linux user space control.
   203	
   204		  Say Y here if you want Intel RSU support.
   205	
   206	config MTK_ADSP_IPC
   207		tristate "MTK ADSP IPC Protocol driver"
   208		depends on MTK_ADSP_MBOX
   209		help
   210		  Say yes here to add support for the MediaTek ADSP IPC
   211		  between host AP (Linux) and the firmware running on ADSP.
   212		  ADSP exists on some mtk processors.
   213		  Client might use shared memory to exchange information with ADSP.
   214	
   215	config QCOM_SCM
   216		tristate
   217	
   218	config QCOM_SCM_DOWNLOAD_MODE_DEFAULT
   219		bool "Qualcomm download mode enabled by default"
   220		depends on QCOM_SCM
   221		help
   222		  A device with "download mode" enabled will upon an unexpected
   223		  warm-restart enter a special debug mode that allows the user to
   224		  "download" memory content over USB for offline postmortem analysis.
   225		  The feature can be enabled/disabled on the kernel command line.
   226	
   227		  Say Y here to enable "download mode" by default.
   228	
   229	config SYSFB
   230		bool
   231		select BOOT_VESA_SUPPORT
   232	
   233	config SYSFB_SIMPLEFB
   234		bool "Mark VGA/VBE/EFI FB as generic system framebuffer"
   235		depends on X86 || EFI
   236		select SYSFB
   237		help
   238		  Firmwares often provide initial graphics framebuffers so the BIOS,
   239		  bootloader or kernel can show basic video-output during boot for
   240		  user-guidance and debugging. Historically, x86 used the VESA BIOS
   241		  Extensions and EFI-framebuffers for this, which are mostly limited
   242		  to x86 BIOS or EFI systems.
   243		  This option, if enabled, marks VGA/VBE/EFI framebuffers as generic
   244		  framebuffers so the new generic system-framebuffer drivers can be
   245		  used instead. If the framebuffer is not compatible with the generic
   246		  modes, it is advertised as fallback platform framebuffer so legacy
   247		  drivers like efifb, vesafb and uvesafb can pick it up.
   248		  If this option is not selected, all system framebuffers are always
   249		  marked as fallback platform framebuffers as usual.
   250	
   251		  Note: Legacy fbdev drivers, including vesafb, efifb, uvesafb, will
   252		  not be able to pick up generic system framebuffers if this option
   253		  is selected. You are highly encouraged to enable simplefb as
   254		  replacement if you select this option. simplefb can correctly deal
   255		  with generic system framebuffers. But you should still keep vesafb
   256		  and others enabled as fallback if a system framebuffer is
   257		  incompatible with simplefb.
   258	
   259		  If unsure, say Y.
   260	
   261	config TI_SCI_PROTOCOL
   262		tristate "TI System Control Interface (TISCI) Message Protocol"
   263		depends on TI_MESSAGE_MANAGER
   264		help
   265		  TI System Control Interface (TISCI) Message Protocol is used to manage
   266		  compute systems such as ARM, DSP etc with the system controller in
   267		  complex System on Chip(SoC) such as those found on certain keystone
   268		  generation SoC from TI.
   269	
   270		  System controller provides various facilities including power
   271		  management function support.
   272	
   273		  This protocol library is used by client drivers to use the features
   274		  provided by the system controller.
   275	
   276	config TRUSTED_FOUNDATIONS
   277		bool "Trusted Foundations secure monitor support"
   278		depends on ARM && CPU_V7
   279		help
   280		  Some devices (including most early Tegra-based consumer devices on
   281		  the market) are booted with the Trusted Foundations secure monitor
   282		  active, requiring some core operations to be performed by the secure
   283		  monitor instead of the kernel.
   284	
   285		  This option allows the kernel to invoke the secure monitor whenever
   286		  required on devices using Trusted Foundations. See the functions and
   287		  comments in linux/firmware/trusted_foundations.h or the device tree
   288		  bindings for "tlm,trusted-foundations" for details on how to use it.
   289	
   290		  Choose N if you don't know what this is about.
   291	
   292	config TURRIS_MOX_RWTM
   293		tristate "Turris Mox rWTM secure firmware driver"
   294		depends on ARCH_MVEBU || COMPILE_TEST
   295		depends on HAS_DMA && OF
   296		depends on MAILBOX
   297		select HW_RANDOM
   298		select ARMADA_37XX_RWTM_MBOX
   299		help
   300		  This driver communicates with the firmware on the Cortex-M3 secure
   301		  processor of the Turris Mox router. Enable if you are building for
   302		  Turris Mox, and you will be able to read the device serial number and
   303		  other manufacturing data and also utilize the Entropy Bit Generator
   304		  for hardware random number generation.
   305	
   306	source "drivers/firmware/arm_ffa/Kconfig"
   307	source "drivers/firmware/broadcom/Kconfig"
   308	source "drivers/firmware/cirrus/Kconfig"
   309	source "drivers/firmware/google/Kconfig"
   310	source "drivers/firmware/efi/Kconfig"
   311	source "drivers/firmware/imx/Kconfig"
   312	source "drivers/firmware/meson/Kconfig"
 > 313	source "drivers/firmware/microchip/Kconfig"
   314	source "drivers/firmware/psci/Kconfig"
   315	source "drivers/firmware/smccc/Kconfig"
   316	source "drivers/firmware/tegra/Kconfig"
   317	source "drivers/firmware/xilinx/Kconfig"
   318	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
