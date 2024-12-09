Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAE91684A0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 05:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733720991; cv=none; b=GfP3lDx6s2V8M3JBypMsTtJGeHojnPtJL0WOYu5UiE01Pd8brrYme0z+w+zLpQgqXGTanHrApB1d5uTtg5F486oRAAf8Ll50iJJm4SByDxIGgUCEoB9E1GJsRb97SVo71NWmM1cGEFUh3vmNvoCR32K8CIrpZ9A3q4K5D45Oa/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733720991; c=relaxed/simple;
	bh=ew/8DOla6GGK2y5JGIrQUW23Ny327qc6PfkECHJxMq0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eI4A9zc1j54Kb7KQmmT2+Qr7xQvysIoxTBWxabtvPrUd9peysQmnpO1WJC8Kaptk3KzpHOq08/tYxfVVQfgqalbH4gxodx07jsc8U9sYAk/ZEHn+O7Npj3sTDLuRRoe1T0/RnGVZvMYfgBoRFCczZKvUBqEd7M8l65QIIZoxrLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BZI74a9j; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BZI74a9j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733720989; x=1765256989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ew/8DOla6GGK2y5JGIrQUW23Ny327qc6PfkECHJxMq0=;
  b=BZI74a9jUaee+myTh6I9KfddB6RGWV33MPjHbbUSK72NeF1cnRREEbhw
   Oait5+L4/XdgguJ7o3aIM82eG4LztQ13NltKIcKLdRbyDvpYekn5CiZxX
   iRcMxf5LDZpVNPzte0dIh7wdkz1x7gDmGOX8Ff0F4GwouySOisxUg3uIk
   BwTbrcjRcK7DmsQ/UAC7JJ2d4u0AHF8UIvjfycY62xtRA489JTsaL4OOb
   jxcAO8PfmouXjwrAe33jQy0ZMDzeI4VSTUCujintYEiSqXNWwqGpy+Coy
   8rpMIxC1Jl3UAit6hqUDQmuBf4OPXE3BJFvrZYTJXzxatCCJ/pc7GuXhG
   w==;
X-CSE-ConnectionGUID: Vd1PjnZ4TW+8jsUhMnksaA==
X-CSE-MsgGUID: nmS42YdQTia572p3rR3bsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="37683996"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="37683996"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 21:09:47 -0800
X-CSE-ConnectionGUID: hsrn04cxTg2W/Jv5KgTNAA==
X-CSE-MsgGUID: 4fJfqzIHQCacDo7k2gySUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="125806864"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Dec 2024 21:09:46 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKW1e-0003yX-2H;
	Mon, 09 Dec 2024 05:09:42 +0000
Date: Mon, 9 Dec 2024 13:08:47 +0800
From: kernel test robot <lkp@intel.com>
To: Adam Ford <aford173@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>,
	Dominique Martinet <dominique.martinet@atmark-techno.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: drivers/phy/freescale/phy-fsl-samsung-hdmi.c:472:3-9: WARNING:
 do_div() does a 64-by-32 division, please consider using div64_ul instead.
Message-ID: <202412091243.fSObwwPi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
commit: 1951dbb41d1dff7c135eed4fa1a6330df6971549 phy: freescale: fsl-samsung-hdmi: Support dynamic integer
date:   8 weeks ago
config: alpha-randconfig-r064-20241209 (https://download.01.org/0day-ci/archive/20241209/202412091243.fSObwwPi-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412091243.fSObwwPi-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/phy/freescale/phy-fsl-samsung-hdmi.c:472:3-9: WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead.

vim +472 drivers/phy/freescale/phy-fsl-samsung-hdmi.c

   435	
   436	static unsigned long fsl_samsung_hdmi_phy_find_pms(unsigned long fout, u8 *p, u16 *m, u8 *s)
   437	{
   438		unsigned long best_freq = 0;
   439		u32 min_delta = 0xffffffff;
   440		u8 _p, best_p;
   441		u16 _m, best_m;
   442		u8 _s, best_s;
   443	
   444		/*
   445		 * Figure 13-78 of the reference manual states the PLL should be TMDS x 5
   446		 * while the TMDS_CLKO should be the PLL / 5.  So to calculate the PLL,
   447		 * take the pix clock x 5, then return the value of the PLL / 5.
   448		 */
   449		fout *= 5;
   450	
   451		/* The ref manual states the values of 'P' range from 1 to 11 */
   452		for (_p = 1; _p <= 11; ++_p) {
   453			for (_s = 1; _s <= 16; ++_s) {
   454				u64 tmp;
   455				u32 delta;
   456	
   457				/* s must be one or even */
   458				if (_s > 1 && (_s & 0x01) == 1)
   459					_s++;
   460	
   461				/* _s cannot be 14 per the TRM */
   462				if (_s == 14)
   463					continue;
   464	
   465				/*
   466				 * TODO: Ref Manual doesn't state the range of _m
   467				 * so this should be further refined if possible.
   468				 * This range was set based on the original values
   469				 * in the lookup table
   470				 */
   471				tmp = (u64)fout * (_p * _s);
 > 472				do_div(tmp, 24 * MHZ);
   473				_m = tmp;
   474				if (_m < 0x30 || _m > 0x7b)
   475					continue;
   476	
   477				/*
   478				 * Rev 2 of the Ref Manual states the
   479				 * VCO can range between 750MHz and
   480				 * 3GHz. The VCO is assumed to be
   481				 * Fvco = (M * f_ref) / P,
   482				 * where f_ref is 24MHz.
   483				 */
   484				tmp = (u64)_m * 24 * MHZ;
   485				do_div(tmp, _p);
   486				if (tmp < 750 * MHZ ||
   487				    tmp > 3000 * MHZ)
   488					continue;
   489	
   490				/* Final frequency after post-divider */
   491				do_div(tmp, _s);
   492	
   493				delta = abs(fout - tmp);
   494				if (delta < min_delta) {
   495					best_p = _p;
   496					best_s = _s;
   497					best_m = _m;
   498					min_delta = delta;
   499					best_freq = tmp;
   500				}
   501			}
   502		}
   503	
   504		if (best_freq) {
   505			*p = best_p;
   506			*m = best_m;
   507			*s = best_s;
   508		}
   509	
   510		return best_freq / 5;
   511	}
   512	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
