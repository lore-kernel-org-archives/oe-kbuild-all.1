Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8814D8CC
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Sep 2024 21:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725745169; cv=none; b=ZfiqAdog8v4YEjUCDWQG78Q+3Rik3vy8ToUQLZTE1jiZWNjie9mGqeexrFizsZaUA2OtMoUXq25ptfnymuYsfi7X6ao2XQiGhxAvEgoDoFzcOJTBWQZZDCE0PfRuAV1heIll92Jyh1ELR1Ryc/z9VNCOMgPuUaUW2ZOXjH7z/m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725745169; c=relaxed/simple;
	bh=ZehMlLnb1+NCqXRSSSDNvf+Jdj0zj5cDfYPPl8wovSk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uFmsE71EeB5xHXFRkK6CEwjqgX7XdLTYR+v6neEPnMYOjKvkJlUdfbUMxtgdDpbHr+ojKFWe7mQv8goI7MUP9FMQjH0Ik3ZewfANL0Ts1S2b9zQKiMsCPk/fs43qmS2y8wvSKxdkj6YwRi/rhwvtb0NANCTWE1kFS8CDacypuHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ByjwhmS9; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ByjwhmS9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725745168; x=1757281168;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZehMlLnb1+NCqXRSSSDNvf+Jdj0zj5cDfYPPl8wovSk=;
  b=ByjwhmS9mSLbrLN0UWxLSuuKAINQnonpIjDw1LzGIeSuitPmO4ogI/kL
   y6+EDAbeHULH2YuRl2qUEVMm464NebZYtiyznVfPlsSIbbn4l4W5VvUi8
   STScBJH9ZTk1R7cPJC75qOtuJNlt/lIFsbsUjEXFdmSL9uFFZJ8DMR9zY
   G8u6eC2RR8jS9xN0sALBy027aT87K2woaYwedgkJFt05cncYM0ZdTa169
   Qv5+HoTD2EuUvz01Laq42E1zS9ROPxPAbv+latxBkiO5q17q+rWLxRwkN
   OotvN8mqpmJNsrGkJu/IwhCBqN5lVQNLaRRepMfZDLlp9Uo2sK34KHfE0
   w==;
X-CSE-ConnectionGUID: JsX+fOLiTsCsdOT0zPS9RQ==
X-CSE-MsgGUID: 00yY//ohTpKkCjTnouSXKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="24619267"
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="24619267"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 14:39:27 -0700
X-CSE-ConnectionGUID: HcpbADuFQ+C4GgIAEPHvCg==
X-CSE-MsgGUID: R/aFl5G9SAGpkrnkq36/aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="65924677"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Sep 2024 14:39:25 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sn39P-000D1j-2h;
	Sat, 07 Sep 2024 21:39:23 +0000
Date: Sun, 8 Sep 2024 05:38:45 +0800
From: kernel test robot <lkp@intel.com>
To: Steve Jeong <how2soft@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-6.6.y 41/82]
 arch/arm64/boot/dts/amlogic/meson64_odroidc4.dts:13.10-18.4: Warning
 (unit_address_vs_reg): /gpiomem: node has a reg or ranges property, but no
 unit name
Message-ID: <202409080510.OcZVQPd3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   c970a63609188f53cf758a3dcd395e777150a29a
commit: 5e7a0fcf547e3b4f54e37972019abef8e78192a7 [41/82] ODROID-N2/C4: char: Add /dev/gpiomem device
config: arm64-randconfig-001-20240907 (https://download.01.org/0day-ci/archive/20240908/202409080510.OcZVQPd3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409080510.OcZVQPd3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409080510.OcZVQPd3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/amlogic/meson64_odroidc4.dts:13.10-18.4: Warning (unit_address_vs_reg): /gpiomem: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi:160.23-164.5: Warning (unit_address_vs_reg): /thermal-zones/cpu-thermal/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi:165.23-169.5: Warning (unit_address_vs_reg): /thermal-zones/cpu-thermal/trips/trip-point@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi:21.10-25.4: Warning (unit_address_vs_reg): /gpiomem: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property

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
