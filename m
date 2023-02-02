Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640BCA2A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Feb 2023 05:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675316113; x=1706852113;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eEvmjqgZ0mygR2wIPs7fYUSqlFkx/sEGcqVB/MM8YV0=;
  b=SUwmW/BPsYviD6oqx1e51iUCSldjJALYaQT8Hdw8w+BlA+Ybj3waTDsn
   0MEHVGvlmX6pCZLY5i0e0Lr3cf2SsYepi/pPet7zDP2ceaQbtrYb4gV1y
   93PPj4KL9Mzs+wxYdSlXSQno0XzajnUPJ5SBd65VXGEkQ7HEbCtfYDA7Q
   UtTonegbzh/NJ8ZwhyS86wVB+xZ4/MGQWwH2m99bcuDHl9sVODDmht5o3
   dE1IvjGqMfrqZmaxXCILE/s+QVv6BE9/tlUGY4iYUAXSobbZF1LHJmYfx
   3pFNMNf5YoV70yjj/mnVWvVBWboehtZTN9w6PB1f9GEIJ7Z96IxNMTP4o
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="390747836"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="390747836"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 21:35:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="697562382"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="697562382"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 01 Feb 2023 21:35:11 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNSFb-0006Bs-15;
	Thu, 02 Feb 2023 05:35:11 +0000
Date: Thu, 2 Feb 2023 13:34:41 +0800
From: kernel test robot <lkp@intel.com>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sverdlin:ep93xx-dt 15/44] drivers/clk/clk-ep93xx.c:341:23: warning:
 variable 'best_rate' set but not used
Message-ID: <202302021313.R6SFhfPk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sverdlin/linux ep93xx-dt
head:   1828eb1f87e53b70df4817b242fbea027e1e146c
commit: 78a5e14f66dd158b2db016cf13acbc959227c76f [15/44] clk: ep93xx: add DT support for Cirrus EP93xx
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230202/202302021313.R6SFhfPk-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/sverdlin/linux/commit/78a5e14f66dd158b2db016cf13acbc959227c76f
        git remote add sverdlin https://github.com/sverdlin/linux
        git fetch --no-tags sverdlin ep93xx-dt
        git checkout 78a5e14f66dd158b2db016cf13acbc959227c76f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/clk/ drivers/power/reset/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/clk/clk-ep93xx.c: In function 'ep93xx_clk_enable':
   drivers/clk/clk-ep93xx.c:151:9: error: implicit declaration of function 'ep93xx_syscon_swlocked_write' [-Werror=implicit-function-declaration]
     151 |         ep93xx_syscon_swlocked_write(val, psc->reg);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-ep93xx.c: In function 'ep93xx_ddiv_set_rate':
