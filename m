Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9DB17C3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jan 2023 02:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674958747; x=1706494747;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7/KTy6Dcg6bpYlCesmqao8Z1eM83Z1+sBQm40AXeW8s=;
  b=L+E4kD9oizmmefGvqJb9MzdtFkdsKJ7XknFEGkZAGlanstsxiqfmCS6/
   zQ51qcPwzmmexKZ07eZX1yfryzROvEoZ+KMTxXjWGoAIbRHM+roAMwyCe
   6ZIWwZWD3yY50ZYZ6gdi6IhePD76wLbQKtIedF7ULrmR6zP71SjsewN1Z
   vWaiJGQ8C9OuTy5cA9ccr0KuOdvNhLrpMM55fFchbim2G7mBUw8K80k1F
   tbOPkEnhtkce4cwEqXq2AuXIqMfRytxjM75NkKo0t2LxPcxqEz80dLV5K
   drqnZ/zRvWfNgSmD4cd2qFldyKB414/4WAmWUT8ZWAywZB9SuApN+gl7x
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="327372635"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="327372635"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 18:19:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="641144410"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="641144410"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 28 Jan 2023 18:19:03 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLxHa-0001M4-2y;
	Sun, 29 Jan 2023 02:19:02 +0000
Date: Sun, 29 Jan 2023 10:18:38 +0800
From: kernel test robot <lkp@intel.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS_2022.1_update 132/1124]
 drivers/clk/clk-xlnx-clock-wizard.c:309:15: error: implicit declaration of
 function 'FIELD_PREP'
Message-ID: <202301291048.Q6rlnDs9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shubhrajyoti,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS_2022.1_update
head:   5da20470af455bc588357712b64603b06e4edf42
commit: e7cc160039f02d71ef5a3b16038d325ad76ab59e [132/1124] clocking-wizard: Support higher frequency accuracy
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20230129/202301291048.Q6rlnDs9-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/e7cc160039f02d71ef5a3b16038d325ad76ab59e
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS_2022.1_update
        git checkout e7cc160039f02d71ef5a3b16038d325ad76ab59e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/clk/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/clk/clk-xlnx-clock-wizard.c: In function 'clk_wzrd_dynamic_all_nolock':
>> drivers/clk/clk-xlnx-clock-wizard.c:309:15: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     309 |         reg = FIELD_PREP(WZRD_CLKOUT_DIVIDE_MASK, clockout0_div) |
         |               ^~~~~~~~~~
   drivers/clk/clk-xlnx-clock-wizard.c: In function 'clk_wzrd_recalc_rate_all':
>> drivers/clk/clk-xlnx-clock-wizard.c:369:13: error: implicit declaration of function 'FIELD_GET'; did you mean 'FOLL_GET'? [-Werror=implicit-function-declaration]
     369 |         d = FIELD_GET(WZRD_DIVCLK_DIVIDE_MASK, reg);
         |             ^~~~~~~~~
         |             FOLL_GET
   cc1: some warnings being treated as errors


vim +/FIELD_PREP +309 drivers/clk/clk-xlnx-clock-wizard.c

   286	
   287	static int clk_wzrd_dynamic_all_nolock(struct clk_hw *hw, unsigned long rate,
   288					       unsigned long parent_rate)
   289	{
   290		struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
   291		u32 reg, pre;
   292		u32 value;
   293		int err;
   294		u64 vco_freq, rate_div, f, clockout0_div;
   295	
   296		err = clk_wzrd_get_divisors(hw, rate, parent_rate);
   297		if (err)
   298			pr_err("failed to get divisors\n");
   299	
   300		vco_freq = DIV_ROUND_CLOSEST((parent_rate * divider->valuem), divider->valued);
   301		rate_div = DIV_ROUND_CLOSEST((vco_freq * WZRD_FRAC_POINTS), rate);
   302	
   303		clockout0_div = rate_div / WZRD_FRAC_POINTS;
   304	
   305		pre = DIV_ROUND_CLOSEST((vco_freq * WZRD_FRAC_POINTS), rate);
   306		f = (u32)(pre - (clockout0_div * WZRD_FRAC_POINTS));
   307		f = f & WZRD_CLKOUT_FRAC_MASK;
   308	
 > 309		reg = FIELD_PREP(WZRD_CLKOUT_DIVIDE_MASK, clockout0_div) |
   310		      FIELD_PREP(WZRD_CLKOUT0_FRAC_MASK, f);
   311	
   312		writel(reg, divider->base + WZRD_CLK_CFG_REG(2));
   313		/* Set divisor and clear phase offset */
   314		reg = FIELD_PREP(WZRD_CLKFBOUT_MULT_MASK, divider->valuem) |
   315		      FIELD_PREP(WZRD_DIVCLK_DIVIDE_MASK, divider->valued);
   316		writel(reg, divider->base + WZRD_CLK_CFG_REG(0));
   317		writel(divider->valueo, divider->base + WZRD_CLK_CFG_REG(2));
   318		writel(0, divider->base + WZRD_CLK_CFG_REG(3));
   319		/* Check status register */
   320		err = readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET, value,
   321					 value & WZRD_DR_LOCK_BIT_MASK,
   322					 WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
   323		if (err)
   324			return -ETIMEDOUT;
   325	
   326		/* Initiate reconfiguration */
   327		writel(WZRD_DR_BEGIN_DYNA_RECONF,
   328		       divider->base + WZRD_DR_INIT_REG_OFFSET);
   329	
   330		/* Check status register */
   331		err = readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET, value,
   332					 value & WZRD_DR_LOCK_BIT_MASK,
   333					 WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
   334		if (err)
   335			return -ETIMEDOUT;
   336	
   337		return 0;
   338	}
   339	
   340	static int clk_wzrd_dynamic_all(struct clk_hw *hw, unsigned long rate,
   341					unsigned long parent_rate)
   342	{
   343		struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
   344		unsigned long flags = 0;
   345		int ret;
   346	
   347		if (divider->lock)
   348			spin_lock_irqsave(divider->lock, flags);
   349		else
   350			__acquire(divider->lock);
   351	
   352		ret = clk_wzrd_dynamic_all_nolock(hw, rate, parent_rate);
   353	
   354		if (divider->lock)
   355			spin_unlock_irqrestore(divider->lock, flags);
   356		else
   357			__release(divider->lock);
   358	
   359		return ret;
   360	}
   361	
   362	static unsigned long clk_wzrd_recalc_rate_all(struct clk_hw *hw,
   363						      unsigned long parent_rate)
   364	{
   365		struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
   366		u32 m, d, o, div, reg, f;
   367	
   368		reg = readl(divider->base + WZRD_CLK_CFG_REG(0));
 > 369		d = FIELD_GET(WZRD_DIVCLK_DIVIDE_MASK, reg);
   370		m = FIELD_GET(WZRD_CLKFBOUT_MULT_MASK, reg);
   371		reg = readl(divider->base + WZRD_CLK_CFG_REG(2));
   372		o = FIELD_GET(WZRD_DIVCLK_DIVIDE_MASK, reg);
   373		f = FIELD_GET(WZRD_CLKOUT0_FRAC_MASK, reg);
   374	
   375		div = DIV_ROUND_CLOSEST(d * (WZRD_FRAC_POINTS * o + f), WZRD_FRAC_POINTS);
   376		return divider_recalc_rate(hw, parent_rate * m, div, divider->table,
   377				divider->flags, divider->width);
   378	}
   379	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
