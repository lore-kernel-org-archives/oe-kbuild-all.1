Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794763344;
	b=P92uWLWJ2UX6n0ZW0lZHwLlVJQPsxmSuZM2DG4SZrl/HYrj/LEHLIIxo0yYUFqT4i4eZ
	 +QVKaC8M9hfSlefnttCRHW8Eub5ThZXJeqNvPk72jf/t1PvGue6ivrUNvXMIskhO2mSCI
	 lHnzvc4M9HbwfONv62X9sf9vGtt3BwHa2olX5dXhviDDskVPMJz8LVw8/tW6+i4TK1qfT
	 pOr6wTZEMvCCz0A4i2eAYw6u1D5mevCs14TXxuqmahiTMB8SDOUXk0s0n5m5IWITvRLY8
	 HHT/JIadfZmtPlhELznQtC9v5m3OE1r4lSPLz85UiMF/fRpT05yCA8w9CfV4PmdTYsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794763344;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=xJDZzVumY0PfNh2oH9f9zVpF+Pr02Pz+NAVtM1VUL+M=;
	b=ALLftU2uYtPpUDLa2tUrlUjt8FHLCiOtfamSgSbAe7hqh8+KphHwzBZPazbeO6YXf3ap
	 Ghcv0GgXGgBNWTtvK2fvrInbtwnEuToz/zXjm06ml1CxpTKL5836QvYAcJ729DgPx/Slm
	 rlUoUKJ5QGfR2kabImFb25Hsuudp5fOHAKlK0v6uqgx1Dph9vo4I+kOJg/9tfj1FZrFX1
	 S9bC/p6aKeXsfIZqVeqqNT4LQN1a3lhARVJ0XENzDojcMwgDgmBowct89NAesN02mRw/h
	 1Th1rVb6UjC8MjvI5pJ5mojH+RM6lJqvtdP8I/zejPXSIcVZJbBf3ngNl9gFujoobQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f1ZlzE29;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6433D606A323
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Nov 2026 17:22:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6433D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f1ZlzE29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794763343; x=1826299343;
  h=date:from:to:cc:subject:message-id;
  bh=8hKjyWU7lXfB7AKL97A69jN3ZwssJuI8IJsH2c6y6yA=;
  b=f1ZlzE29IZD4Ix/DnqYi/i3XC7HvsrcpAO+V1WIjUMGkOoDkYoYorM6t
   JU2Toubw+aTunolydf8aIW4UnfCOYxbXk/bc2mM+W5PBfkgAXvHeAi0pD
   vkmG2AE2pBp5PXnLCrVp3xx4H2HgdeT45oqkDOWwfIiZTMOqV5ha1z/di
   tm3McDSqdK+MMSeH2eoItFV/QkK6B0AfoCD64Lilkt/iwsylCW5UpSY5v
   Ex92I3Ga9RX9JK0KfD9LgDj066m2YpLDOoTokpSn/XpP2uVF9PGnqO8oZ
   a1pxLi2p0MK7m2B3Embuwl0n9+Ok0aurGoSuQodItDsYk2LWdtgNeINPC
   Q==;
X-CSE-ConnectionGUID: W6AUkJnzSzaQrITVnJIgNw==
X-CSE-MsgGUID: TyLlXEknSOCltBFZNlDUvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3380707"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3380707"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 09:22:23 -0800
X-CSE-ConnectionGUID: UVA+krQpQ3KDagkC/4JuZw==
X-CSE-MsgGUID: WPCQ+VX4RbKoL2eICAXMLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9517260"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 15 Nov 2026 09:22:22 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSdvn-000000002Kz-1aMV;
	Sun, 15 Nov 2026 17:22:19 +0000
Date: Sun, 15 Nov 2026 18:21:54 +0100
From: kernel test robot <lkp@intel.com>
To: Romain TISSERAND <romain.tisserand@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, "Chen-Yu Tsai" <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [sunxi:sunxi/clk-for-7.5 2/16]
 drivers/clk/sunxi-ng/ccu_nkm.c:50:1-7: WARNING: do_div() does a 64-by-32
 division, please consider using div64_ul instead.
Message-ID: <202611151822.QXTOs54d-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/clk-for-7.5
head:   63a29fbb4ecdadbaccd2693864616918698e1e58
commit: e9d9dae0d248cb9a102ba90adbef2cfe198d832c [2/16] clk: sunxi-ng: nkm: avoid 32-bit overflow in rate calculations
config: xtensa-randconfig-r2101-20261115 (https://download.01.org/0day-ci/archive/20261115/202611151822.QXTOs54d-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611151822.QXTOs54d-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/clk/sunxi-ng/ccu_nkm.c:50:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead.
   drivers/clk/sunxi-ng/ccu_nkm.c:40:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead.

vim +50 drivers/clk/sunxi-ng/ccu_nkm.c

    43	
    44	static unsigned long ccu_nkm_calc_parent_rate(unsigned long rate,
    45						      unsigned long n, unsigned long k,
    46						      unsigned long m)
    47	{
    48		u64 parent = (u64)rate * m;
    49	
  > 50		do_div(parent, n * k);
    51		return min_t(u64, parent, ULONG_MAX);
    52	}
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
