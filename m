Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862D8180A9D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 16:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718211006; cv=none; b=U8awEa8+MStrQWoYhxr6nyi65nuQdmke9yNvtxw85aHty5oIpwAGFRWonW9apfOKVWYbIGxMN0y+nuKrQbfuZFcNMurbhp7rnrS63gq6OU+BVXABlThgEifZlzRTdkemEyBWVeviWMLDsS+A/cibzLEQjAO41ADx+IYD53FqxaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718211006; c=relaxed/simple;
	bh=2Aq3Vlrtr2oj5BbYuH7QIzUIc+4Yo924hGgXMeHqTzI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=duKdz5JWpyghH3P6r4zi1FVbqUVQQQNoa+zqqV9TMHxhZHLw1cltifZCX7j3XzTpyEpuzX5JHsW+IYdIUnkAlJmsnhieUKOyaKFLwZXMPmQdCWugFXQXg4yIwt3CAkkzY4ADdEbzzFyuy7fgqBlJQwUQXbPwyoP/1a8VH8i0naM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kLXnJLFR; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kLXnJLFR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718211005; x=1749747005;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2Aq3Vlrtr2oj5BbYuH7QIzUIc+4Yo924hGgXMeHqTzI=;
  b=kLXnJLFR7mU5B2OAq8kSfaxx/LXE9OjrExpcj4JfFAfISS22Pb1+pQcN
   zlmbaXyU3lsW+ivBOPd2L7VsJzJaj5y272llnYU68+Jc/pO+zAKMJ7tsV
   lqR6Kdtcnhohph57eLpZ4mgC8NQxsmQsuoeNjXb0jNpetWgdVdwVAIMJL
   nFPIXE/j7euPWmu3Jn4SogQTeqw0loO6KwzFKTRZFTHOG2R8GS5/spK88
   pVHhtd64FB5OVfEu02Yc1XQs1MNh6A5cNjrtqrgm9ZrFipAQPFcQx5Nhf
   pXFI/4Hy3pFdfzpsIoUNH8QQlgowv/y1/UrS7cxYErGCuaPiNFrdFW03k
   Q==;
X-CSE-ConnectionGUID: PWLKZdDsQ8ybhb7c99KEtw==
X-CSE-MsgGUID: Ajlxag2HTU6yeAr+h7/diw==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="15112841"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="15112841"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 09:50:04 -0700
X-CSE-ConnectionGUID: r1rnJM89Th+VDoy8xLMzKA==
X-CSE-MsgGUID: NLqFCMqaTdSodKfFcr5cQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="44243541"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Jun 2024 09:50:01 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHRAc-0001jm-2L;
	Wed, 12 Jun 2024 16:49:58 +0000
Date: Thu, 13 Jun 2024 00:49:48 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 2180/2439]
 arch/arm64/boot/dts/phytium/pe220x.dtsi:214.12-217.6: Warning
 (unit_address_vs_reg): /soc/qspi@28008000/flash@0: node has a unit name, but
 no reg property
