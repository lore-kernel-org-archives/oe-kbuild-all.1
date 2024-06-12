Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86150257D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 03:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718162968; cv=none; b=b7k5wMBWi6msoFxiXukuOyu/mcD9Y+heiqjnYmY8yca9ZRRrd4ngZM9dxdMbF3pnlesLxQrdBTUjyG3zKhrpLkrUhic91DK+SO1VfAlCJXU2gl/Mvaf2DiaHiEX7NHiUXg09YArtRc2+YVNXMIIFENm1gdCnqJlxzg9xi+qlfUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718162968; c=relaxed/simple;
	bh=9ggF3hPq0NENFqtvxNv62haIUbgsmAUxJNuujIqehLw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mpPgCG9H/TAfn1T7JKH99pdDFiYdScTIg7lZTo+cDvCac5PyVqhYrkHc7+2imaU741gvZck5F5fgtDr0DVDbASLvC51o1vaF1ngU1M7RGSFGuB6ZC2hjCcwhqlnMZuVuRQuf+OPnJNsMFCjPG4g8F/HdXwKpi20Vfn8zAR9qjnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PKbFtRx4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PKbFtRx4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718162967; x=1749698967;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9ggF3hPq0NENFqtvxNv62haIUbgsmAUxJNuujIqehLw=;
  b=PKbFtRx4GB+4h10+MH48CHXxIULDOEluWQeTUtasdxua2pZYXd1sgjVU
   YPDGoWsVBHvbiLPslFyYtlfeAB8t7xCv+bSypCJzVhJU+yjxghNltvQDX
   oW0Qdnyiw7WVFwJCU4bPCOhhdoJj6iKmS7/wStcXMZPAh9gUR89vRED3F
   C/iqSHlsxTorrCAggWbFr2FOGuOSxcBAUywc4656Svw5M0ydCQxQddRDf
   kg4xyFekqOrqUOkmJoAWg6fE/d78Rk/E8fXXXF5BiL2ojx2EaE5V/BxLh
   lJrDgRD85HO3AAnkBKjKAmysmZ/T/v2DIeiRcmcHlfuA/09GhmW2BB3Ww
   Q==;
X-CSE-ConnectionGUID: bkhGKeLZSIu28NxhJt36yg==
X-CSE-MsgGUID: I1cY9C6zQECWjh9xnBRKJg==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="32394203"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="32394203"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 20:29:27 -0700
X-CSE-ConnectionGUID: i35AirZkTP25LdDvhBt21w==
X-CSE-MsgGUID: 0qXfxZ7xT7ODkekb8fYpig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="77108910"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Jun 2024 20:29:25 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHEfq-0001AB-2K;
	Wed, 12 Jun 2024 03:29:22 +0000
Date: Wed, 12 Jun 2024 11:28:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 676/30000]
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts:51.34-56.5: Warning
 (unit_address_vs_reg): /reserved-memory/fastboot-cma-mem: node has a reg or
 ranges property, but no unit name
Message-ID: <202406121135.0KlXwrvM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   73b793dd7d4876d09ef0e420c145fab7782f199c
commit: b12a34dcf2de9bfb282d6fb4cb84fdd8eac4bb79 [676/30000] ANDROID: arm64: dts: hikey960: Fix bootwarning on mapping reboot reason syscon
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240612/202406121135.0KlXwrvM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406121135.0KlXwrvM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406121135.0KlXwrvM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/hisilicon/hi3660.dtsi:1150.30-1154.8: Warning (unit_address_vs_reg): /soc/thermal-zones/cls0/trips/trip-point@0: node has a unit name, but no reg property
   arch/arm64/boot/dts/hisilicon/hi3660.dtsi:1156.27-1160.8: Warning (unit_address_vs_reg): /soc/thermal-zones/cls0/trips/trip-point@1: node has a unit name, but no reg property
>> arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts:51.34-56.5: Warning (unit_address_vs_reg): /reserved-memory/fastboot-cma-mem: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts:58.20-61.5: Warning (unit_address_vs_reg): /reserved-memory/uefi-reboot-mode: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts:63.8-66.5: Warning (unit_address_vs_reg): /reserved-memory/bl31: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts:77.13-82.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts:228.19-237.4: Warning (unit_address_vs_reg): /hi3660_i2s: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/hisilicon/hi3660.dtsi:345.31-349.5: Warning (simple_bus_reg): /soc/crg_rst_controller: missing or empty reg/ranges property
   arch/arm64/boot/dts/hisilicon/hi3660.dtsi:370.10-375.5: Warning (simple_bus_reg): /soc/reboot: missing or empty reg/ranges property
   arch/arm64/boot/dts/hisilicon/hi3660.dtsi:384.20-388.5: Warning (simple_bus_reg): /soc/reset: missing or empty reg/ranges property
   arch/arm64/boot/dts/hisilicon/hi3660.dtsi:1139.17-1182.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
   arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi:299.10-333.5: Warning (simple_bus_reg): /soc/funnel: missing or empty reg/ranges property
   arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi:390.14-422.5: Warning (simple_bus_reg): /soc/replicator: missing or empty reg/ranges property
   arch/arm64/boot/dts/hisilicon/hikey960-pinctrl.dtsi:12.21-14.5: Warning (simple_bus_reg): /soc/gpio-range: missing or empty reg/ranges property
   arch/arm64/boot/dts/hisilicon/hi3660-drm.dtsi:94.12-112.6: Warning (avoid_unnecessary_addr_size): /dsi@E8601000/panel@1: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

