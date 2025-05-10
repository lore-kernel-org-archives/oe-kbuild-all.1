Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7F11A2C27
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 May 2025 11:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746876792; cv=none; b=QJWljWCTWINjwPZ7RBTtDRCMiQ8E4OaZ/HSyRk+23mAmqTYrGmOfuUqMqwZDvNKysrKBvNn8nuNnSmCxtuUUP67c10r6GgpNuIahshFPVt4g3z2TRDvlIrr8K+Al3N3CzdZ2aE/j4RrmHe3DoL5pO9qSXcD5MkERIPUUUvLOGUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746876792; c=relaxed/simple;
	bh=wb9P2hA3kNmJeJY1ODC4CCOog+9i9p93RBbh9DZ0s4k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CSUhQEd2hReCUai6i3zokkkVqy597jKWNI43WEFlinGn+Cd3sKNWd/f+LRFQe8Oqsoem8PGtTGuQRPtZAwwFIeP12xVDxRUnu5LiAvPqhrjlRx31xE90tVI0Owbago3+debCRz48YA90aiHHH/uevO3U0i4aOCM3t8DRwTvK+jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QeXU4xMA; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QeXU4xMA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746876791; x=1778412791;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wb9P2hA3kNmJeJY1ODC4CCOog+9i9p93RBbh9DZ0s4k=;
  b=QeXU4xMAA5eOi8uNEY7rKGBY3Rf4lM0dstvNIoMBoQlcZDwYwUhJNqWd
   d9vPkDwdWeC8uiBWM8PpfchgYafMaOTzdqXRlfdTWr6Hl+/6LwTlUMEKI
   vdtQzvmK5+JjODxomcLKuGNAAG75NeKlOuCoc2g12ux4+ZWHnvSpu/ZOo
   mFx6vbUM3Dh6alO2637s/FNo2w0xBFuik0EEEJjf82VsbzNiUFVAIY72u
   OcPv9aapsHGef0pMBOSD03ICViZEAKQazOEIYjR/aBhKaZIaQFlHw7T7Z
   TB1A8glkwWzt/jht+LNF3VVALh+4vDB+OIr2W6AAvwJx4AyeyfH4aYu0L
   A==;
X-CSE-ConnectionGUID: 9Nr8/Oj0TpChQ08Lg7vRHg==
X-CSE-MsgGUID: IZw+6bXMQySoTy6UJ0Sp2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48789531"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="48789531"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 04:33:10 -0700
X-CSE-ConnectionGUID: W7kV/y1HRVOvTpZKrIwjyg==
X-CSE-MsgGUID: TWfbS2LVRXGXl/kPAtS83w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="141632194"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 May 2025 04:33:08 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDiS2-000D2b-0i;
	Sat, 10 May 2025 11:33:06 +0000
Date: Sat, 10 May 2025 19:32:48 +0800
From: kernel test robot <lkp@intel.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 8524/8679]
 arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dtb:
 clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required
 property
Message-ID: <202505101901.jwcikP7f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ed61cb3d78d585209ec775933078e268544fe9a4
commit: b2a1a3be6ec954eecb97185fbc54ad033cfbcab6 [8524/8679] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git
config: arm64-randconfig-051-20250506 (https://download.01.org/0day-ci/archive/20250510/202505101901.jwcikP7f-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250510/202505101901.jwcikP7f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505101901.jwcikP7f-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[35], [36], [37], [38], [39], [40]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[44], [45], [46], [47], [48], [49]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[44], [45], [46], [47], [48], [49]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-evk-pcie-ep.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-evk-pcie-ep.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-evk-pcie-ep.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-evk-pcie-ep.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[26], [27], [28], [29], [30], [31]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-evk-pcie-ep.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-evk-pcie-ep.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[26], [27], [28], [29], [30], [31]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-evkb-pcie-ep.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-evkb-pcie-ep.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-evkb-pcie-ep.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-evkb-pcie-ep.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[26], [27], [28], [29], [30], [31]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-evkb-pcie-ep.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-evkb-pcie-ep.dtb: clock-controller@30380000 (fsl,imx8mm-ccm): clocks: [[26], [27], [28], [29], [30], [31]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mq-evk-pcie1-ep.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#
>> arch/arm64/boot/dts/freescale/imx8mq-evk-pcie1-ep.dtb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-anatop.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
