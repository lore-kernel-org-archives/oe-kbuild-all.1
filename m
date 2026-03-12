Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA9E35958
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Mar 2026 04:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773289867; cv=none; b=jvLi7FdSYj6rVcFR0twHV/d6zJEMzur54xbjdcBF2iOfwGxBQZkIZckGewaJEP3k8Omqh3B6Nse3NrsbzVk+XSUDT6gyYrvxVE+ixEfTGtrTI2HaWy6mf/zm0Xm+VlMiLnXHjrwEbrugP1EgHh6NiHyd9GAWRsZrf6WMZoZ0xno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773289867; c=relaxed/simple;
	bh=Rf1XEnFOtR7zT0I6lDHSgu57tUcWbMecksi2cUd1yus=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DCJG91xsThEDs2kxGpu+deBvTdsb09cgfX9E9bOCDjv/T8C3oVV5wPTPDxNnibO5VeLNsk0uQieqaoJeIbnlDU38eOdehv8wQq3tTDXcWR2elq6qkGrIdQX8teGa7EFtFRWBNl50n8zNPohaaTcUfcQylcOemf06ZcDChJzuLvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jiPcz/PX; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jiPcz/PX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773289865; x=1804825865;
  h=date:from:to:cc:subject:message-id;
  bh=Rf1XEnFOtR7zT0I6lDHSgu57tUcWbMecksi2cUd1yus=;
  b=jiPcz/PX++NZlbwRdtGF0vaNnbMoN/RKMiDQzw2wp4+/kndatXAYBYVp
   KJWLdG74R+ZAsIEMHwaYoMQlVhTy8voel+DNZIhqJmoOfOSp6KKzpQukF
   n/9PYLqrinLdYG/bKRKFywTtJK+HCWRxvYC0XJM4tPWLKoVv40SxejhXG
   OgikBemza1TDsytKt7r5YJB2sTuSAawKNVnh0Srb3wUHrWf90pE5dnWSx
   381q63v9BbxSHT1l8zNRhbcFIZ+8CiEHXCcYbK7EYWHVj+0Qz98l7h6rl
   u5anQPNR5xKX3Ifshl/TKWeCm1TB2kr/4bFJbwHIHWZrTCPVJBQieCkhN
   Q==;
X-CSE-ConnectionGUID: DVywFw+sTSOn3bOx16bzyg==
X-CSE-MsgGUID: Vh7xZFl2SWSoLz/CFe1QJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="84691345"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="84691345"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 21:31:04 -0700
X-CSE-ConnectionGUID: 6yIAyWEAQNmP4NhEoFJa/w==
X-CSE-MsgGUID: SDlQ2DAeR9mPlezEDNWl+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="217282941"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 11 Mar 2026 21:31:01 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0XhK-000000003SP-45DP;
	Thu, 12 Mar 2026 04:30:58 +0000
Date: Thu, 12 Mar 2026 05:29:59 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>,
 "Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 4474/5327]
 arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb:
 tscadc@50030000 (fsl,imx25-tsadc): 'tcq@50030400' does not match any of the
 regexes: '^adc@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^touchscreen@[0-9a-f]+$'
