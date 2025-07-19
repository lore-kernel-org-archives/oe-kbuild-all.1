Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405D716DEB3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Jul 2025 17:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752947755; cv=none; b=BcjUSPoMA+ydul4If0wsRshpxbNOProPG1UbdojxLxeKom/wmdsFV20YHHffmVB3TUqAs7Q/EdZcyJ0AQ086+jab5LQ+NMirCf9DztFbSM1v5aWmJvEtsfmu5W0f/alt1ANus0/AWAhlfvVhGg/rza5SOZuP4Xzy/IqggM+O/AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752947755; c=relaxed/simple;
	bh=IAndQ5F89q+usGozEPVdJ1gwWVwyTpVhG5S/dXgSHDk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z6r+yTJcjZBG/ZTJ5KqmKp6SVrXbRbm5DCV72zqwO2/iLVxHw7nEOAootq0OyEnJEHwhWv3DNR6A8xjz1r6XQNsRD/lbhB8DwXq3Y7Of/qA7t4gfGOWI6+k0UfX6G9jvh8Q3V9HSqzlOmpAvSqcaq09z12xkzmtvTZkR40WBS3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oKnRyh1Z; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oKnRyh1Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752947753; x=1784483753;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IAndQ5F89q+usGozEPVdJ1gwWVwyTpVhG5S/dXgSHDk=;
  b=oKnRyh1ZgidI0AtTp0A9v1pcr88tKhIGxu10PToZ26S7jtqB9wam+6NI
   OXJKNy2XsV03iXelAQDDct1ZBFT+eOs3DCL6fZ2gAxZxDiuSd+wiiEcln
   e1sJ7WIfwxwJVmE5jV+nfeO0b4Vdrj0zqrQDdP20iLkivPhG3mMbF4zgs
   ACfAc7I7rKmqwFp5mm2aiW2W8DWYrfVvRgYtdidiuGiAyMwY0GFAWGuen
   J0H3qjPE9IBnjEwrg6MLxEp1g1kPQdZhGwZPtbG4VXNkPEIcExFuCis8S
   /3Toe0cIcPgA6cH5Vs4cGRk/HHaNz7JOTud3THSwOKYDi4VKntnfsbYTV
   A==;
X-CSE-ConnectionGUID: +i4zioVrTKemw3c7hqtMqQ==
X-CSE-MsgGUID: iKOAYzIDTLinGuG2Kyqxxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11497"; a="54928327"
X-IronPort-AV: E=Sophos;i="6.16,324,1744095600"; 
   d="scan'208";a="54928327"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2025 10:55:52 -0700
X-CSE-ConnectionGUID: cZTelT/NQ865VFJ7hbGHTQ==
X-CSE-MsgGUID: 1jb3/RHIStqUGG7BEwEA9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,324,1744095600"; 
   d="scan'208";a="158579168"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by orviesa007.jf.intel.com with ESMTP; 19 Jul 2025 10:55:51 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udBmm-00018f-2K;
	Sat, 19 Jul 2025 17:55:48 +0000
Date: Sat, 19 Jul 2025 19:55:10 +0200
From: kernel test robot <lkp@intel.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: [linux-next:master 5388/11307]
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: phy@4c1f0040
 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not
 of type 'array'
Message-ID: <202507191945.DjTsT5El-lkp@intel.com>
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
commit: 04c9dd9c7d19c44c2290373129793213a198552c [5388/11307] arm64: dts: imx95-evk: add USB3 PHY tuning properties
config: arm64-randconfig-2051-20250717 (https://download.01.org/0day-ci/archive/20250719/202507191945.DjTsT5El-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507191945.DjTsT5El-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507191945.DjTsT5El-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
   arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): Unevaluated properties are not allowed ('fsl,phy-pcs-tx-deemph-3p5db-attenuation-db' was unexpected)
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/property-units.yaml#
--
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): Unevaluated properties are not allowed ('fsl,phy-pcs-tx-deemph-3p5db-attenuation-db' was unexpected)
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/property-units.yaml#
--
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts:54.18-57.4: Warning (unique_unit_address_if_enabled): /memory@80000000: duplicate unit-address (also used in node /cm7-cpu@80000000)
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): Unevaluated properties are not allowed ('fsl,phy-pcs-tx-deemph-3p5db-attenuation-db' was unexpected)
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/property-units.yaml#
--
   arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): Unevaluated properties are not allowed ('fsl,phy-pcs-tx-deemph-3p5db-attenuation-db' was unexpected)
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
   arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/property-units.yaml#
--
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): Unevaluated properties are not allowed ('fsl,phy-pcs-tx-deemph-3p5db-attenuation-db' was unexpected)
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/property-units.yaml#
--
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): Unevaluated properties are not allowed ('fsl,phy-pcs-tx-deemph-3p5db-attenuation-db' was unexpected)
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/property-units.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
