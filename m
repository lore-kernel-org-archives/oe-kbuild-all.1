Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F24531A567
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Apr 2026 13:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776085969; cv=none; b=BSWF36TJzXYTgUh6HlSanU7+ZrV8RzGjTZsjwqNLgJ2q2gdlDViwcq/tcn29wKc8gs3O3Xkweo1H6o5KDHK5qhrR/JGY1x+ZcpwgB2HtwNXfCiq258SazWGGKdy1CCH+5uik9MlTXigzSZlRUdnbFykVWlgLWoXghiqp/68oxqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776085969; c=relaxed/simple;
	bh=vp91AnRIHoFXGf8qHGx1jxSw+cYb7jmpr6tcgZdyNk8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AtOL0i18qbs4thN4WqxfaOAWHaoeNvY7rxIJ70tisE3VPRvvkD5wTd9qdMBIC+q4U/ayCGwLKigLsA8bqZNtfAe7BO+/dSDMpaPrUmrdBJI6KFRze3nXtTTl4kZASItZ9q+HFE4KwY8MIrVlniPHY5OXnrGnW5jTfltgakgaRfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TT3oP0FA; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TT3oP0FA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776085966; x=1807621966;
  h=date:from:to:cc:subject:message-id;
  bh=vp91AnRIHoFXGf8qHGx1jxSw+cYb7jmpr6tcgZdyNk8=;
  b=TT3oP0FAzq1QZm67CMPbFWZEF13bTnZImZg4jUimQ7qwZBZl3aq8UhRl
   CBKObNHgasX/mS81fsc4I2Sk0Ov9JTpVBSl6agOKT9Q/sXc+9n8bneKnK
   Bx2khwvBFbRR/LeUu2SXlPUAbB/wscfBb3jt1NjbU2n5rypv3TLYWs7Xh
   pjSyI7jfYnInIwIZ8F20u3D7WRdibk52ZdAAO5XpDj+Bet1yKQ7ewPuhi
   YdBOMSu6b8PgKS9dhvRfMnf5OrkvdN0hlK5W68gZoSn8IFXlCL64G9NNY
   DMjkQdni2xp9uAchP/Jfk1iJonqaH9QPM0K4jBrTLJiYGX7w0Fpjqtxjc
   A==;
X-CSE-ConnectionGUID: YwDXnsnRTU++hYcxzTB8Pg==
X-CSE-MsgGUID: YXs7+JykSTGuz4fHHLZwHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="80607852"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="80607852"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 06:12:45 -0700
X-CSE-ConnectionGUID: xkvkLfzUTLq/Ea7GVJOu6A==
X-CSE-MsgGUID: UXzE2ijjR0eIr/a2NLblPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="229654793"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 13 Apr 2026 06:12:45 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCH5m-00000000049-0qym;
	Mon, 13 Apr 2026 13:12:42 +0000
Date: Mon, 13 Apr 2026 15:11:53 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-rc_new 94/96]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dtb: pcie-2-hog:
 'oneOf' conditional failed, one must be fixed:
Message-ID: <202604131525.IdzQnmrK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-rc_new
head:   7a28da8c7a34ce8293b2d72bb6a1f5b37eaa8298
commit: 870482c5ae1427115c2c52087f54b9e40565f809 [94/96] arm64: dts: mediatek: mt7988a-bpi-r4-pro: rework pcie handling
config: arm64-randconfig-2051-20260413 (https://download.01.org/0day-ci/archive/20260413/202604131525.IdzQnmrK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2026.5.dev2+g3579443c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260413/202604131525.IdzQnmrK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604131525.IdzQnmrK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi:192.22-284.4: Warning (avoid_unnecessary_addr_size): /soc/ethernet@15100000/mdio-bus/switch@10: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dtb: pcie-2-hog: 'oneOf' conditional failed, one must be fixed:
   	'input' is a required property
   	'output-high' is a required property
   	'output-low' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dtb: pcie-3-hog: 'oneOf' conditional failed, one must be fixed:
   	'input' is a required property
   	'output-high' is a required property
   	'output-low' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi:192.22-284.4: Warning (avoid_unnecessary_addr_size): /soc/ethernet@15100000/mdio-bus/switch@10: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: pcie-2-hog: 'oneOf' conditional failed, one must be fixed:
   	'input' is a required property
   	'output-high' is a required property
   	'output-low' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: pcie-3-hog: 'oneOf' conditional failed, one must be fixed:
   	'input' is a required property
   	'output-high' is a required property
   	'output-low' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
