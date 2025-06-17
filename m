Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9D22EFD95
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 20:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750191030; cv=none; b=MhtsmwnPtK9/5VZodqHHtLcnTYq+MyE3r5nxtjGwW8atviz4AU20ZdDs7fCp+JhrtfgoYzTRaTlYj8kEXJOWYcO+1Lf9mVF1ejdd6N1sTF5V0fCA9/jUyUjJMAGM3QZxeOMsdCFNNre9JgCaTfKn3VQQ1vNFUSB1kNhtsaCzchw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750191030; c=relaxed/simple;
	bh=7H0Ew+0/BeZLA7acrjIYArF6oLVQ5hoFfQd9bPvV5uA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MzVax9kEE2JEBJ1XViunVwZVPobusV6oYnmLw4GADTtsWZbJ3P86pDprUYsiIFJhz9+zCtIR2SA+ppfSXQmMLLf6pS137r95EA8wUifEKk8WBen4hvcktAhrCCDgV6QYkdmZm+lKceciPLfXpePL/VwTVzdxFmwVEV3xCyqC46I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jHZy4Z7u; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jHZy4Z7u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750191027; x=1781727027;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7H0Ew+0/BeZLA7acrjIYArF6oLVQ5hoFfQd9bPvV5uA=;
  b=jHZy4Z7u62H2zgYTSRC+pV+P9eFrlBw6g+Z1ZE8rMqkbzcB/CDkwOT8I
   gFP/OPwf0Qxo+k4MWitmONZDt0XHKmypHKIbQWGzXwmiDnaRQ2HIkZ8lm
   6B2Ze6yhvRMHTSSbYp/Rx3Y5LZo2EZ3ACpo35bHWGGbZ9xHCwc+CJb5tc
   Jlh5amxFunZoTRG1uCieKDwup2NJRe4fS8to+/03Oi8yuNW7SdN2PXnBO
   dgN6v6M5HinjNWR4m3FZk4jiLKvzduqMVoQVnWmq/d+8xGoVeRRrG+2Wv
   F1+8lDT5iGcbGhPRwmS2/bnPyVAfC4DHK3ETccFXPufUmNUHLtdSS3bVt
   g==;
X-CSE-ConnectionGUID: OQM2OBp+SCaSNenQN6JseA==
X-CSE-MsgGUID: CcaAcpAkRPG394XNt9Ye9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="56189305"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="56189305"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 13:10:27 -0700
X-CSE-ConnectionGUID: NTSXyoITTb6aJ0XANjH0Nw==
X-CSE-MsgGUID: XwWURqFNTn6cO0NFYZb+XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="149304163"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Jun 2025 13:10:25 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRcdS-000I3q-3B;
	Tue, 17 Jun 2025 20:10:22 +0000
