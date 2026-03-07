Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D9A35AC2A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Mar 2026 08:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772872813; cv=none; b=Ti07qgzMMkkhkRCCYFJcWfr1jzDBbcGS+1Wv4rd99Quo9m/p0LSRpMq1bchBez94Nhl8c4KI64DE1sgi9XKxKfasOsVqwbg5C4PBFKg2mF86+7qE/4jCsazwuIYQz8YOVl8Jex/nMv5ETenRKLBjjUGOrPdD9aEipyYoQG+6ei4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772872813; c=relaxed/simple;
	bh=TJRhKmf1hr14LLAtL3TMJeTPsdF0zo3K2X0giVWqE8E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XJsysZFDXQ0V37Gh6YMwQS6VBG+nAgUaC4rzGN0yEaWxeyN+rEYh0bmuXm6GwheF14SFGWDuN/T8t4Sw6/0DQUYTHJL9Hq+cEUcp2dOf7VS4/SPgy/HEfjpgtcIHEQYA1lm5kjSbB2pUIqEhK51GV8lx4MA+6GLbY+5tC/M3oPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZMVjCcsA; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZMVjCcsA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772872811; x=1804408811;
  h=date:from:to:cc:subject:message-id;
  bh=TJRhKmf1hr14LLAtL3TMJeTPsdF0zo3K2X0giVWqE8E=;
  b=ZMVjCcsAqo1azQwBYXp3R6vNs02xte1id4oUA0/3HmGzCPxIXHt+7r3J
   hOZr2Yv3lVs/5iBEPISfuT7rNH1qmQzgJ0J2ISfhBXFmAYxHZEE9u8MQV
   D/SH5z4LOPyfTkDYEnoyQ9EcCFYk2seu9p7EpxKkBHInaJPVcAKgaQ7eP
   JVRJGdZMGBqRlKnSPHllmquArWxVixqQB3PjwPhNSbhSYLR24gPe8o5s4
   B2lPlkY7bfLl8V85WYLnjWEhDxhmFmRnrUG4PKFT4CO/9IGc/ATSgjtjE
   /QIxEWzhzqQARCnlUkTz0cfi+XGvfthoUGRkfYrCZ0PmRd8Mdk0Be/omr
   Q==;
X-CSE-ConnectionGUID: XLrHK3TZTFqCTntf+7ZvPA==
X-CSE-MsgGUID: XQF4hrWPSYO4O0fNV+sWxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="73876462"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="73876462"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 00:40:10 -0800
X-CSE-ConnectionGUID: DHZqsWqqSlSGPuuC23drGg==
X-CSE-MsgGUID: C8756KRQSHSp176l3FAKwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="245413207"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 07 Mar 2026 00:40:07 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vynCe-000000002Rl-3diS;
	Sat, 07 Mar 2026 08:40:04 +0000
