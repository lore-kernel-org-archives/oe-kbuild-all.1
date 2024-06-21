Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B7C376E4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 12:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718971329; cv=none; b=T1sJ9eF682hOlgLySX77nuIlCS2MMqXBGPE90Y4ZACw9ylXx64VV8hEJReDGrrUf1rKiyZ8PMDnFWDjopc1bH4ltQbETxfyef4Pn15OWnxXVWgGD3kHIBsvz10USI3McqN5DUtMp6F+YEudVgh+Sa24gaN0B0S8vF1U8PpDFcKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718971329; c=relaxed/simple;
	bh=efe9hvHVtubnHpoRP4DRwNjQ2jkA3RyVOya08rjNKRs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dwSK4RZENZlTutG+j6uXb3SrkSieMYqn+xBpbVPmqYNE2CCqYTVXtiatIWIisNT0xbRKVLCp/UoT/D2GDxkjeR3SUdRoLFE0LrVGoQI0+onV3OkalxxU3g6rKmogEXoIZesv2EyJYDYY9L2rZOUb/NEpwkOEUMGPS86fxbtxHTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uj0Doc9p; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uj0Doc9p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718971325; x=1750507325;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=efe9hvHVtubnHpoRP4DRwNjQ2jkA3RyVOya08rjNKRs=;
  b=Uj0Doc9plo2tnHQ4sDa3ux2LvPoMB9RBFGXQQrTfJxbdCGH6PTcL2Tsq
   i02SPQfcpbLmKXtEw9OS8jV4LcnagYBsi19IYHYK8FsF9YKJZ+fV1eWIB
   77SRaEvaMUlTP+E73AeXxcGqF61E9haoPY3XsloCoPSJ+vmeR5QsJQo5o
   zGhx7q8RDjjzS80+smyqFrfnNcLFSknQM4gFOhoTdc+6mhgXhxfx1fBNu
   oI11ny2Nw/rsNJNvoQ/DJIXwKsGUV1JE9ifG7NY3FnH4tCNANpVhyC00d
   JS1i9ajLVpKKbeW+E4CHuZG7vjRs9FrDRKOVe+wRaxFNtFgW7AuslMYVB
   g==;
X-CSE-ConnectionGUID: neERJnb+QdmYumTr2DOq5Q==
X-CSE-MsgGUID: Gs3PeDD3Q9+CkJvwTCEUdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="27136396"
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; 
   d="scan'208";a="27136396"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 05:02:04 -0700
X-CSE-ConnectionGUID: i5hjvjPkQ9+FRCaGCYi1Pg==
X-CSE-MsgGUID: cPey9SA5QGG2Ykt9x0hoRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; 
   d="scan'208";a="47020279"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 21 Jun 2024 05:02:02 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKcxs-0008YR-0E;
	Fri, 21 Jun 2024 12:02:00 +0000
Date: Fri, 21 Jun 2024 20:01:08 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [ulfh-mmc:next 10/14]
 arch/arm64/boot/dts/freescale/fsl-ls1012a-oxalis.dtb: esdhc@1580000:
 Unevaluated properties are not allowed ('big-endian', 'broken-cd',
 'bus-width' were unexpected)
