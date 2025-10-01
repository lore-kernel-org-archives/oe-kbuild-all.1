Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFD02773D9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Oct 2025 16:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759336784; cv=none; b=UVzaaJagcuatDd17GvQgqyxagW+57LCFCav/oGCoGFY1o8WAPEVyg4Snpo15npXIzaTang55x+mMAcD01n/iSwAsznWtRvz8BL0+0lp5LmFjXUWynzaEPFTgztghZKE9CUVBxPzJDnukgoKBc5lCw2mZTZUORbYQu2ZUAKhZmt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759336784; c=relaxed/simple;
	bh=dEyjF2hpqC6MFtsWQa8KwDPSwnnqPilNTgaHqMmvK30=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D6eFNKPOYpHIICKD8CtPX9kJ69yGCJPgjU/cDPfvf2Ke1NSpNKV2f1fIwAP4bN5d9ShZwVO4vBmF0lO3Tm4XOFoBW8Gq5R9Fip9+l8ZnAYOuL4BpeaQ8QBSam1p+E7n4W/tYMkvsjmyRjKYEklFCe0VGUxycinaPK6kGrXsMELI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=neg9fkzQ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="neg9fkzQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759336782; x=1790872782;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dEyjF2hpqC6MFtsWQa8KwDPSwnnqPilNTgaHqMmvK30=;
  b=neg9fkzQ7Hv02JaOSvRELjivAVXo+9bbJ7XV9Csc9tCl4R7vEXcpEJLw
   3aqjnbEguPMGWxSz6IlIAQYy/QBW8yL13VJ743NXMCraiicvRyppXdShr
   Viqn8XzfosjFRNIeVG7uahnhI103xEaSNRGJRTSLikVdWNtto3N8S85R0
   sScpnR4LBQbi2BQYsuabAXHrUhy3bVNHQKbHrEAObgED8ZwoSmv30SqpJ
   eSCFcYnZxxtR3/Yc0cC6mS/puxzgJBjyQdNVEzMKKqiC+hvjH14ZvFgIL
   j/LqMiC1S/oZmO8txXb/g4dqBU6C72DNWuPt04+YMTRNJMHbXfn5Y9DGs
   w==;
X-CSE-ConnectionGUID: +yXyHYxBQu6wcBFhRJ1YRQ==
X-CSE-MsgGUID: 0NXZSvkyRQCTso3moyUuCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="72287473"
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; 
   d="scan'208";a="72287473"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2025 09:39:42 -0700
X-CSE-ConnectionGUID: IDjwPfWTQiGiKsKw4syA+g==
X-CSE-MsgGUID: pVouaicrSXGNVtAya+tbkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; 
   d="scan'208";a="179599764"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa010.fm.intel.com with ESMTP; 01 Oct 2025 09:39:40 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v3zre-000000006cr-21cE;
	Wed, 01 Oct 2025 16:39:38 +0000
Date: Wed, 1 Oct 2025 18:39:31 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 49/49]
 arch/arm64/boot/dts/mediatek/mt8189-skywalker-phasma-sku12290.dtb:
 /soc/pwrap@1cc04000/pmic/regulators: failed to match any schema with
 compatible: ['mediatek,mt6359-regulator']
Message-ID: <202510011813.4io27YyV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   fea2361acd4bfebf9bd8bbaa0f11161a1787ea28
commit: 15c4267bbff330fc976cf646a43a8425f44df2b6 [49/49] Merge "CHROMIUM: Merge tag 'v6.6.99' into chromeos-6.6" into chromeos-6.6
config: arm64-randconfig-2052-20250929 (https://download.01.org/0day-ci/archive/20251001/202510011813.4io27YyV-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 2d6ce5148cf144ab800116e1f75a5d007e82cf58)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251001/202510011813.4io27YyV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510011813.4io27YyV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-phasma-sku12290.dtb: /soc/syscon@1c012000: failed to match any schema with compatible: ['mediatek,mt8189-vlp-ckgen', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-phasma-sku12290.dtb: /soc/devapc@1c01c000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-phasma-sku12290.dtb: /soc/mailbox@1c351000: failed to match any schema with compatible: ['mediatek,tinysys_mbox']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-phasma-sku12290.dtb: scp@1c400000 (mediatek,mt8189-scp): clock-names:0: 'main' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-phasma-sku12290.dtb: /soc/syscon@1c80a000: failed to match any schema with compatible: ['mediatek,mt8189-scp-i2c-clk', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-phasma-sku12290.dtb: /soc/syscon@1cb21000: failed to match any schema with compatible: ['mediatek,mt8189-scp-clk', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-phasma-sku12290.dtb: /soc/pwrap@1cc04000: failed to match any schema with compatible: ['mediatek,mt8189-pwrap']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-phasma-sku12290.dtb: /soc/pwrap@1cc04000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-phasma-sku12290.dtb: /soc/pwrap@1cc04000/pmic/adc: failed to match any schema with compatible: ['mediatek,mt6359-auxadc']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-phasma-sku12290.dtb: /soc/pwrap@1cc04000/pmic/regulators: failed to match any schema with compatible: ['mediatek,mt6359-regulator']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-phasma-sku12290.dtb: /soc/pwrap@1cc04000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-phasma-sku12290.dtb: /soc/spmi@1cc06000: failed to match any schema with compatible: ['mediatek,mt8189-spmi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-phasma-sku12290.dtb: mt6319@7 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-phasma-sku12290.dtb: mt6319@8 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-phasma-sku12290.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-phasma-sku12290.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-phasma-sku12290.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-phasma-sku12290.dtb: /soc/syscon@1e010000: failed to match any schema with compatible: ['mediatek,mt8189-vadsys', 'syscon']
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku8194.dtb: /soc/syscon@1c012000: failed to match any schema with compatible: ['mediatek,mt8189-vlp-ckgen', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku8194.dtb: /soc/devapc@1c01c000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku8194.dtb: /soc/mailbox@1c351000: failed to match any schema with compatible: ['mediatek,tinysys_mbox']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku8194.dtb: scp@1c400000 (mediatek,mt8189-scp): clock-names:0: 'main' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku8194.dtb: /soc/syscon@1c80a000: failed to match any schema with compatible: ['mediatek,mt8189-scp-i2c-clk', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku8194.dtb: /soc/syscon@1cb21000: failed to match any schema with compatible: ['mediatek,mt8189-scp-clk', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku8194.dtb: /soc/pwrap@1cc04000: failed to match any schema with compatible: ['mediatek,mt8189-pwrap']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku8194.dtb: /soc/pwrap@1cc04000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku8194.dtb: /soc/pwrap@1cc04000/pmic/adc: failed to match any schema with compatible: ['mediatek,mt6359-auxadc']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku8194.dtb: /soc/pwrap@1cc04000/pmic/regulators: failed to match any schema with compatible: ['mediatek,mt6359-regulator']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku8194.dtb: /soc/pwrap@1cc04000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku8194.dtb: /soc/spmi@1cc06000: failed to match any schema with compatible: ['mediatek,mt8189-spmi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku8194.dtb: mt6319@7 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku8194.dtb: mt6319@8 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku8194.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku8194.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku8194.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin-sku8194.dtb: /soc/syscon@1e010000: failed to match any schema with compatible: ['mediatek,mt8189-vadsys', 'syscon']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
