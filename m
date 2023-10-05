Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB5615C8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Oct 2023 04:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z4cbCdKP"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696480367; x=1728016367;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MltVwwS3wv5biDreOTrr1E2oCF2jmaTZo1/rNjvPfHA=;
  b=Z4cbCdKPwuZSoOmCrr5HLJ46FMYLXBzhB8yYmhS/qapjX9ocwnZB7LXd
   Syin5KiErJS6wVbV1KqmaItGTDRgN/lCWnqurs+3SHP7nW7bUXVdOvJBv
   z8YbJ6DZe1PWutrhFe+3EcKFy9kEZnmzA5v0ea566woGIRH5ozpDS8Thi
   uzgISFS3azrkoTBjQWQ3ztGGPpmdJRONQfMvxdIB89GsoVhqNUJeLcTJC
   SQRSbeq3qpzkgybRDbb3/kr4/UhS3jUy0cTA2tR7UU0lFSZqe6HKM3Jj3
   9T29YhdBxKrQuBK/qODnlWQTZL2qXR3+gcAZqo4R98xBSgILaaMzgI85y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="373748162"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="373748162"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 21:32:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="925444811"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="925444811"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 04 Oct 2023 21:32:44 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoG2U-000L0e-2F;
	Thu, 05 Oct 2023 04:32:42 +0000
Date: Thu, 5 Oct 2023 12:31:44 +0800
From: kernel test robot <lkp@intel.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:lkp_test 5/6]
 drivers/clk/xilinx/clk-xlnx-clock-wizard.c:197:22: warning: unused variable
 'val'
Message-ID: <202310051238.j6rtqqKZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   d81a4120bd209b0103e37eae6f5cceada1eda492
commit: cea76d3ad26cb5f9142426c9b22db5d348c45f2e [5/6] clocking-wizard: Add support for versal clocking wizard
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231005/202310051238.j6rtqqKZ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310051238.j6rtqqKZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310051238.j6rtqqKZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/xilinx/clk-xlnx-clock-wizard.c: In function 'clk_wzrd_recalc_rate_ver':
>> drivers/clk/xilinx/clk-xlnx-clock-wizard.c:197:22: warning: unused variable 'val' [-Wunused-variable]
     197 |         unsigned int val, vall, valh;
         |                      ^~~
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c: In function 'clk_wzrd_recalc_rate':
>> drivers/clk/xilinx/clk-xlnx-clock-wizard.c:222:33: warning: unused variable 'valh' [-Wunused-variable]
     222 |         unsigned int val, vall, valh;
         |                                 ^~~~
>> drivers/clk/xilinx/clk-xlnx-clock-wizard.c:222:27: warning: unused variable 'vall' [-Wunused-variable]
     222 |         unsigned int val, vall, valh;
         |                           ^~~~
>> drivers/clk/xilinx/clk-xlnx-clock-wizard.c:221:39: warning: unused variable 'all' [-Wunused-variable]
     221 |         u32 div, p5en, edge, prediv2, all;
         |                                       ^~~
>> drivers/clk/xilinx/clk-xlnx-clock-wizard.c:221:30: warning: unused variable 'prediv2' [-Wunused-variable]
     221 |         u32 div, p5en, edge, prediv2, all;
         |                              ^~~~~~~
>> drivers/clk/xilinx/clk-xlnx-clock-wizard.c:221:24: warning: unused variable 'edge' [-Wunused-variable]
     221 |         u32 div, p5en, edge, prediv2, all;
         |                        ^~~~
>> drivers/clk/xilinx/clk-xlnx-clock-wizard.c:221:18: warning: unused variable 'p5en' [-Wunused-variable]
     221 |         u32 div, p5en, edge, prediv2, all;
         |                  ^~~~
>> drivers/clk/xilinx/clk-xlnx-clock-wizard.c:221:13: warning: unused variable 'div' [-Wunused-variable]
     221 |         u32 div, p5en, edge, prediv2, all;
         |             ^~~
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c: In function 'clk_wzrd_dynamic_reconfig':
>> drivers/clk/xilinx/clk-xlnx-clock-wizard.c:284:56: warning: unused variable 'regval1' [-Wunused-variable]
     284 |         u32 value, regh, edged, p5en, p5fedge, regval, regval1;
         |                                                        ^~~~~~~
>> drivers/clk/xilinx/clk-xlnx-clock-wizard.c:284:48: warning: unused variable 'regval' [-Wunused-variable]
     284 |         u32 value, regh, edged, p5en, p5fedge, regval, regval1;
         |                                                ^~~~~~
