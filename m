Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99180257A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Jan 2023 13:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674653288; x=1706189288;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j4kzijwCipY/H2oj+A5biDNp5iAQ1zGe3P2ldYgNXK4=;
  b=gc2C6VFNM/8grWULPzt07KhwzIR7hPOoHNDIKkCPvurGiIkMD2aEPezF
   +ohwCyhmJKa5JgtcU9vBw2O2fA/e21bu2A/H6EbKTsORNasrvOx8xF3wK
   sU65SmZBzZHiQowQ7Agqo9nmBwXgch76BUtPsmNxlvfz2QlUXCz9JUqur
   OoJ7wrPanpKYuqybavLelZEqC28yZr66YZPI4WXhWJFpcu9JIB/9Vm9ps
   PElwsdAQCl1kDTYohO5I3A2DHaDezfheEcuBMUozlPBZN+QoqoH8y+0UL
   3wIHxXUtQwTJgRYkjVu/EThIBQZ3m2I6IwObXYZgb5mPChCu6j7mz7toL
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="391057620"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; 
   d="scan'208";a="391057620"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2023 05:28:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="751191403"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; 
   d="scan'208";a="751191403"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Jan 2023 05:28:06 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKfor-0007KS-2i;
	Wed, 25 Jan 2023 13:28:05 +0000
Date: Wed, 25 Jan 2023 21:27:10 +0800
From: kernel test robot <lkp@intel.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 484/1347]
 drivers/clk/clk-xlnx-clock-wizard-v.c:229:25: warning: this decimal constant
 is unsigned only in ISO C90
Message-ID: <202301252135.ZFvNgr0U-lkp@intel.com>
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

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   7484228ddbb5760eac350b1b4ffe685c9da9e765
commit: 8b5383767cb4c856283824baee568f4286ecc0db [484/1347] clocking-wizard: Add versal clocking wizard support
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230125/202301252135.ZFvNgr0U-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/8b5383767cb4c856283824baee568f4286ecc0db
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout 8b5383767cb4c856283824baee568f4286ecc0db
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/clk/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/clk/clk-xlnx-clock-wizard-v.c: In function 'clk_wzrd_recalc_rate_all':
   drivers/clk/clk-xlnx-clock-wizard-v.c:164:16: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
     164 |         regl = FIELD_GET(WZRD_CLKFBOUT_L_MASK, reg);
         |                ^~~~~~~~~
   drivers/clk/clk-xlnx-clock-wizard-v.c: In function 'clk_wzrd_get_divisors':
