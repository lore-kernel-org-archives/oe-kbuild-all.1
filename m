Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AB932FA18
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 17:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774631169; cv=none; b=rbhOCWsykuWarv28tyvSudid2oqwa2EocM5nH1ev67hbzLsPUCfnkiOR/WOYdxWcU71Fl7KNdhb++Dv4Z6RZvMcjhqz/m2Al2sGqf3M7S63fsNZe+LG2OghGxNioRu3Y1b+PexOHhjTAsS5XNn0fAe9IJ9YPmg+hsMCA96NLjlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774631169; c=relaxed/simple;
	bh=MHRk1E5p0HrJy+iLnhUOGkpWAwL9YO1zh/aEnYI3enw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uM3ymz68MQA0DefOd9ATyASMDngrGWfiRVEgODOEv6LKf4mybzuKcC6FBbqDbabSaZwZC1MKCj/DzDXfpyhuUXQhDHL8i6iP+taNES+OVPOJkES7OM0Vle87ECET6/lmkm1SPpJ2XjzAr+x2AtEDy0tteN4+j9mCU/L0EFuGudM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V9hjyxuF; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V9hjyxuF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774631157; x=1806167157;
  h=date:from:to:cc:subject:message-id;
  bh=MHRk1E5p0HrJy+iLnhUOGkpWAwL9YO1zh/aEnYI3enw=;
  b=V9hjyxuFh2qHYRBtGHv0UXON1fKUmxKw/T7h7tCfEjKv9JzvFk8adkgB
   FLZKMVX3WyvvlUyHAhqt7D1jfQ4JzBd6lapvcXMAdV/tfVwaPp+ufka9L
   tV7Xm/SlVKD+AKtFOG1bo/V/YZ6RS1IOMIc/vwc5sVzB5DbWzNzjL3idY
   CkWeQSMTfN/AQm+l2GwuMX+rMDJdUR02SeGFJYrXN8+COYZSXTnyTF0PJ
   GAfXBvPcc1ehc8llkXd3D93XBG5bWJbZhBL2CBKDGnA3WOqCB6+w0vsL1
   LLuh1QSF8tzezZedjGqpgBbqiipQhQHDOSDrxsUYQiD+e4MX04vmwXga7
   A==;
X-CSE-ConnectionGUID: zG/qiJlwRlOT1iO71j+5xw==
X-CSE-MsgGUID: 2t3mzkdpR327UKcHGe+BOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="98325367"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="98325367"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 10:05:56 -0700
X-CSE-ConnectionGUID: HB2+vfTWTECnhAeATEltdA==
X-CSE-MsgGUID: Ily4MNZ+R/i+4pDPVro6zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="222041470"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 27 Mar 2026 10:05:56 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6Ad7-000000007XB-29SH;
	Fri, 27 Mar 2026 17:05:53 +0000
Date: Fri, 27 Mar 2026 18:05:02 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 8419/9801]
 arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb:
 nand-controller@bb000000 (fsl,imx25-nand): Unevaluated properties are not
 allowed ('clock-names' was unexpected)
