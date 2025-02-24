Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE6A1F60A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Feb 2025 03:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740367603; cv=none; b=V7C4V7eBEL6DSssbpFBsjf7QN50qxk7bPlVVRbF9ShMb7mJXA+ERxweybYWxdMHZH5geI46zJjlvCggiGeHp3DIdExV1oXp2DtpOwEO4kpyCiRkgtoVUsHCKfb0IvhcaMym3dYGriugt4E2c4FZXIuTN7EYN+sObT12x1WtABC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740367603; c=relaxed/simple;
	bh=GhYtJ3luUQ0ANzNu9fIdZT53Bvkzaidmkvoa767CgU4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YcTSr2TzZ5w4E3x6JRlfOjBhP3U12hBxfw45XHa08ukZZQC9FiCjTv9JCH99tY/rk0SOgbG8u9tXoMImdArgrOZnDmhS5l8YiB+NRYFa5TsH9WM6H5I4YTG0Sz0b7wdxzdpzJOWZktPFTrk6tljsDI8AIPVu4sJMaUVYCz0Kxac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I0Tui7eO; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I0Tui7eO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740367601; x=1771903601;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GhYtJ3luUQ0ANzNu9fIdZT53Bvkzaidmkvoa767CgU4=;
  b=I0Tui7eOktOTCDXwEFZW55jYy+LCnzSs1nVXZ05s/eQPvdjXACMcadtW
   LDJZTCxxnC0ZyQ3ooU17RBVUpTz0QpjB/1V8utuXKUluHBxi8ZiKie23T
   jkyMkDf8Eh/LAWltM4AoO+lSAk40DbGCHvomcZmAFCuQxQOGylUiJce8h
   kFPqArYSohGc8ga6UgOzIeIRCi91fGm4NTZsJudNWpnRRt7dGz6jjVeIx
   kOcHRrsXt8+0TUMAudkPkIkXcnSdlNhvjvg9nucwit76PSkSC32qbFf16
   Bbg1Zsk4Jdhxdf1jHp14l9tRz2DLvTXeneFb/S7lLJKod+OCYcsgeir7t
   w==;
X-CSE-ConnectionGUID: nafmn6dPQ8i1EvmiykGg+A==
X-CSE-MsgGUID: YuYLJ7kiQkul2T+5zqn7gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="41250895"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="41250895"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2025 19:26:39 -0800
X-CSE-ConnectionGUID: IVsJnpKBSlemQJBFA1r0/Q==
X-CSE-MsgGUID: wq7yjbW7QT21fjhC5VLkgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="116580043"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 23 Feb 2025 19:26:38 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmP76-0007oM-1M;
	Mon, 24 Feb 2025 03:26:36 +0000
Date: Mon, 24 Feb 2025 11:26:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-lts 1/1]
 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb:
 ethernet@ff800000: reset-names:1: 'ahb' was expected
