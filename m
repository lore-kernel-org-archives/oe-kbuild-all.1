Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F42F1714B7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Mar 2025 09:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742722399; cv=none; b=TXl9dIRwyFGKIpY71HplApq/BbsmqP2w19c5DeOj4d5l5xBVbjrS5R66lIFK6sFoE9w7EtGW0iBx0xLb7bUhZ4Trap+5kuoY89pxPivBPLDMeyEDS36CocTzw9b8ZUbtm0P3ve1ZBncMsSUAk4zftUpw6cYrO/rFQMTUJpILNew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742722399; c=relaxed/simple;
	bh=YLSk1bvDCwuJMkdloLU87cAec6RzJd3xxvj6bPv9ooU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XBhCX/wDoS1oX9WJJeensOjkKV0wXtpB/Z8spl3pLqC/5ELutPg57gnJNgfV1o8nW5x1IMEyMabFo7leY0CpCML8fhWXivtA6nuD8sWl1ZcjIGaaK3Z5tANlLXI9iYrMXwan+lHsEUJjJ6b+EV1CdWEvpJgNYysAbmtt+d02sZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TEDPnr1o; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TEDPnr1o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742722398; x=1774258398;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YLSk1bvDCwuJMkdloLU87cAec6RzJd3xxvj6bPv9ooU=;
  b=TEDPnr1oqvipOU4OSAIyzmqMXfzBViKTO0++MAFgcZglLbd4U03jqm5A
   07gLdqvpN7CueRdcz5ofRgjFlaeRZa3wp5dn0kNLaBthIr6APkC5Vd38w
   CtPIuj8tHoc5W4breOLhK3oaeX0MsvpYL4cjiFBLgX2aYstZJ+NJKAzAF
   8NHYpEtCWUwwCv4WkC4xxmf18H3gnE3m5nnKX0vlDVECQDhxSUNNUXzY2
   w0XhvRgeOX3wzhLrfzNwtJb92EPpeDwfJoMvF4graKlo1SNKyFJuGrxoy
   yi7HvihjQd5m/UpCG75O68qWCzb/e9ptIhrD7TYJ6i4gHfY3XKETzrD9d
   A==;
X-CSE-ConnectionGUID: GpY2kp1eTAWQ3s9bxbJsqQ==
X-CSE-MsgGUID: oM+7Rky/Q5e6GCuRdp6Zmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="43868242"
X-IronPort-AV: E=Sophos;i="6.14,269,1736841600"; 
   d="scan'208";a="43868242"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2025 02:33:17 -0700
X-CSE-ConnectionGUID: C04lcgWWTm2jf/lXjV/JcA==
X-CSE-MsgGUID: Wis5XGf9TDitRJ2/0UlSoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,269,1736841600"; 
   d="scan'208";a="128836094"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 23 Mar 2025 02:33:16 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twHhT-0002gt-0Q;
	Sun, 23 Mar 2025 09:33:00 +0000
Date: Sun, 23 Mar 2025 17:32:30 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-werror 9/21] drivers/pwm/pwm-mediatek.c:142:41:
 error: passing argument 1 of 'clk_get_rate' makes pointer from integer
 without a cast
Message-ID: <202503231712.uMV7KggI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-werror
head:   aecd65419533fc7a9eb88c055189d4ec4c9fbdca
commit: 38fca6d9fa6497b95c4b53427d3e83908b807cf3 [9/21] pwm: mediatek: Prevent divide-by-zero in pwm_mediatek_config()
config: sparc64-randconfig-001-20250323 (https://download.01.org/0day-ci/archive/20250323/202503231712.uMV7KggI-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250323/202503231712.uMV7KggI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503231712.uMV7KggI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./arch/sparc/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/kernel.h:27,
                    from arch/sparc/include/asm/io_64.h:5,
                    from arch/sparc/include/asm/io.h:5,
                    from include/linux/io.h:14,
                    from drivers/pwm/pwm-mediatek.c:11:
   drivers/pwm/pwm-mediatek.c: In function 'pwm_mediatek_config':
>> drivers/pwm/pwm-mediatek.c:142:41: error: passing argument 1 of 'clk_get_rate' makes pointer from integer without a cast [-Wint-conversion]
     142 |         do_div(resolution, clk_get_rate(clk_rate));
         |                                         ^~~~~~~~
         |                                         |
         |                                         long unsigned int
   include/asm-generic/div64.h:46:28: note: in definition of macro 'do_div'
      46 |         uint32_t __base = (base);                               \
         |                            ^~~~
   In file included from drivers/pwm/pwm-mediatek.c:15:
   include/linux/clk.h:1076:54: note: expected 'struct clk *' but argument is of type 'long unsigned int'
    1076 | static inline unsigned long clk_get_rate(struct clk *clk)
         |                                          ~~~~~~~~~~~~^~~


vim +/clk_get_rate +142 drivers/pwm/pwm-mediatek.c

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
 > 142		do_div(resolution, clk_get_rate(clk_rate));
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
