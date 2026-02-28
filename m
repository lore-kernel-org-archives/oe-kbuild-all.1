Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B68C212B0A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Feb 2026 17:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772299008; cv=none; b=F2fUvaLBqS94u1n3CryO8YUtUmizqOWv5T0pQYB/nVNzuMuYtn+x4/J/IiQHC3b78bU80xF8Ij5A9tdCLa82BJvJ9c8oMon+YcPvl79A8kAbexUb++yYXUkn9vRW8HHhpSuZvcavFHVuO61qGxEd8SEU8HDGHKNVjblTe4P+XTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772299008; c=relaxed/simple;
	bh=H272WLxmxCaHOvdzlXJqjL1gj0OUbpPaDu6J7hzbK8Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sdNBOuupCYjOCNIjPn8EDZXEacJBqpfG9Q3rwGE/YP+gUlEJyy9KQ8r4u+CQ/a8DqyU+fkMqVLLkRRO8rIWS5Y5WfM9JExpPH9LaMrKXeUHSv+PzLQRLEMnUH40FA9HzJSLPpI8twZHiTj9mb4+6tNnUw299wJ7QYV8mWKPXcVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dYGUnl9E; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dYGUnl9E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772299007; x=1803835007;
  h=date:from:to:cc:subject:message-id;
  bh=H272WLxmxCaHOvdzlXJqjL1gj0OUbpPaDu6J7hzbK8Y=;
  b=dYGUnl9EDE+ZzVQyNv7KmCIzOWL6t4UpXsqxcPWzpqGFZXxG0aPnjuxM
   /AuwJjoH4EwBKdL5IvmyXy7qk1mnFAAFWZqNAv2ORczSWuDu6t7pS4QLZ
   gAzDr9SNJCZC2GNOIg1OxZwf4dM0ty2m4CXagQhgHkJAZ/rF/7bqt2XeQ
   sqVKfFTxGQBkHOHGwZMDAIF2IU8AEl1mSiIXXXiz7jTg5RzZWHP1Hy/5/
   bieAOzmzaw1DMT2zLTBDyysI8cVlzMUehxMyTSZaRhEgU3UculisvN+AS
   34RdTNSiyhxAdQvMtniBcqi1hYDxIhFxdaQBEZIAwKnH6nPj0akOj39fa
   w==;
X-CSE-ConnectionGUID: BkgDDZq3QWmuMSwopYI1uA==
X-CSE-MsgGUID: ljzc6F+PS02AhLZqCJRpSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11715"; a="73547550"
X-IronPort-AV: E=Sophos;i="6.21,316,1763452800"; 
   d="scan'208";a="73547550"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2026 09:16:46 -0800
X-CSE-ConnectionGUID: kheidjjzTVmQXAOIJE/cMg==
X-CSE-MsgGUID: FE7t/U01RyGJHkOm3EoRKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,316,1763452800"; 
   d="scan'208";a="255026262"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 28 Feb 2026 09:16:45 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwNvm-000000000pt-2odY;
	Sat, 28 Feb 2026 17:16:42 +0000
Date: Sat, 28 Feb 2026 18:16:27 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-riscv64 1/1]
 arch/arm/boot/dts/nxp/imx/imx53-qsb.dtb: dialog@48 (dlg,da9053-aa):
 compatible: ['dlg,da9053-aa', 'dlg,da9052'] is too long
Message-ID: <202602281809.pnMXcb64-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android-mainline-riscv64
head:   b4e4071547d6a04da97c3d875dd2f73ef3300ad5
commit: d2b240f9a180ebd63477d0534633f22e16fe41ad [1/1] dt-bindings: mfd: Convert dlg,da9052-i2c.txt to yaml format
config: arm-randconfig-2051-20260227 (https://download.01.org/0day-ci/archive/20260228/202602281809.pnMXcb64-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260228/202602281809.pnMXcb64-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602281809.pnMXcb64-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/imx/imx53.dtsi:461.29-464.6: Warning (unique_unit_address_if_enabled): /soc/bus@50000000/pinctrl@53fa8000: duplicate unit-address (also used in node /soc/bus@50000000/iomuxc-gpr@53fa8000)
>> arch/arm/boot/dts/nxp/imx/imx53-qsb.dtb: dialog@48 (dlg,da9053-aa): compatible: ['dlg,da9053-aa', 'dlg,da9052'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/dlg,da9052.yaml
   arch/arm/boot/dts/nxp/imx/imx53-qsb.dtb: /soc/bus@60000000/nand-controller@63fdb000: failed to match any schema with compatible: ['fsl,imx53-nand']
   arch/arm/boot/dts/nxp/imx/imx53-qsb.dtb: /soc/bus@60000000/tve@63ff0000: failed to match any schema with compatible: ['fsl,imx53-tve']
   arch/arm/boot/dts/nxp/imx/imx53-qsb.dtb: panel (sii,43wvf1g): 'dvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/seiko,43wvf1g.yaml
   arch/arm/boot/dts/nxp/imx/imx53-qsb.dtb: panel (sii,43wvf1g): 'avdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/seiko,43wvf1g.yaml
--
   arch/arm/boot/dts/nxp/imx/imx53.dtsi:461.29-464.6: Warning (unique_unit_address_if_enabled): /soc/bus@50000000/pinctrl@53fa8000: duplicate unit-address (also used in node /soc/bus@50000000/iomuxc-gpr@53fa8000)
>> arch/arm/boot/dts/nxp/imx/imx53-voipac-bsb.dtb: dialog@48 (dlg,da9053-aa): compatible: ['dlg,da9053-aa', 'dlg,da9052'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/dlg,da9052.yaml
   arch/arm/boot/dts/nxp/imx/imx53-voipac-bsb.dtb: /soc/bus@60000000/nand-controller@63fdb000: failed to match any schema with compatible: ['fsl,imx53-nand']
   arch/arm/boot/dts/nxp/imx/imx53-voipac-bsb.dtb: nand-controller@63fdb000 (fsl,imx53-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
   arch/arm/boot/dts/nxp/imx/imx53-voipac-bsb.dtb: nand-controller@63fdb000 (fsl,imx53-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
   arch/arm/boot/dts/nxp/imx/imx53-voipac-bsb.dtb: /soc/bus@60000000/tve@63ff0000: failed to match any schema with compatible: ['fsl,imx53-tve']
--
>> arch/arm/boot/dts/nxp/imx/imx53-qsb-hdmi.dtb: dialog@48 (dlg,da9053-aa): compatible: ['dlg,da9053-aa', 'dlg,da9052'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/dlg,da9052.yaml
   arch/arm/boot/dts/nxp/imx/imx53-qsb-hdmi.dtb: /soc/bus@60000000/nand-controller@63fdb000: failed to match any schema with compatible: ['fsl,imx53-nand']
   arch/arm/boot/dts/nxp/imx/imx53-qsb-hdmi.dtb: /soc/bus@60000000/tve@63ff0000: failed to match any schema with compatible: ['fsl,imx53-tve']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