Message-ID: <202603120558.rN9BMl0x-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7109a2155340cc7b21f27e832ece6df03592f2e8
commit: 61b80ec6685a08addd76ea6622636d709e7d989d [4474/5327] dt-bindings: mfd: Convert fsl-imx25-tsadc.txt to yaml format
config: arm-randconfig-2052-20260310 (https://download.01.org/0day-ci/archive/20260312/202603120558.rN9BMl0x-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260312/202603120558.rN9BMl0x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603120558.rN9BMl0x-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb: /soc/bus@43f00000/bridge@43f00000: failed to match any schema with compatible: ['fsl,imx25-aips']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb: /soc/bus@43f00000/iomuxc@43fac000: failed to match any schema with compatible: ['fsl,imx25-iomuxc']
>> arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb: tscadc@50030000 (fsl,imx25-tsadc): 'tcq@50030400' does not match any of the regexes: '^adc@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^touchscreen@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/fsl,imx25-tsadc.yaml
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb: /soc/spba-bus@50000000/tscadc@50030000/tcq@50030400: failed to match any schema with compatible: ['fsl,imx25-tcq']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb: /soc/bus@53f00000/bridge@53f00000: failed to match any schema with compatible: ['fsl,imx25-aips']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb: /soc/bus@53f00000/timer@53f94000: failed to match any schema with compatible: ['fsl,imx25-epit']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb: /soc/bus@53f00000/timer@53f98000: failed to match any schema with compatible: ['fsl,imx25-epit']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb: /soc/bus@80000000: failed to match any schema with compatible: ['fsl,emi-bus', 'simple-bus']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb: /soc/bus@80000000/nand-controller@bb000000: failed to match any schema with compatible: ['fsl,imx25-nand']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb: nand-controller@bb000000 (fsl,imx25-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb: /sound: failed to match any schema with compatible: ['eukrea,asoc-tlv320']
--
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dtb: /soc/bus@43f00000/bridge@43f00000: failed to match any schema with compatible: ['fsl,imx25-aips']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dtb: /soc/bus@43f00000/iomuxc@43fac000: failed to match any schema with compatible: ['fsl,imx25-iomuxc']
>> arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dtb: tscadc@50030000 (fsl,imx25-tsadc): 'tcq@50030400' does not match any of the regexes: '^adc@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^touchscreen@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/fsl,imx25-tsadc.yaml
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dtb: /soc/spba-bus@50000000/tscadc@50030000/tcq@50030400: failed to match any schema with compatible: ['fsl,imx25-tcq']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dtb: /soc/bus@53f00000/bridge@53f00000: failed to match any schema with compatible: ['fsl,imx25-aips']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dtb: /soc/bus@53f00000/timer@53f94000: failed to match any schema with compatible: ['fsl,imx25-epit']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dtb: /soc/bus@53f00000/timer@53f98000: failed to match any schema with compatible: ['fsl,imx25-epit']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dtb: /soc/bus@80000000: failed to match any schema with compatible: ['fsl,emi-bus', 'simple-bus']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dtb: /soc/bus@80000000/nand-controller@bb000000: failed to match any schema with compatible: ['fsl,imx25-nand']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dtb: nand-controller@bb000000 (fsl,imx25-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dtb: /sound: failed to match any schema with compatible: ['eukrea,asoc-tlv320']
--
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dtb: /soc/bus@43f00000/bridge@43f00000: failed to match any schema with compatible: ['fsl,imx25-aips']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dtb: /soc/bus@43f00000/iomuxc@43fac000: failed to match any schema with compatible: ['fsl,imx25-iomuxc']
>> arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dtb: tscadc@50030000 (fsl,imx25-tsadc): 'tcq@50030400' does not match any of the regexes: '^adc@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^touchscreen@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/fsl,imx25-tsadc.yaml
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dtb: /soc/spba-bus@50000000/tscadc@50030000/tcq@50030400: failed to match any schema with compatible: ['fsl,imx25-tcq']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dtb: /soc/bus@53f00000/bridge@53f00000: failed to match any schema with compatible: ['fsl,imx25-aips']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dtb: /soc/bus@53f00000/timer@53f94000: failed to match any schema with compatible: ['fsl,imx25-epit']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dtb: /soc/bus@53f00000/timer@53f98000: failed to match any schema with compatible: ['fsl,imx25-epit']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dtb: /soc/bus@80000000: failed to match any schema with compatible: ['fsl,emi-bus', 'simple-bus']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dtb: /soc/bus@80000000/nand-controller@bb000000: failed to match any schema with compatible: ['fsl,imx25-nand']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dtb: nand-controller@bb000000 (fsl,imx25-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dtb: /sound: failed to match any schema with compatible: ['eukrea,asoc-tlv320']
--
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-vga.dtb: /soc/bus@43f00000/bridge@43f00000: failed to match any schema with compatible: ['fsl,imx25-aips']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-vga.dtb: /soc/bus@43f00000/iomuxc@43fac000: failed to match any schema with compatible: ['fsl,imx25-iomuxc']
>> arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-vga.dtb: tscadc@50030000 (fsl,imx25-tsadc): 'tcq@50030400' does not match any of the regexes: '^adc@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^touchscreen@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/fsl,imx25-tsadc.yaml
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-vga.dtb: /soc/spba-bus@50000000/tscadc@50030000/tcq@50030400: failed to match any schema with compatible: ['fsl,imx25-tcq']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-vga.dtb: /soc/bus@53f00000/bridge@53f00000: failed to match any schema with compatible: ['fsl,imx25-aips']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-vga.dtb: /soc/bus@53f00000/timer@53f94000: failed to match any schema with compatible: ['fsl,imx25-epit']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-vga.dtb: /soc/bus@53f00000/timer@53f98000: failed to match any schema with compatible: ['fsl,imx25-epit']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-vga.dtb: /soc/bus@80000000: failed to match any schema with compatible: ['fsl,emi-bus', 'simple-bus']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-vga.dtb: /soc/bus@80000000/nand-controller@bb000000: failed to match any schema with compatible: ['fsl,imx25-nand']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-vga.dtb: nand-controller@bb000000 (fsl,imx25-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-vga.dtb: /sound: failed to match any schema with compatible: ['eukrea,asoc-tlv320']
--
   arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dtb: /soc/bus@43f00000/bridge@43f00000: failed to match any schema with compatible: ['fsl,imx25-aips']
   arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dtb: /soc/bus@43f00000/iomuxc@43fac000: failed to match any schema with compatible: ['fsl,imx25-iomuxc']
>> arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dtb: tscadc@50030000 (fsl,imx25-tsadc): 'tcq@50030400' does not match any of the regexes: '^adc@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^touchscreen@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/fsl,imx25-tsadc.yaml
   arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dtb: /soc/spba-bus@50000000/tscadc@50030000/tcq@50030400: failed to match any schema with compatible: ['fsl,imx25-tcq']
   arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dtb: /soc/bus@53f00000/bridge@53f00000: failed to match any schema with compatible: ['fsl,imx25-aips']
   arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dtb: /soc/bus@53f00000/timer@53f94000: failed to match any schema with compatible: ['fsl,imx25-epit']
   arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dtb: /soc/bus@53f00000/timer@53f98000: failed to match any schema with compatible: ['fsl,imx25-epit']
   arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dtb: /soc/bus@80000000: failed to match any schema with compatible: ['fsl,emi-bus', 'simple-bus']
   arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dtb: /soc/bus@80000000/nand-controller@bb000000: failed to match any schema with compatible: ['fsl,imx25-nand']
   arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dtb: nand-controller@bb000000 (fsl,imx25-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
--
   arch/arm/boot/dts/nxp/imx/imx25-pdk.dtb: /soc/bus@43f00000/bridge@43f00000: failed to match any schema with compatible: ['fsl,imx25-aips']
   arch/arm/boot/dts/nxp/imx/imx25-pdk.dtb: /soc/bus@43f00000/iomuxc@43fac000: failed to match any schema with compatible: ['fsl,imx25-iomuxc']
>> arch/arm/boot/dts/nxp/imx/imx25-pdk.dtb: tscadc@50030000 (fsl,imx25-tsadc): 'tcq@50030400' does not match any of the regexes: '^adc@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^touchscreen@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/fsl,imx25-tsadc.yaml
   arch/arm/boot/dts/nxp/imx/imx25-pdk.dtb: /soc/spba-bus@50000000/tscadc@50030000/tcq@50030400: failed to match any schema with compatible: ['fsl,imx25-tcq']
   arch/arm/boot/dts/nxp/imx/imx25-pdk.dtb: /soc/bus@53f00000/bridge@53f00000: failed to match any schema with compatible: ['fsl,imx25-aips']
   arch/arm/boot/dts/nxp/imx/imx25-pdk.dtb: /soc/bus@53f00000/timer@53f94000: failed to match any schema with compatible: ['fsl,imx25-epit']
   arch/arm/boot/dts/nxp/imx/imx25-pdk.dtb: /soc/bus@53f00000/timer@53f98000: failed to match any schema with compatible: ['fsl,imx25-epit']
   arch/arm/boot/dts/nxp/imx/imx25-pdk.dtb: /soc/bus@80000000: failed to match any schema with compatible: ['fsl,emi-bus', 'simple-bus']
   arch/arm/boot/dts/nxp/imx/imx25-pdk.dtb: /soc/bus@80000000/nand-controller@bb000000: failed to match any schema with compatible: ['fsl,imx25-nand']
   arch/arm/boot/dts/nxp/imx/imx25-pdk.dtb: nand-controller@bb000000 (fsl,imx25-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
