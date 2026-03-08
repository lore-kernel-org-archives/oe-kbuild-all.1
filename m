Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6794E1A9F96
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Mar 2026 15:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772984784; cv=none; b=EkjK8LRpqYlfevs0NUT08nIBmjTHmNjPka/jM7YepK+dtol2rVURABxW7dyU+G8qWbS+NieYpn39tJ5HRzq0FmCl8IqO21zluRyoEdFyA/RutgKIvC39el6j2zF9n5tdXzBV8kS+pDI+XKd57EQ03bdfeAATmWWVP+7fUdLkJ2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772984784; c=relaxed/simple;
	bh=PoL8wd56RvwtCuvYI087ug/7aB9nDluEoC+eQHF65/A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FWZOiyL8YQk23lVHialLl1qQ2OGLNNlzDT1sQ7Tvrw3vtHq8BbeSKeuwPXpgx4uRcq1JTua9Jsjn7jUiRX/vabYwyKBvvvW+Pz7S0Qm4/O8GKdNU1rDq6w5vFxbxe2YmTI36RoeSVKVsYko7R3hTTmaPtsRh+8+D4bFCUD+n0xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AyDRSDZ6; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AyDRSDZ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772984782; x=1804520782;
  h=date:from:to:cc:subject:message-id;
  bh=PoL8wd56RvwtCuvYI087ug/7aB9nDluEoC+eQHF65/A=;
  b=AyDRSDZ6uL2tAtVlaT3ETnKPOA0Y9227436J4pk6E3r2HqG8Fq6w1Jb6
   7pKlV4mNfLaIyQDV/qDK50yCbMPdzfCmOJzlwHd1Wuv+N0U5gy42E0FCV
   b2f2iHOp2V07wN2X1GwnzTbhq8YoGSFhcZGRA7i7BTDFVsRxl0qtL/izc
   qe8SAMcV38izB7x1WxqEs1Fgb2JFj4KLxqmQ0dkbOak+ScdLfcGiwyW9x
   S71BBkzO/p/uHC5sxD51/d6jfP0Nw2pgSkmYafBmLq5u0Z1z21Ewf5QN2
   Qa1khTQG/q8WQg2ECixu5Iuqob44Rvepliy52PyvVbgwZX26muun/fLgt
   A==;
X-CSE-ConnectionGUID: eAvWakHJQF+HRZacJ474tg==
X-CSE-MsgGUID: VlPXPG5STuKtehDmp9PHEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="77901611"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="77901611"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 08:46:21 -0700
X-CSE-ConnectionGUID: BqeAQ/O9S/2JjAw+CBwmng==
X-CSE-MsgGUID: N0SChptFRyKu77VP1WCQHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="216521691"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 08 Mar 2026 08:46:19 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzGKf-000000002gL-2nGr;
	Sun, 08 Mar 2026 15:46:17 +0000
Date: Sun, 08 Mar 2026 16:45:41 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-rc 26/64]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dtb: switch@10
 (maxlinear,mxl86252): Unevaluated properties are not allowed
 ('#address-cells', '#size-cells', 'reset-assert-us', 'reset-deassert-us',
 'reset-gpios' were unexpected)
Message-ID: <202603081605.mRk761hp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-rc
head:   027868526273f2766cd140b0fb54609225da2cf9
commit: 20869d738b6218d7db259afe362d8fe396034825 [26/64] arm64: dts: add switch to BPi-R4Pro
config: arm64-randconfig-2054-20260307 (https://download.01.org/0day-ci/archive/20260308/202603081605.mRk761hp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603081605.mRk761hp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603081605.mRk761hp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi:190.12-292.4: Warning (avoid_unnecessary_addr_size): /soc/ethernet@15100000/mdio-bus/switch@10: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dtb: switch@10 (maxlinear,mxl86252): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'reset-assert-us', 'reset-deassert-us', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/maxlinear,mxl862xx.yaml
--
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi:190.12-292.4: Warning (avoid_unnecessary_addr_size): /soc/ethernet@15100000/mdio-bus/switch@10: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: switch@10 (maxlinear,mxl86252): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'reset-assert-us', 'reset-deassert-us', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/maxlinear,mxl862xx.yaml
--
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: switch@10 (maxlinear,mxl86252): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'reset-assert-us', 'reset-deassert-us', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/maxlinear,mxl862xx.yaml
--
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: switch@10 (maxlinear,mxl86252): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'reset-assert-us', 'reset-deassert-us', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/maxlinear,mxl862xx.yaml
--
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: switch@10 (maxlinear,mxl86252): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'reset-assert-us', 'reset-deassert-us', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/maxlinear,mxl862xx.yaml
--
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: switch@10 (maxlinear,mxl86252): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'reset-assert-us', 'reset-deassert-us', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/maxlinear,mxl862xx.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
