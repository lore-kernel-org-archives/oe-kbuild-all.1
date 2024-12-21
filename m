Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0C51F0E3F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Dec 2024 13:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734787119; cv=none; b=Q/c+KVv0jNmC2sve6ura5AxRILRAqtTuL8heg2jvFTX2lhi8wwPeJIUWQ0fv53GdVN+LJ9azwqkCUb9OE66orzWTWo59zoOs4mAO7IXrjIfuROzAfNU4f4gNHyAjG4pdZH99Za4gP7OtOA+7GZ2YBwpYanjPzt9jzmLL/vjXlCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734787119; c=relaxed/simple;
	bh=xzAJC63UW2kuV8CzJ31w597UB2JPUdr3rVPYLcJgOnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YlB/1TG/Rjx58DadSQ9NgpKGHjOGQiM4slUxzVC2h5b1q9+OBzu1XXVAOW6Z10tdFhN1I03VVz3q/rvIaAnySynqslMdfv8lOjJdPH0Tthm/iPXJ6QSI4UFWJ7oyQzD4uc4GvRi7PvH4wd/Bqr4h0M5jr9l0ibBAeYwenzPKHeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=koA34r59; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="koA34r59"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734787118; x=1766323118;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xzAJC63UW2kuV8CzJ31w597UB2JPUdr3rVPYLcJgOnQ=;
  b=koA34r59JfrtklmWaAr9e2z38/JbKAqO/V2QFp8cEoKiZDTFvEHwYBQc
   X9aQN1nSeLoQy3A1BykLNqds2Q2cNqtsim3fd20XQTffguXfr+vERZC7v
   ntICawpEdlBEfxhdDbNK1xjcuCswXFtPSWK2GFEfAdLXSNIZaveiUhhvk
   Tlz3tQgQRP8g2E+fjHVKYITTO05n6bDYK1OiNugr/19z1bgXTuHnG3MiL
   SYQyY62fZ6F1UhTa2GPlMy+GXbJtwrsnl6Br5cAT0+/KptqlcoIqUOS19
   jTF95tHtne+Q5uo4vJQrRmot+kxcGhrwSbJ1FS1MLoE6BXEoTilSfdV+9
   A==;
X-CSE-ConnectionGUID: eLznSep3Q0Kr0NZ49eUf0w==
X-CSE-MsgGUID: AsLeOdmcQvuadShJnS0Mlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="35031359"
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="35031359"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 05:18:37 -0800
X-CSE-ConnectionGUID: W4fsCx0LRpyHfwimTi0EoQ==
X-CSE-MsgGUID: 6gwr92muQuaCwUTZgM7/nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="99619648"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 Dec 2024 05:18:36 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOzNJ-0002Bf-2l;
	Sat, 21 Dec 2024 13:18:33 +0000
Date: Sat, 21 Dec 2024 21:18:01 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.13-rc 73/79]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:348.23-356.4:
 Warning (avoid_unnecessary_addr_size): /soc/spi@11007000/spi_nand@0:
 unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or
 child "reg" property
Message-ID: <202412212122.PeIe4uGy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.13-rc
head:   14191a14a6d71eca113dfb48a38d5fd0b815787e
commit: cd4f46fcaca1a45c10de67b44266921f25741a61 [73/79] arm64: dts: mediatek: mt7988a-bpi-r4: fix trace for spi-nand
config: arm64-randconfig-002-20241221 (https://download.01.org/0day-ci/archive/20241221/202412212122.PeIe4uGy-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412212122.PeIe4uGy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412212122.PeIe4uGy-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1043.23-1064.5: Warning (unit_address_vs_reg): /soc/tphy@11c50000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1076.23-1098.5: Warning (unit_address_vs_reg): /soc/xphy@11e10000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:33.9-35.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1043.23-1064.5: Warning (simple_bus_reg): /soc/tphy@11c50000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1076.23-1098.5: Warning (simple_bus_reg): /soc/xphy@11e10000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts:348.23-356.4: Warning (avoid_unnecessary_addr_size): /soc/spi@11007000/spi_nand@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1159.27-1324.5: Warning (avoid_unnecessary_addr_size): /soc/switch@15020000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +348 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts

57bf62519242a3 Daniel Golle     2023-07-26  342  
57bf62519242a3 Daniel Golle     2023-07-26  343  &spi0 {
57bf62519242a3 Daniel Golle     2023-07-26  344  	pinctrl-names = "default";
57bf62519242a3 Daniel Golle     2023-07-26  345  	pinctrl-0 = <&spi0_flash_pins>;
57bf62519242a3 Daniel Golle     2023-07-26  346  	status = "okay";
57bf62519242a3 Daniel Golle     2023-07-26  347  
57bf62519242a3 Daniel Golle     2023-07-26 @348  	spi_nand: spi_nand@0 {
57bf62519242a3 Daniel Golle     2023-07-26  349  		compatible = "spi-nand";
57bf62519242a3 Daniel Golle     2023-07-26  350  		reg = <0>;
cd4f46fcaca1a4 Frank Wunderlich 2024-12-19  351  		#address-cells = <1>;
cd4f46fcaca1a4 Frank Wunderlich 2024-12-19  352  		#size-cells = <0>;
57bf62519242a3 Daniel Golle     2023-07-26  353  		spi-max-frequency = <52000000>;
57bf62519242a3 Daniel Golle     2023-07-26  354  		spi-tx-buswidth = <4>;
57bf62519242a3 Daniel Golle     2023-07-26  355  		spi-rx-buswidth = <4>;
57bf62519242a3 Daniel Golle     2023-07-26  356  	};
57bf62519242a3 Daniel Golle     2023-07-26  357  };
57bf62519242a3 Daniel Golle     2023-07-26  358  

:::::: The code at line 348 was first introduced by commit
:::::: 57bf62519242a3afc9e95aa2cfe63cfa2df6f3ec WIP: add BPi-R4

:::::: TO: Daniel Golle <daniel@makrotopia.org>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
