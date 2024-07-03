Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297D6138E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jul 2024 00:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719968035; cv=none; b=SbR5dZ3EAm5lRapj0uQWctzXXCNlHzNwdFLssPDHdQ46RGOcb9lBqNPx8cdZ3bsSavIn/jKEQQIiigYgHpO6sPPuXVij3S0Dzu1N5N/TfNvWYWVbB9W4piUSoGrBvFD3TEjxRo0VMQ8SMqNMbKlgdCbJgswSq8snrtgEwC6CpoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719968035; c=relaxed/simple;
	bh=28eVR9gRfFixrsUCGKL+H4Y/B83Y4GjNQZ1mM7MB8jk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GzudO9BC/GZouzAYBnqtIe2/WmxHKLPJQ51zaQR/FuezUWM1m4ExPi3ikHHtS1xHJwdAyBbfVEq2hLg8W3Ts948hO3N096bttTXoLTQx8JPZZ83y23g8qtafBP6HJykPB6B4a5BdqUkdHgSzhKczXFOGerSPE0fxycfIAr5hPIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EJRNkyOK; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EJRNkyOK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719968034; x=1751504034;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=28eVR9gRfFixrsUCGKL+H4Y/B83Y4GjNQZ1mM7MB8jk=;
  b=EJRNkyOKxtC0b5Gf8frT4A20LVJsBR1g9Y9+kIULhPPBerXnphggljDt
   UBz2PAbknqvhZIdrbOJFZ6bI5J9hpKnMcsbJ7HZD9TNQ4thOK5h7p0q1s
   4fS8YUUiWmYlTV1UjkdaVbNQrjKJq7gFBckXGArFJ5Hc2oB5V807zTyX+
   PSnwzVb1f3oSh6ITYB/ddJX89Ey7k9nUVsGUbB2ihHmghWQIt0abIuhoy
   yfkIF+Pv0Lvz2ptDTpUvvGeZ2MeHTflIe6tpIkLVsN0j96ioR9iDBHjeb
   5vj/haHYZKZmOygB+z13ZmAgKUk5Vuwe6eF0htWr80kMPFVOkSXc4vXkK
   w==;
X-CSE-ConnectionGUID: yyFG1ChbRUuuCx/19rsHnA==
X-CSE-MsgGUID: wtpezKBBRpChB0aei1AAVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28307170"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="28307170"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 17:53:51 -0700
X-CSE-ConnectionGUID: XxSGDCnIQICSzWbcb0DsAA==
X-CSE-MsgGUID: PagyGQIXTPqnN+z6PeSTYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="46728336"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Jul 2024 17:53:49 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOoFm-000P2j-1d;
	Wed, 03 Jul 2024 00:53:46 +0000
Date: Wed, 3 Jul 2024 08:53:25 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Shawn Guo <shawnguo@kernel.org>
Subject: [linux-next:master 8735/9748]
 arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: aux-bus:
 '#address-cells', '#size-cells', 'compatible', 'dma-ranges', 'ranges',
 'sata@3200000', 'usb@2f00000', 'usb@3000000', 'usb@3100000' do not match any
 of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202407031134.kIIviSVq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   82e4255305c554b0bb18b7ccf2db86041b4c8b6e
