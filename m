Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463834689
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Jul 2025 06:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752821395; cv=none; b=RQ80kh3NFP8B2O0S+568FGFw9gxhC4lmBhDsz/Jkb3Y0r4W2i3FIjYnHAnR+7doVMIZ2FUZJV2KMV0hGKgOPIf5JdftdoHC8LEuOudn5MpgjnJFR8fIGq9K8w78un0vow/1FoxjghpU2gUl0r56ualTYN4OtZNG0j+sQRFl/4Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752821395; c=relaxed/simple;
	bh=19wm32Goc4iEuXrJ+dOshk7TtY5Nu6HpvP94HO77t+w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f/GC6VYa0l0ZbZ3bpahsMyOQA5ssT/j+4S4qjBUiGCHh1Cl1aXw4aP1JORN0aNihrGrapf8wvsuJ+dfVupqwCkOp6rZAzeIFQQHy5sBPIeWjZqqx07aqMH32aS4OlQenr2mPbeDcasVpJpYBkuij9erF6F84yoeU/sWvIerMmUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iWOICwNI; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iWOICwNI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752821393; x=1784357393;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=19wm32Goc4iEuXrJ+dOshk7TtY5Nu6HpvP94HO77t+w=;
  b=iWOICwNISoKb0yHBUluIWsOjqz6JWMZ77z0kg31i+54saor3J248xHgj
   X6TQLU3wUeudG0sDwu9yQVtbiYopSF4o3zOjVyfJGLPUIgcy6iN4ub02f
   kfr0zw25jwbgPPBO7pfqP4Se1EOSdhL8XdEvVS4eq+myOsrebC9qJVCn1
   kXQ3Eh9a9Xf3f3NbYwOgMZUzzzScXKSuXkfmUjuo6/YHANHvDhdOmrExe
   rG/8H6X8n2yiA2NGrjyVOHCK0zs6KZ2ipxXZ2IwfQWg8XY6kxiNjHsKeZ
   DYQrx76F9eImvgk30/NsLNBEcncV6efFM+QyauCvpERIpiyupfWogGTZF
   w==;
X-CSE-ConnectionGUID: JTjVvSRpSvyYn5njm3sVyw==
X-CSE-MsgGUID: rx0yoaQ8RlC8wTPI7rQVyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="65683565"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="65683565"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 23:49:53 -0700
X-CSE-ConnectionGUID: 56J6zM4oTSuM5PV3AeNt7Q==
X-CSE-MsgGUID: Fgm04v3OQcO2DfW+CEBmVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="188968277"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by fmviesa001.fm.intel.com with ESMTP; 17 Jul 2025 23:49:51 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uceuj-0000qf-0Q;
	Fri, 18 Jul 2025 06:49:49 +0000
Date: Fri, 18 Jul 2025 08:48:51 +0200
From: kernel test robot <lkp@intel.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: [linux-next:master 5398/10823]
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: phy@4c1f0040
 (fsl,imx95-usb-phy): Unevaluated properties are not allowed
 ('fsl,phy-pcs-tx-deemph-3p5db-attenuation-db' was unexpected)
Message-ID: <202507180830.CXYu0zry-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb
commit: 04c9dd9c7d19c44c2290373129793213a198552c [5398/10823] arm64: dts: imx95-evk: add USB3 PHY tuning properties
config: arm64-randconfig-2052-20250717 (https://download.01.org/0day-ci/archive/20250718/202507180830.CXYu0zry-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507180830.CXYu0zry-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507180830.CXYu0zry-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): Unevaluated properties are not allowed ('fsl,phy-pcs-tx-deemph-3p5db-attenuation-db' was unexpected)
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
   arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/property-units.yaml#
--
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): Unevaluated properties are not allowed ('fsl,phy-pcs-tx-deemph-3p5db-attenuation-db' was unexpected)
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/property-units.yaml#
--
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts:54.18-57.4: Warning (unique_unit_address_if_enabled): /memory@80000000: duplicate unit-address (also used in node /cm7-cpu@80000000)
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): Unevaluated properties are not allowed ('fsl,phy-pcs-tx-deemph-3p5db-attenuation-db' was unexpected)
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/property-units.yaml#
--
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
   arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): Unevaluated properties are not allowed ('fsl,phy-pcs-tx-deemph-3p5db-attenuation-db' was unexpected)
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/property-units.yaml#
--
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): Unevaluated properties are not allowed ('fsl,phy-pcs-tx-deemph-3p5db-attenuation-db' was unexpected)
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/property-units.yaml#
--
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): Unevaluated properties are not allowed ('fsl,phy-pcs-tx-deemph-3p5db-attenuation-db' was unexpected)
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/property-units.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