vim +51 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts

    19	
    20	/ {
    21		model = "HiKey960";
    22		compatible = "hisilicon,hi3660-hikey960", "hisilicon,hi3660";
    23	
    24		aliases {
    25			mshc1 = &dwmmc1;
    26			mshc2 = &dwmmc2;
    27			serial0 = &uart0;
    28			serial1 = &uart1;
    29			serial2 = &uart2;
    30			serial3 = &uart3;
    31			serial4 = &uart4;
    32			serial5 = &uart5;
    33			serial6 = &uart6;
    34		};
    35	
    36		chosen {
    37			stdout-path = "serial6:115200n8";
    38		};
    39	
    40		memory@0 {
    41			device_type = "memory";
    42			/* rewrite this at bootloader */
    43			reg = <0x0 0x0 0x0 0x0>;
    44		};
    45	
    46		reserved-memory {
    47			#address-cells = <2>;
    48			#size-cells = <2>;
    49			ranges;
    50	
  > 51			fastboot_cma: fastboot-cma-mem {
    52				reg = <0x0 0x16c00000 0x0 0x4000000>;
    53				compatible = "shared-dma-pool";
    54				hisi,cma-sec;
    55				reusable;
    56			};
    57	
  > 58			uefi-reboot-mode {
    59				reg = <0x0 0x32100000 0x0 0x00001000>;
    60				no-map;
    61			};
    62	
  > 63			bl31 {
    64				reg = <0x0 0x20200000 0x0 0x200000>;
    65				no-map;
    66			};
    67	
    68			ramoops@32000000 {
    69				compatible = "ramoops";
    70				reg = <0x0 0x32000000 0x0 0x00100000>;
    71				record-size	= <0x00020000>;
    72				console-size	= <0x00020000>;
    73				ftrace-size	= <0x00020000>;
    74			};
    75	
    76			/* global autoconfigured region for contiguous allocations */
    77			linux,cma {
    78				compatible = "shared-dma-pool";
    79				reg = <0x0 0x20C00000 0x0 0x4000000>;
    80				reusable;
    81				linux,cma-default;
    82			};
    83		};
    84	
    85		reboot-mode-syscon@32100000 {
    86			compatible = "syscon", "simple-mfd";
    87			reg = <0x0 0x32100000 0x0 0x00001000>;
    88	
    89			reboot-mode {
    90				compatible = "syscon-reboot-mode";
    91				offset = <0x0>;
    92	
    93				mode-normal	= <0x77665501>;
    94				mode-bootloader	= <0x77665500>;
    95				mode-recovery	= <0x77665502>;
    96			};
    97		};
    98	
    99		keys {
   100			compatible = "gpio-keys";
   101			pinctrl-names = "default";
   102			pinctrl-0 = <&pwr_key_pmx_func &pwr_key_cfg_func>;
   103	
   104			power {
   105				wakeup-source;
   106				gpios = <&gpio4 2 GPIO_ACTIVE_LOW>;
   107				label = "GPIO Power";
   108				linux,code = <KEY_POWER>;
   109			};
   110		};
   111	
   112		leds {
   113			compatible = "gpio-leds";
   114	
   115			user_led1 {
   116				label = "green:user1";
   117				/* gpio_150_user_led1 */
   118				gpios = <&gpio18 6 0>;
   119				linux,default-trigger = "heartbeat";
   120			};
   121	
   122			user_led2 {
   123				label = "green:user2";
   124				/* gpio_151_user_led2 */
   125				gpios = <&gpio18 7 0>;
   126				linux,default-trigger = "none";
   127			};
   128	
   129			user_led3 {
   130				label = "green:user3";
   131				/* gpio_189_user_led3 */
   132				gpios = <&gpio23 5 0>;
   133				linux,default-trigger = "mmc0";
   134			};
   135	
   136			user_led4 {
   137				label = "green:user4";
   138				/* gpio_190_user_led4 */
   139				gpios = <&gpio23 6 0>;
   140				panic-indicator;
   141				linux,default-trigger = "none";
   142			};
   143	
   144			wlan_active_led {
   145				label = "yellow:wlan";
   146				/* gpio_205_wifi_active */
   147				gpios = <&gpio25 5 0>;
   148				linux,default-trigger = "phy0tx";
   149				default-state = "off";
   150			};
   151	
   152			bt_active_led {
   153				label = "blue:bt";
   154				gpios = <&gpio25 7 0>;
   155				/* gpio_207_user_led1 */
   156				linux,default-trigger = "hci0-power";
   157				default-state = "off";
   158			};
   159		};
   160	
   161		pmic: pmic@fff34000 {
   162			compatible = "hisilicon,hi6421v530-pmic";
   163			reg = <0x0 0xfff34000 0x0 0x1000>;
   164			interrupt-controller;
   165			#interrupt-cells = <2>;
   166	
   167			regulators {
   168				ldo3: LDO3 { /* HDMI */
   169					regulator-name = "VOUT3_1V85";
   170					regulator-min-microvolt = <1800000>;
   171					regulator-max-microvolt = <2200000>;
   172					regulator-enable-ramp-delay = <120>;
   173				};
   174	
   175				ldo9: LDO9 { /* SDCARD I/O */
   176					regulator-name = "VOUT9_1V8_2V95";
   177					regulator-min-microvolt = <1750000>;
   178					regulator-max-microvolt = <3300000>;
   179					regulator-enable-ramp-delay = <240>;
   180				};
   181	
   182				ldo11: LDO11 { /* Low Speed Connector */
   183					regulator-name = "VOUT11_1V8_2V95";
   184					regulator-min-microvolt = <1750000>;
   185					regulator-max-microvolt = <3300000>;
   186					regulator-enable-ramp-delay = <240>;
   187				};
   188	
   189				ldo15: LDO15 { /* UFS VCC */
   190					regulator-name = "VOUT15_3V0";
   191					regulator-min-microvolt = <1750000>;
   192					regulator-max-microvolt = <3000000>;
   193					regulator-boot-on;
   194					regulator-always-on;
   195					regulator-enable-ramp-delay = <120>;
   196				};
   197	
   198				ldo16: LDO16 { /* SD VDD */
   199					regulator-name = "VOUT16_2V95";
   200					regulator-min-microvolt = <1750000>;
   201					regulator-max-microvolt = <3000000>;
   202					regulator-enable-ramp-delay = <360>;
   203				};
   204			};
   205		};
   206	
   207		wlan_en: wlan-en-1-8v {
   208			compatible = "regulator-fixed";
   209			regulator-name = "wlan-en-regulator";
   210			regulator-min-microvolt = <1800000>;
   211			regulator-max-microvolt = <1800000>;
   212	
   213			/* GPIO_051_WIFI_EN */
   214			gpio = <&gpio6 3 0>;
   215	
   216			/* WLAN card specific delay */
   217			startup-delay-us = <70000>;
   218			enable-active-high;
   219		};
   220	
   221		firmware {
   222			optee {
   223				compatible = "linaro,optee-tz";
   224				method = "smc";
   225			};
   226		};
   227	
   228		i2s2: hi3660_i2s {
   229			compatible = "hisilicon,hi3660-i2s-1.0";
   230			reg = <0x0 0xe804f800 0x0 0x400>,
   231				<0x0 0xe804e000 0x0 0x400>;
   232			pinctrl-names = "default";
   233			pinctrl-0 = <&i2s2_pmx_func &i2s2_cfg_func>;
   234			dmas = <&asp_dmac 18 &asp_dmac 19>;
   235			dma-names = "rx", "tx";
   236			#sound-dai-cells = <0>;
   237		};
   238	
   239		sound {
   240			compatible = "simple-audio-card";
   241			simple-audio-card,name = "hikey-hdmi";
   242			simple-audio-card,format = "i2s";
   243	
   244			simple-audio-card,bitclock-master = <&sound_master>;
   245			simple-audio-card,frame-master = <&sound_master>;
   246	
   247			sound_master: simple-audio-card,cpu {
   248				sound-dai = <&i2s2>;
   249			};
   250	
   251			simple-audio-card,codec {
   252				sound-dai = <&adv7533>;
   253			};
   254		};
   255	};
   256	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
