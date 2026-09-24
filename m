Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59763145B27
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Sep 2026 03:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790220548; cv=none; b=F7CMNHMX6DsQpiKE2/YIEoqXw9+o7G9uzq6ub5oKUW+YeG3UkPnjAZDYB8F5LicA/0Q6Hfe8Aq8cxGThptggUdtuCXksG4skVAWqNH+nscml71SG2lbXadTpH/gmaQJZOJ9/0qqXE0VRB7z2uTL9PrrSTajmIJmATQJku4dGUEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790220548; c=relaxed/simple;
	bh=9q1YAELp6JG8mDc8Gdf8iC+jvCHjrbepNTx67/Z/3OA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kYeKR+Tk4prWc+kwiMgn/aZaS5RfDG6Uf5rWNCiWH0DOwc04Z3+0aUYCILtuUDXfA4MRexvxFbw3BDXjTFpl+wrZ0KrB6clRUndME8bs8G71xEli74G0NZ4alSd5lELSu1ANqflp+20zM+4Tlw4VkQY29odJz1u35S5XZY9ypy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XhHAtS0v; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XhHAtS0v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790220545; x=1821756545;
  h=date:from:to:cc:subject:message-id;
  bh=9q1YAELp6JG8mDc8Gdf8iC+jvCHjrbepNTx67/Z/3OA=;
  b=XhHAtS0vpR9WPRfVqj/ct4GmBbIhfxRu7uLqiLM6eekyo4+IjmDsJLTm
   7iprPUv4YdTw6GzCb0gXVuKmaAGz9HPJ+XHY/2U23J9GUYsDS6HsymrNT
   tW71M2sRTJ7TwQhKtnfMLSvNawo9zAtsjFfntTeEIFnvnlRN+vSzof0NB
   7odFQejXXTB9V9OH54vH3V7kvr28slQJqns6md97yi13iMbpjZNXRSeI9
   xJkfs865tVpSXuVVmJrLj8bomWu/lZtGw8VKzYIA0KpNj5ELoLuof7uQh
   PJydlP2H6bqm46VS3FFlM20Z4+R/Sd+WdQ3nNP4Yde4po8+f2vATgQnVi
   A==;
X-CSE-ConnectionGUID: uGPQSmY/Tc6Zi8GGDN8F8Q==
X-CSE-MsgGUID: Lj3ryWgLQZK6ATpyTmCZPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="94798196"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="94798196"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 20:29:04 -0700
X-CSE-ConnectionGUID: tj68F0DUR/OeSRMk9WaQHg==
X-CSE-MsgGUID: aCHy+eLuRHGPJjfRN1n+Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="300142131"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 23 Sep 2026 20:29:02 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9a8q-000000000BS-19ch;
	Thu, 24 Sep 2026 03:29:00 +0000
Date: Thu, 24 Sep 2026 05:28:30 +0200
From: kernel test robot <lkp@intel.com>
To: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
 "Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 6945/8910]
 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb:
 ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are
 not allowed ('phy-addr' was unexpected)
