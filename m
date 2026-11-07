Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794016575;
	b=aVl53L+hhc/11j6eaKEUCIHDDTQnDcXBoSjMkXA/ZEAvExBSB03MDgz3yI5Tn6BZZ1Gf
	 y35wfWkN7FntRRR7QNygXwGR8cLELBczOyt9vfhh7zIL1DChnwGhOeiJZT+BYQPIzIywV
	 Jmo1tnvN6SRhO9ugBLIrYpdIc5+/DhnY8THkBY524L7bK9gNRAlNcVdCMhJN2j0OhTkkX
	 eIp+PRrZDjBi9MZvc2VhPXGUaNcIR+2c9Wex6t0gsPCwZ1LHk2Ct+aw1xqRP4KcXD2Rcy
	 PnM80yPslZx8bR1jgbxvVpM1NklDzkLhP7GMArccBxmnQUhd76PDugRiubB0svqZn3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794016575;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=XMsUmZARdJSUjoPYVFHbxR/uKJLrmC4CT2i3Z7IuwrI=;
	b=xG9ggoEJ8yc5BQDWxYpoUkN/Pi+rGNVXpD2L+VNc2k0jkBKfzCrxjj/YzI0YYXorwUYE
	 yxrU5oOTEfkvRRrACgDx1FLMPGFMBv5CO9YH3tu8iNwQC+lPbwZeks1te/v0HC/bOgfEy
	 3Z0T0lbtQ4TkXoLMMYuExjYiKbvPz5YDWpvaZLjCbVyTDrrRZ8ehEQ/MBi6Ghxl1LgSYO
	 fFw859XenNi9iwC6TFgQsQ9ap+Hunxz76bDvflVyVS+s6CeWBepYyXau7LScr5nI6u4y3
	 G3IYDZzLopcrIBMXG4OLvg94OwSkBF1Nte/3P3rsK71l60lh1+uA0QGbESMUhDdhbrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jko5ePw6;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADEB606A32D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Nov 2026 01:56:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AADEB606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jko5ePw6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794016574; x=1825552574;
  h=date:from:to:cc:subject:message-id;
  bh=BhfKN4372EmT/GtAvppHzEbjgx3GxqCXOW2KoRy1fC8=;
  b=Jko5ePw6hyYRFIGClAQyRqqvG1h2OXoN4li+yacjFajf3ecIly14ZfdS
   8G+Dhmyo3cP45arxkqQ+LqfeGO3rOGaK8VcytqoG/xTDkSyPxQPjJnzIP
   3cCSO4GYC8E1ahoV+YADf+Zr+FlVrZnhv3WNQuDnVX5DLaU1PYhGhVt96
   xURkr7cHV2hcZ7/Uwi+lobhEBXC6JM3iLKRAQ9Mfv/CSYnH6wqp3DTl2C
   4HE4A+98DMIiT4CRumII5jFj25JXt18BW23KCno+BrtVLZClhnonyHQJ3
   yOJUVTTNoMjiKMjOou/lcnus66wPbb62EgpQiIXdvW2i2Pudj9zlx9PXo
   g==;
X-CSE-ConnectionGUID: rsx48cuASsGLSanVDEYa4A==
X-CSE-MsgGUID: uht3kviPSjGTfxtgikU7OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2734348"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2734348"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 17:56:14 -0800
X-CSE-ConnectionGUID: DGgOjtVIR12MaDTDE+c+Cg==
X-CSE-MsgGUID: iPBdqLv0Seia/nIXbqe89w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7306516"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 06 Nov 2026 17:56:11 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPVf2-00000000AVL-0ScU;
	Sat, 07 Nov 2026 01:56:04 +0000
Date: Sat, 07 Nov 2026 02:55:15 +0100
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [superna9999:topic/sm8650/deckard-el2 1/1]
 drivers/clk/qcom/lpasscorecc-sm8650.c:41:10: sparse: sparse: Initializer
 entry defined twice
Message-ID: <202611070231.vdlYRgnr-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/superna9999/linux topic/sm8650/deckard-el2
head:   4eb3bf9a5093f47916b0d4fc5fd45c97dd0b2c65
commit: 4eb3bf9a5093f47916b0d4fc5fd45c97dd0b2c65 [1/1] WiP
config: arm64-randconfig-r2305-20261106 (https://download.01.org/0day-ci/archive/20261107/202611070231.vdlYRgnr-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 0fa861dbbf46e5a75f621406fd91cb015d8754bf)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611070231.vdlYRgnr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611070231.vdlYRgnr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/qcom/lpasscorecc-sm8650.c:41:10: sparse: sparse: Initializer entry defined twice
   drivers/clk/qcom/lpasscorecc-sm8650.c:44:10: sparse:   also defined here

vim +41 drivers/clk/qcom/lpasscorecc-sm8650.c

    34	
    35	static const struct alpha_pll_config lpass_core_cc_dig_pll_config = {
    36		.l = 0x33,
    37		.alpha = 0x0,
    38		.config_ctl_val = 0x20485699,
    39		.config_ctl_hi_val = 0x00182261,
    40		.config_ctl_hi1_val = 0x82aa299c,
  > 41		.user_ctl_val = 0x00000003,
    42		.user_ctl_hi_val = 0x00009000,
    43		.user_ctl_hi1_val = 0x00000034,
    44		.user_ctl_val = 0x00000000,
    45		.user_ctl_hi_val = 0x00000005,
    46	};
    47	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
