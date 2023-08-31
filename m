Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A809719BB8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 19:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693510868; x=1725046868;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SWJnqSDOViFjjoGc7bCA0QTzVrf3jnpfIO4aGUoZUI4=;
  b=b4+z3YeKVeF3PPQKe9KsglORDlsjyAzAFsFSmmm+yWRw6ed81s7KPaP4
   Ve7p9qi+g2LY/EM2aJHAWdwcqLfHe79Q/eAthJa+FUC6cMEAubI7yBZ/t
   5eRR3F58r2+tExDdL8SrqzVoceQCPUhzAZf5TT4spn6hW4ToONmq8eIRS
   8F3cJv5CV7zPwoptnMZ8oKRGlZ+AtC+JdQyP/cjU9t0oxv4MyqZkcp+Bq
   +A7RUC5KB6N09pinytuzB1lJEgBJVjlAOGLHyTWVu/6uTdsurWjN5dt+4
   AFQ6X+gJEB7Zo4cyPbdg5sQjij++DRXt7ZL8PdvD5gQSGX5uk9U/LHl7b
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="361068849"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="361068849"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 12:41:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="733248356"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="733248356"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 31 Aug 2023 12:41:04 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbnXK-0000Uh-11;
	Thu, 31 Aug 2023 19:41:02 +0000
Date: Fri, 1 Sep 2023 03:40:34 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 6153/24603] sound/soc/fsl/fsl_spdif.c:69:
 warning: Function parameter or member 'cchannel_192b' not described in
 'fsl_spdif_soc_data'
