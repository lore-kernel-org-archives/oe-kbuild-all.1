Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B19BEAC7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Oct 2025 09:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760261995; cv=none; b=GEDic0mJIL2CdJxL+E6KOFlXbX6pjj4EaUvH4tvm30hDNwu6Vu0p1nb9+7vqqTAALV5/0MT2J5lfHuzotT++JVaR3VTXAzJx19Pkcaw4OA2fKZNB5C0RMBGfYTaLzFXWmkHXsNHrICDY8evB01Omer8NEG/x/sZ+BS1pihUrtlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760261995; c=relaxed/simple;
	bh=QXMuWxk+coO/oZSKKuK0LxaZLSPKI1Nx0u3GRRqYPsI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O9Se1vBD1xvlYeijKropTJ/y4mv4aq3Sbqb5d4V07ZiJbO5aRmQjRFTEk7MJENplBsnaRX29kVmezGXfMWOAaeej2O9t0sKSm30pEpTlrRWN1RhXn1C7ZqDzUUH3qTq1VLLVQxMPgcGKuuy+kO1noDa5liqsus9aO+Q+AvVAUeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kCT6VxnT; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kCT6VxnT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760261994; x=1791797994;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QXMuWxk+coO/oZSKKuK0LxaZLSPKI1Nx0u3GRRqYPsI=;
  b=kCT6VxnTCo+k0tpr2dQY5PrOF9vDFwGkzkXnVQRxHLXcFETJDLh+dWrF
   4t73y4RVcrtpSIr4/lZHRYewz+OKpWqzYNKghrrwdAWb2Yv/SgBpzbKdV
   RG1hFpnydHGt/ez9UeqFXDo/FMCMxa1cv0IfYbjfchIYqw5m5x0cG2abK
   Hq1GXXkn3+ETYqTjCSn7InVJwyFhTwgwc6tDyS3yoo2LsFMbWsnKrHEdJ
   uX5aJ+c95VRrWqxbSSagyXFMDIbeoeTijKSDtYUSrhEZiaFNOZNVzXnso
   ES7XCij/aOCmiPFM2wfR468tCXXRfjkwQC4y5gKxj+yevkLrL+/UgXaph
   Q==;
X-CSE-ConnectionGUID: /jYuuoDfSAilQsdwIv5Zeg==
X-CSE-MsgGUID: T+Mr7PETSa2TTPIFB003sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="62576996"
X-IronPort-AV: E=Sophos;i="6.19,223,1754982000"; 
   d="scan'208";a="62576996"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2025 02:39:53 -0700
X-CSE-ConnectionGUID: /+f1LKGKTxCO7Ugkg/4ySg==
X-CSE-MsgGUID: neLHerwOSKivaHda8e/1MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,223,1754982000"; 
   d="scan'208";a="212312602"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Oct 2025 02:39:51 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7sYO-0004J9-3B;
	Sun, 12 Oct 2025 09:39:49 +0000
Date: Sun, 12 Oct 2025 17:39:07 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.18-rc 105/110]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: Warning
 (pci_device_reg): Failed prerequisite 'reg_format'
Message-ID: <202510121743.QdrxdhZM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.18-rc
head:   936e993c16c5c695eb2ce063a5a11f122a580727
commit: 567342ac6d5d63d56875cf9ead8d3aebd3b06fa4 [105/110] dts: try to get lan-phy working
config: arm64-randconfig-001-20251012 (https://download.01.org/0day-ci/archive/20251012/202510121743.QdrxdhZM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251012/202510121743.QdrxdhZM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510121743.QdrxdhZM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts:136.4-15: Warning (reg_format): /soc/ethernet@15100000/mdio-bus/switch@16/ds-mux-bus/ds-mux@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts:142.5-15: Warning (reg_format): /soc/ethernet@15100000/mdio-bus/switch@16/ds-mux-bus/ds-mux@0/channel@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts:150.5-15: Warning (reg_format): /soc/ethernet@15100000/mdio-bus/switch@16/ds-mux-bus/ds-mux@0/channel@1:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:685.24-706.5: Warning (unit_address_vs_reg): /soc/t-phy@11c50000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:715.26-737.5: Warning (unit_address_vs_reg): /soc/xs-phy@11e10000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts:134.21-155.5: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mdio-bus/switch@16/ds-mux-bus/ds-mux@0: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts:134.21-155.5: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mdio-bus/switch@16/ds-mux-bus/ds-mux@0: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts:141.28-147.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mdio-bus/switch@16/ds-mux-bus/ds-mux@0/channel@0: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts:141.28-147.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mdio-bus/switch@16/ds-mux-bus/ds-mux@0/channel@0: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts:149.28-154.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mdio-bus/switch@16/ds-mux-bus/ds-mux@0/channel@1: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts:149.28-154.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mdio-bus/switch@16/ds-mux-bus/ds-mux@0/channel@1: Relying on default #size-cells value
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
