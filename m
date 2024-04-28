Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5986E60E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 19:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714334269; cv=none; b=J0r04nhSfFJCAGBkI1dEj4SOy+W7sFcNbfgjRAZ2Up7ymcBcZ3IUc5jJus2w6q/Eq833ROyaU3gTIdSyFoLESdEiYbEOLvRcsn/mqSZSm5q/G0DPvCc2Eg+4/XGxN07T9INyfeJFH5neAriwaauZSNmSp4QuKYyyta4XwzZMWaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714334269; c=relaxed/simple;
	bh=RHNx8mI8NyeFTmxwmDOotOFA+WpZIftaqsXVT+DZ3Ic=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hwv4xxvrqr3TognpZ2KX0B4IXn6ZZ/SHduy2lVO1+izRP9XDpXfL2PVvUL8bCdRlkx6mBiphgaTqnyCwniq2gHM0/9Br6y5xyHp0YcnnpbdjqGr1MUx+pN992HQ72qUWh5dTz50mgrF3AJKiCkqIHCVcW6mZyyUJMos9L3fuwks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d+HpLh+N; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d+HpLh+N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714334266; x=1745870266;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RHNx8mI8NyeFTmxwmDOotOFA+WpZIftaqsXVT+DZ3Ic=;
  b=d+HpLh+Npo0guUBChmY6kvlbghkm7ejlcdOrUW3RYVdfmOBeXWAvH4Qm
   vmeo+TzoD1JiCrG9f7EkA21btXT7FeEJjJPkrTYNIdk2KSJaKGPdhn1na
   9hxFsr5ZDKEnkMAglbneGZbB7HvQYYCUAmPGCu50usqCrg19AADpTAl+o
   jcsxTL7I7K/4OYo1x2gVxYvbqS1tH8xt2F0hQDotoPCLBzwR0pKRQAkaM
   sHSSuvFXKUit3ZtwD62O0/V2NWZI2Jycr+XFs9EiFO0ECErphB9VnhqDi
   v9d3zhMJJ82XlU7MZ+ZAwg+6OSCKhbWe4wHjBwJRCgQbtuhYNASEH6JXF
   A==;
X-CSE-ConnectionGUID: TIPKZMEORp6xl+Kv6Fcyug==
X-CSE-MsgGUID: V59wyhB6RhCLxtnfHGh/Ig==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10210677"
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="10210677"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 12:57:45 -0700
X-CSE-ConnectionGUID: c0yUEZiARhO4Boc0r156yQ==
X-CSE-MsgGUID: UVP+ACLwTlGnVoBaeLwFkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="30571295"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Apr 2024 12:57:44 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1Aec-0006hu-1J;
	Sun, 28 Apr 2024 19:57:42 +0000
Date: Mon, 29 Apr 2024 03:57:15 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 6512/11728]
 drivers/clk/imx/clk-pll14xx.c:214:34: warning: result of comparison of
 constant 3200000000 with expression of type 'long' is always false
Message-ID: <202404290311.no0xvXvm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: d5fc850bfd0686260be98a0f634b8b5455d37042 [6512/11728] LF-10705: clk: imx: pll14xx: Add constraint for fvco frequency
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240429/202404290311.no0xvXvm-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404290311.no0xvXvm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404290311.no0xvXvm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/imx/clk-pll14xx.c:214:34: warning: result of comparison of constant 3200000000 with expression of type 'long' is always false [-Wtautological-constant-out-of-range-compare]
                           if (fvco < 1600000000 || fvco > 3200000000)
                                                    ~~~~ ^ ~~~~~~~~~~
   1 warning generated.


