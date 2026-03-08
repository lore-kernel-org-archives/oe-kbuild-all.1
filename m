Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E0628C871
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Mar 2026 05:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772947700; cv=none; b=CT/CysqKa6332Xx3V+U7LZ7PDqWOe/W98g15WK02VrnNVM8wpYi1Ib/mB3+oR9zXcWVWZFRKsBpXR2AisakP0ihPzgQpxMBB5ZKf7d6bxS1lXBQET9OBP9PvDG1RbVK3lO3zfi3FZp+MMfOwCrredE1vWhUI+0NCzN05UKeumiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772947700; c=relaxed/simple;
	bh=aIJ2QVEN73RtedGo59+451gw2ars9ubaXrdxo12cczU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R6sj//tvoWTNyOgQycuKk6k0RCuAWZf+E3CmHLJyztA9ZNVQXqgymwSfCJTJc1TwMzpv1vbz3Oxw3CYh70KjUuatKDEaoopkpERhig6nPQlRJNO21LMaC3ubioptOZ2e0jSu5Bld7neZlMqaFMycIYRvaBjE483YpW0f58gcEuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D5/uqooA; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D5/uqooA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772947700; x=1804483700;
  h=date:from:to:cc:subject:message-id;
  bh=aIJ2QVEN73RtedGo59+451gw2ars9ubaXrdxo12cczU=;
  b=D5/uqooAZ0najCUoKv61Ytbe1Q+mfXQNLOkkBsl4B1xH3sRINx1GuyRU
   tNOo6t7gv55dCq5VI3SXy8R5nVNKkQtFnMgCGr3C2q0+Ioh7T76I9mLCf
   xp7v5ruXp5Bdop3tz7sEQop0sM7UtnMEXdFY2PwVAhBv6AwEcHIvGbrr4
   yflPANHFv0iazQvCotERnCV6JIOm6lX87ek3YMtuJUyP8o4aOoMwtoYTE
   lZ5f6FJ+/q0u9OcH/zhW+GmYB31r1hx888Be0f42SBXZSxGLSJfIJjnbE
   WZXXfX0mtS5iY5MUJbm+vzz1cONvynRiKBgQ6pdzdV45NzjzZIFAJhU9B
   g==;
X-CSE-ConnectionGUID: z5Vcv0PnSf66iwxiYMkOmA==
X-CSE-MsgGUID: MQbUqabeT9m6gDocZwIykA==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="73702826"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="73702826"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 21:28:19 -0800
X-CSE-ConnectionGUID: Ozrao5iRQPS0UiRlGXq6yQ==
X-CSE-MsgGUID: MWvoElbUSlGu1ZQD0xFoiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="249891211"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 07 Mar 2026 21:28:18 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vz6gY-000000002dJ-2wYU;
	Sun, 08 Mar 2026 05:28:14 +0000
Date: Sun, 08 Mar 2026 06:27:30 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 3/3]
 arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb:
 /soc/bus@d0000000/pinctrl@13800: failed to match any schema with compatible:
 ['marvell,armada3710-nb-pinctrl', 'syscon', 'simple-mfd']
Message-ID: <202603080635.9xWuB8Qa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   db15f4990be1b8865ae651c9d748d43c91bb9d13
commit: 0b738a2901f43980fc2307a50a26457be1c8030b [3/3] arm64: dts: marvell: add dts for RIPE Atlas Probe v5
config: arm64-randconfig-2052-20260226 (https://download.01.org/0day-ci/archive/20260308/202603080635.9xWuB8Qa-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603080635.9xWuB8Qa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603080635.9xWuB8Qa-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: /soc/bus@d0000000/watchdog@8300: failed to match any schema with compatible: ['marvell,armada-3700-wdt']
>> arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: /soc/bus@d0000000/pinctrl@13800: failed to match any schema with compatible: ['marvell,armada3710-nb-pinctrl', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: pinctrl@13800 (marvell,armada3710-nb-pinctrl): reg: [[79872, 256], [80896, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
>> arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: /soc/bus@d0000000/pinctrl@13800/xtal-clk: failed to match any schema with compatible: ['marvell,armada-3700-xtal-clock']
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: phy@18300 (marvell,comphy-a3700): False schema does not allow ['xtal']
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: phy@18300 (marvell,comphy-a3700): False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: phy@18300 (marvell,comphy-a3700): clock-names:0: 'mg_clk' was expected
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: phy@18300 (marvell,comphy-a3700): clock-names: ['xtal'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: phy@18300 (marvell,comphy-a3700): clocks: [[4]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml
>> arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: /soc/bus@d0000000/pinctrl@18800: failed to match any schema with compatible: ['marvell,armada3710-sb-pinctrl', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: pinctrl@18800 (marvell,armada3710-sb-pinctrl): reg: [[100352, 256], [101376, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: /soc/bus@d0000000/system-controller@5d800: failed to match any schema with compatible: ['marvell,armada-3700-usb2-host-device-misc', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: usb@5e000 (marvell,armada-3700-ehci): phy-names:0: 'usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: /soc/bus@d0000000/mailbox@b0000: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-mailbox']
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: mmc@d8000 (marvell,armada-3700-sdhci): Unevaluated properties are not allowed ('marvell,xenon-emmc' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: pcie@d0070000 (marvell,armada-3700-pcie): interrupt-controller: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pci/marvell,armada-3700-pcie.yaml
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware', 'cznic,turris-mox-rwtm']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
