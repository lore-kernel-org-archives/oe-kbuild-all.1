Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C4336A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Mar 2023 18:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679078959; x=1710614959;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1Po7e2cKJne3MgDkvSAg1nO9APtzuHOwpsI7wC/P3zU=;
  b=X2TyU8acbYTvTg3Ko5USn1VWhrfuzyZbekfr+b+hiaNeDs5nzffsv0ty
   Ivoyvij/ME63oxXDn7GGrI6aZDK6z0RPgqgtX7uQL6jK7cKjo5Mc29viU
   tYC0YDHIZM85GAA3bFVcTf3g8CohIN0/h17zJuA5vebnH9+R0Ygs9k9np
   tfw6X5M1O9AxM4DHAr9doAWpi13x2qvG2N/eFg0My9BqQCDkdqPq6mlVI
   BmRK7sHG4buAsh1kh0WyvTaM9d7Qf1q7+XzX36VucL1pj6FJYxL+bz+xO
   usBRQnb26tsP05BUoREp953rImV9fx91XK9Yo4zsbQJ/1LofUL5tK3vut
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="340694252"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="340694252"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 11:49:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="749373673"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="749373673"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 17 Mar 2023 11:49:17 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdF8e-0009X8-1w;
	Fri, 17 Mar 2023 18:49:16 +0000
Date: Sat, 18 Mar 2023 02:48:31 +0800
From: kernel test robot <lkp@intel.com>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: oe-kbuild-all@lists.linux.dev,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: [sverdlin:ep93xx-snd-wip 15/48] drivers/clk/clk-ep93xx.c:340:23:
 warning: variable 'best_rate' set but not used
Message-ID: <202303180245.BDpPimVd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sverdlin/linux ep93xx-snd-wip
head:   ba6048c19f4e119e9d76024c66e205a7f6750063
commit: 2fc38e2eeec106344c52265d8102c44aad273379 [15/48] clk: ep93xx: add DT support for Cirrus EP93xx
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230318/202303180245.BDpPimVd-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/sverdlin/linux/commit/2fc38e2eeec106344c52265d8102c44aad273379
        git remote add sverdlin https://github.com/sverdlin/linux
        git fetch --no-tags sverdlin ep93xx-snd-wip
        git checkout 2fc38e2eeec106344c52265d8102c44aad273379
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/clk/ drivers/power/reset/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303180245.BDpPimVd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/clk-ep93xx.c: In function 'ep93xx_clk_enable':
   drivers/clk/clk-ep93xx.c:152:9: error: implicit declaration of function 'ep93xx_syscon_swlocked_write' [-Werror=implicit-function-declaration]
     152 |         ep93xx_syscon_swlocked_write(val, psc->reg);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-ep93xx.c: In function 'ep93xx_ddiv_set_rate':