Message-ID: <202609240545.g8CnJKQP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a8c591ed6b672915e0be57843f943a2a723aff40
commit: 0a9b6e9385dc1e2f56f8ec58e64a8dfc36771e74 [6945/8910] dt-bindings: net: snps,dwmac: allow stmmaceth-ocp reset name
config: arm-randconfig-2400-20260923 (https://download.01.org/0day-ci/archive/20260924/202609240545.g8CnJKQP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609240545.g8CnJKQP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609240545.g8CnJKQP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: pdma@ffda1000 (arm,pl330): $nodename:0: 'pdma@ffda1000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/arm,pl330.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: cb_intosc_hs_div2_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: cb_intosc_ls_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: f2s_free_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): phy-addr: b'\xff\xff\xff\xff' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are not allowed ('phy-addr' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/fpga-mgr@ffd03000: failed to match any schema with compatible: ['altr,socfpga-a10-fpga-mgr']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: spi@ffda5000 (snps,dw-apb-ssi): tx-dma-channel: b'\x00\x00\x00"\x00\x00\x00\x10' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: spi@ffda5000 (snps,dw-apb-ssi): rx-dma-channel: b'\x00\x00\x00"\x00\x00\x00\x11' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: flash@0 (jedec,spi-nor): Unevaluated properties are not allowed ('partition@raw', 'u-boot,dm-pre-reloc' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: flash@0 (jedec,spi-nor): 'partition@raw' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: pdma@ffda1000 (arm,pl330): $nodename:0: 'pdma@ffda1000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/arm,pl330.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: cb_intosc_hs_div2_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: cb_intosc_ls_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: f2s_free_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): phy-addr: b'\xff\xff\xff\xff' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are not allowed ('phy-addr' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/fpga-mgr@ffd03000: failed to match any schema with compatible: ['altr,socfpga-a10-fpga-mgr']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/i2c@ffc02300/clock-controller@70: failed to match any schema with compatible: ['silabs,si5338']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: spi@ffda5000 (snps,dw-apb-ssi): tx-dma-channel: b'\x00\x00\x00"\x00\x00\x00\x10' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: spi@ffda5000 (snps,dw-apb-ssi): rx-dma-channel: b'\x00\x00\x00"\x00\x00\x00\x11' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: flash@0 (jedec,spi-nor): 'partition@raw' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: timer0@ffc02700 (snps,dw-apb-timer): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: pdma@ffda1000 (arm,pl330): $nodename:0: 'pdma@ffda1000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/arm,pl330.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: cb_intosc_hs_div2_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: cb_intosc_ls_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: f2s_free_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): phy-addr: b'\xff\xff\xff\xff' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are not allowed ('phy-addr' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/fpga-mgr@ffd03000: failed to match any schema with compatible: ['altr,socfpga-a10-fpga-mgr']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: spi@ffda5000 (snps,dw-apb-ssi): tx-dma-channel: b'\x00\x00\x00"\x00\x00\x00\x10' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: spi@ffda5000 (snps,dw-apb-ssi): rx-dma-channel: b'\x00\x00\x00"\x00\x00\x00\x11' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: flash@0 (jedec,spi-nor): Unevaluated properties are not allowed ('partition@raw', 'u-boot,dm-pre-reloc' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: flash@0 (jedec,spi-nor): 'partition@raw' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: pdma@ffda1000 (arm,pl330): $nodename:0: 'pdma@ffda1000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/arm,pl330.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: cb_intosc_hs_div2_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: cb_intosc_ls_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: f2s_free_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): phy-addr: b'\xff\xff\xff\xff' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are not allowed ('phy-addr' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/fpga-mgr@ffd03000: failed to match any schema with compatible: ['altr,socfpga-a10-fpga-mgr']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/i2c@ffc02300/clock-controller@70: failed to match any schema with compatible: ['silabs,si5338']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: spi@ffda5000 (snps,dw-apb-ssi): tx-dma-channel: b'\x00\x00\x00"\x00\x00\x00\x10' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: spi@ffda5000 (snps,dw-apb-ssi): rx-dma-channel: b'\x00\x00\x00"\x00\x00\x00\x11' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: flash@0 (jedec,spi-nor): Unevaluated properties are not allowed ('partition@raw', 'u-boot,dm-pre-reloc' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: flash@0 (jedec,spi-nor): 'partition@raw' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
--
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: pdma@ffda1000 (arm,pl330): $nodename:0: 'pdma@ffda1000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/arm,pl330.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: cb_intosc_hs_div2_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: cb_intosc_ls_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: f2s_free_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): phy-addr: b'\xff\xff\xff\xff' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are not allowed ('phy-addr', 'txd0-skew-ps', 'txd1-skew-ps', 'txd2-skew-ps', 'txd3-skew-ps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/fpga-mgr@ffd03000: failed to match any schema with compatible: ['altr,socfpga-a10-fpga-mgr']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/i2c@ffc02300/ltc@5c: failed to match any schema with compatible: ['ltc2977']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: spi@ffda5000 (snps,dw-apb-ssi): Unevaluated properties are not allowed ('rx-dma-channel', 'tx-dma-channel' were unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/snps,dw-apb-ssi.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: spi@ffda5000 (snps,dw-apb-ssi): tx-dma-channel: b'\x00\x00\x00"\x00\x00\x00\x10' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: spi@ffda5000 (snps,dw-apb-ssi): rx-dma-channel: b'\x00\x00\x00"\x00\x00\x00\x11' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/spi@ffda5000/resource-manager@0: failed to match any schema with compatible: ['altr,a10sr']
--
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: pdma@ffda1000 (arm,pl330): $nodename:0: 'pdma@ffda1000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/arm,pl330.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: cb_intosc_hs_div2_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: cb_intosc_ls_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: f2s_free_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): phy-addr: b'\xff\xff\xff\xff' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are not allowed ('phy-addr', 'txd0-skew-ps', 'txd1-skew-ps', 'txd2-skew-ps', 'txd3-skew-ps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: /soc/fpga-mgr@ffd03000: failed to match any schema with compatible: ['altr,socfpga-a10-fpga-mgr']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: /soc/i2c@ffc02300/ltc@5c: failed to match any schema with compatible: ['ltc2977']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: spi@ffda5000 (snps,dw-apb-ssi): Unevaluated properties are not allowed ('rx-dma-channel', 'tx-dma-channel' were unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/snps,dw-apb-ssi.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: spi@ffda5000 (snps,dw-apb-ssi): tx-dma-channel: b'\x00\x00\x00"\x00\x00\x00\x10' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: spi@ffda5000 (snps,dw-apb-ssi): rx-dma-channel: b'\x00\x00\x00"\x00\x00\x00\x11' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: /soc/spi@ffda5000/resource-manager@0: failed to match any schema with compatible: ['altr,a10sr']
--
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: pdma@ffda1000 (arm,pl330): $nodename:0: 'pdma@ffda1000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/arm,pl330.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: cb_intosc_hs_div2_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: cb_intosc_ls_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: f2s_free_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): phy-addr: b'\xff\xff\xff\xff' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are not allowed ('phy-addr' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/fpga-mgr@ffd03000: failed to match any schema with compatible: ['altr,socfpga-a10-fpga-mgr']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: spi@ffda5000 (snps,dw-apb-ssi): tx-dma-channel: b'\x00\x00\x00"\x00\x00\x00\x10' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: spi@ffda5000 (snps,dw-apb-ssi): rx-dma-channel: b'\x00\x00\x00"\x00\x00\x00\x11' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: flash@0 (jedec,spi-nor): 'partition@raw' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: timer0@ffc02700 (snps,dw-apb-timer): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml
--
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: pdma@ffda1000 (arm,pl330): $nodename:0: 'pdma@ffda1000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/arm,pl330.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: cb_intosc_hs_div2_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: cb_intosc_ls_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: f2s_free_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): phy-addr: b'\xff\xff\xff\xff' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are not allowed ('phy-addr' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/fpga-mgr@ffd03000: failed to match any schema with compatible: ['altr,socfpga-a10-fpga-mgr']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/i2c@ffc02300/clock-controller@70: failed to match any schema with compatible: ['silabs,si5338']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: spi@ffda5000 (snps,dw-apb-ssi): tx-dma-channel: b'\x00\x00\x00"\x00\x00\x00\x10' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: spi@ffda5000 (snps,dw-apb-ssi): rx-dma-channel: b'\x00\x00\x00"\x00\x00\x00\x11' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: flash@0 (jedec,spi-nor): 'partition@raw' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: timer0@ffc02700 (snps,dw-apb-timer): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: pdma@ffda1000 (arm,pl330): $nodename:0: 'pdma@ffda1000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/arm,pl330.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: cb_intosc_hs_div2_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: cb_intosc_ls_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: f2s_free_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): phy-addr: b'\xff\xff\xff\xff' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are not allowed ('phy-addr' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/fpga-mgr@ffd03000: failed to match any schema with compatible: ['altr,socfpga-a10-fpga-mgr']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: spi@ffda5000 (snps,dw-apb-ssi): tx-dma-channel: b'\x00\x00\x00"\x00\x00\x00\x10' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: spi@ffda5000 (snps,dw-apb-ssi): rx-dma-channel: b'\x00\x00\x00"\x00\x00\x00\x11' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: flash@0 (jedec,spi-nor): 'partition@raw' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: timer0@ffc02700 (snps,dw-apb-timer): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml
--
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: pdma@ffda1000 (arm,pl330): $nodename:0: 'pdma@ffda1000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/arm,pl330.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: cb_intosc_hs_div2_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: cb_intosc_ls_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: f2s_free_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): phy-addr: b'\xff\xff\xff\xff' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are not allowed ('phy-addr' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/fpga-mgr@ffd03000: failed to match any schema with compatible: ['altr,socfpga-a10-fpga-mgr']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/i2c@ffc02300/clock-controller@70: failed to match any schema with compatible: ['silabs,si5338']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: spi@ffda5000 (snps,dw-apb-ssi): tx-dma-channel: b'\x00\x00\x00"\x00\x00\x00\x10' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: spi@ffda5000 (snps,dw-apb-ssi): rx-dma-channel: b'\x00\x00\x00"\x00\x00\x00\x11' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: flash@0 (jedec,spi-nor): 'partition@raw' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: timer0@ffc02700 (snps,dw-apb-timer): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: pdma@ffda1000 (arm,pl330): $nodename:0: 'pdma@ffda1000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/arm,pl330.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: cb_intosc_hs_div2_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: cb_intosc_ls_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: f2s_free_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): phy-addr: b'\xff\xff\xff\xff' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are not allowed ('phy-addr', 'txd0-skew-ps', 'txd1-skew-ps', 'txd2-skew-ps', 'txd3-skew-ps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/fpga-mgr@ffd03000: failed to match any schema with compatible: ['altr,socfpga-a10-fpga-mgr']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/i2c@ffc02300/ltc@5c: failed to match any schema with compatible: ['ltc2977']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: spi@ffda5000 (snps,dw-apb-ssi): Unevaluated properties are not allowed ('rx-dma-channel', 'tx-dma-channel' were unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/snps,dw-apb-ssi.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: spi@ffda5000 (snps,dw-apb-ssi): tx-dma-channel: b'\x00\x00\x00"\x00\x00\x00\x10' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: spi@ffda5000 (snps,dw-apb-ssi): rx-dma-channel: b'\x00\x00\x00"\x00\x00\x00\x11' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/spi@ffda5000/resource-manager@0: failed to match any schema with compatible: ['altr,a10sr']
--
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: pdma@ffda1000 (arm,pl330): $nodename:0: 'pdma@ffda1000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/arm,pl330.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: cb_intosc_hs_div2_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: cb_intosc_ls_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: f2s_free_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): phy-addr: b'\xff\xff\xff\xff' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are not allowed ('phy-addr' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/fpga-mgr@ffd03000: failed to match any schema with compatible: ['altr,socfpga-a10-fpga-mgr']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/i2c@ffc02300/clock-controller@70: failed to match any schema with compatible: ['silabs,si5338']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: spi@ffda5000 (snps,dw-apb-ssi): tx-dma-channel: b'\x00\x00\x00"\x00\x00\x00\x10' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: spi@ffda5000 (snps,dw-apb-ssi): rx-dma-channel: b'\x00\x00\x00"\x00\x00\x00\x11' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: flash@0 (jedec,spi-nor): 'partition@raw' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: timer0@ffc02700 (snps,dw-apb-timer): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: pdma@ffda1000 (arm,pl330): $nodename:0: 'pdma@ffda1000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/arm,pl330.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: cb_intosc_hs_div2_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: cb_intosc_ls_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: f2s_free_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): phy-addr: b'\xff\xff\xff\xff' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are not allowed ('phy-addr' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/fpga-mgr@ffd03000: failed to match any schema with compatible: ['altr,socfpga-a10-fpga-mgr']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/i2c@ffc02300/clock-controller@70: failed to match any schema with compatible: ['silabs,si5338']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: spi@ffda5000 (snps,dw-apb-ssi): tx-dma-channel: b'\x00\x00\x00"\x00\x00\x00\x10' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: spi@ffda5000 (snps,dw-apb-ssi): rx-dma-channel: b'\x00\x00\x00"\x00\x00\x00\x11' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: flash@0 (jedec,spi-nor): Unevaluated properties are not allowed ('partition@raw', 'u-boot,dm-pre-reloc' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: flash@0 (jedec,spi-nor): 'partition@raw' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