commit: 1bc8ad8138db3e15b27ea0725edb2b574fde9eec [8735/9748] arm64: dts: layerscape: rename aux_bus to aux-bus
config: arm64-randconfig-051-20240702 (https://download.01.org/0day-ci/archive/20240703/202407031134.kIIviSVq-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407031134.kIIviSVq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407031134.kIIviSVq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/uqe@2400000/si@700: failed to match any schema with compatible: ['fsl,ls1043-qe-si', 'fsl,t1040-qe-si']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/uqe@2400000/si@700: failed to match any schema with compatible: ['fsl,ls1043-qe-si', 'fsl,t1040-qe-si']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/uqe@2400000/siram@1000: failed to match any schema with compatible: ['fsl,ls1043-qe-siram', 'fsl,t1040-qe-siram']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/uqe@2400000/siram@1000: failed to match any schema with compatible: ['fsl,ls1043-qe-siram', 'fsl,t1040-qe-siram']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/uqe@2400000/muram@10000: failed to match any schema with compatible: ['fsl,qe-muram', 'fsl,cpm-muram']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/uqe@2400000/muram@10000: failed to match any schema with compatible: ['fsl,qe-muram', 'fsl,cpm-muram']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/uqe@2400000/muram@10000/data-only@0: failed to match any schema with compatible: ['fsl,qe-muram-data', 'fsl,cpm-muram-data']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/uqe@2400000/muram@10000/data-only@0: failed to match any schema with compatible: ['fsl,qe-muram-data', 'fsl,cpm-muram-data']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('big-endian', 'clock-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: aux-bus: '#address-cells', '#size-cells', 'compatible', 'dma-ranges', 'ranges', 'sata@3200000', 'usb@2f00000', 'usb@3000000', 'usb@3100000' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/dp-aux-bus.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: aux-bus: 'panel' is a required property
   	from schema $id: http://devicetree.org/schemas/display/dp-aux-bus.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/aux-bus/sata@3200000: failed to match any schema with compatible: ['fsl,ls1043a-ahci']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/msi-controller1@1571000: failed to match any schema with compatible: ['fsl,ls1043a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/msi-controller2@1572000: failed to match any schema with compatible: ['fsl,ls1043a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/msi-controller3@1573000: failed to match any schema with compatible: ['fsl,ls1043a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: pcie@3400000: fsl,pcie-scfg:0: [23, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: pcie@3500000: fsl,pcie-scfg:0: [23, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: pcie@3600000: fsl,pcie-scfg:0: [23, 2] is too long
--
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/uqe@2400000/si@700: failed to match any schema with compatible: ['fsl,ls1043-qe-si', 'fsl,t1040-qe-si']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/uqe@2400000/siram@1000: failed to match any schema with compatible: ['fsl,ls1043-qe-siram', 'fsl,t1040-qe-siram']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/uqe@2400000/siram@1000: failed to match any schema with compatible: ['fsl,ls1043-qe-siram', 'fsl,t1040-qe-siram']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/uqe@2400000/ucc@2000: failed to match any schema with compatible: ['fsl,ucc-hdlc']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/uqe@2400000/muram@10000: failed to match any schema with compatible: ['fsl,qe-muram', 'fsl,cpm-muram']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/uqe@2400000/muram@10000: failed to match any schema with compatible: ['fsl,qe-muram', 'fsl,cpm-muram']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/uqe@2400000/muram@10000/data-only@0: failed to match any schema with compatible: ['fsl,qe-muram-data', 'fsl,cpm-muram-data']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/uqe@2400000/muram@10000/data-only@0: failed to match any schema with compatible: ['fsl,qe-muram-data', 'fsl,cpm-muram-data']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('big-endian', 'clock-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: aux-bus: '#address-cells', '#size-cells', 'compatible', 'dma-ranges', 'ranges', 'sata@3200000', 'usb@2f00000', 'usb@3000000', 'usb@3100000' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/dp-aux-bus.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: aux-bus: 'panel' is a required property
   	from schema $id: http://devicetree.org/schemas/display/dp-aux-bus.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/aux-bus/sata@3200000: failed to match any schema with compatible: ['fsl,ls1043a-ahci']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/msi-controller1@1571000: failed to match any schema with compatible: ['fsl,ls1043a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/msi-controller2@1572000: failed to match any schema with compatible: ['fsl,ls1043a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/msi-controller3@1573000: failed to match any schema with compatible: ['fsl,ls1043a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: pcie@3400000: fsl,pcie-scfg:0: [22, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: pcie@3500000: fsl,pcie-scfg:0: [22, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: pcie@3600000: fsl,pcie-scfg:0: [22, 2] is too long
--
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/uqe@2400000/si@700: failed to match any schema with compatible: ['fsl,ls1043-qe-si', 'fsl,t1040-qe-si']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/uqe@2400000/si@700: failed to match any schema with compatible: ['fsl,ls1043-qe-si', 'fsl,t1040-qe-si']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/uqe@2400000/siram@1000: failed to match any schema with compatible: ['fsl,ls1043-qe-siram', 'fsl,t1040-qe-siram']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/uqe@2400000/siram@1000: failed to match any schema with compatible: ['fsl,ls1043-qe-siram', 'fsl,t1040-qe-siram']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/uqe@2400000/muram@10000: failed to match any schema with compatible: ['fsl,qe-muram', 'fsl,cpm-muram']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/uqe@2400000/muram@10000: failed to match any schema with compatible: ['fsl,qe-muram', 'fsl,cpm-muram']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/uqe@2400000/muram@10000/data-only@0: failed to match any schema with compatible: ['fsl,qe-muram-data', 'fsl,cpm-muram-data']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/uqe@2400000/muram@10000/data-only@0: failed to match any schema with compatible: ['fsl,qe-muram-data', 'fsl,cpm-muram-data']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('big-endian', 'clock-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: aux-bus: '#address-cells', '#size-cells', 'compatible', 'dma-ranges', 'ranges', 'sata@3200000', 'usb@2f00000', 'usb@3000000', 'usb@3100000' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/dp-aux-bus.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: aux-bus: 'panel' is a required property
   	from schema $id: http://devicetree.org/schemas/display/dp-aux-bus.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/aux-bus/sata@3200000: failed to match any schema with compatible: ['fsl,ls1043a-ahci']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/msi-controller1@1571000: failed to match any schema with compatible: ['fsl,ls1043a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/msi-controller2@1572000: failed to match any schema with compatible: ['fsl,ls1043a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/msi-controller3@1573000: failed to match any schema with compatible: ['fsl,ls1043a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: pcie@3400000: fsl,pcie-scfg:0: [25, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: pcie@3500000: fsl,pcie-scfg:0: [25, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: pcie@3600000: fsl,pcie-scfg:0: [25, 2] is too long
--
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,ls1046a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,ls1046a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,ls1046a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,ls1046a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls1046a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls1046a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/gpio@2330000: failed to match any schema with compatible: ['fsl,ls1046a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/gpio@2330000: failed to match any schema with compatible: ['fsl,ls1046a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('big-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: aux-bus: '#address-cells', '#size-cells', 'compatible', 'dma-ranges', 'ranges', 'sata@3200000', 'usb@2f00000', 'usb@3000000', 'usb@3100000' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/dp-aux-bus.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: aux-bus: 'panel' is a required property
   	from schema $id: http://devicetree.org/schemas/display/dp-aux-bus.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/aux-bus/sata@3200000: failed to match any schema with compatible: ['fsl,ls1046a-ahci']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/msi-controller@1580000: failed to match any schema with compatible: ['fsl,ls1046a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/msi-controller@1590000: failed to match any schema with compatible: ['fsl,ls1046a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/msi-controller@15a0000: failed to match any schema with compatible: ['fsl,ls1046a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: pcie_ep@3400000: compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/pcie_ep@3400000: failed to match any schema with compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: pcie_ep@3500000: compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/pcie_ep@3500000: failed to match any schema with compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: pcie_ep@3600000: compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
--
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,ls1046a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,ls1046a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,ls1046a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,ls1046a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls1046a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls1046a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: /soc/gpio@2330000: failed to match any schema with compatible: ['fsl,ls1046a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: /soc/gpio@2330000: failed to match any schema with compatible: ['fsl,ls1046a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('big-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: aux-bus: '#address-cells', '#size-cells', 'compatible', 'dma-ranges', 'ranges', 'sata@3200000', 'usb@2f00000', 'usb@3000000', 'usb@3100000' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/dp-aux-bus.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: aux-bus: 'panel' is a required property
   	from schema $id: http://devicetree.org/schemas/display/dp-aux-bus.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: /soc/aux-bus/sata@3200000: failed to match any schema with compatible: ['fsl,ls1046a-ahci']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: /soc/msi-controller@1580000: failed to match any schema with compatible: ['fsl,ls1046a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: /soc/msi-controller@1590000: failed to match any schema with compatible: ['fsl,ls1046a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: /soc/msi-controller@15a0000: failed to match any schema with compatible: ['fsl,ls1046a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: pcie_ep@3400000: compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: /soc/pcie_ep@3400000: failed to match any schema with compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: pcie_ep@3500000: compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: /soc/pcie_ep@3500000: failed to match any schema with compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: pcie_ep@3600000: compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
--
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,ls1046a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,ls1046a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,ls1046a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,ls1046a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls1046a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls1046a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/gpio@2330000: failed to match any schema with compatible: ['fsl,ls1046a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/gpio@2330000: failed to match any schema with compatible: ['fsl,ls1046a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('big-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: aux-bus: '#address-cells', '#size-cells', 'compatible', 'dma-ranges', 'ranges', 'sata@3200000', 'usb@2f00000', 'usb@3000000', 'usb@3100000' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/dp-aux-bus.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: aux-bus: 'panel' is a required property
   	from schema $id: http://devicetree.org/schemas/display/dp-aux-bus.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/aux-bus/sata@3200000: failed to match any schema with compatible: ['fsl,ls1046a-ahci']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/msi-controller@1580000: failed to match any schema with compatible: ['fsl,ls1046a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/msi-controller@1590000: failed to match any schema with compatible: ['fsl,ls1046a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/msi-controller@15a0000: failed to match any schema with compatible: ['fsl,ls1046a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: pcie_ep@3400000: compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/pcie_ep@3400000: failed to match any schema with compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: pcie_ep@3500000: compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/pcie_ep@3500000: failed to match any schema with compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: pcie_ep@3600000: compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
--
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,ls1046a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,ls1046a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,ls1046a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc/gpio@2310000: failed to match any schema with compatible: ['fsl,ls1046a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls1046a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc/gpio@2320000: failed to match any schema with compatible: ['fsl,ls1046a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc/gpio@2330000: failed to match any schema with compatible: ['fsl,ls1046a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc/gpio@2330000: failed to match any schema with compatible: ['fsl,ls1046a-gpio', 'fsl,qoriq-gpio']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('big-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: aux-bus: '#address-cells', '#size-cells', 'compatible', 'dma-ranges', 'ranges', 'sata@3200000', 'usb@2f00000', 'usb@3000000', 'usb@3100000' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/dp-aux-bus.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: aux-bus: 'panel' is a required property
   	from schema $id: http://devicetree.org/schemas/display/dp-aux-bus.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc/aux-bus/sata@3200000: failed to match any schema with compatible: ['fsl,ls1046a-ahci']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc/msi-controller@1580000: failed to match any schema with compatible: ['fsl,ls1046a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc/msi-controller@1590000: failed to match any schema with compatible: ['fsl,ls1046a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc/msi-controller@15a0000: failed to match any schema with compatible: ['fsl,ls1046a-msi']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: pcie_ep@3400000: compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc/pcie_ep@3400000: failed to match any schema with compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: pcie_ep@3500000: compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc/pcie_ep@3500000: failed to match any schema with compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: pcie_ep@3600000: compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep'] is too long

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
