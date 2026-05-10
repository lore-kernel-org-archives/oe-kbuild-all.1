Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EFA2571C7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 May 2026 03:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778385222; cv=none; b=lOsV4/h7kkfUYlAYVGt1Q/sP8J3n1gAiY+cLFajEdKmHzuGmGrgU0pzji9ZdWl1A56GoAWjmdLyx2lcP5dUjeLmGOgThwIqFbDD3ezXV8fntFsWv7aDc4oaLOQgc0C1XtdcEd+iV2oKGXCMQ3waIZBA7RxSWWu7iVvbSV10hVxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778385222; c=relaxed/simple;
	bh=syII6QQB2D4P3L0zYfjSGWIg4x0carBQgds2Q5m1Vo8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CZjnYatcfh+vJsS3iABGNmh/GHaJEOuTvpT/YxHd29UBRM0QfXklUyEWKfb4o32xA0JMfq2DD58hF12KHo70sK/cMM5oF8ZRk7sNycc3syPqbo1ijhRe/rHIq2L3scEujLeuSOQ0jEfVUxiTaxay+CVTKFVKrM65wnCdx66ZGDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KC1Ib8Xo; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KC1Ib8Xo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778385222; x=1809921222;
  h=date:from:to:cc:subject:message-id;
  bh=syII6QQB2D4P3L0zYfjSGWIg4x0carBQgds2Q5m1Vo8=;
  b=KC1Ib8Xox8rbDZHZrTDUGz58OsLn+i1rymV7PIXSzQqvOx9JiHcLaW45
   kMdSX+RuCTexcBLkxEkGaf+ShN2D5FN/UtyXcALpzcAAh+w6RCl4DVFTK
   yTrE7vjzrM6rz5WB9RmdZ9KQzh7Q85uT5K397TntFGKelPaxzOLKLvQ2p
   FG4zoTKqs28mpC5d3iAXVVk1vU3OKKI2uIpKzfwV35rs4y3bzyZSuWEb5
   YWTiipgsC66mak8hXtNDXJgIpFMs2rCZ/smEopomt0aoGP9Jsiznhth1R
   6SITJIeE4v04j+I5FijHsSDG4GS4QPrmcCbNzkRMf0HRcu47CXcfcKmRq
   w==;
X-CSE-ConnectionGUID: I3psxzFIT6e/CHfoMzBWTQ==
X-CSE-MsgGUID: 27TjAXGpRWqHZkZ7e6ZzLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="82928123"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="82928123"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 20:53:39 -0700
X-CSE-ConnectionGUID: fh6B35xBSdudI2juNjITgw==
X-CSE-MsgGUID: iOoIFIB2TTaFaMf53qVIgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="237234964"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 09 May 2026 20:53:37 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLvEU-000000007dN-2Msi;
	Sun, 10 May 2026 03:53:34 +0000
Date: Sun, 10 May 2026 05:52:43 +0200
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Linus Walleij <linusw@kernel.org>
Subject: arch/arm64/boot/dts/qcom/msm8976-longcheer-l9360.dtb:
 pinctrl@1000000 (qcom,msm8976-pinctrl): ts-int-state: 'oneOf' conditional
 failed, one must be fixed:
Message-ID: <202605100557.rKJrPheQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1bfaee9d3351b9b32a99766bbfb1f5baed60ddef
commit: a901e8705f89f3616fad3bb6aeddba33be86b08a dt-bindings: pinctrl: pincfg-node: add restrictions on conflicting properties
date:   2 months ago
config: arm64-randconfig-2052-20260429 (https://download.01.org/0day-ci/archive/20260510/202605100557.rKJrPheQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605100557.rKJrPheQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a901e8705f89 ("dt-bindings: pinctrl: pincfg-node: add restrictions on conflicting properties")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605100557.rKJrPheQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:1063.27-1118.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8004.dtsi:14.23-23.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@200f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8950.dtsi:176.9-185.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@200f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8976-longcheer-l9360.dts:111.20-139.4: Warning (avoid_unnecessary_addr_size): /soc@0/i2c@78b6000/led-controller@30: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8976.dtsi:510.27-513.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s0-p1@219: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s0-p2@219)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:530.27-533.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s2-p1@21c: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s2-p2@21c)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:555.27-558.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s4-p1@221: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s4-p2@221)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:575.27-578.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s6-p1@224: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s6-p2@224)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:595.25-598.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/mode@228: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s8-p1@228)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:605.27-608.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s8-p2@229: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s9-p1@229)
>> arch/arm64/boot/dts/qcom/msm8976-longcheer-l9360.dtb: pinctrl@1000000 (qcom,msm8976-pinctrl): ts-int-state: 'oneOf' conditional failed, one must be fixed:
   	'bias-pull-down', 'bias-pull-up', 'drive-strength', 'function', 'pins' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,msm8976-pinctrl.yaml
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pmi8998.dtsi:71.20-79.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2930.27-2985.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:3006.27-3061.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-lilac.dtb: pinctrl@3400000 (qcom,msm8998-pinctrl): blsp1-i2c5-sleep-state: 'oneOf' conditional failed, one must be fixed:
   	'bias-disable', 'bias-pull-up', 'drive-strength', 'function', 'pins' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,msm8998-pinctrl.yaml
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pmi8998.dtsi:71.20-79.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2930.27-2985.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:3006.27-3061.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-maple.dtb: pinctrl@3400000 (qcom,msm8998-pinctrl): blsp1-i2c5-sleep-state: 'oneOf' conditional failed, one must be fixed:
   	'bias-disable', 'bias-pull-up', 'drive-strength', 'function', 'pins' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,msm8998-pinctrl.yaml
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pmi8998.dtsi:71.20-79.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2930.27-2985.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:3006.27-3061.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-poplar.dtb: pinctrl@3400000 (qcom,msm8998-pinctrl): blsp1-i2c5-sleep-state: 'oneOf' conditional failed, one must be fixed:
   	'bias-disable', 'bias-pull-up', 'drive-strength', 'function', 'pins' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,msm8998-pinctrl.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