Message-ID: <202406211900.38pFievu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git next
head:   602a73f6dd02fc2501694c8e08b7a1e267b7c14c
commit: 1f14028666386d806d00dd6e95da95327b146ded [10/14] dt-bindings: mmc: Convert fsl-esdhc.txt to yaml
config: arm64-randconfig-051-20240621 (https://download.01.org/0day-ci/archive/20240621/202406211900.38pFievu-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad79a14c9e5ec4a369eed4adf567c22cc029863f)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406211900.38pFievu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406211900.38pFievu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/fsl-ls1012a-oxalis.dtb: esdhc@1560000: $nodename:0: 'esdhc@1560000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-oxalis.dtb: esdhc@1580000: $nodename:0: 'esdhc@1580000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1012a-oxalis.dtb: esdhc@1580000: Unevaluated properties are not allowed ('big-endian', 'broken-cd', 'bus-width' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-oxalis.dtb: crypto@1700000: rtic@60000:reg: [[393216, 256], [396800, 24]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-oxalis.dtb: /soc/clocking@1ee1000: failed to match any schema with compatible: ['fsl,ls1012a-clockgen']
   arch/arm64/boot/dts/freescale/fsl-ls1012a-oxalis.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls1012a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1012a-oxalis.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls1012a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1012a-oxalis.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1012a-oxalis.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1012a-oxalis.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('big-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dtb: esdhc@1560000: $nodename:0: 'esdhc@1560000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dtb: esdhc@1560000: Unevaluated properties are not allowed ('big-endian', 'bus-width' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dtb: esdhc@1580000: $nodename:0: 'esdhc@1580000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dtb: esdhc@1580000: Unevaluated properties are not allowed ('big-endian', 'broken-cd', 'bus-width' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dtb: crypto@1700000: rtic@60000:reg: [[393216, 256], [396800, 24]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dtb: /soc/clocking@1ee1000: failed to match any schema with compatible: ['fsl,ls1012a-clockgen']
   arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls1012a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls1012a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dtb: /soc/spi@2100000/flash@2: failed to match any schema with compatible: ['en25s64', 'jedec,spi-nor']
   arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('big-endian' was unexpected)
--
   arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dtb: esdhc@1560000: $nodename:0: 'esdhc@1560000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dtb: esdhc@1560000: Unevaluated properties are not allowed ('big-endian', 'bus-width', 'sd-uhs-sdr104', 'sd-uhs-sdr12', 'sd-uhs-sdr25', 'sd-uhs-sdr50' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dtb: esdhc@1580000: $nodename:0: 'esdhc@1580000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dtb: esdhc@1580000: Unevaluated properties are not allowed ('big-endian', 'broken-cd', 'bus-width', 'mmc-hs200-1_8v' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dtb: crypto@1700000: rtic@60000:reg: [[393216, 256], [396800, 24]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dtb: /soc/clocking@1ee1000: failed to match any schema with compatible: ['fsl,ls1012a-clockgen']
   arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls1012a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls1012a-dspi', 'fsl,ls1021a-v1.0-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('big-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: mdio-mux-emi1@54: mdio@40:reg:0:0: 64 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: mdio-mux-emi1@54: mdio@60:reg:0:0: 96 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: mdio-mux-emi1@54: mdio@80:reg:0:0: 128 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: mdio-mux-emi1@54: mdio@a0:reg:0:0: 160 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: esdhc@1560000: $nodename:0: 'esdhc@1560000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: esdhc@1560000: Unevaluated properties are not allowed ('big-endian', 'bus-width' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: memory-controller@1080000: 'big-endian' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ddr.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/qman@1880000: failed to match any schema with compatible: ['fsl,qman']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/bman@1890000: failed to match any schema with compatible: ['fsl,bman']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: bman-portals@508000000: $nodename:0: 'bman-portals@508000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/bman-portals@508000000/bman-portal@0: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/bman-portals@508000000/bman-portal@10000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/bman-portals@508000000/bman-portal@20000: failed to match any schema with compatible: ['fsl,bman-portal']
--
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: thermal-zones: 'core-cluster', 'ddr-controller', 'fman', 'sec', 'serdes' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/clocking@1ee1000: failed to match any schema with compatible: ['fsl,ls1043a-clockgen']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/memory-controller@1530000/nand@1,0: failed to match any schema with compatible: ['fsl,ifc-nand']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/memory-controller@1530000/board-control@2,0: failed to match any schema with compatible: ['fsl,ls1043ardb-cpld']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: esdhc@1560000: $nodename:0: 'esdhc@1560000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: esdhc@1560000: Unevaluated properties are not allowed ('big-endian', 'bus-width' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: memory-controller@1080000: 'big-endian' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ddr.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/qman@1880000: failed to match any schema with compatible: ['fsl,qman']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/bman@1890000: failed to match any schema with compatible: ['fsl,bman']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: bman-portals@508000000: $nodename:0: 'bman-portals@508000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/bman-portals@508000000/bman-portal@0: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/bman-portals@508000000/bman-portal@10000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/bman-portals@508000000/bman-portal@20000: failed to match any schema with compatible: ['fsl,bman-portal']
--
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: thermal-zones: 'core-cluster', 'ddr-controller', 'fman', 'sec', 'serdes' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: memory-controller@1080000: 'big-endian' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ddr.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/memory-controller@1530000/nand@0,0: failed to match any schema with compatible: ['fsl,ifc-nand']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: esdhc@1560000: $nodename:0: 'esdhc@1560000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: esdhc@1560000: Unevaluated properties are not allowed ('big-endian', 'bus-width' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/qman@1880000: failed to match any schema with compatible: ['fsl,qman']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/bman@1890000: failed to match any schema with compatible: ['fsl,bman']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: qman-portals@500000000: $nodename:0: 'qman-portals@500000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/qman-portals@500000000/qman-portal@0: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/qman-portals@500000000/qman-portal@10000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/qman-portals@500000000/qman-portal@20000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/qman-portals@500000000/qman-portal@30000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/qman-portals@500000000/qman-portal@40000: failed to match any schema with compatible: ['fsl,qman-portal']
--
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: mdio-mux-emi1: mdio@1:reg:0:0: 32 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: mdio-mux-emi1: mdio@2:reg:0:0: 64 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: mdio-mux-emi1: mdio@3:reg:0:0: 96 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: mdio-mux-emi1: mdio@5:reg:0:0: 128 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: esdhc@1560000: $nodename:0: 'esdhc@1560000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: esdhc@1560000: Unevaluated properties are not allowed ('big-endian', 'bus-width' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: /soc/qman@1880000: failed to match any schema with compatible: ['fsl,qman']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: /soc/bman@1890000: failed to match any schema with compatible: ['fsl,bman']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: qman-portals@500000000: $nodename:0: 'qman-portals@500000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: /soc/qman-portals@500000000/qman-portal@0: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: /soc/qman-portals@500000000/qman-portal@10000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: /soc/qman-portals@500000000/qman-portal@20000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: /soc/qman-portals@500000000/qman-portal@30000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: /soc/qman-portals@500000000/qman-portal@40000: failed to match any schema with compatible: ['fsl,qman-portal']
--
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: thermal-zones: 'core-cluster', 'ddr-controller', 'fman', 'sec', 'serdes' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: memory-controller@1080000: 'big-endian' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ddr.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/memory-controller@1530000/nand@0,0: failed to match any schema with compatible: ['fsl,ifc-nand']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/memory-controller@1530000/board-control@2,0: failed to match any schema with compatible: ['fsl,ls1046ardb-cpld']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: esdhc@1560000: $nodename:0: 'esdhc@1560000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: esdhc@1560000: Unevaluated properties are not allowed ('big-endian', 'bus-width', 'mmc-hs200-1_8v', 'sd-uhs-sdr104', 'sd-uhs-sdr12', 'sd-uhs-sdr25', 'sd-uhs-sdr50' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/qman@1880000: failed to match any schema with compatible: ['fsl,qman']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/bman@1890000: failed to match any schema with compatible: ['fsl,bman']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: qman-portals@500000000: $nodename:0: 'qman-portals@500000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/qman-portals@500000000/qman-portal@0: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/qman-portals@500000000/qman-portal@10000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/qman-portals@500000000/qman-portal@20000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/qman-portals@500000000/qman-portal@30000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/qman-portals@500000000/qman-portal@40000: failed to match any schema with compatible: ['fsl,qman-portal']
--
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a.dtsi:17.19-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@1550000/flash@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: thermal-zones: 'core-cluster', 'ddr-controller', 'fman', 'sec', 'serdes' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: memory-controller@1080000: 'big-endian' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ddr.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: esdhc@1560000: $nodename:0: 'esdhc@1560000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: esdhc@1560000: Unevaluated properties are not allowed ('big-endian', 'bus-width', 'cd-gpios', 'disable-wp', 'mmc-hs200-1_8v', 'non-removable', 'sd-uhs-sdr104', 'sd-uhs-sdr12', 'sd-uhs-sdr25', 'sd-uhs-sdr50', 'wp-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc/qman@1880000: failed to match any schema with compatible: ['fsl,qman']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc/bman@1890000: failed to match any schema with compatible: ['fsl,bman']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: qman-portals@500000000: $nodename:0: 'qman-portals@500000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc/qman-portals@500000000/qman-portal@0: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc/qman-portals@500000000/qman-portal@10000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc/qman-portals@500000000/qman-portal@20000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc/qman-portals@500000000/qman-portal@30000: failed to match any schema with compatible: ['fsl,qman-portal']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc/qman-portals@500000000/qman-portal@40000: failed to match any schema with compatible: ['fsl,qman-portal']
--
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls1088a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: /soc/gpio@2330000: failed to match any schema with compatible: ['fsl,ls1088a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: /soc/gpio@2330000: failed to match any schema with compatible: ['fsl,ls1088a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: /soc/memory-controller@2240000/nand@2,0: failed to match any schema with compatible: ['fsl,ifc-nand']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: /soc/memory-controller@2240000/board-control@3,0: failed to match any schema with compatible: ['fsl,ls1088aqds-fpga', 'fsl,fpga-qixis']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: /soc/memory-controller@2240000/board-control@3,0: failed to match any schema with compatible: ['fsl,ls1088aqds-fpga', 'fsl,fpga-qixis']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: esdhc@2140000: $nodename:0: 'esdhc@2140000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: esdhc@2140000: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: /soc/sata@3200000: failed to match any schema with compatible: ['fsl,ls1088a-ahci']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: pcie-ep@3400000: compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: /soc/pcie-ep@3400000: failed to match any schema with compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: pcie-ep@3500000: compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: /soc/pcie-ep@3500000: failed to match any schema with compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: pcie-ep@3600000: compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,ls1088a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls1088a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls1088a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: /soc/gpio@2330000: failed to match any schema with compatible: ['fsl,ls1088a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: /soc/gpio@2330000: failed to match any schema with compatible: ['fsl,ls1088a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: /soc/memory-controller@2240000/nand@0,0: failed to match any schema with compatible: ['fsl,ifc-nand']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: /soc/memory-controller@2240000/board-control@2,0: failed to match any schema with compatible: ['fsl,ls1088ardb-fpga', 'fsl,fpga-qixis']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: /soc/memory-controller@2240000/board-control@2,0: failed to match any schema with compatible: ['fsl,ls1088ardb-fpga', 'fsl,fpga-qixis']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: esdhc@2140000: $nodename:0: 'esdhc@2140000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: esdhc@2140000: Unevaluated properties are not allowed ('bus-width', 'mmc-hs200-1_8v' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: /soc/sata@3200000: failed to match any schema with compatible: ['fsl,ls1088a-ahci']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: pcie-ep@3400000: compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: /soc/pcie-ep@3400000: failed to match any schema with compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: pcie-ep@3500000: compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: /soc/pcie-ep@3500000: failed to match any schema with compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: pcie-ep@3600000: compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: gpio@76: 'admin_led_lower' does not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: admin_led_lower: $nodename:0: 'admin_led_lower' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: flash@0: partitions: Unevaluated properties are not allowed ('partition@5C0000' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: flash@0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'partitions' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: esdhc@2140000: $nodename:0: 'esdhc@2140000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: esdhc@2140000: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: /soc/sata@3200000: failed to match any schema with compatible: ['fsl,ls1088a-ahci']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: pcie-ep@3400000: compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: /soc/pcie-ep@3400000: failed to match any schema with compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: pcie-ep@3500000: compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: /soc/pcie-ep@3500000: failed to match any schema with compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: pcie-ep@3600000: compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,ls1088a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,ls1088a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,ls1088a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,ls1088a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls1088a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls1088a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: /soc/gpio@2330000: failed to match any schema with compatible: ['fsl,ls1088a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: /soc/gpio@2330000: failed to match any schema with compatible: ['fsl,ls1088a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: esdhc@2140000: $nodename:0: 'esdhc@2140000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: esdhc@2140000: Unevaluated properties are not allowed ('bus-width', 'cd-gpios', 'disable-wp', 'mmc-hs200-1_8v', 'non-removable', 'sd-uhs-sdr104', 'sd-uhs-sdr12', 'sd-uhs-sdr25', 'sd-uhs-sdr50', 'wp-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: /soc/sata@3200000: failed to match any schema with compatible: ['fsl,ls1088a-ahci']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: pcie-ep@3400000: compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: /soc/pcie-ep@3400000: failed to match any schema with compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: pcie-ep@3500000: compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: /soc/pcie-ep@3500000: failed to match any schema with compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: pcie-ep@3600000: compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: /soc/mdio@8c33000: failed to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: /soc/mdio@8c37000: failed to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: /soc/mdio@8c3b000: failed to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: /soc/mdio@8c3f000: failed to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: /soc/mdio@8c43000: failed to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: /soc/fsl-mc@80c000000: failed to match any schema with compatible: ['fsl,qoriq-mc']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls2080a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls2080a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: esdhc@2140000: $nodename:0: 'esdhc@2140000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: esdhc@2140000: Unevaluated properties are not allowed ('bus-width', 'mmc-hs200-1_8v' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,ls2080a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,ls2080a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,ls2080a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,ls2080a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls2080a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls2080a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: /soc/gpio@2330000: failed to match any schema with compatible: ['fsl,ls2080a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: /soc/gpio@2330000: failed to match any schema with compatible: ['fsl,ls2080a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: i2c@2000000: clock-names:0: 'ipg' was expected
--
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: /soc/mdio@8c33000: failed to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: /soc/mdio@8c37000: failed to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: /soc/mdio@8c3b000: failed to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: /soc/mdio@8c3f000: failed to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: /soc/mdio@8c43000: failed to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: /soc/fsl-mc@80c000000: failed to match any schema with compatible: ['fsl,qoriq-mc']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls2080a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls2080a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: esdhc@2140000: $nodename:0: 'esdhc@2140000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: esdhc@2140000: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,ls2080a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,ls2080a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,ls2080a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,ls2080a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls2080a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls2080a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: /soc/gpio@2330000: failed to match any schema with compatible: ['fsl,ls2080a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: /soc/gpio@2330000: failed to match any schema with compatible: ['fsl,ls2080a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: i2c@2000000: clock-names:0: 'ipg' was expected
--
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: /soc/mdio@8c33000: failed to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: /soc/mdio@8c37000: failed to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: /soc/mdio@8c3b000: failed to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: /soc/mdio@8c3f000: failed to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: /soc/mdio@8c43000: failed to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: /soc/fsl-mc@80c000000: failed to match any schema with compatible: ['fsl,qoriq-mc']
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls2080a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls2080a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: esdhc@2140000: $nodename:0: 'esdhc@2140000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: esdhc@2140000: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,ls2080a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,ls2080a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,ls2080a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,ls2080a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls2080a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls2080a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: /soc/gpio@2330000: failed to match any schema with compatible: ['fsl,ls2080a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: /soc/gpio@2330000: failed to match any schema with compatible: ['fsl,ls2080a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: i2c@2000000: clock-names:0: 'ipg' was expected
--
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /soc/mdio@8c33000: failed to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /soc/mdio@8c37000: failed to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /soc/mdio@8c3b000: failed to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /soc/mdio@8c3f000: failed to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /soc/mdio@8c43000: failed to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /soc/fsl-mc@80c000000: failed to match any schema with compatible: ['fsl,qoriq-mc']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls2080a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls2080a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: esdhc@2140000: $nodename:0: 'esdhc@2140000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: esdhc@2140000: Unevaluated properties are not allowed ('bus-width', 'mmc-hs200-1_8v' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,ls2080a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,ls2080a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,ls2080a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,ls2080a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls2080a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls2080a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /soc/gpio@2330000: failed to match any schema with compatible: ['fsl,ls2080a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /soc/gpio@2330000: failed to match any schema with compatible: ['fsl,ls2080a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: i2c@2000000: clock-names:0: 'ipg' was expected
--
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: /soc/mdio@8c33000: failed to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: /soc/mdio@8c37000: failed to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: /soc/mdio@8c3b000: failed to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: /soc/mdio@8c3f000: failed to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: /soc/mdio@8c43000: failed to match any schema with compatible: ['fsl,fman-memac-mdio']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: /soc/fsl-mc@80c000000: failed to match any schema with compatible: ['fsl,qoriq-mc']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls2080a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: /soc/spi@2100000: failed to match any schema with compatible: ['fsl,ls2080a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: esdhc@2140000: $nodename:0: 'esdhc@2140000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: esdhc@2140000: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,ls2080a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,ls2080a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,ls2080a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,ls2080a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls2080a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls2080a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: /soc/gpio@2330000: failed to match any schema with compatible: ['fsl,ls2080a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: /soc/gpio@2330000: failed to match any schema with compatible: ['fsl,ls2080a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: i2c@2000000: clock-names:0: 'ipg' was expected
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: esdhc@2140000: compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: esdhc@2140000: compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: esdhc@2140000: $nodename:0: 'esdhc@2140000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: esdhc@2140000: Unevaluated properties are not allowed ('bus-width', 'compatible', 'sd-uhs-sdr104', 'sd-uhs-sdr12', 'sd-uhs-sdr25', 'sd-uhs-sdr50' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: esdhc@2150000: compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: esdhc@2150000: compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: esdhc@2150000: $nodename:0: 'esdhc@2150000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: esdhc@2150000: Unevaluated properties are not allowed ('broken-cd', 'bus-width', 'compatible', 'mmc-hs200-1_8v', 'mmc-hs400-1_8v' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: can@2180000: 'can-transceiver' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/can/fsl,flexcan.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: can@2190000: 'can-transceiver' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/can/fsl,flexcan.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: /soc/gpio@2330000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: power-controller@1e34040: '#power-domain-cells' is a required property
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: esdhc@2140000: compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: esdhc@2140000: compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: esdhc@2140000: $nodename:0: 'esdhc@2140000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: esdhc@2140000: Unevaluated properties are not allowed ('bus-width', 'compatible', 'sd-uhs-sdr104', 'sd-uhs-sdr12', 'sd-uhs-sdr25', 'sd-uhs-sdr50' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: esdhc@2150000: compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: esdhc@2150000: compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: esdhc@2150000: $nodename:0: 'esdhc@2150000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: esdhc@2150000: Unevaluated properties are not allowed ('broken-cd', 'bus-width', 'compatible', 'mmc-hs200-1_8v', 'mmc-hs400-1_8v' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: can@2180000: 'can-transceiver' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/can/fsl,flexcan.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: can@2190000: 'can-transceiver' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/can/fsl,flexcan.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: /soc/gpio@2330000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: power-controller@1e34040: '#power-domain-cells' is a required property
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: esdhc@2140000: compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: esdhc@2140000: compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: esdhc@2140000: $nodename:0: 'esdhc@2140000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: esdhc@2140000: Unevaluated properties are not allowed ('bus-width', 'compatible', 'sd-uhs-sdr104', 'sd-uhs-sdr12', 'sd-uhs-sdr25', 'sd-uhs-sdr50' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: esdhc@2150000: compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: esdhc@2150000: compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: esdhc@2150000: $nodename:0: 'esdhc@2150000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: esdhc@2150000: Unevaluated properties are not allowed ('broken-cd', 'bus-width', 'compatible', 'mmc-hs200-1_8v', 'mmc-hs400-1_8v' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: /soc/gpio@2330000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: power-controller@1e34040: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: /soc/power-controller@1e34040: failed to match any schema with compatible: ['fsl,lx2160a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: /soc/power-controller@1e34040: failed to match any schema with compatible: ['fsl,lx2160a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: /soc/timer@2800000: failed to match any schema with compatible: ['fsl,lx2160a-ftm-alarm']
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: esdhc@2140000: compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: esdhc@2140000: compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: esdhc@2140000: $nodename:0: 'esdhc@2140000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: esdhc@2140000: Unevaluated properties are not allowed ('bus-width', 'compatible', 'sd-uhs-sdr104', 'sd-uhs-sdr12', 'sd-uhs-sdr25', 'sd-uhs-sdr50' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: esdhc@2150000: compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: esdhc@2150000: compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: esdhc@2150000: $nodename:0: 'esdhc@2150000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: esdhc@2150000: Unevaluated properties are not allowed ('broken-cd', 'bus-width', 'compatible', 'mmc-hs200-1_8v', 'mmc-hs400-1_8v' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: /soc/gpio@2330000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: power-controller@1e34040: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: /soc/power-controller@1e34040: failed to match any schema with compatible: ['fsl,lx2160a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: /soc/power-controller@1e34040: failed to match any schema with compatible: ['fsl,lx2160a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: /soc/timer@2800000: failed to match any schema with compatible: ['fsl,lx2160a-ftm-alarm']
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: esdhc@2140000: compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: esdhc@2140000: compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: esdhc@2140000: $nodename:0: 'esdhc@2140000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: esdhc@2140000: Unevaluated properties are not allowed ('bus-width', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: esdhc@2150000: compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: esdhc@2150000: compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: esdhc@2150000: $nodename:0: 'esdhc@2150000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: esdhc@2150000: Unevaluated properties are not allowed ('broken-cd', 'bus-width', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: /soc/gpio@2330000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: power-controller@1e34040: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: /soc/power-controller@1e34040: failed to match any schema with compatible: ['fsl,lx2160a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: /soc/power-controller@1e34040: failed to match any schema with compatible: ['fsl,lx2160a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: /soc/timer@2800000: failed to match any schema with compatible: ['fsl,lx2160a-ftm-alarm']
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: esdhc@2140000: compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: esdhc@2140000: compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: esdhc@2140000: $nodename:0: 'esdhc@2140000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: esdhc@2140000: Unevaluated properties are not allowed ('bus-width', 'compatible', 'sd-uhs-sdr104', 'sd-uhs-sdr12', 'sd-uhs-sdr25', 'sd-uhs-sdr50' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: esdhc@2150000: compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: esdhc@2150000: compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: esdhc@2150000: $nodename:0: 'esdhc@2150000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: esdhc@2150000: Unevaluated properties are not allowed ('broken-cd', 'bus-width', 'compatible', 'mmc-hs200-1_8v', 'mmc-hs400-1_8v' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: can@2180000: 'can-transceiver' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/can/fsl,flexcan.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: can@2190000: 'can-transceiver' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/can/fsl,flexcan.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: /soc/gpio@2330000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: power-controller@1e34040: '#power-domain-cells' is a required property
--
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: esdhc@2140000: compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: esdhc@2140000: compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: esdhc@2140000: $nodename:0: 'esdhc@2140000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: esdhc@2140000: Unevaluated properties are not allowed ('bus-width', 'compatible', 'sd-uhs-sdr104', 'sd-uhs-sdr12', 'sd-uhs-sdr25', 'sd-uhs-sdr50' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: esdhc@2150000: compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: esdhc@2150000: compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: esdhc@2150000: $nodename:0: 'esdhc@2150000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: esdhc@2150000: Unevaluated properties are not allowed ('broken-cd', 'bus-width', 'compatible', 'mmc-hs200-1_8v', 'mmc-hs400-1_8v' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: /soc/gpio@2330000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: power-controller@1e34040: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: /soc/power-controller@1e34040: failed to match any schema with compatible: ['fsl,lx2160a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: /soc/power-controller@1e34040: failed to match any schema with compatible: ['fsl,lx2160a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: /soc/timer@2800000: failed to match any schema with compatible: ['fsl,lx2160a-ftm-alarm']
--
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: esdhc@2140000: compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: esdhc@2140000: compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: esdhc@2140000: $nodename:0: 'esdhc@2140000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: esdhc@2140000: Unevaluated properties are not allowed ('bus-width', 'compatible', 'sd-uhs-sdr104', 'sd-uhs-sdr12', 'sd-uhs-sdr25', 'sd-uhs-sdr50' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: esdhc@2150000: compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: esdhc@2150000: compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: esdhc@2150000: $nodename:0: 'esdhc@2150000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: esdhc@2150000: Unevaluated properties are not allowed ('broken-cd', 'bus-width', 'compatible', 'mmc-hs200-1_8v', 'mmc-hs400-1_8v' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: /soc/gpio@2330000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: power-controller@1e34040: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: /soc/power-controller@1e34040: failed to match any schema with compatible: ['fsl,lx2160a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: /soc/power-controller@1e34040: failed to match any schema with compatible: ['fsl,lx2160a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: /soc/timer@2800000: failed to match any schema with compatible: ['fsl,lx2160a-ftm-alarm']
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: /soc/spi@2110000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: /soc/spi@2120000: failed to match any schema with compatible: ['fsl,lx2160a-dspi', 'fsl,ls2085a-dspi']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: esdhc@2140000: compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: esdhc@2140000: compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: esdhc@2140000: $nodename:0: 'esdhc@2140000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: esdhc@2140000: Unevaluated properties are not allowed ('bus-width', 'cd-gpios', 'compatible', 'no-mmc', 'no-sdio', 'sd-uhs-sdr104', 'sd-uhs-sdr12', 'sd-uhs-sdr25', 'sd-uhs-sdr50', 'wp-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: esdhc@2150000: compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: esdhc@2150000: compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: esdhc@2150000: $nodename:0: 'esdhc@2150000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: esdhc@2150000: Unevaluated properties are not allowed ('broken-cd', 'bus-width', 'compatible', 'mmc-hs200-1_8v', 'no-sd', 'no-sdio', 'non-removable' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: /soc/gpio@2330000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: power-controller@1e34040: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: /soc/power-controller@1e34040: failed to match any schema with compatible: ['fsl,lx2160a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: /soc/power-controller@1e34040: failed to match any schema with compatible: ['fsl,lx2160a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: /soc/timer@2800000: failed to match any schema with compatible: ['fsl,lx2160a-ftm-alarm']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
