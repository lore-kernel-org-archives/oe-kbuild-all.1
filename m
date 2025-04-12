Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB4118A6B6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Apr 2025 20:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744489441; cv=none; b=X1vF3hS+yUR4oFiJHPxwS6gzn3rm0LSG0vWlcItHtGbuwAbZikfGiiqO7qanW6ujhbZ466JbqPvi8wRrGJfj3WdFveMrxOyYs/pHHg/mfnPM+4wtAqvgoGf/honxuRVmNa9DJnO2PYBaMwUCupQjdsHVFD987O986z7nSznrzeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744489441; c=relaxed/simple;
	bh=ocWwT394QjFQD2uvurqGSZO6PujJC+h1leBMn/LQO5I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sNBvuaO17AgeKRosEPko7dESsQytGQuxRhiEm9uVkOlBBRmGPRIuPpL0m5w/0srWjKhwjlr17lQQmW+JmEYiS53fdCBgBzNjzchMalza7qPzIYZ7HeNLE2Y9jiTeIXRiKFoD8ZV57sEfCu3pO/LiFA6MxOikpdxTbaaxd2+IZMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CfR7PLED; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CfR7PLED"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744489439; x=1776025439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ocWwT394QjFQD2uvurqGSZO6PujJC+h1leBMn/LQO5I=;
  b=CfR7PLED7olct2O0Q0/w/Na7U/foqA7KQbfQi5ybUPxhuDjAc0zR+FJp
   ohfbKlmpAVNP1il3/4wNy4a8RxryKiw5HuwVx1BzgYs6zkbx7kVUuJWXK
   ULbCBTRTwcpAg/PSwCTx88Va9RvjzBgJeEFen4VD8UR2ers+w4ZsFXqxn
   dOJHxJXRk3gmObT/c49Wx8nBXoAU0xzICjb0Vi06pGw84comCJ9ok4tSK
   4fLXLQI7ZCNQiljD0nJtaLdyn2QBpHn2aVDYCUEhu+kmh2vUR/oFV1wGx
   cQfedUjvRZoN7nGXJrHon/pTF1eB8eY/qCDGxGOAwUzxxw3Uy6aBN8gn1
   Q==;
X-CSE-ConnectionGUID: ScxbKe0IRPymp7T/gXhHgA==
X-CSE-MsgGUID: Xv7XfzjBTJK27tvwODhbZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="56656301"
X-IronPort-AV: E=Sophos;i="6.15,209,1739865600"; 
   d="scan'208";a="56656301"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 13:23:58 -0700
X-CSE-ConnectionGUID: laqbCnBoSMWCXm4Y4kfWgQ==
X-CSE-MsgGUID: U7HyURv9TxmPYhnNs3X7pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,209,1739865600"; 
   d="scan'208";a="134564480"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Apr 2025 13:23:57 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3hON-000C6g-1A;
	Sat, 12 Apr 2025 20:23:55 +0000