>> drivers/clk/xilinx/clk-xlnx-clock-wizard.c:284:39: warning: unused variable 'p5fedge' [-Wunused-variable]
     284 |         u32 value, regh, edged, p5en, p5fedge, regval, regval1;
         |                                       ^~~~~~~
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:284:33: warning: unused variable 'p5en' [-Wunused-variable]
     284 |         u32 value, regh, edged, p5en, p5fedge, regval, regval1;
         |                                 ^~~~
>> drivers/clk/xilinx/clk-xlnx-clock-wizard.c:284:26: warning: unused variable 'edged' [-Wunused-variable]
     284 |         u32 value, regh, edged, p5en, p5fedge, regval, regval1;
         |                          ^~~~~
>> drivers/clk/xilinx/clk-xlnx-clock-wizard.c:284:20: warning: unused variable 'regh' [-Wunused-variable]
     284 |         u32 value, regh, edged, p5en, p5fedge, regval, regval1;
         |                    ^~~~
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c: In function 'clk_wzrd_reconfig':
>> drivers/clk/xilinx/clk-xlnx-clock-wizard.c:413:30: warning: unused variable 'f' [-Wunused-variable]
     413 |         u32 reg, pre, value, f;
         |                              ^
>> drivers/clk/xilinx/clk-xlnx-clock-wizard.c:413:18: warning: unused variable 'pre' [-Wunused-variable]
     413 |         u32 reg, pre, value, f;
         |                  ^~~
>> drivers/clk/xilinx/clk-xlnx-clock-wizard.c:413:13: warning: unused variable 'reg' [-Wunused-variable]
     413 |         u32 reg, pre, value, f;
         |             ^~~
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c: In function 'clk_wzrd_dynamic_ver_all_nolock':
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:438:30: warning: unused variable 'f' [-Wunused-variable]
     438 |         u32 reg, pre, value, f;
         |                              ^
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:438:18: warning: unused variable 'pre' [-Wunused-variable]
     438 |         u32 reg, pre, value, f;
         |                  ^~~
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:438:13: warning: unused variable 'reg' [-Wunused-variable]
     438 |         u32 reg, pre, value, f;
         |             ^~~
>> drivers/clk/xilinx/clk-xlnx-clock-wizard.c:436:43: warning: unused variable 'clockout0_div' [-Wunused-variable]
     436 |         unsigned long vco_freq, rate_div, clockout0_div;
         |                                           ^~~~~~~~~~~~~
>> drivers/clk/xilinx/clk-xlnx-clock-wizard.c:436:33: warning: unused variable 'rate_div' [-Wunused-variable]
     436 |         unsigned long vco_freq, rate_div, clockout0_div;
         |                                 ^~~~~~~~