Message-ID: <202309010309.Qxoihh7y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: 0815c79bdd566f7cf60bd567caf91b5481da9782 [6153/24603] Merge branch 'audio/next' into next
config: arc-randconfig-001-20230831 (https://download.01.org/0day-ci/archive/20230901/202309010309.Qxoihh7y-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309010309.Qxoihh7y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309010309.Qxoihh7y-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/fsl/fsl_spdif.c:69: warning: Function parameter or member 'cchannel_192b' not described in 'fsl_spdif_soc_data'
>> sound/soc/fsl/fsl_spdif.c:142: warning: Function parameter or member 'pll8k_clk' not described in 'fsl_spdif_priv'
>> sound/soc/fsl/fsl_spdif.c:142: warning: Function parameter or member 'pll11k_clk' not described in 'fsl_spdif_priv'
>> sound/soc/fsl/fsl_spdif.c:142: warning: Function parameter or member 'bypass' not described in 'fsl_spdif_priv'


vim +69 sound/soc/fsl/fsl_spdif.c

a2388a498ad2f8 Nicolin Chen         2013-08-21   47  
f61b9273c34798 Shengjiu Wang        2020-06-17   48  /**
f61b9273c34798 Shengjiu Wang        2020-06-17   49   * struct fsl_spdif_soc_data: soc specific data
f61b9273c34798 Shengjiu Wang        2020-06-17   50   *
f61b9273c34798 Shengjiu Wang        2020-06-17   51   * @imx: for imx platform
f61b9273c34798 Shengjiu Wang        2020-06-17   52   * @shared_root_clock: flag of sharing a clock source with others;
f61b9273c34798 Shengjiu Wang        2020-06-17   53   *                     so the driver shouldn't set root clock rate
604e5178444ea1 Viorel Suman         2021-04-26   54   * @raw_capture_mode: if raw capture mode support
516232e3609f48 Shengjiu Wang        2020-10-15   55   * @interrupts: interrupt number
516232e3609f48 Shengjiu Wang        2020-10-15   56   * @tx_burst: tx maxburst size
516232e3609f48 Shengjiu Wang        2020-10-15   57   * @rx_burst: rx maxburst size
516232e3609f48 Shengjiu Wang        2020-10-15   58   * @tx_formats: tx supported data format
f61b9273c34798 Shengjiu Wang        2020-06-17   59   */
f61b9273c34798 Shengjiu Wang        2020-06-17   60  struct fsl_spdif_soc_data {
f61b9273c34798 Shengjiu Wang        2020-06-17   61  	bool imx;
f61b9273c34798 Shengjiu Wang        2020-06-17   62  	bool shared_root_clock;
604e5178444ea1 Viorel Suman         2021-04-26   63  	bool raw_capture_mode;
f1861edd8d4036 Shengjiu Wang        2021-10-12   64  	bool cchannel_192b;
516232e3609f48 Shengjiu Wang        2020-10-15   65  	u32 interrupts;
516232e3609f48 Shengjiu Wang        2020-10-15   66  	u32 tx_burst;
516232e3609f48 Shengjiu Wang        2020-10-15   67  	u32 rx_burst;
516232e3609f48 Shengjiu Wang        2020-10-15   68  	u64 tx_formats;
f61b9273c34798 Shengjiu Wang        2020-06-17  @69  };
f61b9273c34798 Shengjiu Wang        2020-06-17   70  
a2388a498ad2f8 Nicolin Chen         2013-08-21   71  /*
a2388a498ad2f8 Nicolin Chen         2013-08-21   72   * SPDIF control structure
a2388a498ad2f8 Nicolin Chen         2013-08-21   73   * Defines channel status, subcode and Q sub
a2388a498ad2f8 Nicolin Chen         2013-08-21   74   */
a2388a498ad2f8 Nicolin Chen         2013-08-21   75  struct spdif_mixer_control {
a2388a498ad2f8 Nicolin Chen         2013-08-21   76  	/* spinlock to access control data */
a2388a498ad2f8 Nicolin Chen         2013-08-21   77  	spinlock_t ctl_lock;
a2388a498ad2f8 Nicolin Chen         2013-08-21   78  
a2388a498ad2f8 Nicolin Chen         2013-08-21   79  	/* IEC958 channel tx status bit */
a2388a498ad2f8 Nicolin Chen         2013-08-21   80  	unsigned char ch_status[4];
a2388a498ad2f8 Nicolin Chen         2013-08-21   81  
a2388a498ad2f8 Nicolin Chen         2013-08-21   82  	/* User bits */
a2388a498ad2f8 Nicolin Chen         2013-08-21   83  	unsigned char subcode[2 * SPDIF_UBITS_SIZE];
a2388a498ad2f8 Nicolin Chen         2013-08-21   84  
a2388a498ad2f8 Nicolin Chen         2013-08-21   85  	/* Q subcode part of user bits */
a2388a498ad2f8 Nicolin Chen         2013-08-21   86  	unsigned char qsub[2 * SPDIF_QSUB_SIZE];
a2388a498ad2f8 Nicolin Chen         2013-08-21   87  
a2388a498ad2f8 Nicolin Chen         2013-08-21   88  	/* Buffer offset for U/Q */
a2388a498ad2f8 Nicolin Chen         2013-08-21   89  	u32 upos;
a2388a498ad2f8 Nicolin Chen         2013-08-21   90  	u32 qpos;
a2388a498ad2f8 Nicolin Chen         2013-08-21   91  
a2388a498ad2f8 Nicolin Chen         2013-08-21   92  	/* Ready buffer index of the two buffers */
a2388a498ad2f8 Nicolin Chen         2013-08-21   93  	u32 ready_buf;
a2388a498ad2f8 Nicolin Chen         2013-08-21   94  };
a2388a498ad2f8 Nicolin Chen         2013-08-21   95  
b8a832a0b667d4 Nicolin Chen         2014-04-30   96  /**
28fd6ff1586724 Pierre-Louis Bossart 2020-07-02   97   * struct fsl_spdif_priv - Freescale SPDIF private data
28fd6ff1586724 Pierre-Louis Bossart 2020-07-02   98   * @soc: SPDIF soc data
b8a832a0b667d4 Nicolin Chen         2014-04-30   99   * @fsl_spdif_control: SPDIF control data
b8a832a0b667d4 Nicolin Chen         2014-04-30  100   * @cpu_dai_drv: cpu dai driver
b8a832a0b667d4 Nicolin Chen         2014-04-30  101   * @pdev: platform device pointer
b8a832a0b667d4 Nicolin Chen         2014-04-30  102   * @regmap: regmap handler
b8a832a0b667d4 Nicolin Chen         2014-04-30  103   * @dpll_locked: dpll lock flag
b8a832a0b667d4 Nicolin Chen         2014-04-30  104   * @txrate: the best rates for playback
b8a832a0b667d4 Nicolin Chen         2014-04-30  105   * @txclk_df: STC_TXCLK_DF dividers value for playback
b8a832a0b667d4 Nicolin Chen         2014-04-30  106   * @sysclk_df: STC_SYSCLK_DF dividers value for playback
b8a832a0b667d4 Nicolin Chen         2014-04-30  107   * @txclk_src: STC_TXCLK_SRC values for playback
b8a832a0b667d4 Nicolin Chen         2014-04-30  108   * @rxclk_src: SRPC_CLKSRC_SEL values for capture
b8a832a0b667d4 Nicolin Chen         2014-04-30  109   * @txclk: tx clock sources for playback
b8a832a0b667d4 Nicolin Chen         2014-04-30  110   * @rxclk: rx clock sources for capture
b8a832a0b667d4 Nicolin Chen         2014-04-30  111   * @coreclk: core clock for register access via DMA
b8a832a0b667d4 Nicolin Chen         2014-04-30  112   * @sysclk: system clock for rx clock rate measurement
0bc5680af8c436 Shengjiu Wang        2015-11-24  113   * @spbaclk: SPBA clock (optional, depending on SoC design)
b8a832a0b667d4 Nicolin Chen         2014-04-30  114   * @dma_params_tx: DMA parameters for transmit channel
b8a832a0b667d4 Nicolin Chen         2014-04-30  115   * @dma_params_rx: DMA parameters for receive channel
28fd6ff1586724 Pierre-Louis Bossart 2020-07-02  116   * @regcache_srpc: regcache for SRPC
b8a832a0b667d4 Nicolin Chen         2014-04-30  117   */
a2388a498ad2f8 Nicolin Chen         2013-08-21  118  struct fsl_spdif_priv {
f61b9273c34798 Shengjiu Wang        2020-06-17  119  	const struct fsl_spdif_soc_data *soc;
a2388a498ad2f8 Nicolin Chen         2013-08-21  120  	struct spdif_mixer_control fsl_spdif_control;
a2388a498ad2f8 Nicolin Chen         2013-08-21  121  	struct snd_soc_dai_driver cpu_dai_drv;
a2388a498ad2f8 Nicolin Chen         2013-08-21  122  	struct platform_device *pdev;
a2388a498ad2f8 Nicolin Chen         2013-08-21  123  	struct regmap *regmap;
a2388a498ad2f8 Nicolin Chen         2013-08-21  124  	bool dpll_locked;
c7dfeed10928f0 Anssi Hannula        2014-06-16  125  	u32 txrate[SPDIF_TXRATE_MAX];
e41a4a79af5cad Nicolin Chen         2014-04-30  126  	u8 txclk_df[SPDIF_TXRATE_MAX];
2231609a2c0a48 Viorel Suman         2019-02-18  127  	u16 sysclk_df[SPDIF_TXRATE_MAX];
a2388a498ad2f8 Nicolin Chen         2013-08-21  128  	u8 txclk_src[SPDIF_TXRATE_MAX];
a2388a498ad2f8 Nicolin Chen         2013-08-21  129  	u8 rxclk_src;
2a135e41af6077 Viorel Suman         2018-08-16  130  	struct clk *txclk[STC_TXCLK_SRC_MAX];
a2388a498ad2f8 Nicolin Chen         2013-08-21  131  	struct clk *rxclk;
08f7336e640469 Nicolin Chen         2014-04-24  132  	struct clk *coreclk;
0b8643900a1bff Nicolin Chen         2014-04-28  133  	struct clk *sysclk;
0bc5680af8c436 Shengjiu Wang        2015-11-24  134  	struct clk *spbaclk;
a2388a498ad2f8 Nicolin Chen         2013-08-21  135  	struct snd_dmaengine_dai_dma_data dma_params_tx;
a2388a498ad2f8 Nicolin Chen         2013-08-21  136  	struct snd_dmaengine_dai_dma_data dma_params_rx;
f9f4fa61aab941 Zidan Wang           2015-09-18  137  	/* regcache for SRPC */
f9f4fa61aab941 Zidan Wang           2015-09-18  138  	u32 regcache_srpc;
7152e40ccc7300 Viorel Suman         2018-08-16  139  	struct clk *pll8k_clk;
7152e40ccc7300 Viorel Suman         2018-08-16  140  	struct clk *pll11k_clk;
37d4518b3f2a57 Viorel Suman         2019-09-23  141  	bool bypass;
a2388a498ad2f8 Nicolin Chen         2013-08-21 @142  };
a2388a498ad2f8 Nicolin Chen         2013-08-21  143  

:::::: The code at line 69 was first introduced by commit
:::::: f61b9273c347980f570d1f9cecb867a7835c613d ASoC: fsl_spdif: Add support for imx6sx platform

:::::: TO: Shengjiu Wang <shengjiu.wang@nxp.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
