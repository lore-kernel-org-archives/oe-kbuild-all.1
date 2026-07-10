Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C29153BE9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jul 2026 00:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783644806; cv=none; b=BnU5ERNPHRmSGrRQDtyQh8XYuBFqMq+Tbr78h4+jVe/YTvJygJxhW45bmqQYBsg4WAexXfdP1W2PllnBRbYc1p0GiLvawYRuTfBuOlg4szGgq7HFMUFRLte8jj6niuipeTXQo+0hGoqm4CbULI4NyngefTMTgI7m23nrylX/RFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783644806; c=relaxed/simple;
	bh=3g0hg08h1hPREKpzQjbKC5udDNqORY0tsxk9g22A4Xs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mjcw+zsHTHZ0WgayindZmxKL1vY5TtmFxXwdQA9+zPyEDyutG+/I7SUwlciPuMOT9m8YJ5BZwTvHNSnQqvgeFW6GVaUHMVVx0GUtMUrGrf7QCHFV/Mbo/1P1g/r3cTaGLa+DyS0X0YL6SRA3+7sAJY40Pl6d+1Ouc1Q7ypaDW4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jPAEaBvC; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jPAEaBvC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783644804; x=1815180804;
  h=date:from:to:cc:subject:message-id;
  bh=3g0hg08h1hPREKpzQjbKC5udDNqORY0tsxk9g22A4Xs=;
  b=jPAEaBvCflyAaoXiumbpjfDqvFu3S4M405XTMU22VtiuWeME4o0gMcn8
   cvTvtSCi2GrANe8zUz6craHd8PrE5n+jMnvWC8aLXGgfTX32vMpKJ21wt
   2rcaodU54nIKS+nSHFzu0D/ZQI1dN/OvN9YLceha1Zxi6g8AGTRcM1tDJ
   JGudqUjj53gMJ0anTG9kv5D43b/OCTga/NsYkijgXLWu+f+N8UOP3VAvL
   IgX0BVBzw/44qoNeYNGGTTgr5wwo1+rYOUO0sLjUYT8l3V9BR4qcwJ9C7
   trwah6MAue6iihvWtxTaorGvYuoqjUlxu/3ymeL2CiEi26k6NXKquoSCQ
   g==;
X-CSE-ConnectionGUID: Efyj4tH/TxSLj2Lqrt4y1A==
X-CSE-MsgGUID: b4+YljMoT9uaa+bQlUNUwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84364329"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84364329"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 17:53:24 -0700
X-CSE-ConnectionGUID: ILTGWTX1SMqhFJuLujdT4Q==
X-CSE-MsgGUID: JUf0FTP6T1OWbh0TgdGwYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="258626057"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 09 Jul 2026 17:53:21 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whzUV-0000000036H-2S8A;
	Fri, 10 Jul 2026 00:53:19 +0000
Date: Fri, 10 Jul 2026 02:52:31 +0200
From: kernel test robot <lkp@intel.com>
To: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>
Subject: arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: i2s@f7118000
 (hisilicon,hi6210-i2s): dma-names:0: 'tx' was expected
Message-ID: <202607100211.rZi8bkP8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a635d6748234582ea287c5ffeae28b9b23f91c7e
commit: f4ee8a882a560308c390cf45ffa616c59f60a731 ASoC: dt-bindings: hisilicon: Convert hi6210 I2S to dt-schema
date:   3 months ago
config: arm64-randconfig-2055-20260708 (https://download.01.org/0day-ci/archive/20260710/202607100211.rZi8bkP8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260710/202607100211.rZi8bkP8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f4ee8a882a56 ("ASoC: dt-bindings: hisilicon: Convert hi6210 I2S to dt-schema")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607100211.rZi8bkP8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: adv7533@39 (adi,adv7533): 'pvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: adv7533@39 (adi,adv7533): 'a2vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: adv7533@39 (adi,adv7533): 'v3p3-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: /soc/mailbox@f7510000: failed to match any schema with compatible: ['hisilicon,hi6220-mbox']
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: /soc/dwmmc0@f723d000: failed to match any schema with compatible: ['hisilicon,hi6220-dw-mshc']
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: /soc/dwmmc1@f723e000: failed to match any schema with compatible: ['hisilicon,hi6220-dw-mshc']
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: /soc/dwmmc2@f723f000: failed to match any schema with compatible: ['hisilicon,hi6220-dw-mshc']
>> arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: i2s@f7118000 (hisilicon,hi6210-i2s): dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/hisilicon,hi6210-i2s.yaml
>> arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: i2s@f7118000 (hisilicon,hi6210-i2s): dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/hisilicon,hi6210-i2s.yaml
>> arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: i2s@f7118000 (hisilicon,hi6210-i2s): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/hisilicon,hi6210-i2s.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: /soc/ade@f4100000: failed to match any schema with compatible: ['hisilicon,hi6220-ade']
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: /soc/dsi@f4107800: failed to match any schema with compatible: ['hisilicon,hi6220-dsi']
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: gpu@f4080000 (hisilicon,hi6220-mali): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-utgard.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: gpu@f4080000 (hisilicon,hi6220-mali): resets: [[18, 1], [84, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-utgard.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: reboot-mode-syscon@5f01000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: /pmic@f8000000: failed to match any schema with compatible: ['hisilicon,hi655x-pmic']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
