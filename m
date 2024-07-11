Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B690214387F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 13:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720703610; cv=none; b=PqNaQQZkjwCmpaJ2ftxKkE1g2uCOmGiyk/w39c7Z6IMBcY4wd7yE9Uw+vyKvLej0nru9Jkk9VayCCtn6WtuA5lZlH4MRpvOPAamEAgVpn9IS69r24HVBkGqOu5bDC8CxYw7kUFwVjVcvaHoTCujybVtQH96o1nOgkfFX4fASTy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720703610; c=relaxed/simple;
	bh=mkd5fpOWEqGNu/yEqMcJ7Tp6ZT15tS9Wroy0xbjdKbo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gfMhPWnbat6MVcTpXP7MbX153EhrSZJYHmv5ntESrq8HPo3UFaoHCNEBB17I9hz1tWkCAdbI/mesExfm13dzAQPGgm2S8w9lMRJKZT8DMhLRyJUX3oRv7Di7+yVmmlWbo1XKsrAfWL+cLVDFycXYGvp55kqcsmQVbQUNi9o9UoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K6kT0m8O; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K6kT0m8O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720703608; x=1752239608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mkd5fpOWEqGNu/yEqMcJ7Tp6ZT15tS9Wroy0xbjdKbo=;
  b=K6kT0m8OoGrr09/khf7ojbb1Z2hVBipux56BgG6FYPPefbjBvRJfpLIh
   u9wj/cwyhiEGyyBgepcl8xTBDMoSYyRFPSh2HmlMOp3SmDfoxoKXedCge
   kbKB74WkmOWC9be1DT2u08OZbE9Fbukdyp0zkbB1yFx7WwckC9GRNCffV
   TOSAmRj80KqMciIv6BQVnSxZ10+iMGN87Qp0v9PYepz4HFRwnd6VL7xS7
   GTHAWr+Je+8GDWEdM+UR9U+A+nkrfcclb3KLxcOuqJneWw9REIpONCnQl
   0X6Fz4FFXuqYUpIvcmpYfPsT91Q20Jk7xalUvmJrv50k2ll4v8JFX0E2S
   w==;
X-CSE-ConnectionGUID: zHAIQ2gfRnen7rlPiwrMxg==
X-CSE-MsgGUID: zu0kTsY3TxmP4WJhH/OYJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="29232715"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="29232715"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 06:13:27 -0700
X-CSE-ConnectionGUID: KV4ci+u2T3WqUYF5BHU7Aw==
X-CSE-MsgGUID: S9PaBQBeSyqqn9rvWv2Hdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="48309263"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Jul 2024 06:13:25 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRtbv-000ZJF-1T;
	Thu, 11 Jul 2024 13:13:23 +0000
Date: Thu, 11 Jul 2024 21:12:54 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 11857/12643]
 arch/powerpc/boot/dts/ac14xx.dts:89.11-115.5: Warning
 (avoid_unnecessary_addr_size): /localbus@80000020/asi@2,0: unnecessary
 #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
 property
