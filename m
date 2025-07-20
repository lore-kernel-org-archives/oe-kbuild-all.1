Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9143D6D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Jul 2025 10:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753008713; cv=none; b=dY9xM0QIjc2+NAKuqxeOfofqmEkyq3nI8eDCRAFOPwu5zAyFQhtCMKyk2iIfJqaKByUVv85Y8PoOC/iJDtcygtbMaUW98FQ/bV+lelVDqiH7o4Hy2JPKqR06osFzUvExvgBlYnih0WEdKDmLIVSE7NGVC2+BVTBDmMHqjSHG5uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753008713; c=relaxed/simple;
	bh=jENLohFBKTSC+24Cp7gSYX2+i7NZbgFs6c4oFx8bxWc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Isi9H2yokGHB1qOeZAI51DdkHXIz24f4xWpmToRPmcUryWRYqQqSoFXftjP1U2I2lEEyEJL/3eCYbaYIzMroqHlbIKqvXtt0s+GezMTe8ND6n9c+8cvAeXjLsclA7UNWy/aWeDUtZ9hGYT76b7cq9pB+jceFaCZvc+/SIetD1T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HJMsAFFc; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HJMsAFFc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753008711; x=1784544711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jENLohFBKTSC+24Cp7gSYX2+i7NZbgFs6c4oFx8bxWc=;
  b=HJMsAFFcCKfHoKa7+lnyjABW2o4XQfn8sD/IgSu/XECR60LqZvfgFFnh
   Js5TNjFpfBjJ0DDH9LfgJv5yK3U9Rhz92AKtfRLJjnWRzM7AN13f8yqsU
   +p5blk9SoomuZfHH7YD+9+/89FdCh1NbUFBHd1KD17oW8xaLlFC/SuDXO
   l+cDsPsmZh4U6ATi9sL0VBGa9x7KmNJVmsHlO3zTra3v/WZy9SyHC87+J
   qU623CAigu5bJeSZSbkQOzezNK6g8tPFyNFTkINQIdcgWrPH4BL/DzP7F
   WmGIGzAW93AMD8Eglg3DxNykRMufZaQ8go5kQ1dJFgwy0r2oV6mZiqJJD
   g==;
X-CSE-ConnectionGUID: AYXQjiKiSwGTMIcz8WQr+A==
X-CSE-MsgGUID: ibKoyM35QsuRnH+bNAFzFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11497"; a="57857602"
X-IronPort-AV: E=Sophos;i="6.16,326,1744095600"; 
   d="scan'208";a="57857602"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2025 03:51:50 -0700
X-CSE-ConnectionGUID: 89+JPvDQR/i0IxEXz6fnHQ==
X-CSE-MsgGUID: rx4A9gfPTPi8p92B8Vcuew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,326,1744095600"; 
   d="scan'208";a="159302970"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by fmviesa010.fm.intel.com with ESMTP; 20 Jul 2025 03:51:48 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udRdy-0001Fx-1S;
	Sun, 20 Jul 2025 10:51:46 +0000
Date: Sun, 20 Jul 2025 12:51:45 +0200
From: kernel test robot <lkp@intel.com>
To: Matthew Gerlach <matthew.gerlach@altera.com>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Mun Yew Tham <mun.yew.tham@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 5793/11307]
 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb:
 ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are
 not allowed ('interrupt-names', 'interrupts', 'mac-address',
 'max-frame-size', 'mdio', 'phy-addr', 'phy-handle', '...
Message-ID: <202507201207.AJ9D9CR6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
commit: 6d359cf464f40baadf5e5595613c38a12f5829ef [5793/11307] dt-bindings: net: Convert socfpga-dwmac bindings to yaml
config: arm-randconfig-2051-20250717 (https://download.01.org/0day-ci/archive/20250720/202507201207.AJ9D9CR6-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250720/202507201207.AJ9D9CR6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507201207.AJ9D9CR6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: cb_intosc_hs_div2_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: cb_intosc_ls_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: f2s_free_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): reset-names: 'oneOf' conditional failed, one must be fixed:
   	['stmmaceth', 'stmmaceth-ocp'] is too long
   	'ahb' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mac-address', 'max-frame-size', 'mdio', 'phy-addr', 'phy-handle', 'reg', 'reset-names', 'resets', 'rx-fifo-depth', 'snps,axi-config', 'snps,multicast-filter-bins', 'snps,perfect-filter-entries', 'tx-fifo-depth' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): reset-names: 'oneOf' conditional failed, one must be fixed:
   	['stmmaceth', 'stmmaceth-ocp'] is too long
   	'ahb' was expected
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): reset-names: 'oneOf' conditional failed, one must be fixed:
   	['stmmaceth', 'stmmaceth-ocp'] is too long
   	'ahb' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): reset-names: 'oneOf' conditional failed, one must be fixed:
--
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: cb_intosc_hs_div2_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: cb_intosc_ls_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: f2s_free_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): reset-names: 'oneOf' conditional failed, one must be fixed:
   	['stmmaceth', 'stmmaceth-ocp'] is too long
   	'ahb' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mac-address', 'max-frame-size', 'mdio', 'phy-addr', 'phy-handle', 'reg', 'reset-names', 'resets', 'rx-fifo-depth', 'snps,axi-config', 'snps,multicast-filter-bins', 'snps,perfect-filter-entries', 'tx-fifo-depth' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): reset-names: 'oneOf' conditional failed, one must be fixed:
   	['stmmaceth', 'stmmaceth-ocp'] is too long
   	'ahb' was expected
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): reset-names: 'oneOf' conditional failed, one must be fixed:
   	['stmmaceth', 'stmmaceth-ocp'] is too long
   	'ahb' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): reset-names: 'oneOf' conditional failed, one must be fixed:
--
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: cb_intosc_hs_div2_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: cb_intosc_ls_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: f2s_free_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): reset-names: 'oneOf' conditional failed, one must be fixed:
   	['stmmaceth', 'stmmaceth-ocp'] is too long
   	'ahb' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mac-address', 'max-frame-size', 'phy-addr', 'reg', 'reset-names', 'resets', 'rx-fifo-depth', 'snps,axi-config', 'snps,multicast-filter-bins', 'snps,perfect-filter-entries', 'tx-fifo-depth', 'txd0-skew-ps', 'txd1-skew-ps', 'txd2-skew-ps', 'txd3-skew-ps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): reset-names: 'oneOf' conditional failed, one must be fixed:
   	['stmmaceth', 'stmmaceth-ocp'] is too long
   	'ahb' was expected
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): reset-names: 'oneOf' conditional failed, one must be fixed:
   	['stmmaceth', 'stmmaceth-ocp'] is too long
   	'ahb' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): reset-names: 'oneOf' conditional failed, one must be fixed:
--
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: cb_intosc_hs_div2_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: cb_intosc_ls_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: f2s_free_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): reset-names: 'oneOf' conditional failed, one must be fixed:
   	['stmmaceth', 'stmmaceth-ocp'] is too long
   	'ahb' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mac-address', 'max-frame-size', 'phy-addr', 'reg', 'reset-names', 'resets', 'rx-fifo-depth', 'snps,axi-config', 'snps,multicast-filter-bins', 'snps,perfect-filter-entries', 'tx-fifo-depth', 'txd0-skew-ps', 'txd1-skew-ps', 'txd2-skew-ps', 'txd3-skew-ps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): reset-names: 'oneOf' conditional failed, one must be fixed:
   	['stmmaceth', 'stmmaceth-ocp'] is too long
   	'ahb' was expected
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): reset-names: 'oneOf' conditional failed, one must be fixed:
   	['stmmaceth', 'stmmaceth-ocp'] is too long
   	'ahb' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): reset-names: 'oneOf' conditional failed, one must be fixed:
--
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: cb_intosc_hs_div2_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: cb_intosc_ls_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: f2s_free_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): reset-names: 'oneOf' conditional failed, one must be fixed:
   	['stmmaceth', 'stmmaceth-ocp'] is too long
   	'ahb' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mac-address', 'max-frame-size', 'phy-addr', 'reg', 'reset-names', 'resets', 'rx-fifo-depth', 'snps,axi-config', 'snps,multicast-filter-bins', 'snps,perfect-filter-entries', 'tx-fifo-depth', 'txd0-skew-ps', 'txd1-skew-ps', 'txd2-skew-ps', 'txd3-skew-ps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): reset-names: 'oneOf' conditional failed, one must be fixed:
   	['stmmaceth', 'stmmaceth-ocp'] is too long
   	'ahb' was expected
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): reset-names: 'oneOf' conditional failed, one must be fixed:
   	['stmmaceth', 'stmmaceth-ocp'] is too long
   	'ahb' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): reset-names: 'oneOf' conditional failed, one must be fixed:
--
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: f2s_periph_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: f2s_sdram_ref_clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: fpga_bridge@ff400000 (altr,socfpga-lwhps2fpga-bridge): $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: fpga_bridge@ff500000 (altr,socfpga-hps2fpga-bridge): $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: ethernet@ff702000 (altr,socfpga-stmmac): Unevaluated properties are not allowed ('txd0-skew-ps', 'txd1-skew-ps', 'txd2-skew-ps', 'txd3-skew-ps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,socfpga-stmmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: adxl345@53 (adi,adxl345): 'interrupt-names' is a dependency of 'interrupts'
   	from schema $id: http://devicetree.org/schemas/iio/accel/adi,adxl345.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: sram@ffff0000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: sram@ffff0000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: sram@ffff0000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de0_nano_soc.dtb: spi@ff705000 (intel,socfpga-qspi): resets: [[6, 37]] is too short

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
