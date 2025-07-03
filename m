Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A7227A904
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Jul 2025 06:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751523705; cv=none; b=IHo2gfuxx3NhVTeXkl6KIuEdKPTCJ8UMNMY74ravWKqNLpK4JMHgTySxEv3YX7PiJsm91lJJtEJWiKBkECokY9BaNLRj8TY1Lxzcian3x+7Fciv6UkQSeaZAsUjtDcW3DECncFXpF+TAuBExFxF6BVRx93sq4GfVvRQkOuhwSfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751523705; c=relaxed/simple;
	bh=KU/70ZeXKOzIymMoHtvJYrDgybxF5WUNMmXggO4p270=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UEbvZz4eTYtuVfvvK7JQi0x7JCvJoS8y8jp397DDWFg3JQRVDAPYl/vYDi0tmsoPivyf43dBeLdDCQvJO/1wvcnSoEiNghfbsc7f56JE0se/BG4d4Vw9/5mDvPNg6iVS5E4qJ5RhNo+4H62d4ZZv9d6N1Q5LltC8BmruoydW6U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ayr6rG08; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ayr6rG08"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751523702; x=1783059702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KU/70ZeXKOzIymMoHtvJYrDgybxF5WUNMmXggO4p270=;
  b=ayr6rG08A4UlPGi3hdKs+qHn/qPsm/9+21EEaj+HaA7NvL9ewi/c1ZwJ
   GVfIGCFn5LfEVTUpoVKNK+F/NYBYDkRDwzMBkt4AcpxX4L5de/VELnSXj
   Te1fK6RFPjFFCP/k/z4d55BO1ptTgDOCPvYKksPO1oq/YZmgq49ZfZ31d
   E5mSlWLbetsR8P2n4TpxJEbJYdSDMxVZRkxpPeFoGmbrWvhswby1RuIQx
   gyi3ACJKR6XF5Uqce9cRfWS0XWY9LFNelxLj4QKO2/xLvMez7xk2NSaZS
   wH3K2ZqP67pMdJAxz8VrJyyR/NC+9QlOF/hNEu34fpiOZnVbBQWKDni6P
   A==;
X-CSE-ConnectionGUID: MtN7jWfFRZiY/o8vpk9ouQ==
X-CSE-MsgGUID: YYhBjWKHQMqpDDHdb1FBTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64885445"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="64885445"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 23:21:41 -0700
X-CSE-ConnectionGUID: NdToWYFBQ+6hmOGeAsFdSQ==
X-CSE-MsgGUID: twrnuuzHTTaTUrf7PiNTxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="154634041"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by fmviesa009.fm.intel.com with ESMTP; 02 Jul 2025 23:21:38 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXDKB-0000QX-33;
	Thu, 03 Jul 2025 06:21:35 +0000
Date: Thu, 3 Jul 2025 08:20:56 +0200
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [linux-next:master 2012/6007]
 arch/arm/boot/dts/marvell/armada-381-netgear-gs110emx.dtb: phy@18300
 (marvell,armada-380-comphy): phy@2:reg:0:0: 2 is greater than the maximum of
 1