>> drivers/clk/xilinx/clk-xlnx-clock-wizard.c:436:23: warning: unused variable 'vco_freq' [-Wunused-variable]
     436 |         unsigned long vco_freq, rate_div, clockout0_div;
         |                       ^~~~~~~~
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c: In function 'clk_wzrd_dynamic_all_nolock':
>> drivers/clk/xilinx/clk-xlnx-clock-wizard.c:506:23: warning: unused variable 'value' [-Wunused-variable]
     506 |         u32 reg, pre, value, f;
         |                       ^~~~~
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:502:60: warning: unused variable 'regval1' [-Wunused-variable]
     502 |         u32 regh, edged, p5en, p5fedge, value2, m, regval, regval1;
         |                                                            ^~~~~~~
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:502:52: warning: unused variable 'regval' [-Wunused-variable]
     502 |         u32 regh, edged, p5en, p5fedge, value2, m, regval, regval1;
         |                                                    ^~~~~~
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:502:49: warning: unused variable 'm' [-Wunused-variable]
     502 |         u32 regh, edged, p5en, p5fedge, value2, m, regval, regval1;
         |                                                 ^
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:502:41: warning: unused variable 'value2' [-Wunused-variable]
     502 |         u32 regh, edged, p5en, p5fedge, value2, m, regval, regval1;
         |                                         ^~~~~~
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:502:32: warning: unused variable 'p5fedge' [-Wunused-variable]
     502 |         u32 regh, edged, p5en, p5fedge, value2, m, regval, regval1;
         |                                ^~~~~~~
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:502:26: warning: unused variable 'p5en' [-Wunused-variable]
     502 |         u32 regh, edged, p5en, p5fedge, value2, m, regval, regval1;
         |                          ^~~~
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:502:19: warning: unused variable 'edged' [-Wunused-variable]
     502 |         u32 regh, edged, p5en, p5fedge, value2, m, regval, regval1;
         |                   ^~~~~
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:502:13: warning: unused variable 'regh' [-Wunused-variable]
     502 |         u32 regh, edged, p5en, p5fedge, value2, m, regval, regval1;
         |             ^~~~
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c: In function 'clk_wzrd_recalc_rate_all':
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:572:64: warning: unused variable 'mult' [-Wunused-variable]
     572 |         u32 edged, div2, p5en, edge, prediv2, all, regl, regh, mult;
         |                                                                ^~~~
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:572:58: warning: unused variable 'regh' [-Wunused-variable]
     572 |         u32 edged, div2, p5en, edge, prediv2, all, regl, regh, mult;
         |                                                          ^~~~
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:572:52: warning: unused variable 'regl' [-Wunused-variable]
     572 |         u32 edged, div2, p5en, edge, prediv2, all, regl, regh, mult;
         |                                                    ^~~~
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:572:47: warning: unused variable 'all' [-Wunused-variable]
     572 |         u32 edged, div2, p5en, edge, prediv2, all, regl, regh, mult;
         |                                               ^~~
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:572:38: warning: unused variable 'prediv2' [-Wunused-variable]
     572 |         u32 edged, div2, p5en, edge, prediv2, all, regl, regh, mult;
         |                                      ^~~~~~~
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:572:32: warning: unused variable 'edge' [-Wunused-variable]
     572 |         u32 edged, div2, p5en, edge, prediv2, all, regl, regh, mult;
         |                                ^~~~
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:572:26: warning: unused variable 'p5en' [-Wunused-variable]
     572 |         u32 edged, div2, p5en, edge, prediv2, all, regl, regh, mult;
         |                          ^~~~
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:572:20: warning: unused variable 'div2' [-Wunused-variable]
     572 |         u32 edged, div2, p5en, edge, prediv2, all, regl, regh, mult;
         |                    ^~~~
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:572:13: warning: unused variable 'edged' [-Wunused-variable]
     572 |         u32 edged, div2, p5en, edge, prediv2, all, regl, regh, mult;
         |             ^~~~~
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c: In function 'clk_wzrd_recalc_rate_all_ver':
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:592:32: warning: unused variable 'f' [-Wunused-variable]
     592 |         u32 m, d, o, div, reg, f;
         |                                ^
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:592:19: warning: unused variable 'o' [-Wunused-variable]
     592 |         u32 m, d, o, div, reg, f;
         |                   ^
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:592:16: warning: unused variable 'd' [-Wunused-variable]
     592 |         u32 m, d, o, div, reg, f;
         |                ^
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:592:13: warning: unused variable 'm' [-Wunused-variable]
     592 |         u32 m, d, o, div, reg, f;
         |             ^
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c: In function 'clk_wzrd_probe':
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:929:36: warning: unused variable 'match' [-Wunused-variable]
     929 |         const struct of_device_id *match;
         |                                    ^~~~~
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c: At top level:
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:686:29: warning: 'clk_wzrd_ver_div_all_ops' defined but not used [-Wunused-const-variable=]
     686 | static const struct clk_ops clk_wzrd_ver_div_all_ops = {
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:680:29: warning: 'clk_wzrd_ver_divider_ops' defined but not used [-Wunused-const-variable=]
     680 | static const struct clk_ops clk_wzrd_ver_divider_ops = {
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/val +197 drivers/clk/xilinx/clk-xlnx-clock-wizard.c

   190	
   191	static unsigned long clk_wzrd_recalc_rate_ver(struct clk_hw *hw,
   192						      unsigned long parent_rate)
   193	{
   194		struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
   195		void __iomem *div_addr = divider->base + divider->offset;
   196		u32 div, p5en, edge, prediv2, all;
 > 197		unsigned int val, vall, valh;
   198	
   199		edge = !!(readl(div_addr) & WZRD_CLKFBOUT_EDGE);
   200		p5en = !!(readl(div_addr) & WZRD_P5EN);
   201		prediv2 = !!(readl(div_addr) & WZRD_CLKOUT0_PREDIV2);
   202		vall = readl(div_addr + 4) & WZRD_CLKFBOUT_L_MASK;
   203		valh = readl(div_addr + 4) >> WZRD_CLKFBOUT_H_SHIFT;
   204		all = valh + vall + edge;
   205		if (!all)
   206			all = 1;
   207	
   208		if (prediv2)
   209			div = 2 * all + prediv2 * p5en;
   210		else
   211			div = all;
   212	
   213		return DIV_ROUND_UP_ULL((u64)parent_rate, div);
   214	}
   215	
   216	static unsigned long clk_wzrd_recalc_rate(struct clk_hw *hw,
   217						  unsigned long parent_rate)
   218	{
   219		struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
   220		void __iomem *div_addr = divider->base + divider->offset;
 > 221		u32 div, p5en, edge, prediv2, all;
 > 222		unsigned int val, vall, valh;
   223	
   224		val = readl(div_addr) >> divider->shift;
   225		val &= div_mask(divider->width);
   226	
   227		return divider_recalc_rate(hw, parent_rate, val, divider->table,
   228				divider->flags, divider->width);
   229	}
   230	
   231	static int clk_wzrd_ver_dynamic_reconfig(struct clk_hw *hw, unsigned long rate,
   232						 unsigned long parent_rate)
   233	{
   234		struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
   235		void __iomem *div_addr = divider->base + divider->offset;
   236		u32 value, regh, edged, p5en, p5fedge, regval, regval1;
   237		unsigned long flags = 0;
   238		int err;
   239	
   240		spin_lock_irqsave(divider->lock, flags);
   241	
   242		value = DIV_ROUND_CLOSEST(parent_rate, rate);
   243	
   244		regh = (value / 4);
   245		regval1 = readl(div_addr);
   246		regval1 |= WZRD_CLKFBOUT_PREDIV2;
   247		regval1 = regval1 & ~(WZRD_CLKFBOUT_EDGE | WZRD_P5EN | WZRD_P5FEDGE);
   248		if (value % 4 > 1) {
   249			edged = 1;
   250			regval1 |= (edged << WZRD_EDGE_SHIFT);
   251		}
   252		p5fedge = value % 2;
   253		p5en = value % 2;
   254		regval1 = regval1 | p5en << WZRD_P5EN_SHIFT | p5fedge << WZRD_P5FEDGE_SHIFT;
   255		writel(regval1, div_addr);
   256	
   257		regval = regh | regh << WZRD_CLKFBOUT_H_SHIFT;
   258		writel(regval, div_addr + 4);
   259		/* Check status register */
   260		err = readl_poll_timeout_atomic(divider->base + WZRD_DR_STATUS_REG_OFFSET,
   261						value, value & WZRD_DR_LOCK_BIT_MASK,
   262						WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
   263		if (err)
   264			goto err_reconfig;
   265	
   266		/* Initiate reconfiguration */
   267		writel(WZRD_DR_BEGIN_DYNA_RECONF,
   268		       divider->base + WZRD_DR_INIT_VERSAL_OFFSET);
   269	
   270		/* Check status register */
   271		err = readl_poll_timeout_atomic(divider->base + WZRD_DR_STATUS_REG_OFFSET,
   272						value, value & WZRD_DR_LOCK_BIT_MASK,
   273						WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
   274	err_reconfig:
   275		spin_unlock_irqrestore(divider->lock, flags);
   276		return err;
   277	}
   278	
   279	static int clk_wzrd_dynamic_reconfig(struct clk_hw *hw, unsigned long rate,
   280					     unsigned long parent_rate)
   281	{
   282		struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
   283		void __iomem *div_addr = divider->base + divider->offset;
 > 284		u32 value, regh, edged, p5en, p5fedge, regval, regval1;
   285		unsigned long flags = 0;
   286		int err;
   287	
   288		spin_lock_irqsave(divider->lock, flags);
   289	
   290		value = DIV_ROUND_CLOSEST(parent_rate, rate);
   291	
   292		/* Cap the value to max */
   293		min_t(u32, value, WZRD_DR_MAX_INT_DIV_VALUE);
   294	
   295		/* Set divisor and clear phase offset */
   296		writel(value, div_addr);
   297		writel(0x00, div_addr + WZRD_DR_DIV_TO_PHASE_OFFSET);
   298	
   299		/* Check status register */
   300		err = readl_poll_timeout_atomic(divider->base + WZRD_DR_STATUS_REG_OFFSET,
   301						value, value & WZRD_DR_LOCK_BIT_MASK,
   302						WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
   303		if (err)
   304			goto err_reconfig;
   305	
   306		/* Initiate reconfiguration */
   307		writel(WZRD_DR_BEGIN_DYNA_RECONF_5_2,
   308		       divider->base + WZRD_DR_INIT_REG_OFFSET);
   309		writel(WZRD_DR_BEGIN_DYNA_RECONF1_5_2,
   310		       divider->base + WZRD_DR_INIT_REG_OFFSET);
   311	
   312		/* Check status register */
   313		err = readl_poll_timeout_atomic(divider->base + WZRD_DR_STATUS_REG_OFFSET,
   314						value, value & WZRD_DR_LOCK_BIT_MASK,
   315						WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
   316	err_reconfig:
   317		spin_unlock_irqrestore(divider->lock, flags);
   318		return err;
   319	}
   320	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
