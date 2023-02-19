Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543332F4B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Feb 2023 19:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676835045; x=1708371045;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rCkxaiyBHOgy0BpS5NXIjdI1zZxcgigb76WCfh4KEe4=;
  b=mt32Z4D9nZs6F4yGLF9bGa4YdAm3tyjmpGKfXgc20cO1mUj4U2/wxttE
   IxKqjBLEKv7ukKJimkWrtgdnCeu7A6PtixhGzPY9FRhrot2kfeBjzh9gv
   dYlUGYexu1Uz4H5BjYQ8zCKOeGC8swYEaCvN/veBvgx/M2lxvhW5+9NfW
   caLJVqTq4F9V0LmrUq05ti2MNNKf3sMvElk/E9HMLJ0nZQKvtIf9gi5Xj
   CBAIWINsmCkh4YCLUC63drxMWyQHPAsKIRDD9gLUtYJioviESRd6XGWQm
   52LKjtSwPoZ6v2l2o1Q3vlX5+hiG4926V+QO6RzgGb6m+rP1fv+AXMXRB
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="359739479"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="359739479"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 11:30:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="759954882"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="759954882"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Feb 2023 11:30:43 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTpOV-000DQw-0n;
	Sun, 19 Feb 2023 19:30:43 +0000
Date: Mon, 20 Feb 2023 03:29:56 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@svenpeter.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:atcphy-20230219 52/54]
 drivers/phy/apple/atc-display-crossbar.c:127:25: error: implicit declaration
 of function 'FIELD_PREP'
Message-ID: <202302200341.2ozTYUDS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux atcphy-20230219
head:   9928386c36c8def0becc6ce2db8f18f2111f9b3c
commit: aec02a74177421dde96d55515aef500059d6f8ab [52/54] phy: apple: Add display crossbar
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230220/202302200341.2ozTYUDS-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/aec02a74177421dde96d55515aef500059d6f8ab
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux atcphy-20230219
        git checkout aec02a74177421dde96d55515aef500059d6f8ab
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/phy/apple/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302200341.2ozTYUDS-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/phy/apple/atc-display-crossbar.c: In function 'apple_dpxbar_set':
>> drivers/phy/apple/atc-display-crossbar.c:127:25: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     127 |                         FIELD_PREP(CROSSBAR_MUX_CTRL_DPPHY_SELECT0, mux_state) |
         |                         ^~~~~~~~~~
   drivers/phy/apple/atc-display-crossbar.c: At top level:
