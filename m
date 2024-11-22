Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1086518A94C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 23:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732317755; cv=none; b=ZKiO/JNzBIbkbFG+YKgmLtA+HwXWGTgCwywF1dlLoaSOqNJBn5JZ31/bzljJn+Dy3daRNv0Ux13JPx9H0IQ7eZK4u9POAZFZDwUicR4YRmeHPu9Th5JSOcfd4AxrshGN52KikbQZpKeHkhltSi8UHShcPO9Z+K8+KWJ9eKEzh20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732317755; c=relaxed/simple;
	bh=wjZ7mQrPWVD+FGgMC+2cIR1Qu8ESQphvn29V3u22q6o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RyGUzk4zhmbqCFhjPCF/5XNU7wNW1wMMxizGLzd+MIx+7wrH5qMzF8XtSoN1eQwvobjbOghmI0NMo2eFnWoM+VNoxKJp5N9Z3AejmIbLAvSa4W+X/6kImB6WXOrR2wXWHgoyMBS5xaxriWwnk0Asthc9lekbloWd++ZnRbR9tWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MJFIWKh3; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MJFIWKh3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732317754; x=1763853754;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wjZ7mQrPWVD+FGgMC+2cIR1Qu8ESQphvn29V3u22q6o=;
  b=MJFIWKh374d9LW8nmMSRqS1y9pXi8Eii7HbnFKHbNM24AriXb5QBNAcf
   Ejm7mOCM+l9ZMKsXD9pyZYCFw90+tAe8uqBxpV/cCXOQKi1UKVxXw5sTp
   3ZYucURnGU47hHpJaPymphiY6JvnzUWcAmCNVp5kawxsmbXev7aRPTdCZ
   VTQK/YDKtWaYnZXxHb33WY7X9vPvdxtr22hMXFZ3YYDmhxGZ/ACm8SaPx
   WhKyhtazuJ9fODA6AfurTCDpSspbeaGEDX3EeJ5Cyumm3hRd9S4X1QcqK
   8/HdKVvdqLrw9ot/zV5malz5Du5UgSPCb7tNgCUH6UopxbenupCjDa/bV
   A==;
X-CSE-ConnectionGUID: hnd1J5jKRK6xWgWgb0iAoQ==
X-CSE-MsgGUID: ngTm6BgPRia1Xt2q4u6tCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="32352674"
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="32352674"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 15:22:33 -0800
X-CSE-ConnectionGUID: T6ugk3pDRtC4J8w3+6EeQw==
X-CSE-MsgGUID: cUXWNoTQS6aIg7MASmA7NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="95644451"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 Nov 2024 15:22:33 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEcys-0004HV-0A;
	Fri, 22 Nov 2024 23:22:30 +0000
Date: Sat, 23 Nov 2024 07:21:32 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.12-main 33/62]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:34.9-36.4: Warning
 (unit_address_vs_reg): /memory: node has a reg or ranges property, but no
 unit name
Message-ID: <202411230719.3J2muDZm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.12-main
head:   fc18a51777815a2de7bd2a88e44b3707632980d4
commit: b6d853c15f1bb6a978970c1effab3f90d6847fac [33/62] WIP: add BPi-R4
config: arm64-randconfig-002-20241123 (https://download.01.org/0day-ci/archive/20241123/202411230719.3J2muDZm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411230719.3J2muDZm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411230719.3J2muDZm-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1029.23-1050.5: Warning (unit_address_vs_reg): /soc/tphy@11c50000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1062.23-1084.5: Warning (unit_address_vs_reg): /soc/xphy@11e10000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:34.9-36.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1029.23-1050.5: Warning (simple_bus_reg): /soc/tphy@11c50000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1062.23-1084.5: Warning (simple_bus_reg): /soc/xphy@11e10000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1145.27-1310.5: Warning (avoid_unnecessary_addr_size): /soc/switch@15020000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +34 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts

    11	
    12	/ {
    13		compatible = "bananapi,bpi-r4", "mediatek,mt7988a";
    14		model = "Banana Pi BPI-R4";
    15		chassis-type = "embedded";
    16	
    17		aliases {
    18			ethernet0 = &gmac0;
    19			ethernet1 = &gmac1;
    20			ethernet2 = &gmac2;
    21			serial0 = &uart0;
    22			led-boot = &led_green;
    23			led-failsafe = &led_green;
    24			led-running = &led_green;
    25			led-upgrade = &led_green;
    26		};
    27	
    28		chosen {
    29			stdout-path = &uart0;
    30			bootargs = "console=ttyS0,115200n1 loglevel=8 pci=pcie_bus_perf ubi.block=0,fit root=/dev/fit0";
    31			rootdisk-spim-nand = <&ubi_rootfs>;
    32		};
    33	
  > 34		memory {
    35			reg = <0x00 0x40000000 0x00 0x10000000>;
    36		};
    37	
    38		/* SFP1 cage (WAN) */
    39		sfp1: sfp1 {
    40			compatible = "sff,sfp";
    41			i2c-bus = <&i2c_sfp1>;
    42			los-gpios = <&pio 54 GPIO_ACTIVE_HIGH>;
    43			mod-def0-gpios = <&pio 82 GPIO_ACTIVE_LOW>;
    44			tx-disable-gpios = <&pio 70 GPIO_ACTIVE_HIGH>;
    45			tx-fault-gpios = <&pio 69 GPIO_ACTIVE_HIGH>;
    46			rate-select0-gpios = <&pio 21 GPIO_ACTIVE_LOW>;
    47			maximum-power-milliwatt = <3000>;
    48		};
    49	
    50		/* SFP2 cage (LAN) */
    51		sfp2: sfp2 {
    52			compatible = "sff,sfp";
    53			i2c-bus = <&i2c_sfp2>;
    54			los-gpios = <&pio 2 GPIO_ACTIVE_HIGH>;
    55			mod-def0-gpios = <&pio 83 GPIO_ACTIVE_LOW>;
    56			tx-disable-gpios = <&pio 0 GPIO_ACTIVE_HIGH>;
    57			tx-fault-gpios = <&pio 1 GPIO_ACTIVE_HIGH>;
    58			rate-select0-gpios = <&pio 3 GPIO_ACTIVE_LOW>;
    59			maximum-power-milliwatt = <3000>;
    60		};
    61	
    62		gpio-keys {
    63			compatible = "gpio-keys";
    64	
    65			wps {
    66				label = "WPS";
    67				linux,code = <KEY_RESTART>;
    68				gpios = <&pio 14 GPIO_ACTIVE_LOW>;
    69			};
    70		};
    71	
    72		gpio-leds {
    73			compatible = "gpio-leds";
    74	
    75			led_green: led-green {
    76				function = LED_FUNCTION_STATUS;
    77				color = <LED_COLOR_ID_GREEN>;
    78				gpios = <&pio 79 GPIO_ACTIVE_HIGH>;
    79				default-state = "on";
    80			};
    81	
    82			led_blue: led-blue {
    83				function = LED_FUNCTION_WPS;
    84				color = <LED_COLOR_ID_BLUE>;
    85				gpios = <&pio 63 GPIO_ACTIVE_HIGH>;
    86				default-state = "off";
    87			};
    88		};
    89	};
    90	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