Date: Wed, 18 Jun 2025 04:10:17 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.16-r4pro 53/53]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:569.4-27:
 Warning (reg_format): /soc/pcie@11300000/pcie@0,0/mt7996@0,0:reg: property
 has invalid length (20 bytes) (#address-cells == 2, #size-cells == 1)
Message-ID: <202506180456.kP8ovF8I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.16-r4pro
head:   de2eef5af7055f0bc1f2c29e4025169aa41126ae
commit: abfdfd2323f75f5893aeb593f5164a4a05558d9d [53/53] dts64: r4pro: fix build-errors (take fan from r4) but still warnings (reg_format/default_addr_size)
config: arm64-randconfig-r121-20250617 (https://download.01.org/0day-ci/archive/20250618/202506180456.kP8ovF8I-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250618/202506180456.kP8ovF8I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506180456.kP8ovF8I-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:569.4-27: Warning (reg_format): /soc/pcie@11300000/pcie@0,0/mt7996@0,0:reg: property has invalid length (20 bytes) (#address-cells == 2, #size-cells == 1)
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:249.5-15: Warning (reg_format): /soc/ethernet@15100000/mdio-bus/switch@16/ports/port@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:256.5-15: Warning (reg_format): /soc/ethernet@15100000/mdio-bus/switch@16/ports/port@1:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:263.5-15: Warning (reg_format): /soc/ethernet@15100000/mdio-bus/switch@16/ports/port@2:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:270.5-15: Warning (reg_format): /soc/ethernet@15100000/mdio-bus/switch@16/ports/port@3:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:277.5-15: Warning (reg_format): /soc/ethernet@15100000/mdio-bus/switch@16/ports/port@4:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:284.5-16: Warning (reg_format): /soc/ethernet@15100000/mdio-bus/switch@16/ports/port@12:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:290.5-15: Warning (reg_format): /soc/ethernet@15100000/mdio-bus/switch@16/ports/port@8:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:303.5-14: Warning (reg_format): /soc/ethernet@15100000/mdio-bus/switch@16/mdio/switchphy@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:306.5-14: Warning (reg_format): /soc/ethernet@15100000/mdio-bus/switch@16/mdio/switchphy@1:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:309.5-14: Warning (reg_format): /soc/ethernet@15100000/mdio-bus/switch@16/mdio/switchphy@2:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:312.5-14: Warning (reg_format): /soc/ethernet@15100000/mdio-bus/switch@16/mdio/switchphy@3:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:315.5-14: Warning (reg_format): /soc/ethernet@15100000/mdio-bus/switch@16/mdio/switchphy@4:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:123.4-14: Warning (reg_format): /soc/ethernet@15100000/mux-bus/ethernet-mux@1:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:128.5-15: Warning (reg_format): /soc/ethernet@15100000/mux-bus/ethernet-mux@1/channel@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:134.5-15: Warning (reg_format): /soc/ethernet@15100000/mux-bus/ethernet-mux@1/channel@1:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:143.4-14: Warning (reg_format): /soc/ethernet@15100000/mux-bus/ethernet-mux@2:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:148.5-15: Warning (reg_format): /soc/ethernet@15100000/mux-bus/ethernet-mux@2/channel@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:155.5-15: Warning (reg_format): /soc/ethernet@15100000/mux-bus/ethernet-mux@2/channel@1:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:685.24-706.5: Warning (unit_address_vs_reg): /soc/t-phy@11c50000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:715.26-737.5: Warning (unit_address_vs_reg): /soc/xs-phy@11e10000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:94.9-96.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:567.14-572.5: Warning (pci_bridge): /soc/pcie@11300000/pcie@0,0/mt7996@0,0: node name is not "pci" or "pcie"
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:567.14-572.5: Warning (pci_bridge): /soc/pcie@11300000/pcie@0,0/mt7996@0,0: missing ranges for PCI bridge (or not a bridge)
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:567.14-572.5: Warning (pci_bridge): /soc/pcie@11300000/pcie@0,0/mt7996@0,0: incorrect #address-cells for PCI bridge
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:567.14-572.5: Warning (pci_bridge): /soc/pcie@11300000/pcie@0,0/mt7996@0,0: incorrect #size-cells for PCI bridge
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: Warning (unit_address_format): Failed prerequisite 'pci_bridge'
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: Warning (pci_device_reg): Failed prerequisite 'pci_bridge'
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: Warning (pci_device_bus_num): Failed prerequisite 'pci_bridge'
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:567.14-572.5: Warning (avoid_default_addr_size): /soc/pcie@11300000/pcie@0,0/mt7996@0,0: Relying on default #address-cells value
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:567.14-572.5: Warning (avoid_default_addr_size): /soc/pcie@11300000/pcie@0,0/mt7996@0,0: Relying on default #size-cells value
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:248.18-254.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mdio-bus/switch@16/ports/port@0: Relying on default #address-cells value
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:248.18-254.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mdio-bus/switch@16/ports/port@0: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:255.18-261.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mdio-bus/switch@16/ports/port@1: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:255.18-261.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mdio-bus/switch@16/ports/port@1: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:262.18-268.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mdio-bus/switch@16/ports/port@2: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:262.18-268.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mdio-bus/switch@16/ports/port@2: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:269.18-275.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mdio-bus/switch@16/ports/port@3: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:269.18-275.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mdio-bus/switch@16/ports/port@3: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:276.18-282.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mdio-bus/switch@16/ports/port@4: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:276.18-282.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mdio-bus/switch@16/ports/port@4: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:283.20-288.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mdio-bus/switch@16/ports/port@12: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:283.20-288.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mdio-bus/switch@16/ports/port@12: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:289.18-299.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mdio-bus/switch@16/ports/port@8: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:289.18-299.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mdio-bus/switch@16/ports/port@8: Relying on default #size-cells value
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:302.27-304.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mdio-bus/switch@16/mdio/switchphy@0: Relying on default #address-cells value
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:302.27-304.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mdio-bus/switch@16/mdio/switchphy@0: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:305.27-307.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mdio-bus/switch@16/mdio/switchphy@1: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:305.27-307.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mdio-bus/switch@16/mdio/switchphy@1: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:308.27-310.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mdio-bus/switch@16/mdio/switchphy@2: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:308.27-310.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mdio-bus/switch@16/mdio/switchphy@2: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:311.27-313.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mdio-bus/switch@16/mdio/switchphy@3: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:311.27-313.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mdio-bus/switch@16/mdio/switchphy@3: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:314.27-316.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mdio-bus/switch@16/mdio/switchphy@4: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:314.27-316.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mdio-bus/switch@16/mdio/switchphy@4: Relying on default #size-cells value
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:121.24-140.5: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mux-bus/ethernet-mux@1: Relying on default #address-cells value
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:121.24-140.5: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mux-bus/ethernet-mux@1: Relying on default #size-cells value
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:127.26-132.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mux-bus/ethernet-mux@1/channel@0: Relying on default #address-cells value
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:127.26-132.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mux-bus/ethernet-mux@1/channel@0: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:133.26-139.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mux-bus/ethernet-mux@1/channel@1: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:133.26-139.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mux-bus/ethernet-mux@1/channel@1: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:141.24-160.5: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mux-bus/ethernet-mux@2: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:141.24-160.5: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mux-bus/ethernet-mux@2: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:147.26-153.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mux-bus/ethernet-mux@2/channel@0: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:147.26-153.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mux-bus/ethernet-mux@2/channel@0: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:154.26-159.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mux-bus/ethernet-mux@2/channel@1: Relying on default #address-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts:154.26-159.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mux-bus/ethernet-mux@2/channel@1: Relying on default #size-cells value
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'

vim +569 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dts

abfdfd2323f75f Frank Wunderlich 2025-06-16  320  
abfdfd2323f75f Frank Wunderlich 2025-06-16  321  &pio {
abfdfd2323f75f Frank Wunderlich 2025-06-16  322  	i2c0_pins: i2c0-g0-pins {
abfdfd2323f75f Frank Wunderlich 2025-06-16  323  		mux {
abfdfd2323f75f Frank Wunderlich 2025-06-16  324  			function = "i2c";
abfdfd2323f75f Frank Wunderlich 2025-06-16  325  			groups = "i2c0_1";
abfdfd2323f75f Frank Wunderlich 2025-06-16  326  		};
abfdfd2323f75f Frank Wunderlich 2025-06-16  327  	};
abfdfd2323f75f Frank Wunderlich 2025-06-16  328  
abfdfd2323f75f Frank Wunderlich 2025-06-16  329  	i2c1_pins: i2c1-g0-pins {
abfdfd2323f75f Frank Wunderlich 2025-06-16  330  		mux {
abfdfd2323f75f Frank Wunderlich 2025-06-16  331  			function = "i2c";
abfdfd2323f75f Frank Wunderlich 2025-06-16  332  			groups = "i2c1_0";
abfdfd2323f75f Frank Wunderlich 2025-06-16  333  		};
abfdfd2323f75f Frank Wunderlich 2025-06-16  334  	};
abfdfd2323f75f Frank Wunderlich 2025-06-16  335  
abfdfd2323f75f Frank Wunderlich 2025-06-16  336  	i2c2_1_pins: i2c2-g1-pins {
abfdfd2323f75f Frank Wunderlich 2025-06-16  337  		mux {
abfdfd2323f75f Frank Wunderlich 2025-06-16  338  			function = "i2c";
abfdfd2323f75f Frank Wunderlich 2025-06-16  339  			groups = "i2c2_1";
abfdfd2323f75f Frank Wunderlich 2025-06-16  340  		};
abfdfd2323f75f Frank Wunderlich 2025-06-16  341  	};
abfdfd2323f75f Frank Wunderlich 2025-06-16  342  
abfdfd2323f75f Frank Wunderlich 2025-06-16  343  	gbe0_led0_pins: gbe0-led0-pins {
abfdfd2323f75f Frank Wunderlich 2025-06-16  344  		mux {
abfdfd2323f75f Frank Wunderlich 2025-06-16  345  			function = "led";
abfdfd2323f75f Frank Wunderlich 2025-06-16  346  			groups = "gbe0_led0";
abfdfd2323f75f Frank Wunderlich 2025-06-16  347  		};
abfdfd2323f75f Frank Wunderlich 2025-06-16  348  	};
abfdfd2323f75f Frank Wunderlich 2025-06-16  349  
abfdfd2323f75f Frank Wunderlich 2025-06-16  350  	gbe1_led0_pins: gbe1-led0-pins {
abfdfd2323f75f Frank Wunderlich 2025-06-16  351  		mux {
abfdfd2323f75f Frank Wunderlich 2025-06-16  352  			function = "led";
abfdfd2323f75f Frank Wunderlich 2025-06-16  353  			groups = "gbe1_led0";
abfdfd2323f75f Frank Wunderlich 2025-06-16  354  		};
abfdfd2323f75f Frank Wunderlich 2025-06-16  355  	};
abfdfd2323f75f Frank Wunderlich 2025-06-16  356  
abfdfd2323f75f Frank Wunderlich 2025-06-16  357  	gbe2_led0_pins: gbe2-led0-pins {
abfdfd2323f75f Frank Wunderlich 2025-06-16  358  		mux {
abfdfd2323f75f Frank Wunderlich 2025-06-16  359  			function = "led";
abfdfd2323f75f Frank Wunderlich 2025-06-16  360  			groups = "gbe2_led0";
abfdfd2323f75f Frank Wunderlich 2025-06-16  361  		};
abfdfd2323f75f Frank Wunderlich 2025-06-16  362  	};
abfdfd2323f75f Frank Wunderlich 2025-06-16  363  
abfdfd2323f75f Frank Wunderlich 2025-06-16  364  	gbe3_led0_pins: gbe3-led0-pins {
abfdfd2323f75f Frank Wunderlich 2025-06-16  365  		mux {
abfdfd2323f75f Frank Wunderlich 2025-06-16  366  			function = "led";
abfdfd2323f75f Frank Wunderlich 2025-06-16  367  			groups = "gbe3_led0";
abfdfd2323f75f Frank Wunderlich 2025-06-16  368  		};
abfdfd2323f75f Frank Wunderlich 2025-06-16  369  	};
abfdfd2323f75f Frank Wunderlich 2025-06-16  370  
abfdfd2323f75f Frank Wunderlich 2025-06-16  371  	mdio0_pins: mdio0-pins {
abfdfd2323f75f Frank Wunderlich 2025-06-16  372  		mux {
abfdfd2323f75f Frank Wunderlich 2025-06-16  373  			function = "eth";
abfdfd2323f75f Frank Wunderlich 2025-06-16  374  			groups = "mdc_mdio0";
abfdfd2323f75f Frank Wunderlich 2025-06-16  375  		};
abfdfd2323f75f Frank Wunderlich 2025-06-16  376  
abfdfd2323f75f Frank Wunderlich 2025-06-16  377  		conf {
abfdfd2323f75f Frank Wunderlich 2025-06-16  378  			pins = "SMI_0_MDC", "SMI_0_MDIO";
abfdfd2323f75f Frank Wunderlich 2025-06-16  379  			drive-strength = <8>;
abfdfd2323f75f Frank Wunderlich 2025-06-16  380  		};
abfdfd2323f75f Frank Wunderlich 2025-06-16  381  	};
abfdfd2323f75f Frank Wunderlich 2025-06-16  382  
abfdfd2323f75f Frank Wunderlich 2025-06-16  383  	spi0_flash_pins: spi0-flash-pins {
abfdfd2323f75f Frank Wunderlich 2025-06-16  384  		mux {
abfdfd2323f75f Frank Wunderlich 2025-06-16  385  			function = "spi";
abfdfd2323f75f Frank Wunderlich 2025-06-16  386  			groups = "spi0", "spi0_wp_hold";
abfdfd2323f75f Frank Wunderlich 2025-06-16  387  		};
abfdfd2323f75f Frank Wunderlich 2025-06-16  388  	};
abfdfd2323f75f Frank Wunderlich 2025-06-16  389  };
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  390  &switch {
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  391  	dsa,member = <1 0>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  392  	status = "okay";
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  393  };
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  394  &gsw_phy0 {
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  395  	pinctrl-names = "gbe-led";
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  396  	pinctrl-0 = <&gbe0_led0_pins>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  397  };
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  398  &gsw_port0 {
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  399  	label = "wan";
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  400  };
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  401  &gsw_phy0_led0 {
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  402  	status = "okay";
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  403  	color = <LED_COLOR_ID_GREEN>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  404  };
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  405  &gsw_phy1 {
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  406  	pinctrl-names = "gbe-led";
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  407  	pinctrl-0 = <&gbe1_led0_pins>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  408  };
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  409  &gsw_phy1_led0 {
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  410  	status = "okay";
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  411  	color = <LED_COLOR_ID_GREEN>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  412  };
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  413  &gsw_phy2 {
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  414  	pinctrl-names = "gbe-led";
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  415  	pinctrl-0 = <&gbe2_led0_pins>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  416  };
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  417  &gsw_phy2_led0 {
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  418  	status = "okay";
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  419  	color = <LED_COLOR_ID_GREEN>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  420  };
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  421  &gsw_phy3 {
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  422  	pinctrl-names = "gbe-led";
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  423  	pinctrl-0 = <&gbe3_led0_pins>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  424  };
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  425  &gsw_phy3_led0 {
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  426  	status = "okay";
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  427  	color = <LED_COLOR_ID_GREEN>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  428  };
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  429  &cpu0 {
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  430  	proc-supply = <&rt5190_buck3>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  431  };
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  432  &cpu1 {
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  433  	proc-supply = <&rt5190_buck3>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  434  };
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  435  &cpu2 {
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  436  	proc-supply = <&rt5190_buck3>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  437  };
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  438  &cpu3 {
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  439  	proc-supply = <&rt5190_buck3>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  440  };
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  441  &cci {
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  442  	proc-supply = <&rt5190_buck3>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  443  };
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  444  &i2c0 {
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  445  	pinctrl-names = "default";
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  446  	pinctrl-0 = <&i2c0_pins>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  447  	status = "okay";
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  448  	rt5190a_64: rt5190a@64 {
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  449  		compatible = "richtek,rt5190a";
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  450  		reg = <0x64>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  451  		vin2-supply = <&rt5190_buck1>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  452  		vin3-supply = <&rt5190_buck1>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  453  		vin4-supply = <&rt5190_buck1>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  454  		regulators {
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  455  			rt5190_buck1: buck1 {
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  456  				regulator-name = "rt5190a-buck1";
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  457  				regulator-min-microvolt = <5090000>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  458  				regulator-max-microvolt = <5090000>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  459  				regulator-allowed-modes =
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  460  				<RT5190A_OPMODE_AUTO RT5190A_OPMODE_FPWM>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  461  				regulator-boot-on;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  462  				regulator-always-on;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  463  			};
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  464  			buck2 {
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  465  				regulator-name = "vcore";
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  466  				regulator-min-microvolt = <600000>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  467  				regulator-max-microvolt = <1400000>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  468  				regulator-boot-on;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  469  				regulator-always-on;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  470  			};
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  471  			rt5190_buck3: buck3 {
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  472  				regulator-name = "vproc";
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  473  				regulator-min-microvolt = <600000>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  474  				regulator-max-microvolt = <1400000>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  475  				regulator-boot-on;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  476  			};
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  477  			buck4 {
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  478  				regulator-name = "rt5190a-buck4";
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  479  				regulator-min-microvolt = <850000>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  480  				regulator-max-microvolt = <850000>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  481  				regulator-allowed-modes =
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  482  				<RT5190A_OPMODE_AUTO RT5190A_OPMODE_FPWM>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  483  				regulator-boot-on;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  484  				regulator-always-on;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  485  			};
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  486  			ldo {
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  487  				regulator-name = "rt5190a-ldo";
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  488  				regulator-min-microvolt = <1200000>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  489  				regulator-max-microvolt = <1200000>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  490  				regulator-boot-on;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  491  				regulator-always-on;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  492  			};
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  493  		};
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  494  	};
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  495  };
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  496  &i2c1 {
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  497  	pinctrl-names = "default";
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  498  	pinctrl-0 = <&i2c1_pins>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  499  	status = "okay";
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  500  };
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  501  &i2c2 {
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  502  	pinctrl-names = "default";
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  503  	pinctrl-0 = <&i2c2_1_pins>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  504  	status = "okay";
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  505  	pca9545: i2c-switch@70 {
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  506  		reg = <0x70>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  507  		compatible = "nxp,pca9545";
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  508  		#address-cells = <1>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  509  		#size-cells = <0>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  510  		imux0: i2c@0 {
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  511  			#address-cells = <1>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  512  			#size-cells = <0>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  513  			reg = <0>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  514  			ina226: adc@40 {
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  515  				compatible = "ti,ina226";
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  516  				reg = <0x40>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  517  			};
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  518  			pcf8563: rtc@51 {
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  519  				compatible = "nxp,pcf8563";
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  520  				reg = <0x51>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  521  			};
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  522  			p24c02: eeprom@57 {
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  523  				compatible = "atmel,24c02";
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  524  				reg = <0x57>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  525  				address-bits = <8>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  526  				page-size = <8>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  527  				size = <256>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  528  			};
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  529  		};
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  530  		imux1_gpio: i2c@1 {
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  531  			#address-cells = <1>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  532  			#size-cells = <0>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  533  			reg = <1>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  534  			pca9555: i2c-gpio-expander@20 {
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  535  				compatible = "nxp,pca9555";
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  536  				gpio-controller;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  537  				#gpio-cells = <2>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  538  				reg = <0x20>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  539  			};
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  540  		};
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  541  		imux2_sfp2: i2c@2 {
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  542  			#address-cells = <1>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  543  			#size-cells = <0>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  544  			reg = <2>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  545  		};
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  546  		imux3_wifi: i2c@3 {
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  547  			#address-cells = <1>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  548  			#size-cells = <0>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  549  			reg = <3>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  550  			wifi_eeprom: eeprom@51 {
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  551  				compatible = "atmel,24c02";
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  552  				reg = <0x51>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  553  				address-bits = <8>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  554  				page-size = <8>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  555  				size = <256>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  556  			};
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  557  		};
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  558  	};
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  559  };
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  560  /* mPCIe SIM2 */
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  561  &pcie0 {
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  562  	pinctrl-names = "default";
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  563  	pinctrl-0 = <&pcie0_pins>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  564  	status = "okay";
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  565  	slot0: pcie@0,0 {
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  566  		reg = <0x0000 0 0 0 0>;
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16 @567  		mt7996@0,0 {
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16  568  			compatible = "mediatek,mt76";
8c558ce9ba5bf0 Frank Wunderlich 2025-06-16 @569  			reg = <0x0000 0 0 0 0>;

:::::: The code at line 569 was first introduced by commit
:::::: 8c558ce9ba5bf064b9237a9e7eed001df2f9a5d4 arm64: dts: mt7988: add R4-Pro dts from MTK SDK

:::::: TO: Frank Wunderlich <frank-w@public-files.de>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
