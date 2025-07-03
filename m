Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB2E29D19
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Jul 2025 23:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751586218; cv=none; b=BrEh/HT9E8Ql8CVllzT33NWhHWgi1XIJHSdAGDG8CdepN/m7BOgQYBKQYk6IYO0bka9vpDrxnnWXmYGGH9TEZue11XnrTjYfzi1O+mmaE2XvAf9CSf9oaTzml1ME/AydINrFl/C3qy2rKT145XpLYKt4Pur+qbwecYs5xnfVF/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751586218; c=relaxed/simple;
	bh=hTFrotEZ7T4Jl5v2ZNTUUci8ofOeB+NPr5KBwe6ldd8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xh4qNlLdTP6FNk0gINDC05nDj1/9drqynNozBHQcZELGiqIWAtDp6PzFcXjS75oNQwA2xrswqwQUapdCyihen7IyBMyoYzI2uK4Re10513nvXMW6e4NDT4Dr/ON7NkUgAL2YjkTGjasLB7by2RYVWceAJsGpjF6hfLDPPBfwxAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FtPbVtJn; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FtPbVtJn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751586217; x=1783122217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hTFrotEZ7T4Jl5v2ZNTUUci8ofOeB+NPr5KBwe6ldd8=;
  b=FtPbVtJn5aCilqjRjapO+8VyVCfrOVhwgdfBVlOdH2MsxSpz1yapEJ1v
   xAyXoNXqUffVsDgHcsMyEFV8EB0QL2MYDugJti+g71QaomH8r5SvQqT9b
   c3c8GPE6ooyvzyR2wAfWvMdViiqiR/aXjO8zfEuUza77w91/W57JFIW52
   iByRu+Maonio6yFw0+PFdz+UDf6xJywXsAPhhjtAJQsdpoyYZllefdaQn
   lDLyDXXajQIcPqh91KesaoxDC1TAL0UNyplCGrz+k/4jzVsGws7N5KyGv
   6aNDiAU7BKTfSwvyWsqpCAF3Zid5uQ52pD1DjF8E5Gy3VcI1iB4p/q9An
   A==;
X-CSE-ConnectionGUID: ZebH8PvzTI+bM4W0vbHCcw==
X-CSE-MsgGUID: QKx8OsMDQ1GF7Xeg4OwqhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="65272189"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="65272189"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 16:43:35 -0700
X-CSE-ConnectionGUID: HC5sfiNWRjy2EvrCT79DKw==
X-CSE-MsgGUID: 61y2r498ROG5Gw7ootwpoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="154586122"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Jul 2025 16:43:34 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXTaV-00037P-13;
	Thu, 03 Jul 2025 23:43:31 +0000
Date: Fri, 4 Jul 2025 07:42:45 +0800
From: kernel test robot <lkp@intel.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: [linux-next:master 6024/7039]
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: phy@4c1f0040
 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not
 of type 'array'
Message-ID: <202507040730.OxedSKJE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8d6c58332c7a8ba025fcfa76888b6c37dbce9633
commit: 04c9dd9c7d19c44c2290373129793213a198552c [6024/7039] arm64: dts: imx95-evk: add USB3 PHY tuning properties
config: arm64-randconfig-051-20250703 (https://download.01.org/0day-ci/archive/20250704/202507040730.OxedSKJE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507040730.OxedSKJE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507040730.OxedSKJE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): Unevaluated properties are not allowed ('fsl,phy-pcs-tx-deemph-3p5db-attenuation-db' was unexpected)
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/property-units.yaml#
--
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): Unevaluated properties are not allowed ('fsl,phy-pcs-tx-deemph-3p5db-attenuation-db' was unexpected)
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/property-units.yaml#
--
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts:54.18-57.4: Warning (unique_unit_address_if_enabled): /memory@80000000: duplicate unit-address (also used in node /cm7-cpu@80000000)
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): Unevaluated properties are not allowed ('fsl,phy-pcs-tx-deemph-3p5db-attenuation-db' was unexpected)
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/property-units.yaml#
--
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): Unevaluated properties are not allowed ('fsl,phy-pcs-tx-deemph-3p5db-attenuation-db' was unexpected)
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/property-units.yaml#
--
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): Unevaluated properties are not allowed ('fsl,phy-pcs-tx-deemph-3p5db-attenuation-db' was unexpected)
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/property-units.yaml#
--
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): Unevaluated properties are not allowed ('fsl,phy-pcs-tx-deemph-3p5db-attenuation-db' was unexpected)
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/property-units.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