Date: Sat, 07 Mar 2026 09:39:44 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 1683/4342]
 arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb:
 nand-controller@bb000000 (fsl,imx25-nand): Unevaluated properties are not
 allowed ('#address-cells', '#size-cells', 'clock-names', 'nand-bus-width',
 'nand-ecc-mode', 'nand-on-flash-bbt' were ...
Message-ID: <202603070924.95EFyPaB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3f9cd19e764b782706dbaacc69e502099cb014ba
commit: d86e70e9ca995942e848515b089e9be7430c862e [1683/4342] dt-bindings: mtd: mxc-nand: add i.MX25 and i.MX27 nand support
config: arm-randconfig-2051-20260301 (https://download.01.org/0day-ci/archive/20260307/202603070924.95EFyPaB-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603070924.95EFyPaB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603070924.95EFyPaB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb: /soc/bus@43f00000/bridge@43f00000: failed to match any schema with compatible: ['fsl,imx25-aips']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb: /soc/bus@43f00000/iomuxc@43fac000: failed to match any schema with compatible: ['fsl,imx25-iomuxc']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb: /soc/spba-bus@50000000/tscadc@50030000: failed to match any schema with compatible: ['fsl,imx25-tsadc']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb: /soc/spba-bus@50000000/tscadc@50030000/tcq@50030400: failed to match any schema with compatible: ['fsl,imx25-tcq']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb: /soc/bus@53f00000/bridge@53f00000: failed to match any schema with compatible: ['fsl,imx25-aips']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb: /soc/bus@53f00000/timer@53f94000: failed to match any schema with compatible: ['fsl,imx25-epit']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb: /soc/bus@53f00000/timer@53f98000: failed to match any schema with compatible: ['fsl,imx25-epit']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb: /soc/bus@80000000: failed to match any schema with compatible: ['fsl,emi-bus', 'simple-bus']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb: nand-controller@bb000000 (fsl,imx25-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml
>> arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb: nand-controller@bb000000 (fsl,imx25-nand): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-names', 'nand-bus-width', 'nand-ecc-mode', 'nand-on-flash-bbt' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb: nand-controller@bb000000 (fsl,imx25-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb: /sound: failed to match any schema with compatible: ['eukrea,asoc-tlv320']
--
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dtb: /soc/bus@43f00000/bridge@43f00000: failed to match any schema with compatible: ['fsl,imx25-aips']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dtb: /soc/bus@43f00000/iomuxc@43fac000: failed to match any schema with compatible: ['fsl,imx25-iomuxc']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dtb: /soc/spba-bus@50000000/tscadc@50030000: failed to match any schema with compatible: ['fsl,imx25-tsadc']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dtb: /soc/spba-bus@50000000/tscadc@50030000/tcq@50030400: failed to match any schema with compatible: ['fsl,imx25-tcq']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dtb: /soc/bus@53f00000/bridge@53f00000: failed to match any schema with compatible: ['fsl,imx25-aips']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dtb: /soc/bus@53f00000/timer@53f94000: failed to match any schema with compatible: ['fsl,imx25-epit']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dtb: /soc/bus@53f00000/timer@53f98000: failed to match any schema with compatible: ['fsl,imx25-epit']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dtb: /soc/bus@80000000: failed to match any schema with compatible: ['fsl,emi-bus', 'simple-bus']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dtb: nand-controller@bb000000 (fsl,imx25-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml
>> arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dtb: nand-controller@bb000000 (fsl,imx25-nand): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-names', 'nand-bus-width', 'nand-ecc-mode', 'nand-on-flash-bbt' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dtb: nand-controller@bb000000 (fsl,imx25-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dtb: /sound: failed to match any schema with compatible: ['eukrea,asoc-tlv320']
--
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dtb: /soc/bus@43f00000/bridge@43f00000: failed to match any schema with compatible: ['fsl,imx25-aips']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dtb: /soc/bus@43f00000/iomuxc@43fac000: failed to match any schema with compatible: ['fsl,imx25-iomuxc']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dtb: /soc/spba-bus@50000000/tscadc@50030000: failed to match any schema with compatible: ['fsl,imx25-tsadc']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dtb: /soc/spba-bus@50000000/tscadc@50030000/tcq@50030400: failed to match any schema with compatible: ['fsl,imx25-tcq']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dtb: /soc/bus@53f00000/bridge@53f00000: failed to match any schema with compatible: ['fsl,imx25-aips']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dtb: /soc/bus@53f00000/timer@53f94000: failed to match any schema with compatible: ['fsl,imx25-epit']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dtb: /soc/bus@53f00000/timer@53f98000: failed to match any schema with compatible: ['fsl,imx25-epit']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dtb: /soc/bus@80000000: failed to match any schema with compatible: ['fsl,emi-bus', 'simple-bus']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dtb: nand-controller@bb000000 (fsl,imx25-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml
>> arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dtb: nand-controller@bb000000 (fsl,imx25-nand): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-names', 'nand-bus-width', 'nand-ecc-mode', 'nand-on-flash-bbt' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dtb: nand-controller@bb000000 (fsl,imx25-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dtb: /sound: failed to match any schema with compatible: ['eukrea,asoc-tlv320']
--
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-vga.dtb: /soc/bus@43f00000/bridge@43f00000: failed to match any schema with compatible: ['fsl,imx25-aips']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-vga.dtb: /soc/bus@43f00000/iomuxc@43fac000: failed to match any schema with compatible: ['fsl,imx25-iomuxc']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-vga.dtb: /soc/spba-bus@50000000/tscadc@50030000: failed to match any schema with compatible: ['fsl,imx25-tsadc']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-vga.dtb: /soc/spba-bus@50000000/tscadc@50030000/tcq@50030400: failed to match any schema with compatible: ['fsl,imx25-tcq']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-vga.dtb: /soc/bus@53f00000/bridge@53f00000: failed to match any schema with compatible: ['fsl,imx25-aips']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-vga.dtb: /soc/bus@53f00000/timer@53f94000: failed to match any schema with compatible: ['fsl,imx25-epit']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-vga.dtb: /soc/bus@53f00000/timer@53f98000: failed to match any schema with compatible: ['fsl,imx25-epit']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-vga.dtb: /soc/bus@80000000: failed to match any schema with compatible: ['fsl,emi-bus', 'simple-bus']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-vga.dtb: nand-controller@bb000000 (fsl,imx25-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml
>> arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-vga.dtb: nand-controller@bb000000 (fsl,imx25-nand): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-names', 'nand-bus-width', 'nand-ecc-mode', 'nand-on-flash-bbt' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-vga.dtb: nand-controller@bb000000 (fsl,imx25-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-vga.dtb: /sound: failed to match any schema with compatible: ['eukrea,asoc-tlv320']
--
   arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dtb: /soc/bus@43f00000/bridge@43f00000: failed to match any schema with compatible: ['fsl,imx25-aips']
   arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dtb: /soc/bus@43f00000/iomuxc@43fac000: failed to match any schema with compatible: ['fsl,imx25-iomuxc']
   arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dtb: /soc/spba-bus@50000000/tscadc@50030000: failed to match any schema with compatible: ['fsl,imx25-tsadc']
   arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dtb: /soc/spba-bus@50000000/tscadc@50030000/tcq@50030400: failed to match any schema with compatible: ['fsl,imx25-tcq']
   arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dtb: /soc/bus@53f00000/bridge@53f00000: failed to match any schema with compatible: ['fsl,imx25-aips']
   arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dtb: /soc/bus@53f00000/timer@53f94000: failed to match any schema with compatible: ['fsl,imx25-epit']
   arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dtb: /soc/bus@53f00000/timer@53f98000: failed to match any schema with compatible: ['fsl,imx25-epit']
   arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dtb: /soc/bus@80000000: failed to match any schema with compatible: ['fsl,emi-bus', 'simple-bus']
   arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dtb: nand-controller@bb000000 (fsl,imx25-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml
>> arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dtb: nand-controller@bb000000 (fsl,imx25-nand): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-names', 'nand-bus-width', 'nand-ecc-mode', 'nand-on-flash-bbt' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dtb: nand-controller@bb000000 (fsl,imx25-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
--
   arch/arm/boot/dts/nxp/imx/imx25-pdk.dtb: /soc/bus@43f00000/bridge@43f00000: failed to match any schema with compatible: ['fsl,imx25-aips']
   arch/arm/boot/dts/nxp/imx/imx25-pdk.dtb: /soc/bus@43f00000/iomuxc@43fac000: failed to match any schema with compatible: ['fsl,imx25-iomuxc']
   arch/arm/boot/dts/nxp/imx/imx25-pdk.dtb: /soc/spba-bus@50000000/tscadc@50030000: failed to match any schema with compatible: ['fsl,imx25-tsadc']
   arch/arm/boot/dts/nxp/imx/imx25-pdk.dtb: /soc/spba-bus@50000000/tscadc@50030000/tcq@50030400: failed to match any schema with compatible: ['fsl,imx25-tcq']
   arch/arm/boot/dts/nxp/imx/imx25-pdk.dtb: /soc/bus@53f00000/bridge@53f00000: failed to match any schema with compatible: ['fsl,imx25-aips']
   arch/arm/boot/dts/nxp/imx/imx25-pdk.dtb: /soc/bus@53f00000/timer@53f94000: failed to match any schema with compatible: ['fsl,imx25-epit']
   arch/arm/boot/dts/nxp/imx/imx25-pdk.dtb: /soc/bus@53f00000/timer@53f98000: failed to match any schema with compatible: ['fsl,imx25-epit']
   arch/arm/boot/dts/nxp/imx/imx25-pdk.dtb: /soc/bus@80000000: failed to match any schema with compatible: ['fsl,emi-bus', 'simple-bus']
   arch/arm/boot/dts/nxp/imx/imx25-pdk.dtb: nand-controller@bb000000 (fsl,imx25-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml
>> arch/arm/boot/dts/nxp/imx/imx25-pdk.dtb: nand-controller@bb000000 (fsl,imx25-nand): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-names', 'nand-on-flash-bbt' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx25-pdk.dtb: nand-controller@bb000000 (fsl,imx25-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
--
   arch/arm/boot/dts/nxp/imx/imx27-apf27.dtb: osc26m (fsl,imx-osc26m): compatible:0: 'fixed-clock' was expected
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/nxp/imx/imx27-apf27.dtb: osc26m (fsl,imx-osc26m): compatible: ['fsl,imx-osc26m', 'fixed-clock'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/nxp/imx/imx27-apf27.dtb: /clocks/osc26m: failed to match any schema with compatible: ['fsl,imx-osc26m', 'fixed-clock']
   arch/arm/boot/dts/nxp/imx/imx27-apf27.dtb: /soc/bus@10000000: failed to match any schema with compatible: ['fsl,aipi-bus', 'simple-bus']
   arch/arm/boot/dts/nxp/imx/imx27-apf27.dtb: /soc/bus@10000000/iomuxc@10015000: failed to match any schema with compatible: ['fsl,imx27-iomuxc']
   arch/arm/boot/dts/nxp/imx/imx27-apf27.dtb: /soc/bus@10020000: failed to match any schema with compatible: ['fsl,aipi-bus', 'simple-bus']
   arch/arm/boot/dts/nxp/imx/imx27-apf27.dtb: nand-controller@d8000000 (fsl,imx27-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml
>> arch/arm/boot/dts/nxp/imx/imx27-apf27.dtb: nand-controller@d8000000 (fsl,imx27-nand): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'nand-bus-width', 'nand-ecc-mode', 'nand-on-flash-bbt', 'partition@0', 'partition@100000', 'partition@180000', 'partition@200000', 'partition@280000', 'partition@300000', 'partition@800000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx27-apf27.dtb: nand-controller@d8000000 (fsl,imx27-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
--
   arch/arm/boot/dts/nxp/imx/imx27-apf27dev.dtb: osc26m (fsl,imx-osc26m): compatible:0: 'fixed-clock' was expected
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/nxp/imx/imx27-apf27dev.dtb: osc26m (fsl,imx-osc26m): compatible: ['fsl,imx-osc26m', 'fixed-clock'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/nxp/imx/imx27-apf27dev.dtb: /clocks/osc26m: failed to match any schema with compatible: ['fsl,imx-osc26m', 'fixed-clock']
   arch/arm/boot/dts/nxp/imx/imx27-apf27dev.dtb: /soc/bus@10000000: failed to match any schema with compatible: ['fsl,aipi-bus', 'simple-bus']
   arch/arm/boot/dts/nxp/imx/imx27-apf27dev.dtb: /soc/bus@10000000/iomuxc@10015000: failed to match any schema with compatible: ['fsl,imx27-iomuxc']
   arch/arm/boot/dts/nxp/imx/imx27-apf27dev.dtb: /soc/bus@10020000: failed to match any schema with compatible: ['fsl,aipi-bus', 'simple-bus']
   arch/arm/boot/dts/nxp/imx/imx27-apf27dev.dtb: nand-controller@d8000000 (fsl,imx27-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml
>> arch/arm/boot/dts/nxp/imx/imx27-apf27dev.dtb: nand-controller@d8000000 (fsl,imx27-nand): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'nand-bus-width', 'nand-ecc-mode', 'nand-on-flash-bbt', 'partition@0', 'partition@100000', 'partition@180000', 'partition@200000', 'partition@280000', 'partition@300000', 'partition@800000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx27-apf27dev.dtb: nand-controller@d8000000 (fsl,imx27-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
--
   arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: /clocks/osc26m: failed to match any schema with compatible: ['fsl,imx-osc26m', 'fixed-clock']
   arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: /soc/bus@10000000: failed to match any schema with compatible: ['fsl,aipi-bus', 'simple-bus']
   arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: ads7846@0 (ti,ads7846): interrupts: [[9], [25], [8]] is too long
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,ads7843.yaml
   arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: ads7846@0 (ti,ads7846): Unevaluated properties are not allowed ('spi-cpol' was unexpected)
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,ads7843.yaml
   arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: /soc/bus@10000000/iomuxc@10015000: failed to match any schema with compatible: ['fsl,imx27-iomuxc']
   arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: /soc/bus@10020000: failed to match any schema with compatible: ['fsl,aipi-bus', 'simple-bus']
   arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: nand-controller@d8000000 (fsl,imx27-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml
>> arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: nand-controller@d8000000 (fsl,imx27-nand): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'nand-bus-width', 'nand-ecc-mode', 'nand-on-flash-bbt' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: nand-controller@d8000000 (fsl,imx27-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
   arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: uart8250@3,200000 (ns8250): $nodename:0: 'uart8250@3,200000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: uart8250@3,200000 (ns8250): interrupts: [[28], [23], [8]] is too long
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: uart8250@3,400000 (ns8250): $nodename:0: 'uart8250@3,400000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: uart8250@3,400000 (ns8250): interrupts: [[28], [22], [8]] is too long
--
   arch/arm/boot/dts/nxp/imx/imx27-pdk.dtb: osc26m (fsl,imx-osc26m): compatible:0: 'fixed-clock' was expected
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/nxp/imx/imx27-pdk.dtb: osc26m (fsl,imx-osc26m): compatible: ['fsl,imx-osc26m', 'fixed-clock'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/nxp/imx/imx27-pdk.dtb: /clocks/osc26m: failed to match any schema with compatible: ['fsl,imx-osc26m', 'fixed-clock']
   arch/arm/boot/dts/nxp/imx/imx27-pdk.dtb: /soc/bus@10000000: failed to match any schema with compatible: ['fsl,aipi-bus', 'simple-bus']
   arch/arm/boot/dts/nxp/imx/imx27-pdk.dtb: /soc/bus@10000000/iomuxc@10015000: failed to match any schema with compatible: ['fsl,imx27-iomuxc']
   arch/arm/boot/dts/nxp/imx/imx27-pdk.dtb: /soc/bus@10020000: failed to match any schema with compatible: ['fsl,aipi-bus', 'simple-bus']
   arch/arm/boot/dts/nxp/imx/imx27-pdk.dtb: nand-controller@d8000000 (fsl,imx27-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml
>> arch/arm/boot/dts/nxp/imx/imx27-pdk.dtb: nand-controller@d8000000 (fsl,imx27-nand): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'nand-ecc-mode', 'nand-on-flash-bbt' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx27-pdk.dtb: nand-controller@d8000000 (fsl,imx27-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
--
   arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dtb: osc26m (fsl,imx-osc26m): compatible:0: 'fixed-clock' was expected
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dtb: osc26m (fsl,imx-osc26m): compatible: ['fsl,imx-osc26m', 'fixed-clock'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dtb: /clocks/osc26m: failed to match any schema with compatible: ['fsl,imx-osc26m', 'fixed-clock']
   arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dtb: /soc/bus@10000000: failed to match any schema with compatible: ['fsl,aipi-bus', 'simple-bus']
   arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dtb: /soc/bus@10000000/iomuxc@10015000: failed to match any schema with compatible: ['fsl,imx27-iomuxc']
   arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dtb: /soc/bus@10020000: failed to match any schema with compatible: ['fsl,aipi-bus', 'simple-bus']
   arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dtb: nand-controller@d8000000 (fsl,imx27-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml
>> arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dtb: nand-controller@d8000000 (fsl,imx27-nand): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'nand-bus-width', 'nand-ecc-mode', 'nand-on-flash-bbt' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dtb: nand-controller@d8000000 (fsl,imx27-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
   arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dtb: can@4,0 (nxp,sja1000): Unevaluated properties are not allowed ('fsl,weim-cs-timing' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/nxp,sja1000.yaml
--
   arch/arm/boot/dts/nxp/imx/imx27-phytec-phycard-s-rdk.dtb: osc26m (fsl,imx-osc26m): compatible:0: 'fixed-clock' was expected
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/nxp/imx/imx27-phytec-phycard-s-rdk.dtb: osc26m (fsl,imx-osc26m): compatible: ['fsl,imx-osc26m', 'fixed-clock'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm/boot/dts/nxp/imx/imx27-phytec-phycard-s-rdk.dtb: /clocks/osc26m: failed to match any schema with compatible: ['fsl,imx-osc26m', 'fixed-clock']
   arch/arm/boot/dts/nxp/imx/imx27-phytec-phycard-s-rdk.dtb: /soc/bus@10000000: failed to match any schema with compatible: ['fsl,aipi-bus', 'simple-bus']
   arch/arm/boot/dts/nxp/imx/imx27-phytec-phycard-s-rdk.dtb: /soc/bus@10000000/iomuxc@10015000: failed to match any schema with compatible: ['fsl,imx27-iomuxc']
   arch/arm/boot/dts/nxp/imx/imx27-phytec-phycard-s-rdk.dtb: /soc/bus@10020000: failed to match any schema with compatible: ['fsl,aipi-bus', 'simple-bus']
   arch/arm/boot/dts/nxp/imx/imx27-phytec-phycard-s-rdk.dtb: nand-controller@d8000000 (fsl,imx27-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml
>> arch/arm/boot/dts/nxp/imx/imx27-phytec-phycard-s-rdk.dtb: nand-controller@d8000000 (fsl,imx27-nand): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'nand-bus-width', 'nand-ecc-mode', 'nand-on-flash-bbt' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx27-phytec-phycard-s-rdk.dtb: nand-controller@d8000000 (fsl,imx27-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
--
   arch/arm/boot/dts/nxp/imx/imx31-lite.dtb: emi@b8000000 (simple-bus): $nodename:0: 'emi@b8000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/nxp/imx/imx31-lite.dtb: nand-controller@b8000000 (fsl,imx31-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml
>> arch/arm/boot/dts/nxp/imx/imx31-lite.dtb: nand-controller@b8000000 (fsl,imx31-nand): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dma-names', 'dmas', 'nand-bus-width', 'nand-ecc-mode', 'nand-on-flash-bbt' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx31-lite.dtb: nand-controller@b8000000 (fsl,imx31-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
--
   arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: i2c@43f84000 (fsl,imx35-i2c): clock-names:0: 'ipg' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-imx.yaml
   arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: i2c@43f98000 (fsl,imx35-i2c): clock-names:0: 'ipg' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-imx.yaml
   arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: emi@80000000 (fsl,emi): $nodename:0: 'emi@80000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: emi@80000000 (fsl,emi): $nodename:0: 'emi@80000000' does not match '^((spba|emi)-bus|bus)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/fsl,spba-bus.yaml
   arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: nand-controller@bb000000 (fsl,imx35-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml
>> arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: nand-controller@bb000000 (fsl,imx35-nand): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx35-nand', 'fsl,imx25-nand'] is too long
   	'fsl,imx35-nand' is not one of ['fsl,imx25-nand', 'fsl,imx27-nand']
   	'fsl,imx35-nand' is not one of ['fsl,imx31-nand']
   	'fsl,imx27-nand' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml
>> arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: nand-controller@bb000000 (fsl,imx35-nand): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-names', 'nand-bus-width', 'nand-ecc-mode', 'nand-on-flash-bbt' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: /soc/emi@80000000/nand-controller@bb000000: failed to match any schema with compatible: ['fsl,imx35-nand', 'fsl,imx25-nand']
   arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: nand-controller@bb000000 (fsl,imx35-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
   arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: usbphy (simple-bus): usb-phy@0:reg:0: [0] is too short
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: usbphy (simple-bus): usb-phy@1:reg:0: [1] is too short
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: usbphy (simple-bus): #size-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: i2c@43f84000 (fsl,imx35-i2c): clock-names:0: 'ipg' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-imx.yaml
   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: i2c@43f98000 (fsl,imx35-i2c): clock-names:0: 'ipg' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-imx.yaml
   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: emi@80000000 (fsl,emi): $nodename:0: 'emi@80000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: emi@80000000 (fsl,emi): $nodename:0: 'emi@80000000' does not match '^((spba|emi)-bus|bus)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/fsl,spba-bus.yaml
   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: nand-controller@bb000000 (fsl,imx35-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml
>> arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: nand-controller@bb000000 (fsl,imx35-nand): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx35-nand', 'fsl,imx25-nand'] is too long
   	'fsl,imx35-nand' is not one of ['fsl,imx25-nand', 'fsl,imx27-nand']
   	'fsl,imx35-nand' is not one of ['fsl,imx31-nand']
   	'fsl,imx27-nand' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml
>> arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: nand-controller@bb000000 (fsl,imx35-nand): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-names', 'nand-bus-width', 'nand-ecc-mode', 'nand-on-flash-bbt' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: /soc/emi@80000000/nand-controller@bb000000: failed to match any schema with compatible: ['fsl,imx35-nand', 'fsl,imx25-nand']
   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: nand-controller@bb000000 (fsl,imx35-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: usbphy (simple-bus): usb-phy@0:reg:0: [0] is too short
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: usbphy (simple-bus): usb-phy@1:reg:0: [1] is too short
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: usbphy (simple-bus): #size-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