>> drivers/clk/clk-ep93xx.c:340:23: warning: variable 'best_rate' set but not used [-Wunused-but-set-variable]
     340 |         unsigned long best_rate = 0, actual_rate, mclk_rate, rate_err = -1;
         |                       ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +/best_rate +340 drivers/clk/clk-ep93xx.c

   139	
   140	static int ep93xx_clk_enable(struct clk_hw *hw)
   141	{
   142		struct clk_psc *psc = to_clk_psc(hw);
   143		unsigned long flags = 0;
   144		u32 val;
   145	
   146		if (psc->lock)
   147			spin_lock_irqsave(psc->lock, flags);
   148	
   149		ep93xx_regmap_read(psc->reg, &val);
   150		val |= BIT(psc->bit_idx);
   151	
 > 152		ep93xx_syscon_swlocked_write(val, psc->reg);
   153	
   154		if (psc->lock)
   155			spin_unlock_irqrestore(psc->lock, flags);
   156	
   157		return 0;
   158	}
   159	
   160	static void ep93xx_clk_disable(struct clk_hw *hw)
   161	{
   162		struct clk_psc *psc = to_clk_psc(hw);
   163		unsigned long flags = 0;
   164		u32 val;
   165	
   166		if (psc->lock)
   167			spin_lock_irqsave(psc->lock, flags);
   168	
   169		ep93xx_regmap_read(psc->reg, &val);
   170		val &= ~BIT(psc->bit_idx);
   171	
   172		ep93xx_syscon_swlocked_write(val, psc->reg);
   173	
   174		if (psc->lock)
   175			spin_unlock_irqrestore(psc->lock, flags);
   176	}
   177	
   178	static const struct clk_ops clk_ep93xx_gate_ops = {
   179		.enable = ep93xx_clk_enable,
   180		.disable = ep93xx_clk_disable,
   181		.is_enabled = ep93xx_clk_is_enabled,
   182	};
   183	
   184	static struct clk_hw *ep93xx_clk_register_gate(const char *name,
   185					    const char *parent_name,
   186					    unsigned int reg,
   187					    u8 bit_idx)
   188	{
   189		struct clk_init_data init;
   190		struct clk_psc *psc;
   191		struct clk *clk;
   192	
   193		psc = kzalloc(sizeof(*psc), GFP_KERNEL);
   194		if (!psc)
   195			return ERR_PTR(-ENOMEM);
   196	
   197		init.name = name;
   198		init.ops = &clk_ep93xx_gate_ops;
   199		init.flags = CLK_SET_RATE_PARENT;
   200		init.parent_names = (parent_name ? &parent_name : NULL);
   201		init.num_parents = (parent_name ? 1 : 0);
   202	
   203		psc->reg = reg;
   204		psc->bit_idx = bit_idx;
   205		psc->hw.init = &init;
   206		psc->lock = &clk_lock;
   207	
   208		clk = clk_register(NULL, &psc->hw);
   209		if (IS_ERR(clk)) {
   210			kfree(psc);
   211			return ERR_CAST(clk);
   212		}
   213	
   214		return &psc->hw;
   215	}
   216	
   217	static u8 ep93xx_mux_get_parent(struct clk_hw *hw)
   218	{
   219		struct clk_psc *psc = to_clk_psc(hw);
   220		u32 val;
   221	
   222		ep93xx_regmap_read(psc->reg, &val);
   223		if (!(val & EP93XX_SYSCON_CLKDIV_ESEL))
   224			return 0;
   225	
   226		if (!(val & EP93XX_SYSCON_CLKDIV_PSEL))
   227			return 1;
   228	
   229		return 2;
   230	}
   231	
   232	static int ep93xx_mux_set_parent_lock(struct clk_hw *hw, u8 index)
   233	{
   234		struct clk_psc *psc = to_clk_psc(hw);
   235		unsigned long flags = 0;
   236		u32 val;
   237	
   238		if (index >= ARRAY_SIZE(mux_parents))
   239			return -EINVAL;
   240	
   241		if (psc->lock)
   242			spin_lock_irqsave(psc->lock, flags);
   243	
   244		ep93xx_regmap_read(psc->reg, &val);
   245		val &= ~(EP93XX_SYSCON_CLKDIV_ESEL | EP93XX_SYSCON_CLKDIV_PSEL);
   246	
   247		if (index != 0) {
   248			val |= EP93XX_SYSCON_CLKDIV_ESEL;
   249			val |= (index - 1) ? EP93XX_SYSCON_CLKDIV_PSEL : 0;
   250		}
   251	
   252		ep93xx_syscon_swlocked_write(val, psc->reg);
   253	
   254		if (psc->lock)
   255			spin_unlock_irqrestore(psc->lock, flags);
   256	
   257		return 0;
   258	}
   259	
   260	static bool is_best(unsigned long rate, unsigned long now,
   261			     unsigned long best)
   262	{
   263		return abs(rate - now) < abs(rate - best);
   264	}
   265	
   266	static int ep93xx_mux_determine_rate(struct clk_hw *hw,
   267					struct clk_rate_request *req)
   268	{
   269		unsigned long rate = req->rate;
   270		struct clk *parent_best = NULL;
   271		unsigned long parent_rate;
   272		unsigned long best_rate = 0, actual_rate, mclk_rate;
   273		unsigned long parent_rate_best;
   274		int div, pdiv;
   275		int i;
   276	
   277		/*
   278		 * Try the two pll's and the external clock
   279		 * Because the valid predividers are 2, 2.5 and 3, we multiply
   280		 * all the clocks by 2 to avoid floating point math.
   281		 *
   282		 * This is based on the algorithm in the ep93xx raster guide:
   283		 * http://be-a-maverick.com/en/pubs/appNote/AN269REV1.pdf
   284		 *
   285		 */
   286		for (i = 0; i < ARRAY_SIZE(mux_parents); i++) {
   287			struct clk *parent = clk_get_sys(mux_parents[i], NULL);
   288	
   289			parent_rate = clk_get_rate(parent);
   290			mclk_rate = parent_rate * 2;
   291	
   292			/* Try each predivider value */
   293			for (pdiv = 4; pdiv <= 6; pdiv++) {
   294				div = mclk_rate / (rate * pdiv);
   295				if (div < 2 || div > 127)
   296					continue;
   297	
   298				actual_rate = DIV_ROUND_CLOSEST(mclk_rate, pdiv * div);
   299	
   300				if (is_best(rate, actual_rate, best_rate)) {
   301					best_rate = actual_rate;
   302					parent_rate_best = parent_rate;
   303					parent_best = parent;
   304				}
   305			}
   306		}
   307	
   308		if (!parent_best)
   309			return -EINVAL;
   310	
   311		req->best_parent_rate = parent_rate_best;
   312		req->best_parent_hw = __clk_get_hw(parent_best);
   313		req->rate = best_rate;
   314	
   315		return 0;
   316	}
   317	
   318	static unsigned long ep93xx_ddiv_recalc_rate(struct clk_hw *hw,
   319							unsigned long parent_rate)
   320	{
   321		struct clk_psc *psc = to_clk_psc(hw);
   322		unsigned long rate = 0;
   323		u32 val;
   324		int pdiv, div;
   325	
   326		ep93xx_regmap_read(psc->reg, &val);
   327		pdiv = ((val >> EP93XX_SYSCON_CLKDIV_PDIV_SHIFT) & 0x03);
   328		div = val & 0x7f;
   329		if (div > 0)
   330			rate = (parent_rate * 2) / ((pdiv + 3) * div);
   331	
   332		return rate;
   333	}
   334	
   335	static int ep93xx_ddiv_set_rate(struct clk_hw *hw, unsigned long rate,
   336					unsigned long parent_rate)
   337	{
   338		struct clk_psc *psc = to_clk_psc(hw);
   339		int pdiv, div, npdiv, ndiv;
 > 340		unsigned long best_rate = 0, actual_rate, mclk_rate, rate_err = -1;
   341		int found = 0;
   342		u32 val;
   343	
   344		ep93xx_regmap_read(psc->reg, &val);
   345		mclk_rate = parent_rate * 2;
   346	
   347		for (pdiv = 4; pdiv <= 6; pdiv++) {
   348			div = mclk_rate / (rate * pdiv);
   349			if (div < 2 || div > 127)
   350				continue;
   351	
   352			actual_rate = mclk_rate / (pdiv * div);
   353	
   354			if (!found || abs(actual_rate - rate) < rate_err) {
   355				npdiv = pdiv - 3;
   356				ndiv = div;
   357				best_rate = actual_rate;
   358				rate_err = abs(actual_rate - rate);
   359				found = 1;
   360			}
   361		}
   362	
   363		if (!found)
   364			return -EINVAL;
   365	
   366		/* Clear old dividers */
   367		val &= ~0x37f;
   368	
   369		/* Set the new pdiv and div bits for the new clock rate */
   370		val |= (npdiv << EP93XX_SYSCON_CLKDIV_PDIV_SHIFT) | ndiv;
   371	
   372		ep93xx_syscon_swlocked_write(val, psc->reg);
   373	
   374		return 0;
   375	}
   376	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