Message-ID: <202507030828.NiGXw9ep-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1343433ed38923a21425c602e92120a1f1db5f7a
commit: a5aa04619e715adda36ca5a97cae4c48bad8d65b [2012/6007] dt-bindings: phy: Convert marvell,armada-380-comphy to DT schema
config: arm-randconfig-2053-20250625 (https://download.01.org/0day-ci/archive/20250703/202507030828.NiGXw9ep-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250703/202507030828.NiGXw9ep-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507030828.NiGXw9ep-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'marvell,armada-38x-uart' is not one of ['mrvl,mmp-uart', 'spacemit,k1-uart']
   	'marvell,armada-38x-uart' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/marvell/armada-381-netgear-gs110emx.dtb: /soc/internal-regs/serial@12100: failed to match any schema with compatible: ['marvell,armada-38x-uart', 'ns16550a']
   arch/arm/boot/dts/marvell/armada-381-netgear-gs110emx.dtb: /soc/internal-regs/pinctrl@18000: failed to match any schema with compatible: ['marvell,mv88f6820-pinctrl']
   arch/arm/boot/dts/marvell/armada-381-netgear-gs110emx.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-380-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-381-netgear-gs110emx.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-380-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-381-netgear-gs110emx.dtb: /soc/internal-regs/clock-gating-control@18220: failed to match any schema with compatible: ['marvell,armada-380-gating-clock']
>> arch/arm/boot/dts/marvell/armada-381-netgear-gs110emx.dtb: phy@18300 (marvell,armada-380-comphy): phy@2:reg:0:0: 2 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-381-netgear-gs110emx.dtb: phy@18300 (marvell,armada-380-comphy): phy@3:reg:0:0: 3 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-381-netgear-gs110emx.dtb: phy@18300 (marvell,armada-380-comphy): phy@4:reg:0:0: 4 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-381-netgear-gs110emx.dtb: phy@18300 (marvell,armada-380-comphy): phy@5:reg:0:0: 5 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-381-netgear-gs110emx.dtb: /soc/internal-regs/mvebu-sar@18600: failed to match any schema with compatible: ['marvell,armada-380-core-clock']
   arch/arm/boot/dts/marvell/armada-381-netgear-gs110emx.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/armada-381-netgear-gs110emx.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-380-wdt']
--
   	'marvell,armada-38x-uart' is not one of ['mrvl,mmp-uart', 'spacemit,k1-uart']
   	'marvell,armada-38x-uart' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/marvell/armada-382-rd-ac3x-48g4x2xl.dtb: /soc/internal-regs/serial@12100: failed to match any schema with compatible: ['marvell,armada-38x-uart', 'ns16550a']
   arch/arm/boot/dts/marvell/armada-382-rd-ac3x-48g4x2xl.dtb: /soc/internal-regs/pinctrl@18000: failed to match any schema with compatible: ['marvell,mv88f6820-pinctrl']
   arch/arm/boot/dts/marvell/armada-382-rd-ac3x-48g4x2xl.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-380-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-382-rd-ac3x-48g4x2xl.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-380-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-382-rd-ac3x-48g4x2xl.dtb: /soc/internal-regs/clock-gating-control@18220: failed to match any schema with compatible: ['marvell,armada-380-gating-clock']
>> arch/arm/boot/dts/marvell/armada-382-rd-ac3x-48g4x2xl.dtb: phy@18300 (marvell,armada-380-comphy): phy@2:reg:0:0: 2 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-382-rd-ac3x-48g4x2xl.dtb: phy@18300 (marvell,armada-380-comphy): phy@3:reg:0:0: 3 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-382-rd-ac3x-48g4x2xl.dtb: phy@18300 (marvell,armada-380-comphy): phy@4:reg:0:0: 4 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-382-rd-ac3x-48g4x2xl.dtb: phy@18300 (marvell,armada-380-comphy): phy@5:reg:0:0: 5 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-382-rd-ac3x-48g4x2xl.dtb: /soc/internal-regs/mvebu-sar@18600: failed to match any schema with compatible: ['marvell,armada-380-core-clock']
   arch/arm/boot/dts/marvell/armada-382-rd-ac3x-48g4x2xl.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/armada-382-rd-ac3x-48g4x2xl.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-380-wdt']
--
   	'marvell,armada-38x-uart' is not one of ['mrvl,mmp-uart', 'spacemit,k1-uart']
   	'marvell,armada-38x-uart' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/marvell/armada-385-atl-x530.dtb: /soc/internal-regs/serial@12100: failed to match any schema with compatible: ['marvell,armada-38x-uart', 'ns16550a']
   arch/arm/boot/dts/marvell/armada-385-atl-x530.dtb: /soc/internal-regs/pinctrl@18000: failed to match any schema with compatible: ['marvell,mv88f6820-pinctrl']
   arch/arm/boot/dts/marvell/armada-385-atl-x530.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-380-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-385-atl-x530.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-380-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-385-atl-x530.dtb: /soc/internal-regs/clock-gating-control@18220: failed to match any schema with compatible: ['marvell,armada-380-gating-clock']
>> arch/arm/boot/dts/marvell/armada-385-atl-x530.dtb: phy@18300 (marvell,armada-380-comphy): phy@2:reg:0:0: 2 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-atl-x530.dtb: phy@18300 (marvell,armada-380-comphy): phy@3:reg:0:0: 3 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-atl-x530.dtb: phy@18300 (marvell,armada-380-comphy): phy@4:reg:0:0: 4 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-atl-x530.dtb: phy@18300 (marvell,armada-380-comphy): phy@5:reg:0:0: 5 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-atl-x530.dtb: /soc/internal-regs/mvebu-sar@18600: failed to match any schema with compatible: ['marvell,armada-380-core-clock']
   arch/arm/boot/dts/marvell/armada-385-atl-x530.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/armada-385-atl-x530.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-380-wdt']
--
   	'marvell,armada-38x-uart' is not one of ['mrvl,mmp-uart', 'spacemit,k1-uart']
   	'marvell,armada-38x-uart' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-s4.dtb: /soc/internal-regs/serial@12100: failed to match any schema with compatible: ['marvell,armada-38x-uart', 'ns16550a']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-s4.dtb: /soc/internal-regs/pinctrl@18000: failed to match any schema with compatible: ['marvell,mv88f6820-pinctrl']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-s4.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-380-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-s4.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-380-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-s4.dtb: /soc/internal-regs/clock-gating-control@18220: failed to match any schema with compatible: ['marvell,armada-380-gating-clock']
>> arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-s4.dtb: phy@18300 (marvell,armada-380-comphy): phy@2:reg:0:0: 2 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-s4.dtb: phy@18300 (marvell,armada-380-comphy): phy@3:reg:0:0: 3 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-s4.dtb: phy@18300 (marvell,armada-380-comphy): phy@4:reg:0:0: 4 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-s4.dtb: phy@18300 (marvell,armada-380-comphy): phy@5:reg:0:0: 5 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-s4.dtb: /soc/internal-regs/mvebu-sar@18600: failed to match any schema with compatible: ['marvell,armada-380-core-clock']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-s4.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-s4.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-380-wdt']
--
   	'marvell,armada-38x-uart' is not one of ['mrvl,mmp-uart', 'spacemit,k1-uart']
   	'marvell,armada-38x-uart' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-l8.dtb: /soc/internal-regs/serial@12100: failed to match any schema with compatible: ['marvell,armada-38x-uart', 'ns16550a']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-l8.dtb: /soc/internal-regs/pinctrl@18000: failed to match any schema with compatible: ['marvell,mv88f6820-pinctrl']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-l8.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-380-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-l8.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-380-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-l8.dtb: /soc/internal-regs/clock-gating-control@18220: failed to match any schema with compatible: ['marvell,armada-380-gating-clock']
>> arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-l8.dtb: phy@18300 (marvell,armada-380-comphy): phy@2:reg:0:0: 2 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-l8.dtb: phy@18300 (marvell,armada-380-comphy): phy@3:reg:0:0: 3 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-l8.dtb: phy@18300 (marvell,armada-380-comphy): phy@4:reg:0:0: 4 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-l8.dtb: phy@18300 (marvell,armada-380-comphy): phy@5:reg:0:0: 5 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-l8.dtb: /soc/internal-regs/mvebu-sar@18600: failed to match any schema with compatible: ['marvell,armada-380-core-clock']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-l8.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr-l8.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-380-wdt']
--
   	'marvell,armada-38x-uart' is not one of ['mrvl,mmp-uart', 'spacemit,k1-uart']
   	'marvell,armada-38x-uart' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/marvell/armada-385-db-88f6820-amc.dtb: /soc/internal-regs/serial@12100: failed to match any schema with compatible: ['marvell,armada-38x-uart', 'ns16550a']
   arch/arm/boot/dts/marvell/armada-385-db-88f6820-amc.dtb: /soc/internal-regs/pinctrl@18000: failed to match any schema with compatible: ['marvell,mv88f6820-pinctrl']
   arch/arm/boot/dts/marvell/armada-385-db-88f6820-amc.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-380-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-385-db-88f6820-amc.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-380-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-385-db-88f6820-amc.dtb: /soc/internal-regs/clock-gating-control@18220: failed to match any schema with compatible: ['marvell,armada-380-gating-clock']
>> arch/arm/boot/dts/marvell/armada-385-db-88f6820-amc.dtb: phy@18300 (marvell,armada-380-comphy): phy@2:reg:0:0: 2 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-db-88f6820-amc.dtb: phy@18300 (marvell,armada-380-comphy): phy@3:reg:0:0: 3 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-db-88f6820-amc.dtb: phy@18300 (marvell,armada-380-comphy): phy@4:reg:0:0: 4 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-db-88f6820-amc.dtb: phy@18300 (marvell,armada-380-comphy): phy@5:reg:0:0: 5 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-db-88f6820-amc.dtb: /soc/internal-regs/mvebu-sar@18600: failed to match any schema with compatible: ['marvell,armada-380-core-clock']
   arch/arm/boot/dts/marvell/armada-385-db-88f6820-amc.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/armada-385-db-88f6820-amc.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-380-wdt']
--
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/marvell/armada-385-db-ap.dtb: serial@12100 (marvell,armada-38x-uart): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/marvell/armada-385-db-ap.dtb: /soc/internal-regs/serial@12100: failed to match any schema with compatible: ['marvell,armada-38x-uart', 'ns16550a']
   arch/arm/boot/dts/marvell/armada-385-db-ap.dtb: /soc/internal-regs/pinctrl@18000: failed to match any schema with compatible: ['marvell,mv88f6820-pinctrl']
   arch/arm/boot/dts/marvell/armada-385-db-ap.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-380-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-385-db-ap.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-380-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-385-db-ap.dtb: /soc/internal-regs/clock-gating-control@18220: failed to match any schema with compatible: ['marvell,armada-380-gating-clock']
>> arch/arm/boot/dts/marvell/armada-385-db-ap.dtb: phy@18300 (marvell,armada-380-comphy): phy@2:reg:0:0: 2 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-db-ap.dtb: phy@18300 (marvell,armada-380-comphy): phy@3:reg:0:0: 3 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-db-ap.dtb: phy@18300 (marvell,armada-380-comphy): phy@4:reg:0:0: 4 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-db-ap.dtb: phy@18300 (marvell,armada-380-comphy): phy@5:reg:0:0: 5 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-db-ap.dtb: /soc/internal-regs/mvebu-sar@18600: failed to match any schema with compatible: ['marvell,armada-380-core-clock']
   arch/arm/boot/dts/marvell/armada-385-db-ap.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/armada-385-db-ap.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-380-wdt']
--
   	'marvell,armada-38x-uart' is not one of ['mrvl,mmp-uart', 'spacemit,k1-uart']
   	'marvell,armada-38x-uart' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/marvell/armada-385-linksys-caiman.dtb: /soc/internal-regs/serial@12100: failed to match any schema with compatible: ['marvell,armada-38x-uart', 'ns16550a']
   arch/arm/boot/dts/marvell/armada-385-linksys-caiman.dtb: /soc/internal-regs/pinctrl@18000: failed to match any schema with compatible: ['marvell,mv88f6820-pinctrl']
   arch/arm/boot/dts/marvell/armada-385-linksys-caiman.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-380-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-385-linksys-caiman.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-380-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-385-linksys-caiman.dtb: /soc/internal-regs/clock-gating-control@18220: failed to match any schema with compatible: ['marvell,armada-380-gating-clock']
>> arch/arm/boot/dts/marvell/armada-385-linksys-caiman.dtb: phy@18300 (marvell,armada-380-comphy): phy@2:reg:0:0: 2 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-linksys-caiman.dtb: phy@18300 (marvell,armada-380-comphy): phy@3:reg:0:0: 3 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-linksys-caiman.dtb: phy@18300 (marvell,armada-380-comphy): phy@4:reg:0:0: 4 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-linksys-caiman.dtb: phy@18300 (marvell,armada-380-comphy): phy@5:reg:0:0: 5 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-linksys-caiman.dtb: /soc/internal-regs/mvebu-sar@18600: failed to match any schema with compatible: ['marvell,armada-380-core-clock']
   arch/arm/boot/dts/marvell/armada-385-linksys-caiman.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/armada-385-linksys-caiman.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-380-wdt']
--
   	'marvell,armada-38x-uart' is not one of ['mrvl,mmp-uart', 'spacemit,k1-uart']
   	'marvell,armada-38x-uart' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/marvell/armada-385-linksys-cobra.dtb: /soc/internal-regs/serial@12100: failed to match any schema with compatible: ['marvell,armada-38x-uart', 'ns16550a']
   arch/arm/boot/dts/marvell/armada-385-linksys-cobra.dtb: /soc/internal-regs/pinctrl@18000: failed to match any schema with compatible: ['marvell,mv88f6820-pinctrl']
   arch/arm/boot/dts/marvell/armada-385-linksys-cobra.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-380-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-385-linksys-cobra.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-380-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-385-linksys-cobra.dtb: /soc/internal-regs/clock-gating-control@18220: failed to match any schema with compatible: ['marvell,armada-380-gating-clock']
>> arch/arm/boot/dts/marvell/armada-385-linksys-cobra.dtb: phy@18300 (marvell,armada-380-comphy): phy@2:reg:0:0: 2 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-linksys-cobra.dtb: phy@18300 (marvell,armada-380-comphy): phy@3:reg:0:0: 3 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-linksys-cobra.dtb: phy@18300 (marvell,armada-380-comphy): phy@4:reg:0:0: 4 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-linksys-cobra.dtb: phy@18300 (marvell,armada-380-comphy): phy@5:reg:0:0: 5 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-linksys-cobra.dtb: /soc/internal-regs/mvebu-sar@18600: failed to match any schema with compatible: ['marvell,armada-380-core-clock']
   arch/arm/boot/dts/marvell/armada-385-linksys-cobra.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/armada-385-linksys-cobra.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-380-wdt']
--
   	'marvell,armada-38x-uart' is not one of ['mrvl,mmp-uart', 'spacemit,k1-uart']
   	'marvell,armada-38x-uart' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/marvell/armada-385-linksys-rango.dtb: /soc/internal-regs/serial@12100: failed to match any schema with compatible: ['marvell,armada-38x-uart', 'ns16550a']
   arch/arm/boot/dts/marvell/armada-385-linksys-rango.dtb: /soc/internal-regs/pinctrl@18000: failed to match any schema with compatible: ['marvell,mv88f6820-pinctrl']
   arch/arm/boot/dts/marvell/armada-385-linksys-rango.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-380-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-385-linksys-rango.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-380-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-385-linksys-rango.dtb: /soc/internal-regs/clock-gating-control@18220: failed to match any schema with compatible: ['marvell,armada-380-gating-clock']
>> arch/arm/boot/dts/marvell/armada-385-linksys-rango.dtb: phy@18300 (marvell,armada-380-comphy): phy@2:reg:0:0: 2 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-linksys-rango.dtb: phy@18300 (marvell,armada-380-comphy): phy@3:reg:0:0: 3 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-linksys-rango.dtb: phy@18300 (marvell,armada-380-comphy): phy@4:reg:0:0: 4 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-linksys-rango.dtb: phy@18300 (marvell,armada-380-comphy): phy@5:reg:0:0: 5 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-linksys-rango.dtb: /soc/internal-regs/mvebu-sar@18600: failed to match any schema with compatible: ['marvell,armada-380-core-clock']
   arch/arm/boot/dts/marvell/armada-385-linksys-rango.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/armada-385-linksys-rango.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-380-wdt']
--
   	'marvell,armada-38x-uart' is not one of ['mrvl,mmp-uart', 'spacemit,k1-uart']
   	'marvell,armada-38x-uart' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/marvell/armada-385-linksys-shelby.dtb: /soc/internal-regs/serial@12100: failed to match any schema with compatible: ['marvell,armada-38x-uart', 'ns16550a']
   arch/arm/boot/dts/marvell/armada-385-linksys-shelby.dtb: /soc/internal-regs/pinctrl@18000: failed to match any schema with compatible: ['marvell,mv88f6820-pinctrl']
   arch/arm/boot/dts/marvell/armada-385-linksys-shelby.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-380-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-385-linksys-shelby.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-380-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-385-linksys-shelby.dtb: /soc/internal-regs/clock-gating-control@18220: failed to match any schema with compatible: ['marvell,armada-380-gating-clock']
>> arch/arm/boot/dts/marvell/armada-385-linksys-shelby.dtb: phy@18300 (marvell,armada-380-comphy): phy@2:reg:0:0: 2 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-linksys-shelby.dtb: phy@18300 (marvell,armada-380-comphy): phy@3:reg:0:0: 3 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-linksys-shelby.dtb: phy@18300 (marvell,armada-380-comphy): phy@4:reg:0:0: 4 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-linksys-shelby.dtb: phy@18300 (marvell,armada-380-comphy): phy@5:reg:0:0: 5 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-linksys-shelby.dtb: /soc/internal-regs/mvebu-sar@18600: failed to match any schema with compatible: ['marvell,armada-380-core-clock']
   arch/arm/boot/dts/marvell/armada-385-linksys-shelby.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/armada-385-linksys-shelby.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-380-wdt']
--
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/marvell/armada-385-synology-ds116.dtb: serial@12100 (marvell,armada-38x-uart): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/marvell/armada-385-synology-ds116.dtb: /soc/internal-regs/serial@12100: failed to match any schema with compatible: ['marvell,armada-38x-uart', 'ns16550a']
   arch/arm/boot/dts/marvell/armada-385-synology-ds116.dtb: /soc/internal-regs/pinctrl@18000: failed to match any schema with compatible: ['marvell,mv88f6820-pinctrl']
   arch/arm/boot/dts/marvell/armada-385-synology-ds116.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-380-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-385-synology-ds116.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-380-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-385-synology-ds116.dtb: /soc/internal-regs/clock-gating-control@18220: failed to match any schema with compatible: ['marvell,armada-380-gating-clock']
>> arch/arm/boot/dts/marvell/armada-385-synology-ds116.dtb: phy@18300 (marvell,armada-380-comphy): phy@2:reg:0:0: 2 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-synology-ds116.dtb: phy@18300 (marvell,armada-380-comphy): phy@3:reg:0:0: 3 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-synology-ds116.dtb: phy@18300 (marvell,armada-380-comphy): phy@4:reg:0:0: 4 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-synology-ds116.dtb: phy@18300 (marvell,armada-380-comphy): phy@5:reg:0:0: 5 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-synology-ds116.dtb: /soc/internal-regs/mvebu-sar@18600: failed to match any schema with compatible: ['marvell,armada-380-core-clock']
   arch/arm/boot/dts/marvell/armada-385-synology-ds116.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/armada-385-synology-ds116.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-380-wdt']
--
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/marvell/armada-385-turris-omnia.dtb: serial@12100 (marvell,armada-38x-uart): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/marvell/armada-385-turris-omnia.dtb: /soc/internal-regs/serial@12100: failed to match any schema with compatible: ['marvell,armada-38x-uart', 'ns16550a']
   arch/arm/boot/dts/marvell/armada-385-turris-omnia.dtb: /soc/internal-regs/pinctrl@18000: failed to match any schema with compatible: ['marvell,mv88f6820-pinctrl']
   arch/arm/boot/dts/marvell/armada-385-turris-omnia.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-380-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-385-turris-omnia.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-380-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-385-turris-omnia.dtb: /soc/internal-regs/clock-gating-control@18220: failed to match any schema with compatible: ['marvell,armada-380-gating-clock']
>> arch/arm/boot/dts/marvell/armada-385-turris-omnia.dtb: phy@18300 (marvell,armada-380-comphy): phy@2:reg:0:0: 2 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-turris-omnia.dtb: phy@18300 (marvell,armada-380-comphy): phy@3:reg:0:0: 3 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-turris-omnia.dtb: phy@18300 (marvell,armada-380-comphy): phy@4:reg:0:0: 4 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-turris-omnia.dtb: phy@18300 (marvell,armada-380-comphy): phy@5:reg:0:0: 5 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-385-turris-omnia.dtb: /soc/internal-regs/mvebu-sar@18600: failed to match any schema with compatible: ['marvell,armada-380-core-clock']
   arch/arm/boot/dts/marvell/armada-385-turris-omnia.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/armada-385-turris-omnia.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-380-wdt']
--
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: serial@12100 (marvell,armada-38x-uart): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: /soc/internal-regs/serial@12100: failed to match any schema with compatible: ['marvell,armada-38x-uart', 'ns16550a']
   arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: /soc/internal-regs/pinctrl@18000: failed to match any schema with compatible: ['marvell,mv88f6828-pinctrl']
   arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-380-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-380-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: /soc/internal-regs/clock-gating-control@18220: failed to match any schema with compatible: ['marvell,armada-380-gating-clock']
>> arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: phy@18300 (marvell,armada-380-comphy): phy@2:reg:0:0: 2 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: phy@18300 (marvell,armada-380-comphy): phy@3:reg:0:0: 3 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: phy@18300 (marvell,armada-380-comphy): phy@4:reg:0:0: 4 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: phy@18300 (marvell,armada-380-comphy): phy@5:reg:0:0: 5 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: /soc/internal-regs/mvebu-sar@18600: failed to match any schema with compatible: ['marvell,armada-380-core-clock']
   arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/armada-388-clearfog.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-380-wdt']
--
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/marvell/armada-388-clearfog-base.dtb: serial@12100 (marvell,armada-38x-uart): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/marvell/armada-388-clearfog-base.dtb: /soc/internal-regs/serial@12100: failed to match any schema with compatible: ['marvell,armada-38x-uart', 'ns16550a']
   arch/arm/boot/dts/marvell/armada-388-clearfog-base.dtb: /soc/internal-regs/pinctrl@18000: failed to match any schema with compatible: ['marvell,mv88f6828-pinctrl']
   arch/arm/boot/dts/marvell/armada-388-clearfog-base.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-380-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-388-clearfog-base.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-380-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-388-clearfog-base.dtb: /soc/internal-regs/clock-gating-control@18220: failed to match any schema with compatible: ['marvell,armada-380-gating-clock']
>> arch/arm/boot/dts/marvell/armada-388-clearfog-base.dtb: phy@18300 (marvell,armada-380-comphy): phy@2:reg:0:0: 2 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-388-clearfog-base.dtb: phy@18300 (marvell,armada-380-comphy): phy@3:reg:0:0: 3 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-388-clearfog-base.dtb: phy@18300 (marvell,armada-380-comphy): phy@4:reg:0:0: 4 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-388-clearfog-base.dtb: phy@18300 (marvell,armada-380-comphy): phy@5:reg:0:0: 5 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-388-clearfog-base.dtb: /soc/internal-regs/mvebu-sar@18600: failed to match any schema with compatible: ['marvell,armada-380-core-clock']
   arch/arm/boot/dts/marvell/armada-388-clearfog-base.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/armada-388-clearfog-base.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-380-wdt']
--
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: serial@12100 (marvell,armada-38x-uart): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: /soc/internal-regs/serial@12100: failed to match any schema with compatible: ['marvell,armada-38x-uart', 'ns16550a']
   arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: /soc/internal-regs/pinctrl@18000: failed to match any schema with compatible: ['marvell,mv88f6828-pinctrl']
   arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-380-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-380-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: /soc/internal-regs/clock-gating-control@18220: failed to match any schema with compatible: ['marvell,armada-380-gating-clock']
>> arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: phy@18300 (marvell,armada-380-comphy): phy@2:reg:0:0: 2 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: phy@18300 (marvell,armada-380-comphy): phy@3:reg:0:0: 3 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: phy@18300 (marvell,armada-380-comphy): phy@4:reg:0:0: 4 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: phy@18300 (marvell,armada-380-comphy): phy@5:reg:0:0: 5 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: /soc/internal-regs/mvebu-sar@18600: failed to match any schema with compatible: ['marvell,armada-380-core-clock']
   arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/armada-388-clearfog-pro.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-380-wdt']
--
   	'marvell,armada-38x-uart' is not one of ['mrvl,mmp-uart', 'spacemit,k1-uart']
   	'marvell,armada-38x-uart' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/marvell/armada-388-db.dtb: /soc/internal-regs/serial@12100: failed to match any schema with compatible: ['marvell,armada-38x-uart', 'ns16550a']
   arch/arm/boot/dts/marvell/armada-388-db.dtb: /soc/internal-regs/pinctrl@18000: failed to match any schema with compatible: ['marvell,mv88f6828-pinctrl']
   arch/arm/boot/dts/marvell/armada-388-db.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-380-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-388-db.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-380-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-388-db.dtb: /soc/internal-regs/clock-gating-control@18220: failed to match any schema with compatible: ['marvell,armada-380-gating-clock']
>> arch/arm/boot/dts/marvell/armada-388-db.dtb: phy@18300 (marvell,armada-380-comphy): phy@2:reg:0:0: 2 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-388-db.dtb: phy@18300 (marvell,armada-380-comphy): phy@3:reg:0:0: 3 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-388-db.dtb: phy@18300 (marvell,armada-380-comphy): phy@4:reg:0:0: 4 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-388-db.dtb: phy@18300 (marvell,armada-380-comphy): phy@5:reg:0:0: 5 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-388-db.dtb: /soc/internal-regs/mvebu-sar@18600: failed to match any schema with compatible: ['marvell,armada-380-core-clock']
   arch/arm/boot/dts/marvell/armada-388-db.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/armada-388-db.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-380-wdt']
--
   	'marvell,armada-38x-uart' is not one of ['mrvl,mmp-uart', 'spacemit,k1-uart']
   	'marvell,armada-38x-uart' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/marvell/armada-388-gp.dtb: /soc/internal-regs/serial@12100: failed to match any schema with compatible: ['marvell,armada-38x-uart', 'ns16550a']
   arch/arm/boot/dts/marvell/armada-388-gp.dtb: /soc/internal-regs/pinctrl@18000: failed to match any schema with compatible: ['marvell,mv88f6828-pinctrl']
   arch/arm/boot/dts/marvell/armada-388-gp.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-380-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-388-gp.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-380-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-388-gp.dtb: /soc/internal-regs/clock-gating-control@18220: failed to match any schema with compatible: ['marvell,armada-380-gating-clock']
>> arch/arm/boot/dts/marvell/armada-388-gp.dtb: phy@18300 (marvell,armada-380-comphy): phy@2:reg:0:0: 2 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-388-gp.dtb: phy@18300 (marvell,armada-380-comphy): phy@3:reg:0:0: 3 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-388-gp.dtb: phy@18300 (marvell,armada-380-comphy): phy@4:reg:0:0: 4 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-388-gp.dtb: phy@18300 (marvell,armada-380-comphy): phy@5:reg:0:0: 5 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-388-gp.dtb: /soc/internal-regs/mvebu-sar@18600: failed to match any schema with compatible: ['marvell,armada-380-core-clock']
   arch/arm/boot/dts/marvell/armada-388-gp.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/armada-388-gp.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-380-wdt']
--
   	'marvell,armada-38x-uart' is not one of ['mrvl,mmp-uart', 'spacemit,k1-uart']
   	'marvell,armada-38x-uart' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: /soc/internal-regs/serial@12100: failed to match any schema with compatible: ['marvell,armada-38x-uart', 'ns16550a']
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: /soc/internal-regs/pinctrl@18000: failed to match any schema with compatible: ['marvell,mv88f6828-pinctrl']
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-380-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-380-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: /soc/internal-regs/clock-gating-control@18220: failed to match any schema with compatible: ['marvell,armada-380-gating-clock']
>> arch/arm/boot/dts/marvell/armada-388-helios4.dtb: phy@18300 (marvell,armada-380-comphy): phy@2:reg:0:0: 2 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: phy@18300 (marvell,armada-380-comphy): phy@3:reg:0:0: 3 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: phy@18300 (marvell,armada-380-comphy): phy@4:reg:0:0: 4 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: phy@18300 (marvell,armada-380-comphy): phy@5:reg:0:0: 5 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: /soc/internal-regs/mvebu-sar@18600: failed to match any schema with compatible: ['marvell,armada-380-core-clock']
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/armada-388-helios4.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-380-wdt']
--
   	'marvell,armada-38x-uart' is not one of ['mrvl,mmp-uart', 'spacemit,k1-uart']
   	'marvell,armada-38x-uart' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/marvell/armada-388-rd.dtb: /soc/internal-regs/serial@12100: failed to match any schema with compatible: ['marvell,armada-38x-uart', 'ns16550a']
   arch/arm/boot/dts/marvell/armada-388-rd.dtb: /soc/internal-regs/pinctrl@18000: failed to match any schema with compatible: ['marvell,mv88f6828-pinctrl']
   arch/arm/boot/dts/marvell/armada-388-rd.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-380-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-388-rd.dtb: /soc/internal-regs/system-controller@18200: failed to match any schema with compatible: ['marvell,armada-380-system-controller', 'marvell,armada-370-xp-system-controller']
   arch/arm/boot/dts/marvell/armada-388-rd.dtb: /soc/internal-regs/clock-gating-control@18220: failed to match any schema with compatible: ['marvell,armada-380-gating-clock']
>> arch/arm/boot/dts/marvell/armada-388-rd.dtb: phy@18300 (marvell,armada-380-comphy): phy@2:reg:0:0: 2 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-388-rd.dtb: phy@18300 (marvell,armada-380-comphy): phy@3:reg:0:0: 3 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-388-rd.dtb: phy@18300 (marvell,armada-380-comphy): phy@4:reg:0:0: 4 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-388-rd.dtb: phy@18300 (marvell,armada-380-comphy): phy@5:reg:0:0: 5 is greater than the maximum of 1
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-380-comphy.yaml#
   arch/arm/boot/dts/marvell/armada-388-rd.dtb: /soc/internal-regs/mvebu-sar@18600: failed to match any schema with compatible: ['marvell,armada-380-core-clock']
   arch/arm/boot/dts/marvell/armada-388-rd.dtb: /soc/internal-regs/mbus-controller@20000: failed to match any schema with compatible: ['marvell,mbus-controller']
   arch/arm/boot/dts/marvell/armada-388-rd.dtb: /soc/internal-regs/watchdog@20300: failed to match any schema with compatible: ['marvell,armada-380-wdt']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
