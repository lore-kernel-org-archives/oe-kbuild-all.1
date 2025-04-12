Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820391392
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Apr 2025 18:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744483731; cv=none; b=g2LNcfXCqOYimI7USizB+9HIRoD4CDLUOFlVWXo/63SrBlzraJcf09EWOBvm5Jk3S2vau2ync18rsPtaT2dziwDHx2ZjoxbyQsrSyaTWHjAOsyeUNEeqTM5DcfQqPItz9jOgLWzIkJic+XXnuGBHaPto+/OxkeEOHeemzP35nm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744483731; c=relaxed/simple;
	bh=ypVq7yWLOhVg7DdvY16pJPPX2ve3crP0buXbvDtC7Q8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ND1c6OQAG7NzwQTD+M9ewbEsnpXm5dImRoY70kEKHsnlX60WRRQ8kWKIs0o7WlJJEPYdaAHGANdLT8l+6v3AGKuaUti9Oh89mCbT1505khMJONQjwO3w/XG7L3efSRGUzF2tXGNs8r17bi+rD8h/1mpfGPfBwnpx3f/l6oe4QVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J5Ul3ZGc; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J5Ul3ZGc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744483730; x=1776019730;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ypVq7yWLOhVg7DdvY16pJPPX2ve3crP0buXbvDtC7Q8=;
  b=J5Ul3ZGccJfbBVi/M1AV0YHNmSokLSCaqu94+bGkY8+npJBkkSuXdtn3
   HkB37q/MxllROj7KSMwSCmMlpJkaDiDtLq3xK7YW70spmkDWoQJ7h+NwO
   QU+ctViFugD7BpITyI3G3TFJtQwpAgEm2FDq0z90dpPNVfYoamHYL8y5n
   MrRqqdRpHBk9ILcF9r/ttP5tDeBYsOZaDTiFLYgiD570xR9bd5F9lPvmu
   jTokeuYmTrivZRARXIaWFUgS85kCHVoVRjyWs4Xigs7QttsZCNS+yA/4L
   M/3ZvhibQ0IU7qX+GSqvFvGexy4UviTJAZe6wteJBJG4jg/f42+w1UgHB
   A==;
X-CSE-ConnectionGUID: qwIH0l/3SR2kSqhQjJLs0g==
X-CSE-MsgGUID: YBxs/ilXSLSZw1V5XO272g==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="46096196"
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="46096196"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 11:48:49 -0700
X-CSE-ConnectionGUID: Fa5mZ5ZJSPi9QZ/eOncfxg==
X-CSE-MsgGUID: DWGRqbJfQFy/20I/uA0ACw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="129322889"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Apr 2025 11:48:47 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3fuH-000C2Y-2I;
	Sat, 12 Apr 2025 18:48:45 +0000
Date: Sun, 13 Apr 2025 02:47:56 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.14-next-wip 6622/6651]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi:551.23-559.4:
 Warning (avoid_unnecessary_addr_size): /soc/spi@11007000/spi_nand@0:
 unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or
 child "reg" property
Message-ID: <202504130255.Rw21f1Ij-lkp@intel.com>
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
commit: 6a4d380e2a052798cf5a5cd961a50697ed536b65 [6622/6651] arm64: dts: bpi-r4: split into PoE and non-PoE board variant
config: arm64-randconfig-001-20250413 (https://download.01.org/0day-ci/archive/20250413/202504130255.Rw21f1Ij-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250413/202504130255.Rw21f1Ij-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504130255.Rw21f1Ij-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:894.24-915.5: Warning (unit_address_vs_reg): /soc/t-phy@11c50000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:927.23-949.5: Warning (unit_address_vs_reg): /soc/xphy@11e10000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi:52.9-54.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:652.31-656.5: Warning (simple_bus_reg): /soc/phy-firmware@f000000: simple-bus unit address format error, expected "f100000"
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:894.24-915.5: Warning (simple_bus_reg): /soc/t-phy@11c50000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:927.23-949.5: Warning (simple_bus_reg): /soc/xphy@11e10000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi:551.23-559.4: Warning (avoid_unnecessary_addr_size): /soc/spi@11007000/spi_nand@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1010.27-1175.5: Warning (avoid_unnecessary_addr_size): /soc/switch@15020000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +551 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi

   545	
   546	&spi0 {
   547		pinctrl-names = "default";
   548		pinctrl-0 = <&spi0_flash_pins>;
   549		status = "okay";
   550	
 > 551		spi_nand: spi_nand@0 {
   552			compatible = "spi-nand";
   553			reg = <0>;
   554			spi-max-frequency = <52000000>;
   555			spi-tx-buswidth = <4>;
   556			spi-rx-buswidth = <4>;
   557			#address-cells = <1>;
   558			#size-cells = <1>;
   559		};
   560	};
   561	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
