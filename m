Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792547679;
	b=rRwb12NU5dw+6+W5+0srXP1adXk1yYldSJTlQOyqjApLAQ3zQJ5HK2/6EfUmLzhUS+1L
	 V31nFYuv8v9C5bshPIQpt5HdXE3kbEXl8TLG7bIAxWuIkJVREgrqs6endvMjx7vFQVXPc
	 RAWLGDimwgLq2W7oH/MG4sXLmRxTJw88PO8pcfoILDUVedsN6LSi3jvsD68OhwRp0gzm7
	 Q6tDdScs07aOD2h2JKcLzPOPTlKxMZK7S4x60WEioLzrGQGlEd1fTzWyc9gjmJIKlW9xj
	 dk0zYrm1Eovv/apQUkxFOgrzu23ra8K9sKtsT3SXiIIAgDsykcLRgGcOIWnTqH0rDSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792547679;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=0z1uOl2yJIA88ydtZ4Naia5pYPvinKqYydRtlu+CrMU=;
	b=FKQ7e5oveRs1OZQhqjVCcy3XEu0xp8qflLU4xtB8skY8eaf5Kvin5JbbZZxpIK1/1ppv
	 0R0tsUt290J+Y8+B7A9wejPc2Fp/rFLMV3xqkhilUjZFnO7dQd9D647d1FaeQwEf1lA6Y
	 k25B1XBJVvGTFrEgBLMs3qiOkpl9mVhVrxxRflOmbpKZbxx2kg//H2SC9EFiYs3qywzWJ
	 2k/VNlZQeUCdEiK4PrTz6SU56RIFKDPH81cK27C6VrJkqSYoFIG5083ncGCqY1LCn7xxo
	 dQJUw190g8kYxqJziGVaHAEHQQCzcEhSg9VQKGy6SxxwQAj2UIXuJz6ZnwsKTzI52xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PQWDCajK;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19D8606A31B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Oct 2026 01:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D19D8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PQWDCajK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792547678; x=1824083678;
  h=date:from:to:cc:subject:message-id;
  bh=UIWvzw9MhEQz4HHfKqW4WRbVkHXQu4fpNljElUd4+Ck=;
  b=PQWDCajKGlq/dfVnL8iEQ7sEmqbvXlggUjFNc+kLRqKJ4W+0qyHxI5kF
   XXctwbL1YwKiPsx9PuDL6J6UvduS8QY7anqc06cDqr8OIvS4wNqsMn0ix
   /8SGVpR0VTNC6E3/06menH5mxC9Ml5chhN0b2KXPN3mAdzJYOacOytdo3
   26s+SEYo01IDRLxPtPLaGd5ZNhgc1NswNxh8hPLJPqs8yuEygUBbXbwx6
   h0r2AM4Hc3f9FoYlaxDqhwH46xwSxCwpSFb5TZ+0k2Q/E6YEJgPqSLFmA
   0PCLIXSNNkcFwcFqIXLTierLLSB97vIDzUNw1MV78Xv0PjiFy75st+hDl
   A==;
X-CSE-ConnectionGUID: 1c3dlB0SRPCiztMzv1M1Pw==
X-CSE-MsgGUID: wyYLvFF+T96hCSJE/thwAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1364846"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1364846"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 18:54:37 -0700
X-CSE-ConnectionGUID: B1FWaT/ISPCUz9OpS77fHw==
X-CSE-MsgGUID: E+eXsUoVR8GaNKMxRYW0ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="2970425"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 20 Oct 2026 18:54:36 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJLXF-000000006aN-41eA;
	Wed, 21 Oct 2026 01:54:33 +0000
Date: Wed, 21 Oct 2026 03:53:37 +0200
From: kernel test robot <lkp@intel.com>
To: ckkim <changkon12@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-7.3.y 2/59] ERROR: modpost:
 drivers/clk/meson/axg-audio.ko: symbol 'meson_clk_phase_ops' undefined!
Message-ID: <202610210353.p411HmaK-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/tobetter/linux odroid-7.3.y
head:   c30cb664bead7336f81c7a7c7c82709ee1f803cf
commit: 6d59c25e68051d59dfac85991d9a152489e628c3 [2/59] ODROID-COMMON:sound/soc/meson: add audio module for g12a, g12b, sm1
config: arm-randconfig-2001-20261020 (https://download.01.org/0day-ci/archive/20261021/202610210353.p411HmaK-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261021/202610210353.p411HmaK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610210353.p411HmaK-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: drivers/clk/meson/axg-audio.ko: symbol 'meson_clk_phase_ops' undefined!
>> ERROR: modpost: drivers/clk/meson/axg-audio.ko: symbol 'meson_clk_triphase_ops' undefined!
>> ERROR: modpost: drivers/clk/meson/axg-audio.ko: symbol 'meson_sclk_div_ops' undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for COMMON_CLK_AXG_AUDIO
   Depends on [n]: COMMON_CLK [=y] && (ARCH_MESON [=y] || COMPILE_TEST [=y]) && ARM64
   Selected by [m]:
   - SND_MESON_AXG_FIFO [=m] && SOUND [=y] && SND [=m] && SND_SOC [=m] && (ARCH_MESON [=y] || COMPILE_TEST [=y] && COMMON_CLK [=y])

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