>> drivers/phy/apple/atc-display-crossbar.c:268:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
     268 | const static struct apple_dpxbar_hw apple_dpxbar_hw_t8103 = {
         | ^~~~~
   drivers/phy/apple/atc-display-crossbar.c:273:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
     273 | const static struct apple_dpxbar_hw apple_dpxbar_hw_t6000 = {
         | ^~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_PREP +127 drivers/phy/apple/atc-display-crossbar.c

    93	
    94	static int apple_dpxbar_set(struct mux_control *mux, int state)
    95	{
    96		struct apple_dpxbar *dpxbar = mux_chip_priv(mux->chip);
    97		unsigned int index = mux_control_get_index(mux);
    98		unsigned long flags;
    99		unsigned int mux_state;
   100		unsigned int dispext_bit;
   101		unsigned int atc_bit;
   102		bool enable;
   103		int ret = 0;
   104		u32 mux_mask, mux_set;
   105	
   106		if (state == MUX_IDLE_DISCONNECT) {
   107			/*
   108			 * Technically this will select dispext0,0 in the mux control
   109			 * register. Practically that doesn't matter since everything
   110			 * else is disabled.
   111			 */
   112			mux_state = 0;
   113			enable = false;
   114		} else if (state >= 0 && state < 9) {
   115			dispext_bit = 1 << state;
   116			mux_state = state;
   117			enable = true;
   118		} else {
   119			return -EINVAL;
   120		}
   121	
   122		switch (index) {
   123		case MUX_DPPHY:
   124			mux_mask = CROSSBAR_MUX_CTRL_DPPHY_SELECT0 |
   125				   CROSSBAR_MUX_CTRL_DPPHY_SELECT1;
   126			mux_set =
 > 127				FIELD_PREP(CROSSBAR_MUX_CTRL_DPPHY_SELECT0, mux_state) |
   128				FIELD_PREP(CROSSBAR_MUX_CTRL_DPPHY_SELECT1, mux_state);
   129			atc_bit = ATC_DPPHY;
   130			break;
   131		case MUX_DPIN0:
   132			mux_mask = CROSSBAR_MUX_CTRL_DPIN0_SELECT0 |
   133				   CROSSBAR_MUX_CTRL_DPIN0_SELECT1;
   134			mux_set =
   135				FIELD_PREP(CROSSBAR_MUX_CTRL_DPIN0_SELECT0, mux_state) |
   136				FIELD_PREP(CROSSBAR_MUX_CTRL_DPIN0_SELECT1, mux_state);
   137			atc_bit = ATC_DPIN0;
   138			break;
   139		case MUX_DPIN1:
   140			mux_mask = CROSSBAR_MUX_CTRL_DPIN1_SELECT0 |
   141				   CROSSBAR_MUX_CTRL_DPIN1_SELECT1;
   142			mux_set =
   143				FIELD_PREP(CROSSBAR_MUX_CTRL_DPIN1_SELECT0, mux_state) |
   144				FIELD_PREP(CROSSBAR_MUX_CTRL_DPIN1_SELECT1, mux_state);
   145			atc_bit = ATC_DPIN1;
   146			break;
   147		default:
   148			return -EINVAL;
   149		}
   150	
   151		spin_lock_irqsave(&dpxbar->lock, flags);
   152	
   153		/* ensure the selected dispext isn't already used in this crossbar */
   154		if (enable) {
   155			for (int i = 0; i < MUX_MAX; ++i) {
   156				if (i == index)
   157					continue;
   158				if (dpxbar->selected_dispext[i] == state) {
   159					spin_unlock_irqrestore(&dpxbar->lock, flags);
   160					return -EBUSY;
   161				}
   162			}
   163		}
   164	
   165		dpxbar_set32(dpxbar, OUT_N_CLK_EN, atc_bit);
   166		dpxbar_clear32(dpxbar, OUT_UNK_EN, atc_bit);
   167		dpxbar_clear32(dpxbar, OUT_PCLK1_EN, atc_bit);
   168		dpxbar_clear32(dpxbar, CROSSBAR_ATC_EN, atc_bit);
   169	
   170		if (dpxbar->selected_dispext[index] >= 0) {
   171			u32 prev_dispext_bit = 1 << dpxbar->selected_dispext[index];
   172	
   173			dpxbar_set32(dpxbar, FIFO_WR_N_CLK_EN, prev_dispext_bit);
   174			dpxbar_set32(dpxbar, FIFO_RD_N_CLK_EN, prev_dispext_bit);
   175			dpxbar_clear32(dpxbar, FIFO_WR_UNK_EN, prev_dispext_bit);
   176			dpxbar_clear32(dpxbar, FIFO_RD_UNK_EN, prev_dispext_bit);
   177			dpxbar_clear32(dpxbar, FIFO_WR_DPTX_CLK_EN, prev_dispext_bit);
   178			dpxbar_clear32(dpxbar, FIFO_RD_PCLK1_EN, prev_dispext_bit);
   179			dpxbar_clear32(dpxbar, CROSSBAR_DISPEXT_EN, prev_dispext_bit);
   180	
   181			dpxbar->selected_dispext[index] = -1;
   182		}
   183	
   184		dpxbar_mask32(dpxbar, CROSSBAR_MUX_CTRL, mux_mask, mux_set);
   185	
   186		if (enable) {
   187			dpxbar_clear32(dpxbar, FIFO_WR_N_CLK_EN, dispext_bit);
   188			dpxbar_clear32(dpxbar, FIFO_RD_N_CLK_EN, dispext_bit);
   189			dpxbar_clear32(dpxbar, OUT_N_CLK_EN, atc_bit);
   190			dpxbar_set32(dpxbar, FIFO_WR_UNK_EN, dispext_bit);
   191			dpxbar_set32(dpxbar, FIFO_RD_UNK_EN, dispext_bit);
   192			dpxbar_set32(dpxbar, OUT_UNK_EN, atc_bit);
   193			dpxbar_set32(dpxbar, FIFO_WR_DPTX_CLK_EN, dispext_bit);
   194			dpxbar_set32(dpxbar, FIFO_RD_PCLK1_EN, dispext_bit);
   195			dpxbar_set32(dpxbar, OUT_PCLK1_EN, atc_bit);
   196			dpxbar_set32(dpxbar, CROSSBAR_ATC_EN, atc_bit);
   197			dpxbar_set32(dpxbar, CROSSBAR_DISPEXT_EN, dispext_bit);
   198	
   199			/*
   200			 * This workaround was observed by tracing XNU's memory access
   201			 * and seems to work around some HW quirk:
   202			 * Without toggling the RD_PCLK enable here the connection
   203			 * doesn't come up. Testing has shown that a delay of about
   204			 * 5 usec is required which is doubled here to be on the
   205			 * safe side.
   206			 */
   207			dpxbar_clear32(dpxbar, FIFO_RD_PCLK1_EN, dispext_bit);
   208			udelay(10);
   209			dpxbar_set32(dpxbar, FIFO_RD_PCLK1_EN, dispext_bit);
   210	
   211			dpxbar->selected_dispext[index] = state;
   212		}
   213	
   214		spin_unlock_irqrestore(&dpxbar->lock, flags);
   215	
   216		if (enable)
   217			dev_err(dpxbar->dev, "Switched %s to dispext%u,%u\n",
   218				apple_dpxbar_names[index], mux_state >> 1,
   219				mux_state & 1);
   220		else
   221			dev_err(dpxbar->dev, "Switched %s to disconnected state\n",
   222				apple_dpxbar_names[index]);
   223	
   224		return ret;
   225	}
   226	
   227	static const struct mux_control_ops apple_dpxbar_ops = {
   228		.set = apple_dpxbar_set,
   229	};
   230	
   231	static int apple_dpxbar_probe(struct platform_device *pdev)
   232	{
   233		struct device *dev = &pdev->dev;
   234		struct mux_chip *mux_chip;
   235		struct apple_dpxbar *dpxbar;
   236		const struct apple_dpxbar_hw *hw;
   237		int ret;
   238	
   239		hw = of_device_get_match_data(dev);
   240		mux_chip = devm_mux_chip_alloc(dev, MUX_MAX, sizeof(*dpxbar));
   241		if (IS_ERR(mux_chip))
   242			return PTR_ERR(mux_chip);
   243	
   244		dpxbar = mux_chip_priv(mux_chip);
   245		mux_chip->ops = &apple_dpxbar_ops;
   246		spin_lock_init(&dpxbar->lock);
   247	
   248		dpxbar->dev = dev;
   249		dpxbar->regs = devm_platform_ioremap_resource(pdev, 0);
   250		if (IS_ERR(dpxbar->regs))
   251			return PTR_ERR(dpxbar->regs);
   252	
   253		writel(hw->tunable, dpxbar->regs + UNK_TUNABLE);
   254	
   255		for (unsigned int i = 0; i < MUX_MAX; ++i) {
   256			mux_chip->mux[i].states = hw->n_ufp;
   257			mux_chip->mux[i].idle_state = MUX_IDLE_DISCONNECT;
   258			dpxbar->selected_dispext[i] = -1;
   259		}
   260	
   261		ret = devm_mux_chip_register(dev, mux_chip);
   262		if (ret < 0)
   263			return ret;
   264	
   265		return 0;
   266	}
   267	
 > 268	const static struct apple_dpxbar_hw apple_dpxbar_hw_t8103 = {
   269		.n_ufp = 2,
   270		.tunable = 0,
   271	};
   272	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