>> drivers/clk/clk-ep93xx.c:341:23: warning: variable 'best_rate' set but not used [-Wunused-but-set-variable]
     341 |         unsigned long best_rate = 0, actual_rate, mclk_rate, rate_err = -1;
         |                       ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +/best_rate +341 drivers/clk/clk-ep93xx.c

   138	
   139	static int ep93xx_clk_enable(struct clk_hw *hw)
   140	{
   141		struct clk_psc *psc = to_clk_psc(hw);
   142		unsigned long flags = 0;
   143		u32 val;
   144	
   145		if (psc->lock)
   146			spin_lock_irqsave(psc->lock, flags);
   147	
   148		ep93xx_regmap_read(psc->reg, &val);
   149		val |= BIT(psc->bit_idx);
   150	
 > 151		ep93xx_syscon_swlocked_write(val, psc->reg);
   152	
   153		if (psc->lock)
   154			spin_unlock_irqrestore(psc->lock, flags);
   155	
   156		return 0;
   157	}
   158	
   159	static void ep93xx_clk_disable(struct clk_hw *hw)
   160	{
   161		struct clk_psc *psc = to_clk_psc(hw);
   162		unsigned long flags = 0;
   163		u32 val;
   164	
   165		if (psc->lock)
   166			spin_lock_irqsave(psc->lock, flags);
   167	
   168		ep93xx_regmap_read(psc->reg, &val);
   169		val &= ~BIT(psc->bit_idx);
   170	
   171		ep93xx_syscon_swlocked_write(val, psc->reg);
   172	
   173		if (psc->lock)
   174			spin_unlock_irqrestore(psc->lock, flags);
   175	}
   176	
   177	static const struct clk_ops clk_ep93xx_gate_ops = {
   178		.enable = ep93xx_clk_enable,
   179		.disable = ep93xx_clk_disable,
   180		.is_enabled = ep93xx_clk_is_enabled,
   181	};
   182	
   183	static struct clk_hw *ep93xx_clk_register_gate(const char *name,
   184					    const char *parent_name,
   185					    unsigned int reg,
   186					    u8 bit_idx)
   187	{
   188		struct clk_init_data init;
   189		struct clk_psc *psc;
   190		struct clk *clk;
   191	
   192		psc = kzalloc(sizeof(*psc), GFP_KERNEL);
   193		if (!psc)
   194			return ERR_PTR(-ENOMEM);
   195	
   196		init.name = name;
   197		init.ops = &clk_ep93xx_gate_ops;
   198		init.flags = CLK_SET_RATE_PARENT;
   199		init.parent_names = (parent_name ? &parent_name : NULL);
   200		init.num_parents = (parent_name ? 1 : 0);
   201	
   202		psc->reg = reg;
   203		psc->bit_idx = bit_idx;
   204		psc->hw.init = &init;
   205		psc->lock = &clk_lock;
   206	
   207		clk = clk_register(NULL, &psc->hw);
   208		if (IS_ERR(clk)) {
   209			kfree(psc);
   210			return ERR_CAST(clk);
   211		}
   212	
   213		return &psc->hw;
   214	}
   215	
   216	static u8 ep93xx_mux_get_parent(struct clk_hw *hw)
   217	{
   218		struct clk_psc *psc = to_clk_psc(hw);
   219		u32 val;
   220	
   221		ep93xx_regmap_read(psc->reg, &val);
   222		if (!(val & EP93XX_SYSCON_CLKDIV_ESEL))
   223			return 0;
   224	
   225		if (!(val & EP93XX_SYSCON_CLKDIV_PSEL))
   226			return 1;
   227	
   228		return 2;
   229	}
   230	
   231	static int ep93xx_mux_set_parent_lock(struct clk_hw *hw, u8 index)
   232	{
   233		struct clk_psc *psc = to_clk_psc(hw);
   234		unsigned long flags = 0;
   235		u32 val;
   236	
   237		if (index >= ARRAY_SIZE(mux_parents))
   238			return -EINVAL;
   239	
   240		if (psc->lock)
   241			spin_lock_irqsave(psc->lock, flags);
   242	
   243		ep93xx_regmap_read(psc->reg, &val);
   244		val &= ~(EP93XX_SYSCON_CLKDIV_ESEL | EP93XX_SYSCON_CLKDIV_PSEL);
   245	
   246		if (index != 0) {
   247			val |= EP93XX_SYSCON_CLKDIV_ESEL;
   248			val |= (index - 1) ? EP93XX_SYSCON_CLKDIV_PSEL : 0;
   249		}
   250	
   251		ep93xx_syscon_swlocked_write(val, psc->reg);
   252	
   253		if (psc->lock)
   254			spin_unlock_irqrestore(psc->lock, flags);
   255	
   256		return 0;
   257	}
   258	
   259	static bool is_best(unsigned long rate, unsigned long now,
   260			     unsigned long best)
   261	{
   262		return abs(rate - now) < abs(rate - best);
   263	}
   264	
   265	static int ep93xx_mux_determine_rate(struct clk_hw *hw,
   266					struct clk_rate_request *req)
   267	{
   268		unsigned long rate = req->rate;
   269		struct clk *parent_best = NULL;
   270		unsigned long parent_rate;
   271		unsigned long best_rate = 0, actual_rate, mclk_rate;
   272		unsigned long parent_rate_best;
   273		int div, pdiv;
   274		int i;
   275	
   276		/*
   277		 * Try the two pll's and the external clock
   278		 * Because the valid predividers are 2, 2.5 and 3, we multiply
   279		 * all the clocks by 2 to avoid floating point math.
   280		 *
   281		 * This is based on the algorithm in the ep93xx raster guide:
   282		 * http://be-a-maverick.com/en/pubs/appNote/AN269REV1.pdf
   283		 *
   284		 */
   285		for (i = 0; i < ARRAY_SIZE(mux_parents); i++) {
   286			struct clk *parent = clk_get_sys(mux_parents[i], NULL);
   287	
   288			parent_rate = clk_get_rate(parent);
   289			mclk_rate = parent_rate * 2;
   290	
   291			/* Try each predivider value */
   292			for (pdiv = 4; pdiv <= 6; pdiv++) {
   293				div = mclk_rate / (rate * pdiv);
   294				if (div < 2 || div > 127) {
   295					pr_info("%s : continue div=%d", __func__, div);
   296					continue;
   297				}
   298	
   299				actual_rate = DIV_ROUND_UP_ULL((u64)mclk_rate, (pdiv * div));
   300	
   301				if (is_best(rate, actual_rate, best_rate)) {
   302					best_rate = actual_rate;
   303					parent_rate_best = parent_rate;
   304					parent_best = parent;
   305				}
   306			}
   307		}
   308	
   309		if (!parent_best)
   310			return -EINVAL;
   311	
   312		req->best_parent_rate = parent_rate_best;
   313		req->best_parent_hw = __clk_get_hw(parent_best);
   314		req->rate = best_rate;
   315	
   316		return 0;
   317	}
   318	
   319	static unsigned long ep93xx_ddiv_recalc_rate(struct clk_hw *hw,
   320							unsigned long parent_rate)
   321	{
   322		struct clk_psc *psc = to_clk_psc(hw);
   323		unsigned long rate = 0;
   324		u32 val;
   325		int pdiv, div;
   326	
   327		ep93xx_regmap_read(psc->reg, &val);
   328		pdiv = ((val >> EP93XX_SYSCON_CLKDIV_PDIV_SHIFT) & 0x03);
   329		div = val & 0x7f;
   330		if (div > 0)
   331			rate = (parent_rate * 2) / ((pdiv + 3) * div);
   332	
   333		return rate;
   334	}
   335	
   336	static int ep93xx_ddiv_set_rate(struct clk_hw *hw, unsigned long rate,
   337					unsigned long parent_rate)
   338	{
   339		struct clk_psc *psc = to_clk_psc(hw);
   340		int pdiv, div, npdiv, ndiv;
 > 341		unsigned long best_rate = 0, actual_rate, mclk_rate, rate_err = -1;
   342		int found = 0;
   343		u32 val;
   344	
   345		ep93xx_regmap_read(psc->reg, &val);
   346		mclk_rate = parent_rate * 2;
   347	
   348		for (pdiv = 4; pdiv <= 6; pdiv++) {
   349			div = mclk_rate / (rate * pdiv);
   350			if (div < 2 || div > 127)
   351				continue;
   352	
   353			actual_rate = mclk_rate / (pdiv * div);
   354	
   355			if (!found || abs(actual_rate - rate) < rate_err) {
   356				npdiv = pdiv - 3;
   357				ndiv = div;
   358				best_rate = actual_rate;
   359				rate_err = abs(actual_rate - rate);
   360				found = 1;
   361			}
   362		}
   363	
   364		if (!found)
   365			return -EINVAL;
   366	
   367		/* Clear old dividers */
   368		val &= ~0x37f;
   369	
   370		/* Set the new pdiv and div bits for the new clock rate */
   371		val |= (npdiv << EP93XX_SYSCON_CLKDIV_PDIV_SHIFT) | ndiv;
   372	
   373		ep93xx_syscon_swlocked_write(val, psc->reg);
   374	
   375		return 0;
   376	}
   377	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