Date: Sun, 13 Apr 2025 04:23:09 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.14-next-wip 6649/6651]
 arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dts:90.3-13: Warning
 (reg_format): /soc/ethernet@15100000/mac@0:reg: property has invalid length
 (4 bytes) (#address-cells == 2, #size-cells == 1)
Message-ID: <202504130429.9CZqTQId-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.14-next-wip
head:   c47e22e7e204c4e69cb6eeeb8588809af178bc8c
commit: 9ba55ae5b49f644543d6d8d6bc93917672f0a2b0 [6649/6651] complete mt7981 dts and add GL.iNet MT3000
config: arm64-randconfig-001-20250413 (https://download.01.org/0day-ci/archive/20250413/202504130429.9CZqTQId-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250413/202504130429.9CZqTQId-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504130429.9CZqTQId-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dts:90.3-13: Warning (reg_format): /soc/ethernet@15100000/mac@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dts:99.3-13: Warning (reg_format): /soc/ethernet@15100000/mac@1:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dts:42.24-45.5: Warning (unit_address_vs_reg): /leds/led@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dts:47.20-50.5: Warning (unit_address_vs_reg): /leds/led@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt7981b.dtsi:259.21-271.5: Warning (spi_bus_bridge): /soc/pi@1100a000: node name for SPI buses should be 'spi'
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: Warning (spi_bus_reg): Failed prerequisite 'spi_bus_bridge'
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dts:88.15-95.4: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mac@0: Relying on default #address-cells value
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dts:88.15-95.4: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mac@0: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dts:97.15-105.4: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mac@1: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dts:97.15-105.4: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mac@1: Relying on default #size-cells value
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
--
>> arch/arm64/boot/dts/mediatek/mt7981b.dtsi:692.18-697.5: Warning (simple_bus_reg): /soc/ice_debug: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt7981b.dtsi:489.33-496.5: Warning (unique_unit_address_if_enabled): /soc/ap2woccif@151a5000: duplicate unit-address (also used in node /soc/syscon@151a5000)
>> arch/arm64/boot/dts/mediatek/mt7981b.dtsi:649.36-652.6: Warning (unique_unit_address_if_enabled): /soc/efuse@11f20000/usb3-rx-imp@8c8: duplicate unit-address (also used in node /soc/efuse@11f20000/usb3-tx-imp@8c8)

vim +90 arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dts

     4	
     5	/ {
     6		model = "GL.iNet GL-MT3000";
     7		compatible = "glinet,gl-mt3000", "mediatek,mt7981";
     8	
     9		aliases {
    10			led-boot = &led_lightblue;
    11			led-failsafe = &led_lightblue;
    12			led-running = &led_white;
    13			led-upgrade = &led_lightblue;
    14			serial0 = &uart0;
    15		};
    16	
    17		chosen {
    18			stdout-path = "serial0:115200n8";
    19		};
    20	
    21		gpio-keys {
    22			compatible = "gpio-keys";
    23	
    24			reset {
    25				label = "reset";
    26				linux,code = <KEY_RESTART>;
    27				gpios = <&pio 1 GPIO_ACTIVE_LOW>;
    28			};
    29	
    30			mode {
    31				label = "mode";
    32				linux,input-type = <EV_SW>;
    33				linux,code = <BTN_0>;
    34				gpios = <&pio 0 GPIO_ACTIVE_HIGH>;
    35				debounce-interval = <60>;
    36			};
    37		};
    38	
    39		leds {
    40			compatible = "gpio-leds";
    41	
  > 42			led_lightblue: led@0 {
    43				label = "blue:run";
    44				gpios = <&pio 31 GPIO_ACTIVE_LOW>;
    45			};
    46	
    47			led_white: led@1 {
    48				label = "white:system";
    49				gpios = <&pio 30 GPIO_ACTIVE_LOW>;
    50			};
    51		};
    52	
    53		fan_5v: regulator-fan-5v {
    54			compatible = "regulator-fixed";
    55			regulator-name = "fan";
    56			regulator-min-microvolt = <5000000>;
    57			regulator-max-microvolt = <5000000>;
    58			gpio = <&pio 28 GPIO_ACTIVE_HIGH>;
    59			enable-active-high;
    60			regulator-boot-on;
    61		};
    62	
    63		usb_vbus: regulator-usb-vbus {
    64			compatible = "regulator-fixed";
    65			regulator-name = "usb_vbus";
    66			regulator-min-microvolt = <5000000>;
    67			regulator-max-microvolt = <5000000>;
    68			gpio = <&pio 12 GPIO_ACTIVE_HIGH>;
    69			enable-active-high;
    70			regulator-boot-on;
    71		};
    72	};
    73	
    74	&uart0 {
    75		status = "okay";
    76	};
    77	
    78	&watchdog {
    79		status = "okay";
    80	};
    81	
    82	&eth {
    83		pinctrl-names = "default";
    84		pinctrl-0 = <&mdio_pins>;
    85	
    86		status = "okay";
    87	
  > 88		gmac0: mac@0 {
    89			compatible = "mediatek,eth-mac";
  > 90			reg = <0>;
    91			phy-mode = "2500base-x";
    92			phy-handle = <&phy0>;
    93			nvmem-cells = <&macaddr>;
    94			nvmem-cell-names = "mac-address";
    95		};
    96	
    97		gmac1: mac@1 {
    98			compatible = "mediatek,eth-mac";
    99			reg = <1>;
   100			phy-mode = "gmii";
   101			phy-handle = <&int_gbe_phy>;
   102			nvmem-cells = <&macaddr>;
   103			nvmem-cell-names = "mac-address";
   104			mac-address-increment = <1>;
   105		};
   106	};
   107	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
