Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588EB1C3D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 19:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718391860; cv=none; b=iKVaqbKLeM9nuA4lXu1tbsCqyWMV8rzEYftYiBPP4IlvupyxMszyVU1NyKhr6MzJ+M0xDl10E+SqtvLRLx/7X8aboFPeWWEIzAuTnDXrtweU47xxKO2n03Y9t5+GY4UWRd6nytidntcZ1dDqM1qZxSr8eYvasaqgeduJbfx819w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718391860; c=relaxed/simple;
	bh=FgIyB7i0hXlkEVJBpRAH8Z5O0xIaq2l2ZC1WKcxgv+E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mAjt2MV/Y6Re/Sadb5mxoEMTdEZtd2hKEYIDPOkfsbllJKUN/tiwCOkVBwHlWcqeB+taqlULeehNs23IX0aqqrC9vmMrDYk90k6SnV6PAju5LF4tUHyYiYSwkepIDLU43oD1YQx0wG5j7vxKvNhv34ypEVrY3e92FzHgkbBUXGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RSbWjR40; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RSbWjR40"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718391858; x=1749927858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FgIyB7i0hXlkEVJBpRAH8Z5O0xIaq2l2ZC1WKcxgv+E=;
  b=RSbWjR40LU2SDcAiK6Rb1F3ejXIWfeord0GaN3J/BQUkAe5n7F/RGeqJ
   /Wpl4+N0ZJVWm+Izu27M8iEetXUReqIz6oatoo0SW3sH3deTz+gEEeRtk
   R9gilPDqBm1rMPz+8gRSfnH5er9dYk4T55VWqnP26OAoT+snb6zpU7MSq
   NzSfZhNtEB+ITYl3miD9XnlTUit918ce6HIiYds1n17mQpkztjJiC6eik
   5f0Q86fh+E3wH3ZTrtDi1TvnoMfaXluXJGIoxaT09pyzaTQcc8/sRr9my
   GHJg9KmtSq2kS/unURpXNhrXBC+EpuyNTs2hACce5E7xfgEjami2IRQwU
   A==;
X-CSE-ConnectionGUID: 2hpm2Wl8QiGWmw32aehp4Q==
X-CSE-MsgGUID: DXQ9YxVDSN6SLqhCHmGk1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="26713870"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="26713870"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 12:04:18 -0700
X-CSE-ConnectionGUID: Oz91EAyiQ/eECcXVGC4cEQ==
X-CSE-MsgGUID: do8TrkJ9TLaxkuoDpdt/5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="40738665"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Jun 2024 12:04:17 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sICDe-0001gg-2z;
	Fri, 14 Jun 2024 19:04:14 +0000
Date: Sat, 15 Jun 2024 03:03:35 +0800
From: kernel test robot <lkp@intel.com>
To: Steve Jeong <how2soft@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-6.1.y 4606/15964]
 arch/arm64/boot/dts/amlogic/meson64_odroidc4.dts:13.10-18.4: Warning
 (unit_address_vs_reg): /gpiomem: node has a reg or ranges property, but no
 unit name
Message-ID: <202406150327.2kIpvIRd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.1.y
head:   a50c6922e2b4c1d7c895bde521d13096ba16a863
commit: 7ff99842a2f49291177856844102f1aa00687214 [4606/15964] ODROID-N2/C4: char: Add /dev/gpiomem device
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240615/202406150327.2kIpvIRd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406150327.2kIpvIRd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406150327.2kIpvIRd-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:265.33-1539.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1731.28-2012.7: Warning (unit_address_vs_reg): /soc/bus@ff800000/sys-ctrl@0/pinctrl@14: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/amlogic/meson64_odroidc4.dts:13.10-18.4: Warning (unit_address_vs_reg): /gpiomem: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:265.33-1539.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:265.33-1539.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1731.28-2012.7: Warning (unit_address_vs_reg): /soc/bus@ff800000/sys-ctrl@0/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi:160.23-164.5: Warning (unit_address_vs_reg): /thermal-zones/cpu-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi:165.23-169.5: Warning (unit_address_vs_reg): /thermal-zones/cpu-thermal/trips/trip-point@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi:21.10-25.4: Warning (unit_address_vs_reg): /gpiomem: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:265.33-1539.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:265.33-1539.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1731.28-2012.7: Warning (unit_address_vs_reg): /soc/bus@ff800000/sys-ctrl@0/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi:160.23-164.5: Warning (unit_address_vs_reg): /thermal-zones/cpu-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi:165.23-169.5: Warning (unit_address_vs_reg): /thermal-zones/cpu-thermal/trips/trip-point@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi:21.10-25.4: Warning (unit_address_vs_reg): /gpiomem: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:265.33-1539.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2253.20-2261.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/i2c@1c000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

vim +13 arch/arm64/boot/dts/amlogic/meson64_odroidc4.dts

     9	
    10	/ {
    11		model = "Hardkernel ODROID-C4";
    12	
  > 13		gpiomem {
    14			compatible = "amlogic, gpiomem";
    15			reg = <0x0 0xff634000 0x0 0x1000>,	/* GPIO banks */
    16				<0x0 0xff800000 0x0 0x1000>;	/* GPIO_AO bank */
    17			status = "okay";
    18		};
    19	
    20		odroid-reboot {
    21			compatible = "odroid,reboot";
    22			sys_reset = <0x84000009>;
    23			sys_poweroff = <0x84000008>;
    24	
    25			sd-vqen = <&gpio_ao GPIOE_2 GPIO_ACTIVE_HIGH>;
    26			sd-vqsw = <&gpio_ao GPIOAO_6 GPIO_ACTIVE_HIGH>;
    27			sd-vmmc = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_HIGH>;
    28		};
    29	};
    30	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
