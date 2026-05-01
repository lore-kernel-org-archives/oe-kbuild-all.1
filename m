Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7682FFF90
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 May 2026 04:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777610730; cv=none; b=gPtoTGG+f3ryzF9dSkQ+WqqE2Urxk1uC0kJes2Pcp8EK4628TOFEDi+UTD6UwwddZVoq6M2fgzRuNU9CpixRUK4dbKY4LieyvpV6YkR6+l0Mh1LR7wr4KF8xoHldBTmaOFPguayoAwDHQIhoZ2ObdzJK6Qb7Dk9VGQ6VZC43Nys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777610730; c=relaxed/simple;
	bh=qlchKs1IzdSYxo0UpkrQ9LDNARD4Lb6inxMMOpR9dVg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HPLYBjq1eqJqOPfpN45Zs+27sUDUVYLaqcwvbZ448YcWY2f1UibGQWnqSD1rOBNET0R+fXbUvvvDD6WqWZEW7EEceTAqiCosrVwMhK8F6OJJIE5Q/iNaTsVi9sIo+QSIYzfdOwadZcDO4mgp7fCJ0biYkQf2Oby1aKOnxmoy8k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T6jhrOQW; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T6jhrOQW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777610729; x=1809146729;
  h=date:from:to:cc:subject:message-id;
  bh=qlchKs1IzdSYxo0UpkrQ9LDNARD4Lb6inxMMOpR9dVg=;
  b=T6jhrOQWQDcbmsIDvvuWEgYm2sH3i2F0Oe6EVdI//MUpKU6yTfLxFLw8
   +w0UZelVcbpPc6IGc9Rys6UdPmUIl0J5VPM0ZFZakq/TgKvCdyhu5bBZN
   P7TVaqbovyqGR22mjr1ozoT7mEt/R7+g3ssWXLpYjnXgmWBsZnrdQ1Wl3
   o3t0ZW4WQCh3wfnisGpjwGdsZd+QO6Nm0KKZH/k2TYuW51hQjfensES6h
   UnLhalBs6pqxc/iK4oO+u6n87OuyoGHlWQ8C4DC5HwAwp3C3wEGNSBth8
   Dgax+Jfztxf/7S2zMCAn3dqSItTgWNLTmZRr/LJ+Ccx5Lfrv+b50KsAp+
   A==;
X-CSE-ConnectionGUID: AS1fvcWYSGqF3CBx96xMxQ==
X-CSE-MsgGUID: xxa6crgERYi2xAQb/qKAhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="66109166"
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="66109166"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 21:45:26 -0700
X-CSE-ConnectionGUID: 5dwXwtX9TP2C0hRsB0Pr1A==
X-CSE-MsgGUID: H/8GU9NQSIaF/M6Rz4WIDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="233737811"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 30 Apr 2026 21:45:25 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIfkg-000000000BN-23YD;
	Fri, 01 May 2026 04:45:22 +0000
Date: Fri, 01 May 2026 12:44:26 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-mt7622 3/3]
 arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: Warning
 (pci_device_reg): Failed prerequisite 'reg_format'
Message-ID: <202605011227.0YAC1Jx4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-mt7622
head:   d8b6134553d0f268ed594061eba808fcb51257f4
commit: 208398c142667c9f2c7e538e318e4f1fb59b155e [3/3] complete mt7981 dts and add GL.iNet MT3000
config: arm64-randconfig-002-20260501 (https://download.01.org/0day-ci/archive/20260501/202605011227.0YAC1Jx4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260501/202605011227.0YAC1Jx4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605011227.0YAC1Jx4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dts:90.3-13: Warning (reg_format): /soc/ethernet@15100000/mac@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dts:99.3-13: Warning (reg_format): /soc/ethernet@15100000/mac@1:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dts:42.24-45.5: Warning (unit_address_vs_reg): /leds/led@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dts:47.20-50.5: Warning (unit_address_vs_reg): /leds/led@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/mediatek/mt7981b.dtsi:261.21-273.5: Warning (spi_bus_bridge): /soc/pi@1100a000: node name for SPI buses should be 'spi'
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: Warning (spi_bus_reg): Failed prerequisite 'spi_bus_bridge'
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dts:88.15-95.4: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mac@0: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dts:88.15-95.4: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mac@0: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dts:97.15-105.4: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mac@1: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dts:97.15-105.4: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mac@1: Relying on default #size-cells value
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
>> arch/arm64/boot/dts/mediatek/mt7981b-glinet-gl-mt3000.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
