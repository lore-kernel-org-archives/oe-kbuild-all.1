Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF642E9729
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Mar 2026 01:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772588187; cv=none; b=qIlVz4y42t6Ot6kMmNiOK4B4U8HHk85dFcIeLrj9t/pVkNgwjT/fTc70dDfEJ8DAc1XBrlRLi7Db7y6ky2s2JbYlsgblcZY0HuUaEuYQfvcxnFbJZAYx70K7Yu3nlsK1K0NhkeDR1OapmkgNPN0HJWozvMD/cGclSpmWr9bcyoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772588187; c=relaxed/simple;
	bh=rl8OfCIdGfpKHHwceFRdlOiIlPu40TrK2/LQRJdV6pE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZDuxF8t8pFHdDiRYwjdWG1/wyITpXNmvkli4yiZNldP8wmm2HRsA1QgEAbhvhVWjX8hXMmtYpE8PYwb0SKzDa2BL5yMJtu/qBNI7b63c+/2Ge0KE792wHibMy7T/E+z2ZQIgvUYnzxPe6Ec+UPjYGlPfe+jXSOpzjTD0ZxzGjd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J3bQfTCp; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J3bQfTCp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772588185; x=1804124185;
  h=date:from:to:cc:subject:message-id;
  bh=rl8OfCIdGfpKHHwceFRdlOiIlPu40TrK2/LQRJdV6pE=;
  b=J3bQfTCpf4EomIgAUVogXf7DvZaxUCoOShXXsNXI9cQs7W6M75wd1mxX
   4sJ5vwWtBEIakSOaEhRSRf9zChlbPLSzO3FTldznv3PHyfyZj8XWlBaUd
   skudIaCbJBh6U4NyEZx49IHUynVvMccAOV05T4vbqvLE+j7keHvws8Aim
   jsTQ+3MRlvGzH8fA3/FXRu9d9pBtIbOLOLbeI/4TjsjQpla8V2vM9XRd0
   eHA7SbZjpkGDFxmBHXtkrLoFhQ7hUgznzk6FJ10ZDpfqatLJP999w6kGY
   vdnTrP1l85uC0raepx/WKBT7IBJntwc326cB3OCIVKZ3HUi4i4EYEgDi5
   g==;
X-CSE-ConnectionGUID: 7c1E0DQJSO+rVXHZG6ApPQ==
X-CSE-MsgGUID: 5SJVrpEwR26zc3fA4xkW2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73608545"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="73608545"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 17:36:25 -0800
X-CSE-ConnectionGUID: 0cqlrx4pTXeOyypIEj/eTQ==
X-CSE-MsgGUID: tu3LPKu1Q7GRWfmp4/hH8w==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 03 Mar 2026 17:36:23 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxb9x-000000001an-2xcj;
	Wed, 04 Mar 2026 01:36:21 +0000
Date: Wed, 04 Mar 2026 02:35:39 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 1492/3431]
 arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb:
 /soc/emi-bus@80000000/nand-controller@bb000000: failed to match any schema
 with compatible: ['fsl,imx35-nand', 'fsl,imx25-nand']
Message-ID: <202603040215.kifxXLEJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c025f6cf4209e1542ec2afebe49f42bbaf1a5c7b
commit: c79cb42baf2ab1bbaac49cc46a3536af593e46c3 [1492/3431] ARM: dts: imx35: rename emi to emi-bus to fix CHECK_DTBS warning
config: arm-randconfig-2051-20260301 (https://download.01.org/0day-ci/archive/20260304/202603040215.kifxXLEJ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260304/202603040215.kifxXLEJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603040215.kifxXLEJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: i2c@43f80000 (fsl,imx35-i2c): clock-names:0: 'ipg' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-imx.yaml
   arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: i2c@43f84000 (fsl,imx35-i2c): clock-names:0: 'ipg' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-imx.yaml
   arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: i2c@43f98000 (fsl,imx35-i2c): clock-names:0: 'ipg' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-imx.yaml
>> arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: /soc/emi-bus@80000000/nand-controller@bb000000: failed to match any schema with compatible: ['fsl,imx35-nand', 'fsl,imx25-nand']
>> arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: /soc/emi-bus@80000000/nand-controller@bb000000: failed to match any schema with compatible: ['fsl,imx35-nand', 'fsl,imx25-nand']
   arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: nand-controller@bb000000 (fsl,imx35-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
   arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: usbphy (simple-bus): usb-phy@0:reg:0: [0] is too short
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: usbphy (simple-bus): usb-phy@1:reg:0: [1] is too short
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: usbphy (simple-bus): #size-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb: usbphy (simple-bus): $nodename:0: 'usbphy' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: i2c@43f80000 (fsl,imx35-i2c): clock-names:0: 'ipg' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-imx.yaml
   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: i2c@43f84000 (fsl,imx35-i2c): clock-names:0: 'ipg' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-imx.yaml
   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: i2c@43f98000 (fsl,imx35-i2c): clock-names:0: 'ipg' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-imx.yaml
>> arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: /soc/emi-bus@80000000/nand-controller@bb000000: failed to match any schema with compatible: ['fsl,imx35-nand', 'fsl,imx25-nand']
>> arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: /soc/emi-bus@80000000/nand-controller@bb000000: failed to match any schema with compatible: ['fsl,imx35-nand', 'fsl,imx25-nand']
   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: nand-controller@bb000000 (fsl,imx35-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml
   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: usbphy (simple-bus): usb-phy@0:reg:0: [0] is too short
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: usbphy (simple-bus): usb-phy@1:reg:0: [1] is too short
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: usbphy (simple-bus): #size-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: usbphy (simple-bus): $nodename:0: 'usbphy' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