vim +/long +214 drivers/clk/imx/clk-pll14xx.c

   143	
   144	static void imx_pll14xx_calc_settings(struct clk_pll14xx *pll, unsigned long rate,
   145					      unsigned long prate, struct imx_pll14xx_rate_table *t)
   146	{
   147		u32 pll_div_ctl0, pll_div_ctl1;
   148		int mdiv, pdiv, sdiv, kdiv;
   149		long fvco, fout, rate_min, rate_max, dist, best = LONG_MAX;
   150		const struct imx_pll14xx_rate_table *tt;
   151	
   152		/*
   153		 * Fractional PLL constrains:
   154		 *
   155		 * a) 1 <= p <= 63
   156		 * b) 64 <= m <= 1023
   157		 * c) 0 <= s <= 6
   158		 * d) -32768 <= k <= 32767
   159		 *
   160		 * fvco = (m * 65536 + k) * prate / (p * 65536)
   161		 *
   162		 * e) 1600MHz <= fvco <= 3200MHz
   163		 */
   164	
   165		/* First try if we can get the desired rate from one of the static entries */
   166		tt = imx_get_pll_settings(pll, rate);
   167		if (tt) {
   168			pr_debug("%s: in=%ld, want=%ld, Using PLL setting from table\n",
   169				 clk_hw_get_name(&pll->hw), prate, rate);
   170			t->rate = tt->rate;
   171			t->mdiv = tt->mdiv;
   172			t->pdiv = tt->pdiv;
   173			t->sdiv = tt->sdiv;
   174			t->kdiv = tt->kdiv;
   175			return;
   176		}
   177	
   178		pll_div_ctl0 = readl_relaxed(pll->base + DIV_CTL0);
   179		mdiv = FIELD_GET(MDIV_MASK, pll_div_ctl0);
   180		pdiv = FIELD_GET(PDIV_MASK, pll_div_ctl0);
   181		sdiv = FIELD_GET(SDIV_MASK, pll_div_ctl0);
   182		pll_div_ctl1 = readl_relaxed(pll->base + DIV_CTL1);
   183	
   184		/* Then see if we can get the desired rate by only adjusting kdiv (glitch free) */
   185		rate_min = pll14xx_calc_rate(pll, mdiv, pdiv, sdiv, KDIV_MIN, prate);
   186		rate_max = pll14xx_calc_rate(pll, mdiv, pdiv, sdiv, KDIV_MAX, prate);
   187	
   188		if (rate >= rate_min && rate <= rate_max) {
   189			kdiv = pll1443x_calc_kdiv(mdiv, pdiv, sdiv, rate, prate);
   190			pr_debug("%s: in=%ld, want=%ld Only adjust kdiv %ld -> %d\n",
   191				 clk_hw_get_name(&pll->hw), prate, rate,
   192				 FIELD_GET(KDIV_MASK, pll_div_ctl1), kdiv);
   193			fout = pll14xx_calc_rate(pll, mdiv, pdiv, sdiv, kdiv, prate);
   194			t->rate = (unsigned int)fout;
   195			t->mdiv = mdiv;
   196			t->pdiv = pdiv;
   197			t->sdiv = sdiv;
   198			t->kdiv = kdiv;
   199			return;
   200		}
   201	
   202		/* Finally calculate best values */
   203		for (pdiv = 1; pdiv <= 63; pdiv++) {
   204			for (sdiv = 0; sdiv <= 6; sdiv++) {
   205				/* calc mdiv = round(rate * pdiv * 2^sdiv) / prate) */
   206				mdiv = DIV_ROUND_CLOSEST(rate * (pdiv << sdiv), prate);
   207				mdiv = clamp(mdiv, 64, 1023);
   208	
   209				kdiv = pll1443x_calc_kdiv(mdiv, pdiv, sdiv, rate, prate);
   210				fout = pll14xx_calc_rate(pll, mdiv, pdiv, sdiv, kdiv, prate);
   211	
   212				fvco = fout << sdiv;
   213	
 > 214				if (fvco < 1600000000 || fvco > 3200000000)
   215					continue;
   216				/* best match */
   217				dist = abs((long)rate - (long)fout);
   218				if (dist < best) {
   219					best = dist;
   220					t->rate = (unsigned int)fout;
   221					t->mdiv = mdiv;
   222					t->pdiv = pdiv;
   223					t->sdiv = sdiv;
   224					t->kdiv = kdiv;
   225	
   226					if (!dist)
   227						goto found;
   228				}
   229			}
   230		}
   231	found:
   232		pr_debug("%s: in=%ld, want=%ld got=%d (pdiv=%d sdiv=%d mdiv=%d kdiv=%d)\n",
   233			 clk_hw_get_name(&pll->hw), prate, rate, t->rate, t->pdiv, t->sdiv,
   234			 t->mdiv, t->kdiv);
   235	}
   236	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