Message-ID: <202407112148.GBeOyoe4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f477dd6eede3ecedc8963478571d99ec3bf3f762
commit: 12d638f48c082831388358cc12a1c6ee58185ad8 [11857/12643] scripts/dtc: Update to upstream version v1.7.0-93-g1df7b047fe43
config: powerpc64-randconfig-r024-20220207 (https://download.01.org/0day-ci/archive/20240711/202407112148.GBeOyoe4-lkp@intel.com/config)
compiler: powerpc64le-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407112148.GBeOyoe4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407112148.GBeOyoe4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/mpc5121.dtsi:41.9-44.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/ac14xx.dts:102.13-107.6: Warning (unit_address_vs_reg): /localbus@80000020/asi@2,0/master@1: node has a unit name, but no reg or ranges property
   arch/powerpc/boot/dts/ac14xx.dts:109.13-114.6: Warning (unit_address_vs_reg): /localbus@80000020/asi@2,0/master@2: node has a unit name, but no reg or ranges property
   arch/powerpc/boot/dts/ac14xx.dts:353.19-373.5: Warning (unit_address_vs_reg): /soc@80000000/matrix_keypad@0: node has a unit name, but no reg or ranges property
   arch/powerpc/boot/dts/mpc5121.dtsi:397.13-406.5: Warning (spi_bus_bridge): /soc@80000000/psc@11400: node name for SPI buses should be 'spi'
   arch/powerpc/boot/dts/mpc5121.dtsi:409.13-418.5: Warning (spi_bus_bridge): /soc@80000000/psc@11500: node name for SPI buses should be 'spi'
   arch/powerpc/boot/dts/ac14xx.dtb: Warning (spi_bus_reg): Failed prerequisite 'spi_bus_bridge'
>> arch/powerpc/boot/dts/ac14xx.dts:89.11-115.5: Warning (avoid_unnecessary_addr_size): /localbus@80000020/asi@2,0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/powerpc/boot/dts/mpc5121.dtsi:79.9-88.4: Warning (avoid_unnecessary_addr_size): /clocks: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/powerpc/boot/dts/mpc5121.dtsi:273.13-280.5: Warning (unique_unit_address_if_enabled): /soc@80000000/mdio@2800: duplicate unit-address (also used in node /soc@80000000/ethernet@2800)
   arch/powerpc/boot/dts/mpc5121.dtsi:225.12-231.5: Warning (unique_unit_address_if_enabled): /soc@80000000/axe@2000: duplicate unit-address (also used in node /soc@80000000/axe-base@2000)
   arch/powerpc/boot/dts/mpc5121.dtsi:508.20-525.4: Warning (interrupt_provider): /pci@80008500: '#interrupt-cells' found, but node is not an interrupt provider
   arch/powerpc/boot/dts/ac14xx.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
--
   arch/powerpc/boot/dts/bluestone.dts:44.9-47.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/bluestone.dts:151.13-326.5: Warning (unit_address_vs_reg): /plb/opb: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/bluestone.dts:158.14-235.6: Warning (unit_address_vs_reg): /plb/opb/ebc: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/bluestone.dts:272.13-277.7: Warning (i2c_bus_reg): /plb/opb/i2c@ef600700/sttm@4C: I2C bus unit address format error, expected "4c"
>> arch/powerpc/boot/dts/bluestone.dts:189.14-234.7: Warning (avoid_unnecessary_addr_size): /plb/opb/ebc/ndfc@1,0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
--
   arch/powerpc/boot/dts/canyonlands.dts:47.9-50.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/canyonlands.dts:210.13-429.5: Warning (unit_address_vs_reg): /plb/opb: node has a reg or ranges property, but no unit name
>> arch/powerpc/boot/dts/canyonlands.dts:268.14-289.7: Warning (avoid_unnecessary_addr_size): /plb/opb/ebc/ndfc@3,0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
--
   arch/powerpc/boot/dts/eiger.dts:48.9-51.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/eiger.dts:144.13-420.5: Warning (unit_address_vs_reg): /plb/opb: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/eiger.dts:161.19-195.7: Warning (unit_address_vs_reg): /plb/opb/ebc/nor_flash@0,0: node has a unit name, but no reg or ranges property
   arch/powerpc/boot/dts/eiger.dts:197.14-233.7: Warning (unit_address_vs_reg): /plb/opb/ebc/ndfc@1,0: node has a unit name, but no reg or ranges property
>> arch/powerpc/boot/dts/eiger.dts:151.14-234.6: Warning (avoid_unnecessary_addr_size): /plb/opb/ebc: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/powerpc/boot/dts/eiger.dts:197.14-233.7: Warning (avoid_unnecessary_addr_size): /plb/opb/ebc/ndfc@1,0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
--
   arch/powerpc/boot/dts/glacier.dts:49.9-52.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/glacier.dts:161.13-457.5: Warning (unit_address_vs_reg): /plb/opb: node has a reg or ranges property, but no unit name
>> arch/powerpc/boot/dts/glacier.dts:214.14-235.7: Warning (avoid_unnecessary_addr_size): /plb/opb/ebc/ndfc@3,0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
--
   arch/powerpc/boot/dts/mpc5121.dtsi:41.9-44.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
>> arch/powerpc/boot/dts/mpc5121.dtsi:79.9-88.4: Warning (avoid_unnecessary_addr_size): /clocks: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/powerpc/boot/dts/mpc5121.dtsi:273.13-280.5: Warning (unique_unit_address_if_enabled): /soc@80000000/mdio@2800: duplicate unit-address (also used in node /soc@80000000/ethernet@2800)
--
   arch/powerpc/boot/dts/mpc5125twr.dts:45.9-48.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
>> arch/powerpc/boot/dts/mpc5125twr.dts:55.9-64.4: Warning (avoid_unnecessary_addr_size): /clocks: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/powerpc/boot/dts/mpc5125twr.dts:201.13-209.5: Warning (unique_unit_address_if_enabled): /soc@80000000/mdio@2800: duplicate unit-address (also used in node /soc@80000000/ethernet@2800)
--
   arch/powerpc/boot/dts/mpc5121.dtsi:41.9-44.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/mpc5121.dtsi:457.13-466.5: Warning (spi_bus_bridge): /soc@80000000/psc@11900: node name for SPI buses should be 'spi'
   arch/powerpc/boot/dts/pdm360ng.dtb: Warning (spi_bus_reg): Failed prerequisite 'spi_bus_bridge'
>> arch/powerpc/boot/dts/mpc5121.dtsi:79.9-88.4: Warning (avoid_unnecessary_addr_size): /clocks: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/powerpc/boot/dts/mpc5121.dtsi:273.13-280.5: Warning (unique_unit_address_if_enabled): /soc@80000000/mdio@2800: duplicate unit-address (also used in node /soc@80000000/ethernet@2800)
   arch/powerpc/boot/dts/mpc5121.dtsi:508.20-525.4: Warning (interrupt_provider): /pci@80008500: '#interrupt-cells' found, but node is not an interrupt provider
   arch/powerpc/boot/dts/pdm360ng.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
--
   arch/powerpc/boot/dts/tqm8548-bigflash.dts:44.9-47.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/tqm8548-bigflash.dts:423.11-431.6: Warning (unit_address_vs_reg): /localbus@a0005000/upm@3,0/nand@0: node has a unit name, but no reg or ranges property
   arch/powerpc/boot/dts/tqm8548-bigflash.dts:351.13-384.5: Warning (simple_bus_reg): /localbus@a0005000/flash@1,0: simple-bus unit address format error, expected "100000000"
   arch/powerpc/boot/dts/tqm8548-bigflash.dts:387.11-397.5: Warning (simple_bus_reg): /localbus@a0005000/can@2,0: simple-bus unit address format error, expected "200000000"
   arch/powerpc/boot/dts/tqm8548-bigflash.dts:399.13-408.5: Warning (simple_bus_reg): /localbus@a0005000/can@2,100: simple-bus unit address format error, expected "200000100"
   arch/powerpc/boot/dts/tqm8548-bigflash.dts:411.11-432.5: Warning (simple_bus_reg): /localbus@a0005000/upm@3,0: simple-bus unit address format error, expected "300000000"
>> arch/powerpc/boot/dts/tqm8548-bigflash.dts:411.11-432.5: Warning (avoid_unnecessary_addr_size): /localbus@a0005000/upm@3,0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
--
   arch/powerpc/boot/dts/xpedite5330.dts:32.13-39.5: Warning (unit_address_vs_reg): /pmcslots/pmcslot@0: node has a unit name, but no reg or ranges property
   arch/powerpc/boot/dts/xpedite5330.dts:46.13-52.5: Warning (unit_address_vs_reg): /xmcslots/xmcslot@0: node has a unit name, but no reg or ranges property
   arch/powerpc/boot/dts/xpedite5330.dts:94.9-97.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/xpedite5330.dts:112.16-139.5: Warning (simple_bus_reg): /localbus@ef005000/nor-boot@0,0: simple-bus unit address format error, expected "0"
   arch/powerpc/boot/dts/xpedite5330.dts:141.21-169.5: Warning (simple_bus_reg): /localbus@ef005000/nor-alternate@1,0: simple-bus unit address format error, expected "100000000"
   arch/powerpc/boot/dts/xpedite5330.dts:171.12-188.5: Warning (simple_bus_reg): /localbus@ef005000/nand@2,0: simple-bus unit address format error, expected "200000000"
   arch/powerpc/boot/dts/xpedite5330.dts:547.13-570.5: Warning (simple_bus_reg): /soc8572@ef000000/gpio-leds: missing or empty reg/ranges property
>> arch/powerpc/boot/dts/xpedite5330.dts:28.11-40.4: Warning (avoid_unnecessary_addr_size): /pmcslots: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/powerpc/boot/dts/xpedite5330.dts:42.11-53.4: Warning (avoid_unnecessary_addr_size): /xmcslots: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
--
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:175.11-178.4: Warning (unit_address_vs_reg): /dcsr@f00000000/dcsr-npc: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:183.15-186.4: Warning (unit_address_vs_reg): /dcsr@f00000000/dcsr-corenet: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:175.11-178.4: Warning (simple_bus_reg): /dcsr@f00000000/dcsr-npc: simple-bus unit address format error, expected "1000"
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:183.15-186.4: Warning (simple_bus_reg): /dcsr@f00000000/dcsr-corenet: simple-bus unit address format error, expected "8000"
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:368.17-371.4: Warning (simple_bus_reg): /soc@ffe000000/soc-sram-error: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:489.16-536.4: Warning (simple_bus_reg): /soc@ffe000000/thermal-zones: missing or empty reg/ranges property
>> arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:633.41-711.4: Warning (avoid_unnecessary_addr_size): /soc@ffe000000/ethernet-switch@800000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi:44.10-68.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
--
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:175.11-178.4: Warning (unit_address_vs_reg): /dcsr@f00000000/dcsr-npc: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:183.15-186.4: Warning (unit_address_vs_reg): /dcsr@f00000000/dcsr-corenet: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:175.11-178.4: Warning (simple_bus_reg): /dcsr@f00000000/dcsr-npc: simple-bus unit address format error, expected "1000"
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:183.15-186.4: Warning (simple_bus_reg): /dcsr@f00000000/dcsr-corenet: simple-bus unit address format error, expected "8000"
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:368.17-371.4: Warning (simple_bus_reg): /soc@ffe000000/soc-sram-error: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:489.16-536.4: Warning (simple_bus_reg): /soc@ffe000000/thermal-zones: missing or empty reg/ranges property
>> arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:633.41-711.4: Warning (avoid_unnecessary_addr_size): /soc@ffe000000/ethernet-switch@800000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
--
   arch/powerpc/boot/dts/fsl/t104xqds.dtsi:117.18-236.6: Warning (unit_address_vs_reg): /localbus@ffe124000/board-control@3,0/mdio-mux-emi1: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:175.11-178.4: Warning (unit_address_vs_reg): /dcsr@f00000000/dcsr-npc: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:183.15-186.4: Warning (unit_address_vs_reg): /dcsr@f00000000/dcsr-corenet: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:175.11-178.4: Warning (simple_bus_reg): /dcsr@f00000000/dcsr-npc: simple-bus unit address format error, expected "1000"
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:183.15-186.4: Warning (simple_bus_reg): /dcsr@f00000000/dcsr-corenet: simple-bus unit address format error, expected "8000"
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:368.17-371.4: Warning (simple_bus_reg): /soc@ffe000000/soc-sram-error: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:489.16-536.4: Warning (simple_bus_reg): /soc@ffe000000/thermal-zones: missing or empty reg/ranges property
>> arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:633.41-711.4: Warning (avoid_unnecessary_addr_size): /soc@ffe000000/ethernet-switch@800000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi:44.10-68.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi:44.10-68.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi:44.10-68.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi:44.10-68.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi:44.10-68.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
--
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:175.11-178.4: Warning (unit_address_vs_reg): /dcsr@f00000000/dcsr-npc: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:183.15-186.4: Warning (unit_address_vs_reg): /dcsr@f00000000/dcsr-corenet: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:175.11-178.4: Warning (simple_bus_reg): /dcsr@f00000000/dcsr-npc: simple-bus unit address format error, expected "1000"
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:183.15-186.4: Warning (simple_bus_reg): /dcsr@f00000000/dcsr-corenet: simple-bus unit address format error, expected "8000"
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:368.17-371.4: Warning (simple_bus_reg): /soc@ffe000000/soc-sram-error: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:489.16-536.4: Warning (simple_bus_reg): /soc@ffe000000/thermal-zones: missing or empty reg/ranges property
>> arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:633.41-711.4: Warning (avoid_unnecessary_addr_size): /soc@ffe000000/ethernet-switch@800000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi:44.10-68.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi:44.10-68.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi:44.10-68.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
--
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:175.11-178.4: Warning (unit_address_vs_reg): /dcsr@f00000000/dcsr-npc: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:183.15-186.4: Warning (unit_address_vs_reg): /dcsr@f00000000/dcsr-corenet: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:175.11-178.4: Warning (simple_bus_reg): /dcsr@f00000000/dcsr-npc: simple-bus unit address format error, expected "1000"
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:183.15-186.4: Warning (simple_bus_reg): /dcsr@f00000000/dcsr-corenet: simple-bus unit address format error, expected "8000"
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:368.17-371.4: Warning (simple_bus_reg): /soc@ffe000000/soc-sram-error: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:489.16-536.4: Warning (simple_bus_reg): /soc@ffe000000/thermal-zones: missing or empty reg/ranges property
>> arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:633.41-711.4: Warning (avoid_unnecessary_addr_size): /soc@ffe000000/ethernet-switch@800000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi:44.10-68.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi:44.10-68.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi:44.10-68.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
--
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:175.11-178.4: Warning (unit_address_vs_reg): /dcsr@f00000000/dcsr-npc: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:183.15-186.4: Warning (unit_address_vs_reg): /dcsr@f00000000/dcsr-corenet: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:175.11-178.4: Warning (simple_bus_reg): /dcsr@f00000000/dcsr-npc: simple-bus unit address format error, expected "1000"
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:183.15-186.4: Warning (simple_bus_reg): /dcsr@f00000000/dcsr-corenet: simple-bus unit address format error, expected "8000"
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:368.17-371.4: Warning (simple_bus_reg): /soc@ffe000000/soc-sram-error: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:489.16-536.4: Warning (simple_bus_reg): /soc@ffe000000/thermal-zones: missing or empty reg/ranges property
>> arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:633.41-711.4: Warning (avoid_unnecessary_addr_size): /soc@ffe000000/ethernet-switch@800000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi:44.10-68.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi:44.10-68.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi:44.10-68.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'

vim +89 arch/powerpc/boot/dts/ac14xx.dts

fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  10  
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  11  / {
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  12  	model = "ac14xx";
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  13  	compatible = "ifm,ac14xx", "fsl,mpc5121";
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  14  	#address-cells = <1>;
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  15  	#size-cells = <1>;
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  16  
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  17  	aliases {
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  18  		serial0 = &serial0;
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  19  		serial1 = &serial7;
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  20  		spi4 = &spi4;
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  21  		spi5 = &spi5;
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  22  	};
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  23  
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  24  	cpus {
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  25  		PowerPC,5121@0 {
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  26  			timebase-frequency = <40000000>;	/*  40 MHz (csb/4) */
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  27  			bus-frequency = <160000000>;		/* 160 MHz csb bus */
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  28  			clock-frequency = <400000000>;		/* 400 MHz ppc core */
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  29  		};
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  30  	};
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  31  
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  32  	memory {
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  33  		reg = <0x00000000 0x10000000>;			/* 256MB at 0 */
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  34  	};
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  35  
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  36  	nfc@40000000 {
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  37  		status = "disabled";
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  38  	};
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  39  
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  40  	localbus@80000020 {
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  41  		ranges = <0x0 0x0 0xfc000000 0x04000000	/* CS0: NOR flash */
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  42  			  0x1 0x0 0xe0000000 0x00010000 /* CS1: FRAM */
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  43  			  0x2 0x0 0xe0100000 0x00080000 /* CS2: asi1 */
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  44  			  0x3 0x0 0xe0300000 0x00020000 /* CS3: comm */
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  45  			  0x5 0x0 0xe0400000 0x00010000 /* CS5: safety */
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  46  			  0x6 0x0 0xe0200000 0x00080000>; /* CS6: asi2 */
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  47  
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  48  		flash@0,0 {
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  49  			compatible = "cfi-flash";
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  50  			reg = <0 0x00000000 0x04000000>;
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  51  			#address-cells = <1>;
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  52  			#size-cells = <1>;
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  53  			bank-width = <2>;
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  54  			device-width = <2>;
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  55  
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  56  			partition@0 {
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  57  				label = "dtb-kernel-production";
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  58  				reg = <0x00000000 0x00400000>;
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  59  			};
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  60  			partition@1 {
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  61  				label = "filesystem-production";
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  62  				reg = <0x00400000 0x03400000>;
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  63  			};
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  64  
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  65  			partition@2 {
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  66  				label = "recovery";
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  67  				reg = <0x03800000 0x00700000>;
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  68  			};
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  69  
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  70  			partition@3 {
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  71  				label = "uboot-code";
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  72  				reg = <0x03f00000 0x00040000>;
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  73  			};
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  74  			partition@4 {
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  75  				label = "uboot-env1";
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  76  				reg = <0x03f40000 0x00020000>;
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  77  			};
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  78  			partition@5 {
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  79  				label = "uboot-env2";
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  80  				reg = <0x03f60000 0x00020000>;
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  81  			};
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  82  		};
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  83  
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  84  		fram@1,0 {
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  85  			compatible = "ifm,ac14xx-fram", "linux,uio-pdrv-genirq";
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  86  			reg = <1 0x00000000 0x00010000>;
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  87  		};
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10  88  
fdeaf0e20e9f39 Anatolij Gustschin 2013-04-10 @89  		asi@2,0 {

:::::: The code at line 89 was first introduced by commit
:::::: fdeaf0e20e9f3999c5cb129e821595fe927bf259 powerpc/512x: add ifm ac14xx board

:::::: TO: Anatolij Gustschin <agust@denx.de>
:::::: CC: Anatolij Gustschin <agust@denx.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