Message-ID: <202603271742.UMycleyh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e77a5a5cfe43b4c25bd44a3818e487033287517f
commit: 3b2a422e23cf1998b85ccbcb90cabff01d17422c [8419/9801] dt-bindings: mtd: mxc-nand: add missing compatible string and ref to nand-controller-legacy.yaml
config: arm-randconfig-2051-20260326 (https://download.01.org/0day-ci/archive/20260327/202603271742.UMycleyh-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603271742.UMycleyh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603271742.UMycleyh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb: /soc/bus@43f00000/bridge@43f00000: failed to match any schema with compatible: ['fsl,imx25-aips']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb: /soc/bus@43f00000/iomuxc@43fac000: failed to match any schema with compatible: ['fsl,imx25-iomuxc']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb: /soc/spba-bus@50000000/tscadc@50030000: failed to match any schema with compatible: ['fsl,imx25-tsadc']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb: /soc/spba-bus@50000000/tscadc@50030000/tcq@50030400: failed to match any schema with compatible: ['fsl,imx25-tcq']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb: /soc/bus@53f00000/bridge@53f00000: failed to match any schema with compatible: ['fsl,imx25-aips']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb: /soc/bus@53f00000/timer@53f94000: failed to match any schema with compatible: ['fsl,imx25-epit']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb: /soc/bus@53f00000/timer@53f98000: failed to match any schema with compatible: ['fsl,imx25-epit']
   arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb: /soc/bus@80000000: failed to match any schema with compatible: ['fsl,emi-bus', 'simple-bus']
>> arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb: nand-controller@bb000000 (fsl,imx25-nand): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml
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
>> arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dtb: nand-controller@bb000000 (fsl,imx25-nand): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml
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
>> arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dtb: nand-controller@bb000000 (fsl,imx25-nand): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml
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
>> arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-vga.dtb: nand-controller@bb000000 (fsl,imx25-nand): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml
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
>> arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dtb: nand-controller@bb000000 (fsl,imx25-nand): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml
--
   arch/arm/boot/dts/nxp/imx/imx25-pdk.dtb: /soc/bus@43f00000/bridge@43f00000: failed to match any schema with compatible: ['fsl,imx25-aips']
   arch/arm/boot/dts/nxp/imx/imx25-pdk.dtb: /soc/bus@43f00000/iomuxc@43fac000: failed to match any schema with compatible: ['fsl,imx25-iomuxc']
   arch/arm/boot/dts/nxp/imx/imx25-pdk.dtb: /soc/spba-bus@50000000/tscadc@50030000: failed to match any schema with compatible: ['fsl,imx25-tsadc']
   arch/arm/boot/dts/nxp/imx/imx25-pdk.dtb: /soc/spba-bus@50000000/tscadc@50030000/tcq@50030400: failed to match any schema with compatible: ['fsl,imx25-tcq']
   arch/arm/boot/dts/nxp/imx/imx25-pdk.dtb: /soc/bus@53f00000/bridge@53f00000: failed to match any schema with compatible: ['fsl,imx25-aips']
   arch/arm/boot/dts/nxp/imx/imx25-pdk.dtb: /soc/bus@53f00000/timer@53f94000: failed to match any schema with compatible: ['fsl,imx25-epit']
   arch/arm/boot/dts/nxp/imx/imx25-pdk.dtb: /soc/bus@53f00000/timer@53f98000: failed to match any schema with compatible: ['fsl,imx25-epit']
   arch/arm/boot/dts/nxp/imx/imx25-pdk.dtb: /soc/bus@80000000: failed to match any schema with compatible: ['fsl,emi-bus', 'simple-bus']
>> arch/arm/boot/dts/nxp/imx/imx25-pdk.dtb: nand-controller@bb000000 (fsl,imx25-nand): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml
--
   arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: i2c@43f80000 (fsl,imx35-i2c): clock-names:0: 'ipg' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-imx.yaml
   arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: i2c@43f84000 (fsl,imx35-i2c): clock-names:0: 'ipg' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-imx.yaml
   arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: i2c@43f98000 (fsl,imx35-i2c): clock-names:0: 'ipg' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-imx.yaml
   arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: emi@80000000 (fsl,emi): $nodename:0: 'emi@80000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: emi@80000000 (fsl,emi): $nodename:0: 'emi@80000000' does not match '^((spba|emi)-bus|bus)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/fsl,spba-bus.yaml
>> arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: nand-controller@bb000000 (fsl,imx35-nand): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: usbphy (simple-bus): usb-phy@0:reg:0: [0] is too short
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: usbphy (simple-bus): usb-phy@1:reg:0: [1] is too short
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: usbphy (simple-bus): #size-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: usbphy (simple-bus): $nodename:0: 'usbphy' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: usbphy (simple-bus): 'ranges' is a required property
--
   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: i2c@43f80000 (fsl,imx35-i2c): clock-names:0: 'ipg' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-imx.yaml
   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: i2c@43f84000 (fsl,imx35-i2c): clock-names:0: 'ipg' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-imx.yaml
   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: i2c@43f98000 (fsl,imx35-i2c): clock-names:0: 'ipg' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-imx.yaml
   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: emi@80000000 (fsl,emi): $nodename:0: 'emi@80000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: emi@80000000 (fsl,emi): $nodename:0: 'emi@80000000' does not match '^((spba|emi)-bus|bus)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/fsl,spba-bus.yaml
>> arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: nand-controller@bb000000 (fsl,imx35-nand): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml
   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: usbphy (simple-bus): usb-phy@0:reg:0: [0] is too short
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: usbphy (simple-bus): usb-phy@1:reg:0: [1] is too short
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: usbphy (simple-bus): #size-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: usbphy (simple-bus): $nodename:0: 'usbphy' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: usbphy (simple-bus): 'ranges' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