Message-ID: <202502241107.TVSFHgS6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-lts
head:   8e76d55979c1abc234e6fa16e4d697c318a38ea2
commit: a332e101fcbfe141728bdfe5e3f052f199cc1a07 [1/1] arm: dts: socfpga: use reset-name "stmmaceth-ocp" instead of "ahb"
config: arm-randconfig-051-20250220 (https://download.01.org/0day-ci/archive/20250224/202502241107.TVSFHgS6-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250224/202502241107.TVSFHgS6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502241107.TVSFHgS6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/clkmgr@ffd04000/clocks/l4_sp_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/clkmgr@ffd04000/clocks/mpu_periph_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/clkmgr@ffd04000/clocks/nand_x_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/clkmgr@ffd04000/clocks/nand_ecc_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/clkmgr@ffd04000/clocks/nand_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/clkmgr@ffd04000/clocks/spi_m_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/clkmgr@ffd04000/clocks/usb_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/clkmgr@ffd04000/clocks/s2f_usr1_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: ethernet@ff800000: reset-names:1: 'ahb' was expected
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/ethernet@ff800000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/ethernet@ff800000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: ethernet@ff802000: reset-names:1: 'ahb' was expected
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/ethernet@ff802000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/ethernet@ff802000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: ethernet@ff804000: reset-names:1: 'ahb' was expected
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/ethernet@ff804000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/ethernet@ff804000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/fpga-mgr@ffd03000: failed to match any schema with compatible: ['altr,socfpga-a10-fpga-mgr']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/i2c@ffc02200/audio-codec@1a: failed to match any schema with compatible: ['adi,ssm2603']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: isl12022@6f: $nodename:0: 'isl12022@6f' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/intersil,isl12022.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: /soc/sdr@ffcfb100: failed to match any schema with compatible: ['altr,sdr-ctl', 'syscon']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dtb: nand@ffb90000: $nodename:0: 'nand@ffb90000' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/denali,nand.yaml#
--
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: /soc/clkmgr@ffd04000/clocks/l4_sp_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: /soc/clkmgr@ffd04000/clocks/mpu_periph_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: /soc/clkmgr@ffd04000/clocks/nand_x_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: /soc/clkmgr@ffd04000/clocks/nand_ecc_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: /soc/clkmgr@ffd04000/clocks/nand_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: /soc/clkmgr@ffd04000/clocks/spi_m_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: /soc/clkmgr@ffd04000/clocks/usb_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: /soc/clkmgr@ffd04000/clocks/s2f_usr1_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: ethernet@ff800000: reset-names:1: 'ahb' was expected
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: /soc/ethernet@ff800000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: /soc/ethernet@ff800000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: ethernet@ff802000: reset-names:1: 'ahb' was expected
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: /soc/ethernet@ff802000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: /soc/ethernet@ff802000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: ethernet@ff804000: reset-names:1: 'ahb' was expected
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: /soc/ethernet@ff804000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: /soc/ethernet@ff804000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: /soc/fpga-mgr@ffd03000: failed to match any schema with compatible: ['altr,socfpga-a10-fpga-mgr']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: isl12022@6f: $nodename:0: 'isl12022@6f' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/intersil,isl12022.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: /soc/sdr@ffcfb100: failed to match any schema with compatible: ['altr,sdr-ctl', 'syscon']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: nand@ffb90000: $nodename:0: 'nand@ffb90000' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/denali,nand.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb: sram@ffe00000: '#address-cells' is a required property
--
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/clkmgr@ffd04000/clocks/l4_sp_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/clkmgr@ffd04000/clocks/mpu_periph_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/clkmgr@ffd04000/clocks/nand_x_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/clkmgr@ffd04000/clocks/nand_ecc_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/clkmgr@ffd04000/clocks/nand_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/clkmgr@ffd04000/clocks/spi_m_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/clkmgr@ffd04000/clocks/usb_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/clkmgr@ffd04000/clocks/s2f_usr1_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: ethernet@ff800000: reset-names:1: 'ahb' was expected
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/ethernet@ff800000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/ethernet@ff800000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: ethernet@ff802000: reset-names:1: 'ahb' was expected
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/ethernet@ff802000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/ethernet@ff802000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: ethernet@ff804000: reset-names:1: 'ahb' was expected
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/ethernet@ff804000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/ethernet@ff804000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/fpga-mgr@ffd03000: failed to match any schema with compatible: ['altr,socfpga-a10-fpga-mgr']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: /soc/i2c@ffc02300/ltc@5c: failed to match any schema with compatible: ['ltc2977']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: spi@ffda5000: Unevaluated properties are not allowed ('rx-dma-channel', 'tx-dma-channel' were unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/snps,dw-apb-ssi.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dtb: resource-manager@0: gpio-controller: 'oneOf' conditional failed, one must be fixed:
   	{'compatible': ['altr,a10sr-gpio'], 'gpio-controller': True, '#gpio-cells': 2, 'phandle': 48} is not of type 'boolean'
   	True was expected
--
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l4_sp_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: /soc/clkmgr@ffd04000/clocks/mpu_periph_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: /soc/clkmgr@ffd04000/clocks/nand_x_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: /soc/clkmgr@ffd04000/clocks/nand_ecc_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: /soc/clkmgr@ffd04000/clocks/nand_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: /soc/clkmgr@ffd04000/clocks/spi_m_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: /soc/clkmgr@ffd04000/clocks/usb_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: /soc/clkmgr@ffd04000/clocks/s2f_usr1_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: ethernet@ff800000: reset-names:1: 'ahb' was expected
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: /soc/ethernet@ff800000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: /soc/ethernet@ff800000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: ethernet@ff802000: reset-names:1: 'ahb' was expected
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: /soc/ethernet@ff802000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: /soc/ethernet@ff802000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: ethernet@ff804000: reset-names:1: 'ahb' was expected
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: /soc/ethernet@ff804000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: /soc/ethernet@ff804000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: /soc/fpga-mgr@ffd03000: failed to match any schema with compatible: ['altr,socfpga-a10-fpga-mgr']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: /soc/i2c@ffc02300/ltc@5c: failed to match any schema with compatible: ['ltc2977']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: spi@ffda5000: Unevaluated properties are not allowed ('rx-dma-channel', 'tx-dma-channel' were unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/snps,dw-apb-ssi.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_qspi.dtb: resource-manager@0: gpio-controller: 'oneOf' conditional failed, one must be fixed:
   	{'compatible': ['altr,a10sr-gpio'], 'gpio-controller': True, '#gpio-cells': 2, 'phandle': 48} is not of type 'boolean'
   	True was expected
--
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_sp_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/mpu_periph_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_x_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_ecc_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/spi_m_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/usb_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/s2f_usr1_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: ethernet@ff800000: reset-names:1: 'ahb' was expected
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/ethernet@ff800000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/ethernet@ff800000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: ethernet@ff802000: reset-names:1: 'ahb' was expected
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/ethernet@ff802000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/ethernet@ff802000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
>> arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: ethernet@ff804000: reset-names:1: 'ahb' was expected
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/ethernet@ff804000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/ethernet@ff804000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/fpga-mgr@ffd03000: failed to match any schema with compatible: ['altr,socfpga-a10-fpga-mgr']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: /soc/i2c@ffc02300/ltc@5c: failed to match any schema with compatible: ['ltc2977']
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: spi@ffda5000: Unevaluated properties are not allowed ('rx-dma-channel', 'tx-dma-channel' were unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/snps,dw-apb-ssi.yaml#
   arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_sdmmc.dtb: resource-manager@0: gpio-controller: 'oneOf' conditional failed, one must be fixed:
   	{'compatible': ['altr,a10sr-gpio'], 'gpio-controller': True, '#gpio-cells': 2, 'phandle': 48} is not of type 'boolean'
   	True was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