Message-ID: <202406130002.1tniCKTA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   220ab143d3d2e3e85057a532bee9dd887a1858e7
commit: 3523026413a8dd024663f67f000b06047b9c8567 [2180/2439] dts: phytium: Add dts for Phytium Pe220x SoCs Add initial device tree for Phytium Pe220x SoCs. Phytium Pe220x series has three specs (Pe2201/Pe2202/Pe2204), distinguished by the number of CPU core. Besides CPU cores, on-chip peripherals also vary. Thus, we split them into three separate DTBs.
config: arm64-randconfig-003-20240612 (https://download.01.org/0day-ci/archive/20240613/202406130002.1tniCKTA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240613/202406130002.1tniCKTA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406130002.1tniCKTA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/phytium/pe220x.dtsi:214.12-217.6: Warning (unit_address_vs_reg): /soc/qspi@28008000/flash@0: node has a unit name, but no reg property
>> arch/arm64/boot/dts/phytium/pe220x.dtsi:328.10-332.6: Warning (unit_address_vs_reg): /soc/gpio@28034000/porta: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/phytium/pe220x.dtsi:360.10-364.6: Warning (unit_address_vs_reg): /soc/gpio@28035000/porta: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/phytium/pe220x.dtsi:392.10-396.6: Warning (unit_address_vs_reg): /soc/gpio@28036000/porta: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/phytium/pe220x.dtsi:409.10-413.6: Warning (unit_address_vs_reg): /soc/gpio@28037000/porta: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/phytium/pe220x.dtsi:426.10-430.6: Warning (unit_address_vs_reg): /soc/gpio@28038000/porta: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/phytium/pe220x.dtsi:443.10-447.6: Warning (unit_address_vs_reg): /soc/gpio@28039000/porta: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/phytium/pe2201-demo-ddr4.dts:21.11-24.4: Warning (unit_address_format): /memory@00: unit name should not have leading 0s
>> arch/arm64/boot/dts/phytium/pe220x.dtsi:494.32-501.5: Warning (simple_bus_reg): /soc/watchdog@28040000: simple-bus unit address format error, expected "28041000"
   arch/arm64/boot/dts/phytium/pe220x.dtsi:503.32-510.5: Warning (simple_bus_reg): /soc/watchdog@28042000: simple-bus unit address format error, expected "28043000"
>> arch/arm64/boot/dts/phytium/pe220x.dtsi:905.20-908.5: Warning (simple_bus_reg): /soc/pmdk_dp: missing or empty reg/ranges property
--
>> arch/arm64/boot/dts/phytium/pe220x.dtsi:214.12-217.6: Warning (unit_address_vs_reg): /soc/qspi@28008000/flash@0: node has a unit name, but no reg property
>> arch/arm64/boot/dts/phytium/pe220x.dtsi:328.10-332.6: Warning (unit_address_vs_reg): /soc/gpio@28034000/porta: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/phytium/pe220x.dtsi:360.10-364.6: Warning (unit_address_vs_reg): /soc/gpio@28035000/porta: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/phytium/pe220x.dtsi:392.10-396.6: Warning (unit_address_vs_reg): /soc/gpio@28036000/porta: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/phytium/pe220x.dtsi:409.10-413.6: Warning (unit_address_vs_reg): /soc/gpio@28037000/porta: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/phytium/pe220x.dtsi:426.10-430.6: Warning (unit_address_vs_reg): /soc/gpio@28038000/porta: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/phytium/pe220x.dtsi:443.10-447.6: Warning (unit_address_vs_reg): /soc/gpio@28039000/porta: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/phytium/pe2204-demo-ddr4-local.dts:21.11-24.4: Warning (unit_address_format): /memory@00: unit name should not have leading 0s
>> arch/arm64/boot/dts/phytium/pe220x.dtsi:494.32-501.5: Warning (simple_bus_reg): /soc/watchdog@28040000: simple-bus unit address format error, expected "28041000"
   arch/arm64/boot/dts/phytium/pe220x.dtsi:503.32-510.5: Warning (simple_bus_reg): /soc/watchdog@28042000: simple-bus unit address format error, expected "28043000"
>> arch/arm64/boot/dts/phytium/pe220x.dtsi:905.20-908.5: Warning (simple_bus_reg): /soc/pmdk_dp: missing or empty reg/ranges property
--
>> arch/arm64/boot/dts/phytium/pe220x.dtsi:214.12-217.6: Warning (unit_address_vs_reg): /soc/qspi@28008000/flash@0: node has a unit name, but no reg property
>> arch/arm64/boot/dts/phytium/pe220x.dtsi:328.10-332.6: Warning (unit_address_vs_reg): /soc/gpio@28034000/porta: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/phytium/pe220x.dtsi:360.10-364.6: Warning (unit_address_vs_reg): /soc/gpio@28035000/porta: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/phytium/pe220x.dtsi:392.10-396.6: Warning (unit_address_vs_reg): /soc/gpio@28036000/porta: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/phytium/pe220x.dtsi:409.10-413.6: Warning (unit_address_vs_reg): /soc/gpio@28037000/porta: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/phytium/pe220x.dtsi:426.10-430.6: Warning (unit_address_vs_reg): /soc/gpio@28038000/porta: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/phytium/pe220x.dtsi:443.10-447.6: Warning (unit_address_vs_reg): /soc/gpio@28039000/porta: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/phytium/pe2202-demo-ddr4-local.dts:21.11-24.4: Warning (unit_address_format): /memory@00: unit name should not have leading 0s
>> arch/arm64/boot/dts/phytium/pe220x.dtsi:494.32-501.5: Warning (simple_bus_reg): /soc/watchdog@28040000: simple-bus unit address format error, expected "28041000"
   arch/arm64/boot/dts/phytium/pe220x.dtsi:503.32-510.5: Warning (simple_bus_reg): /soc/watchdog@28042000: simple-bus unit address format error, expected "28043000"
>> arch/arm64/boot/dts/phytium/pe220x.dtsi:905.20-908.5: Warning (simple_bus_reg): /soc/pmdk_dp: missing or empty reg/ranges property
--
>> arch/arm64/boot/dts/phytium/pe220x.dtsi:214.12-217.6: Warning (unit_address_vs_reg): /soc/qspi@28008000/flash@0: node has a unit name, but no reg property
>> arch/arm64/boot/dts/phytium/pe220x.dtsi:328.10-332.6: Warning (unit_address_vs_reg): /soc/gpio@28034000/porta: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/phytium/pe220x.dtsi:360.10-364.6: Warning (unit_address_vs_reg): /soc/gpio@28035000/porta: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/phytium/pe220x.dtsi:392.10-396.6: Warning (unit_address_vs_reg): /soc/gpio@28036000/porta: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/phytium/pe220x.dtsi:409.10-413.6: Warning (unit_address_vs_reg): /soc/gpio@28037000/porta: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/phytium/pe220x.dtsi:426.10-430.6: Warning (unit_address_vs_reg): /soc/gpio@28038000/porta: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/phytium/pe220x.dtsi:443.10-447.6: Warning (unit_address_vs_reg): /soc/gpio@28039000/porta: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/phytium/pe2204-demo-ddr4.dts:21.11-24.4: Warning (unit_address_format): /memory@00: unit name should not have leading 0s
>> arch/arm64/boot/dts/phytium/pe220x.dtsi:494.32-501.5: Warning (simple_bus_reg): /soc/watchdog@28040000: simple-bus unit address format error, expected "28041000"
   arch/arm64/boot/dts/phytium/pe220x.dtsi:503.32-510.5: Warning (simple_bus_reg): /soc/watchdog@28042000: simple-bus unit address format error, expected "28043000"
>> arch/arm64/boot/dts/phytium/pe220x.dtsi:905.20-908.5: Warning (simple_bus_reg): /soc/pmdk_dp: missing or empty reg/ranges property
--
>> arch/arm64/boot/dts/phytium/pe220x.dtsi:214.12-217.6: Warning (unit_address_vs_reg): /soc/qspi@28008000/flash@0: node has a unit name, but no reg property
>> arch/arm64/boot/dts/phytium/pe220x.dtsi:328.10-332.6: Warning (unit_address_vs_reg): /soc/gpio@28034000/porta: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/phytium/pe220x.dtsi:360.10-364.6: Warning (unit_address_vs_reg): /soc/gpio@28035000/porta: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/phytium/pe220x.dtsi:392.10-396.6: Warning (unit_address_vs_reg): /soc/gpio@28036000/porta: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/phytium/pe220x.dtsi:409.10-413.6: Warning (unit_address_vs_reg): /soc/gpio@28037000/porta: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/phytium/pe220x.dtsi:426.10-430.6: Warning (unit_address_vs_reg): /soc/gpio@28038000/porta: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/phytium/pe220x.dtsi:443.10-447.6: Warning (unit_address_vs_reg): /soc/gpio@28039000/porta: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/phytium/pe2202-demo-ddr4.dts:21.11-24.4: Warning (unit_address_format): /memory@00: unit name should not have leading 0s
>> arch/arm64/boot/dts/phytium/pe220x.dtsi:494.32-501.5: Warning (simple_bus_reg): /soc/watchdog@28040000: simple-bus unit address format error, expected "28041000"
   arch/arm64/boot/dts/phytium/pe220x.dtsi:503.32-510.5: Warning (simple_bus_reg): /soc/watchdog@28042000: simple-bus unit address format error, expected "28043000"
>> arch/arm64/boot/dts/phytium/pe220x.dtsi:905.20-908.5: Warning (simple_bus_reg): /soc/pmdk_dp: missing or empty reg/ranges property

vim +214 arch/arm64/boot/dts/phytium/pe220x.dtsi

     9	
    10	/ {
    11		compatible = "phytium,pe220x";
    12		interrupt-parent = <&gic>;
    13		#address-cells = <2>;
    14		#size-cells = <2>;
    15	
    16		aliases {
    17			serial0 = &uart0;
    18			serial1 = &uart1;
    19			serial2 = &uart2;
    20			serial3 = &uart3;
    21		};
    22	
    23		psci {
    24			compatible   = "arm,psci-1.0";
    25			method       = "smc";
    26			cpu_suspend  = <0xc4000001>;
    27			cpu_off      = <0x84000002>;
    28			cpu_on       = <0xc4000003>;
    29			sys_poweroff = <0x84000008>;
    30			sys_reset    = <0x84000009>;
    31		};
    32	
    33		firmware {
    34			scmi: scmi {
    35				compatible = "arm,scmi";
    36				mboxes = <&mbox 0 &mbox 1>;
    37				mbox-names = "tx", "rx";
    38				shmem = <&cpu_scp_hpri &cpu_scp_lpri>;
    39				#address-cells = <1>;
    40				#size-cells = <0>;
    41	
    42				scmi_dvfs: protocol@13 {
    43					reg = <0x13>;
    44					#clock-cells = <1>;
    45				};
    46	
    47				scmi_sensors0: protocol@15 {
    48					reg = <0x15>;
    49					#thermal-sensor-cells = <1>;
    50				};
    51			};
    52		};
    53	
    54		thermal-zones {
    55			sensor0 {
    56				polling-delay-passive = <100>;
    57				polling-delay = <1000>;
    58				thermal-sensors = <&scmi_sensors0 0>;
    59			};
    60	
    61			sensor1 {
    62				polling-delay-passive = <100>;
    63				polling-delay = <1000>;
    64				thermal-sensors = <&scmi_sensors0 1>;
    65			};
    66		};
    67	
    68		cpu: cpus {
    69			#address-cells = <0x2>;
    70			#size-cells = <0x0>;
    71		};
    72	
    73		gic: interrupt-controller@30800000 {
    74			compatible = "arm,gic-v3";
    75			#interrupt-cells = <3>;
    76			#address-cells = <2>;
    77			#size-cells = <2>;
    78			ranges;
    79			interrupt-controller;
    80			reg = <0x0 0x30800000 0 0x20000>,	/* GICD */
    81			      <0x0 0x30880000 0 0x80000>,	/* GICR */
    82			      <0x0 0x30840000 0 0x10000>,	/* GICC */
    83			      <0x0 0x30850000 0 0x10000>,	/* GICH */
    84			      <0x0 0x30860000 0 0x10000>;	/* GICV */
    85			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
    86	
    87			its: gic-its@30820000 {
    88				compatible = "arm,gic-v3-its";
    89				msi-controller;
    90				reg = <0x0 0x30820000 0x0 0x20000>;
    91			};
    92		};
    93	
    94		pmu {
    95			compatible = "arm,armv8-pmuv3";
    96			interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
    97		};
    98	
    99		timer {
   100			compatible = "arm,armv8-timer";
   101			interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
   102				     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
   103				     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
   104				     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
   105			clock-frequency = <50000000>;
   106		};
   107	
   108		clocks {
   109			#address-cells = <2>;
   110			#size-cells = <2>;
   111			ranges;
   112	
   113			sysclk_48mhz: clk48mhz {
   114				compatible = "fixed-clock";
   115				#clock-cells = <0>;
   116				clock-frequency = <48000000>;
   117			};
   118	
   119			sysclk_50mhz: clk50mhz {
   120				compatible = "fixed-clock";
   121				#clock-cells = <0>;
   122				clock-frequency = <50000000>;
   123			};
   124	
   125			sysclk_100mhz: clk100mhz {
   126				compatible = "fixed-clock";
   127				#clock-cells = <0>;
   128				clock-frequency = <100000000>;
   129			};
   130	
   131			sysclk_200mhz: clk200mhz {
   132				compatible = "fixed-clock";
   133				#clock-cells = <0>;
   134				clock-frequency = <200000000>;
   135			};
   136	
   137			sysclk_250mhz: clk250mhz {
   138				compatible = "fixed-clock";
   139				#clock-cells = <0>;
   140				clock-frequency = <250000000>;
   141			};
   142	
   143			sysclk_300mhz: clk300mhz {
   144				compatible = "fixed-clock";
   145				#clock-cells = <0>;
   146				clock-frequency = <300000000>;
   147			};
   148	
   149			sysclk_600mhz: clk600mhz {
   150				compatible = "fixed-clock";
   151				#clock-cells = <0>;
   152				clock-frequency = <600000000>;
   153			};
   154	
   155			sysclk_1200mhz: clk1200mhz {
   156				compatible = "fixed-clock";
   157				#clock-cells = <0>;
   158				clock-frequency = <1200000000>;
   159			};
   160		};
   161	
   162		smmu: iommu@30000000 {
   163			compatible = "arm,smmu-v3";
   164			reg = <0x0 0x30000000 0x0 0x800000>;
   165			interrupts = <GIC_SPI 240 IRQ_TYPE_EDGE_RISING>,
   166				     <GIC_SPI 239 IRQ_TYPE_EDGE_RISING>,
   167				     <GIC_SPI 236 IRQ_TYPE_EDGE_RISING>,
   168				     <GIC_SPI 242 IRQ_TYPE_EDGE_RISING>;
   169			interrupt-names = "eventq", "priq", "cmdq-sync", "gerror";
   170			dma-coherent;
   171			#iommu-cells = <1>;
   172		};
   173	
   174		soc: soc {
   175			compatible = "simple-bus";
   176			#address-cells = <2>;
   177			#size-cells = <2>;
   178			dma-coherent;
   179			ranges;
   180	
   181			mmc0: mmc@28000000 {
   182				compatible = "phytium,mci";
   183				reg = <0x0 0x28000000 0x0 0x1000>;
   184				interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
   185				clocks = <&sysclk_1200mhz>;
   186				clock-names = "phytium_mci_clk";
   187				status = "disabled";
   188			};
   189	
   190			mmc1: mmc@28001000 {
   191				compatible = "phytium,mci";
   192				reg = <0x0 0x28001000 0x0 0x1000>;
   193				interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
   194				clocks = <&sysclk_1200mhz>;
   195				clock-names = "phytium_mci_clk";
   196				status = "disabled";
   197			};
   198	
   199			nand0: nand@28002000 {
   200				compatible = "phytium,nfc";
   201				reg = <0x0 0x28002000 0x0 0x1000>;
   202				interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
   203				status = "disabled";
   204			};
   205	
   206			qspi0: qspi@28008000 {
   207				compatible = "phytium,qspi";
   208				reg = <0x0 0x28008000 0x0     0x1000>,
   209				      <0x0        0x0 0x0 0x0fffffff>;
   210				reg-names = "qspi", "qspi_mm";
   211				clocks = <&sysclk_50mhz>;
   212				status = "disabled";
   213	
 > 214				flash@0 {
   215					spi-rx-bus-width = <1>;
   216					spi-max-frequency = <50000000>;
   217				};
   218			};
   219	
   220			uart0: uart@2800c000 {
   221				compatible = "arm,pl011","arm,primecell";
   222				reg = <0x0 0x2800c000 0x0 0x1000>;
   223				interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
   224				clocks = <&sysclk_100mhz &sysclk_100mhz>;
   225				clock-names = "uartclk", "apb_pclk";
   226				status = "disabled";
   227			};
   228	
   229			uart1: uart@2800d000 {
   230				compatible = "arm,pl011","arm,primecell";
   231				reg = <0x0 0x2800d000 0x0 0x1000>;
   232				interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
   233				clocks = <&sysclk_100mhz &sysclk_100mhz>;
   234				clock-names = "uartclk", "apb_pclk";
   235				status = "disabled";
   236			};
   237	
   238			uart2: uart@2800e000 {
   239				compatible = "arm,pl011","arm,primecell";
   240				reg = <0x0 0x2800e000 0x0 0x1000>;
   241				interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
   242				clocks = <&sysclk_100mhz &sysclk_100mhz>;
   243				clock-names = "uartclk", "apb_pclk";
   244				status = "disabled";
   245			};
   246	
   247			uart3: uart@2800f000 {
   248				compatible = "arm,pl011","arm,primecell";
   249				reg = <0x0 0x2800f000 0x0 0x1000>;
   250				interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
   251				clocks = <&sysclk_100mhz &sysclk_100mhz>;
   252				clock-names = "uartclk", "apb_pclk";
   253				status = "disabled";
   254			};
   255	
   256			lpc: lpc@28010000 {
   257				compatible = "simple-mfd", "syscon";
   258				reg = <0x0 0x28010000 0x0 0x1000>;
   259				reg-io-width = <4>;
   260	
   261				#address-cells = <1>;
   262				#size-cells = <1>;
   263				ranges = <0x0 0x0 0x28010000 0x1000>;
   264	
   265				kcs0: kcs@24 {
   266					compatible = "phytium,kcs-bmc";
   267					reg = <0x24 0x1>, <0x30 0x1>, <0x3c 0x1>;
   268					interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
   269					status = "disabled";
   270				};
   271	
   272				kcs1: kcs@28 {
   273					compatible = "phytium,kcs-bmc";
   274					reg = <0x28 0x1>, <0x34 0x1>, <0x40 0x1>;
   275					interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
   276					status = "disabled";
   277				};
   278	
   279				kcs2: kcs@2c {
   280					compatible = "phytium,kcs-bmc";
   281					reg = <0x2c 0x1>, <0x38 0x1>, <0x44 0x1>;
   282					interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
   283					status = "disabled";
   284				};
   285	
   286				kcs3: kcs@8c {
   287					compatible = "phytium,kcs-bmc";
   288					reg = <0x8c 0x1>, <0x90 0x1>, <0x94 0x1>;
   289					interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
   290					status = "disabled";
   291				};
   292	
   293				bt: bt@48 {
   294					compatible = "phytium,bt-bmc";
   295					reg = <0x48 0x20>;
   296					interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
   297					status = "disabled";
   298				};
   299			};
   300	
   301			/* MIO */
   302	
   303			gpio0: gpio@28034000 {
   304				compatible = "phytium,gpio";
   305				reg = <0x0 0x28034000 0x0 0x1000>;
   306				interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
   307					     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
   308					     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
   309					     <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
   310					     <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
   311					     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
   312					     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
   313					     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
   314					     <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
   315					     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
   316					     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
   317					     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
   318					     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
   319					     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
   320					     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
   321					     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
   322				gpio-controller;
   323				#gpio-cells = <2>;
   324				#address-cells = <1>;
   325				#size-cells = <0>;
   326				status = "disabled";
   327	
 > 328				porta {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
