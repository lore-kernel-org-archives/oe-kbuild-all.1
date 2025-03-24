Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0E225E444
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Mar 2025 13:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742823837; cv=none; b=SBnOretNb/BE2jTruTbsd92i1+99Q4fmJE5hegUHzYJ4B3sCpN8fAqeyLTVXcsuBgc+o7p+skGWgddFT4IXlEI/pqCxLhopAXPRTiLNvjTTf8CRoYR/ZWzyNlTgloU9g+4U6vHikPUwL3mkWX63tLt0kwxyS0Xu6MHzBDH0ZWpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742823837; c=relaxed/simple;
	bh=+P/WT2cvNcq4MrEdHKMVPe4vc5/k8h+eg0ME/bhPKyY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uxx0mrHYRn/TobpPSrvgqLxYJYKMRRFB6okyPfZsER3dMwkDJkUvG4mWKAHASHaYwsZNac5mxEeg+oEDXI/sywmjzihLYMJLUJPa1Cdu8nL5Oc61wHqktCC2ayLi30ncpn4wkzOPpFls0Fo087UJoGvllbmgzSEPh4UZ1sdhYiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uj1RAheN; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uj1RAheN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742823835; x=1774359835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+P/WT2cvNcq4MrEdHKMVPe4vc5/k8h+eg0ME/bhPKyY=;
  b=Uj1RAheNX3/Oo7Ck0aZiwuaYji48CD5ww352wsDsIsd3tQDMzXZx3Nl4
   nD450JZ02JxIQXNtSJYG07SbJrzk8ei+/4M65OkD3zZtCTDWBbWLiWpIh
   tTHKMFBD7PpVP7bLJ4Gt5CezlfOMVTugZkaYYNAfqq8sx/rARm88Qv5iP
   DEEcA9ZA/1kiZjSEvx+n4S5ClCsZm6OaYzzyWWaZRGEvBEgNlkISWfyF6
   C5BljtSFRht2KUuORwTDPxFXqjV3RjY0SNJ3WPFOVttWzpJERo2q3UQ53
   22vwsaC5B/LVBhwI+8PUHe/krE6gkFxWnKvnc2pmz+qOEZbDHXJpJwAtX
   Q==;
X-CSE-ConnectionGUID: uixWU9NHST+mbt5mogTzEQ==
X-CSE-MsgGUID: KAzJBOmjTkiqQNiOgGipIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="44192761"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; 
   d="scan'208";a="44192761"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 06:43:53 -0700
X-CSE-ConnectionGUID: 2tSsMt8dTJ+knizt8ewVUw==
X-CSE-MsgGUID: Oy0WZTr+T5mKFT3wlm2e9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; 
   d="scan'208";a="128228975"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 24 Mar 2025 06:43:52 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twi5m-0003cT-1u;
	Mon, 24 Mar 2025 13:43:50 +0000
Date: Mon, 24 Mar 2025 21:43:32 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-werror 21/22] drivers/pwm/pwm-mediatek.c:142:1-7:
 WARNING: do_div() does a 64-by-32 division, please consider using div64_ul
 instead.
Message-ID: <202503242136.gWSwF8Bh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-werror
head:   a83027487e43186e3eb3dd0a39733ee2eb102d30
commit: b31869ae7173a6350b6b764f36a90003dedd8902 [21/22] pwm: mediatek: Prevent divide-by-zero in pwm_mediatek_config()
config: parisc-randconfig-r052-20250324 (https://download.01.org/0day-ci/archive/20250324/202503242136.gWSwF8Bh-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503242136.gWSwF8Bh-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/pwm/pwm-mediatek.c:142:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead.

vim +142 drivers/pwm/pwm-mediatek.c

   117	
   118	static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
   119				       int duty_ns, int period_ns)
   120	{
   121		struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
   122		u32 clkdiv = 0, cnt_period, cnt_duty, reg_width = PWMDWIDTH,
   123		    reg_thres = PWMTHRES;
   124		unsigned long clk_rate;
   125		u64 resolution;
   126		int ret;
   127	
   128		ret = pwm_mediatek_clk_enable(chip, pwm);
   129		if (ret < 0)
   130			return ret;
   131	
   132		clk_rate = clk_get_rate(pc->clk_pwms[pwm->hwpwm]);
   133		if (!clk_rate)
   134			return -EINVAL;
   135	
   136		/* Make sure we use the bus clock and not the 26MHz clock */
   137		if (pc->soc->has_ck_26m_sel)
   138			writel(0, pc->regs + PWM_CK_26M_SEL);
   139	
   140		/* Using resolution in picosecond gets accuracy higher */
   141		resolution = (u64)NSEC_PER_SEC * 1000;
 > 142		do_div(resolution, clk_rate);
   143	
   144		cnt_period = DIV_ROUND_CLOSEST_ULL((u64)period_ns * 1000, resolution);
   145		while (cnt_period > 8191) {
   146			resolution *= 2;
   147			clkdiv++;
   148			cnt_period = DIV_ROUND_CLOSEST_ULL((u64)period_ns * 1000,
   149							   resolution);
   150		}
   151	
   152		if (clkdiv > PWM_CLK_DIV_MAX) {
   153			pwm_mediatek_clk_disable(chip, pwm);
   154			dev_err(pwmchip_parent(chip), "period of %d ns not supported\n", period_ns);
   155			return -EINVAL;
   156		}
   157	
   158		if (pc->soc->pwm45_fixup && pwm->hwpwm > 2) {
   159			/*
   160			 * PWM[4,5] has distinct offset for PWMDWIDTH and PWMTHRES
   161			 * from the other PWMs on MT7623.
   162			 */
   163			reg_width = PWM45DWIDTH_FIXUP;
   164			reg_thres = PWM45THRES_FIXUP;
   165		}
   166	
   167		cnt_duty = DIV_ROUND_CLOSEST_ULL((u64)duty_ns * 1000, resolution);
   168		pwm_mediatek_writel(pc, pwm->hwpwm, PWMCON, BIT(15) | clkdiv);
   169		pwm_mediatek_writel(pc, pwm->hwpwm, reg_width, cnt_period);
   170		pwm_mediatek_writel(pc, pwm->hwpwm, reg_thres, cnt_duty);
   171	
   172		pwm_mediatek_clk_disable(chip, pwm);
   173	
   174		return 0;
   175	}
   176	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