>> drivers/clk/clk-xlnx-clock-wizard-v.c:229:25: warning: this decimal constant is unsigned only in ISO C90
     229 |                         if (vco_freq >= WZRD_VCO_MIN && vco_freq <= WZRD_VCO_MAX) {
         |                         ^~
   drivers/clk/clk-xlnx-clock-wizard-v.c: In function 'clk_wzrd_dynamic_all_nolock':
   drivers/clk/clk-xlnx-clock-wizard-v.c:276:19: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     276 |         regval1 = FIELD_PREP(WZRD_DIVCLK_EDGE, edged);
         |                   ^~~~~~~~~~
   drivers/clk/clk-xlnx-clock-wizard-v.c: In function 'clk_wzrd_recalc_rate':
>> drivers/clk/clk-xlnx-clock-wizard-v.c:342:42: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     342 |                         (void __iomem *)((u64)divider->base + divider->offset);
         |                                          ^
>> drivers/clk/clk-xlnx-clock-wizard-v.c:342:25: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     342 |                         (void __iomem *)((u64)divider->base + divider->offset);
         |                         ^
   drivers/clk/clk-xlnx-clock-wizard-v.c: In function 'clk_wzrd_dynamic_reconfig':
   drivers/clk/clk-xlnx-clock-wizard-v.c:375:42: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     375 |                         (void __iomem *)((u64)divider->base + divider->offset);
         |                                          ^
   drivers/clk/clk-xlnx-clock-wizard-v.c:375:25: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     375 |                         (void __iomem *)((u64)divider->base + divider->offset);
         |                         ^
   cc1: some warnings being treated as errors


vim +229 drivers/clk/clk-xlnx-clock-wizard-v.c

   218	
   219	static int clk_wzrd_get_divisors(struct clk_hw *hw, unsigned long rate,
   220					 unsigned long parent_rate)
   221	{
   222		struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
   223		u64 vco_freq, freq, diff;
   224		u32 m, d, o;
   225	
   226		for (m = WZRD_M_MIN; m <= WZRD_M_MAX; m++) {
   227			for (d = WZRD_D_MIN; d <= WZRD_D_MAX; d++) {
   228				vco_freq = DIV_ROUND_CLOSEST((parent_rate * m), d);
 > 229				if (vco_freq >= WZRD_VCO_MIN && vco_freq <= WZRD_VCO_MAX) {
   230					for (o = WZRD_O_MIN; o <= WZRD_O_MAX; o++) {
   231						freq = DIV_ROUND_CLOSEST(vco_freq, o);
   232						diff = abs(freq - rate);
   233	
   234						if (diff < WZRD_MIN_ERR) {
   235							divider->valuem = m;
   236							divider->valued = d;
   237							divider->valueo = o;
   238							return 0;
   239						}
   240					}
   241				}
   242			}
   243		}
   244		return -EBUSY;
   245	}
   246	
   247	static int clk_wzrd_dynamic_all_nolock(struct clk_hw *hw, unsigned long rate,
   248					       unsigned long parent_rate)
   249	{
   250		struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
   251		u32 value, regh, edged, p5en, p5fedge, value2, m, regval, regval1;
   252		int err;
   253	
   254		err = clk_wzrd_get_divisors(hw, rate, parent_rate);
   255		if (err)
   256			return err;
   257	
   258		writel(0, divider->base + WZRD_CLK_CFG_REG(WZRD_CLKFBOUT_4));
   259	
   260		m = divider->valuem;
   261		edged = m % WZRD_DUTY_CYCLE;
   262		regh = m / WZRD_DUTY_CYCLE;
   263		regval1 = readl(divider->base + WZRD_CLK_CFG_REG(WZRD_CLKFBOUT_1));
   264		regval1 |= WZRD_MULT_PREDIV2;
   265		if (edged)
   266			regval1 = regval1 | WZRD_CLKFBOUT_EDGE;
   267		else
   268			regval1 = regval1 & ~WZRD_CLKFBOUT_EDGE;
   269		writel(regval1, divider->base + WZRD_CLK_CFG_REG(WZRD_CLKFBOUT_1));
   270		regval1 = regh | regh << WZRD_CLKFBOUT_H_SHIFT;
   271		writel(regval1, divider->base + WZRD_CLK_CFG_REG(WZRD_CLKFBOUT_2));
   272	
   273		value2 = divider->valued;
   274		edged = value2 % WZRD_DUTY_CYCLE;
   275		regh = (value2 / WZRD_DUTY_CYCLE);
   276		regval1 = FIELD_PREP(WZRD_DIVCLK_EDGE, edged);
   277		writel(regval1, divider->base + WZRD_CLK_CFG_REG(WZRD_DESKEW_2));
   278		regval1 = regh | regh << WZRD_CLKFBOUT_H_SHIFT;
   279		writel(regval1, divider->base + WZRD_CLK_CFG_REG(WZRD_DIVCLK));
   280	
   281		value = divider->valueo;
   282		regh = value / WZRD_O_DIV;
   283		regval1 = readl(divider->base + WZRD_CLK_CFG_REG(WZRD_CLKOUT0_1));
   284		regval1 |= WZRD_CLKFBOUT_PREDIV2;
   285		regval1 = regval1 & ~(WZRD_CLKFBOUT_EDGE | WZRD_P5EN | WZRD_P5FEDGE);
   286		if (value % WZRD_O_DIV > 1) {
   287			edged = 1;
   288			regval1 |= edged << WZRD_CLKFBOUT_H_SHIFT;
   289		}
   290		p5fedge = value % WZRD_DUTY_CYCLE;
   291		p5en = value % WZRD_DUTY_CYCLE;
   292	
   293		regval1 = regval1 | FIELD_PREP(WZRD_P5EN, p5en) | FIELD_PREP(WZRD_P5FEDGE, p5fedge);
   294		writel(regval1, divider->base + WZRD_CLK_CFG_REG(WZRD_CLKOUT0_1));
   295		regval = regh | regh << WZRD_CLKFBOUT_H_SHIFT;
   296		writel(regval, divider->base + WZRD_CLK_CFG_REG(WZRD_CLKOUT0_2));
   297	
   298		/* Check status register */
   299		err = readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET,
   300					 value, value & WZRD_DR_LOCK_BIT_MASK,
   301					 WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
   302		if (err)
   303			return err;
   304	
   305		/* Initiate reconfiguration */
   306		writel(WZRD_DR_BEGIN_DYNA_RECONF,
   307		       divider->base + WZRD_DR_INIT_REG_OFFSET);
   308	
   309		/* Check status register */
   310		return  readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET,
   311					 value, value & WZRD_DR_LOCK_BIT_MASK,
   312					 WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
   313	}
   314	
   315	static int clk_wzrd_dynamic_all(struct clk_hw *hw, unsigned long rate,
   316					unsigned long parent_rate)
   317	{
   318		struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
   319		unsigned long flags = 0;
   320		int ret;
   321	
   322		if (divider->lock)
   323			spin_lock_irqsave(divider->lock, flags);
   324		else
   325			__acquire(divider->lock);
   326	
   327		ret = clk_wzrd_dynamic_all_nolock(hw, rate, parent_rate);
   328	
   329		if (divider->lock)
   330			spin_unlock_irqrestore(divider->lock, flags);
   331		else
   332			__release(divider->lock);
   333	
   334		return ret;
   335	}
   336	
   337	static unsigned long clk_wzrd_recalc_rate(struct clk_hw *hw,
   338						  unsigned long parent_rate)
   339	{
   340		struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
   341		void __iomem *div_addr =
 > 342				(void __iomem *)((u64)divider->base + divider->offset);
   343		unsigned int vall, valh;
   344		u32 div;
   345		u32 p5en, edge, prediv2;
   346		u32 all;
   347	
   348		edge = !!(readl(div_addr) & BIT(8));
   349		p5en = !!(readl(div_addr) & BIT(13));
   350		prediv2 = !!(readl(div_addr) & BIT(11));
   351		vall = readl(div_addr + 4) & 0xff;
   352		valh = readl(div_addr + 4) >> 8;
   353		all = valh + vall + edge;
   354		if (!all)
   355			all = 1;
   356		if (prediv2)
   357			div =  (2 * all + prediv2 * p5en);
   358		else
   359			div = all;
   360	
   361		return DIV_ROUND_UP_ULL((u64)parent_rate, div);
   362	}
   363	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
