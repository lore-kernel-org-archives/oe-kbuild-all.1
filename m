Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD38163A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jul 2023 19:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690053883; x=1721589883;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QxnULhBxbo0RT2Rv4SOSVF+bYX+C/GkT/TsYXmWud24=;
  b=HxrBNrlYhsyYkQoHFB63ja3Ys1hpEJSzAJ2NQE3tt3smwFWhCHyw7q/y
   HQKjJbt4GxjRdXwT0BCLCoqmUNBP6/Lcr6WDKj5ameuw4oagAfpqBBtN7
   y111568GQ1sAkQhb1xgAL8SHh0e1GMFpJVAmfj0t43UtFFxbMl5xDWHDF
   Hb71qmTA22yCeZrB5ul0geED3oBS5TKzZ3ZwgLhcqvXRtmTg4pmupsTe4
   efl0Vs0is5Ne45pAYrtOqulZJvRloxBCjhZHzUPIPbKgN9csh+AaLpWBW
   TuHmQS4sHkIUfbGofkXPlea6FyMv8Th6eWAlNlbiEP3vQopKUxBWJqaiH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="364682494"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="364682494"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 12:24:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="971801684"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="971801684"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 22 Jul 2023 12:24:41 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNIDZ-0008XZ-0B;
	Sat, 22 Jul 2023 19:24:41 +0000
Date: Sun, 23 Jul 2023 03:24:15 +0800
From: kernel test robot <lkp@intel.com>
To: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [csky-linux:sg2042-master-qspinlock-64ilp32_v3 9/67]
 drivers/mmc/host/sdhci-sophgo.c:195:6: warning: no previous prototype for
 'bm_sdhci_reset'
Message-ID: <202307230347.334oCY8v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/c-sky/csky-linux sg2042-master-qspinlock-64ilp32_v3
head:   7f9f76d36814ed6fcbca4c27a5d2ec3724c46add
commit: a47efbc69fc5e6fc6a9609f5c74504c07d335f08 [9/67] driver: mmc: Add sophgo sg2042 soc support
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230723/202307230347.334oCY8v-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230723/202307230347.334oCY8v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307230347.334oCY8v-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mmc/host/sdhci-sophgo.c:195:6: warning: no previous prototype for 'bm_sdhci_reset' [-Wmissing-prototypes]
     195 | void bm_sdhci_reset(struct sdhci_host *host, u8 mask)
         |      ^~~~~~~~~~~~~~
>> drivers/mmc/host/sdhci-sophgo.c:261:6: warning: no previous prototype for 'bm_sdhci_set_clock' [-Wmissing-prototypes]
     261 | void bm_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/mmc/host/sdhci-sophgo.c:330:5: warning: no previous prototype for 'bm_platform_execute_tuning' [-Wmissing-prototypes]
     330 | int bm_platform_execute_tuning(struct sdhci_host *host, u32 opcode)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/bm_sdhci_reset +195 drivers/mmc/host/sdhci-sophgo.c

   194	
 > 195	void bm_sdhci_reset(struct sdhci_host *host, u8 mask)
   196	{
   197	#if 0 // FIXME, SD card not working after this.
   198		bm_sdhci_hw_reset(host);
   199	#endif
   200		sdhci_reset(host, mask);
   201	
   202		if (mask & SDHCI_RESET_ALL)
   203			bm_sdhci_phy_init(host);
   204	}
   205	
   206	int bm_sdhci_phy_init(struct sdhci_host *host)
   207	{
   208		// Asset reset of phy
   209		sdhci_writel(host, sdhci_readl(host, SDHCI_P_PHY_CNFG) & ~(1 << PHY_CNFG_PHY_RSTN), SDHCI_P_PHY_CNFG);
   210	
   211		// Set PAD_SN PAD_SP
   212		sdhci_writel(host,
   213			     (1 << PHY_CNFG_PHY_PWRGOOD) | (0x9 << PHY_CNFG_PAD_SP) | (0x8 << PHY_CNFG_PAD_SN),
   214			     SDHCI_P_PHY_CNFG);
   215	
   216		// Set CMDPAD
   217		sdhci_writew(host, (0x2 << PAD_CNFG_RXSEL) | (1 << PAD_CNFG_WEAKPULL_EN) |
   218				(0x3 << PAD_CNFG_TXSLEW_CTRL_P) | (0x2 << PAD_CNFG_TXSLEW_CTRL_N), SDHCI_P_CMDPAD_CNFG);
   219	
   220		// Set DATAPAD
   221		sdhci_writew(host, (0x2 << PAD_CNFG_RXSEL) | (1 << PAD_CNFG_WEAKPULL_EN) |
   222				(0x3 << PAD_CNFG_TXSLEW_CTRL_P) | (0x2 << PAD_CNFG_TXSLEW_CTRL_N), SDHCI_P_DATPAD_CNFG);
   223	
   224		// Set CLKPAD
   225		sdhci_writew(host,
   226			     (0x2 << PAD_CNFG_RXSEL) | (0x3 << PAD_CNFG_TXSLEW_CTRL_P) | (0x2 << PAD_CNFG_TXSLEW_CTRL_N),
   227			     SDHCI_P_CLKPAD_CNFG);
   228	
   229		// Set STB_PAD
   230		sdhci_writew(host, (0x2 << PAD_CNFG_RXSEL) | (0x2 << PAD_CNFG_WEAKPULL_EN) |
   231				(0x3 << PAD_CNFG_TXSLEW_CTRL_P) | (0x2 << PAD_CNFG_TXSLEW_CTRL_N), SDHCI_P_STBPAD_CNFG);
   232	
   233		// Set RSTPAD
   234		sdhci_writew(host, (0x2 << PAD_CNFG_RXSEL) | (1 << PAD_CNFG_WEAKPULL_EN) |
   235				(0x3 << PAD_CNFG_TXSLEW_CTRL_P) | (0x2 << PAD_CNFG_TXSLEW_CTRL_N), SDHCI_P_RSTNPAD_CNFG);
   236	
   237		// Set SDCLKDL_CNFG, EXTDLY_EN = 1, fix delay
   238		sdhci_writeb(host, (1 << SDCLKDL_CNFG_EXTDLY_EN), SDHCI_P_SDCLKDL_CNFG);
   239	
   240		// Add 10 * 70ps = 0.7ns for output delay
   241		sdhci_writeb(host, 10, SDHCI_P_SDCLKDL_DC);
   242	
   243		//if (host->index == 1) {
   244		//	 Set SMPLDL_CNFG, Bypass
   245		sdhci_writeb(host, (1 << SMPLDL_CNFG_BYPASS_EN), SDHCI_P_SMPLDL_CNFG);
   246		//}
   247		//else {
   248		//	Set SMPLDL_CNFG, INPSEL_CNFG = 0x2
   249		//sdhci_writeb(host, (0x2 << SMPLDL_CNFG_INPSEL_CNFG), SDHCI_P_SMPLDL_CNFG);
   250		//}
   251	
   252		// Set ATDL_CNFG, tuning clk not use for init
   253		sdhci_writeb(host, (2 << ATDL_CNFG_INPSEL_CNFG), SDHCI_P_ATDL_CNFG);
   254	
   255		// deasset reset of phy
   256		sdhci_writel(host, sdhci_readl(host, SDHCI_P_PHY_CNFG) | (1 << PHY_CNFG_PHY_RSTN), SDHCI_P_PHY_CNFG);
   257	
   258		return 0;
   259	}
   260	
 > 261	void bm_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
   262	{
   263		sdhci_set_clock(host, clock);
   264	
   265		if (clock == 0)
   266			// forward tx
   267			sdhci_writeb(host, 0x0, SDHCI_P_SDCLKDL_DC);
   268		else
   269			// revert tx
   270			sdhci_writeb(host, 0x10, SDHCI_P_SDCLKDL_DC);
   271	}
   272	
   273	/*
   274	 * If DMA addr spans 128MB boundary, we split the DMA transfer into two
   275	 * so that each DMA transfer doesn't exceed the boundary.
   276	 */
   277	#define BOUNDARY_OK(addr, len) \
   278		((addr | (SZ_128M - 1)) == ((addr + len - 1) | (SZ_128M - 1)))
   279	
   280	static void dwcmshc_adma_write_desc(struct sdhci_host *host, void **desc,
   281					    dma_addr_t addr, int len, unsigned int cmd)
   282	{
   283		int tmplen, offset;
   284	
   285		if (likely(!len || BOUNDARY_OK(addr, len))) {
   286			sdhci_adma_write_desc(host, desc, addr, len, cmd);
   287			return;
   288		}
   289	
   290		offset = addr & (SZ_128M - 1);
   291		tmplen = SZ_128M - offset;
   292		sdhci_adma_write_desc(host, desc, addr, tmplen, cmd);
   293	
   294		addr += tmplen;
   295		len -= tmplen;
   296		sdhci_adma_write_desc(host, desc, addr, len, cmd);
   297	}
   298	
   299	
   300	/* ------------- bm palludium sdcard --------------- */
   301	static const struct sdhci_ops sdhci_bm_pldm_sd_ops = {
   302		.reset = bm_sdhci_reset,
   303		.set_clock = bm_sdhci_set_clock,
   304		.set_bus_width = sdhci_set_bus_width,
   305		.set_uhs_signaling = sdhci_bm_set_uhs_signaling,
   306		.get_max_clock = bm_sdhci_get_max_clock,
   307		.get_min_clock = bm_sdhci_get_min_clock,
   308		.adma_write_desc = dwcmshc_adma_write_desc,
   309	};
   310	
   311	static const struct sdhci_pltfm_data sdhci_bm_pldm_sd_pdata = {
   312		.ops = &sdhci_bm_pldm_sd_ops,
   313		.quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN | SDHCI_QUIRK_INVERTED_WRITE_PROTECT,
   314		.quirks2 = SDHCI_QUIRK2_NO_1_8_V,
   315	};
   316	
   317	static inline bool sdhci_data_line_cmd(struct mmc_command *cmd)
   318	{
   319		return cmd->data || cmd->flags & MMC_RSP_BUSY;
   320	}
   321	
   322	static void sdhci_del_timer(struct sdhci_host *host, struct mmc_request *mrq)
   323	{
   324		if (sdhci_data_line_cmd(mrq->cmd))
   325			del_timer(&host->data_timer);
   326		else
   327			del_timer(&host->timer);
   328	}
   329	
 > 330	int bm_platform_execute_tuning(struct sdhci_host *host, u32 opcode)
   331	{
   332		u16 ctrl;
   333		int tuning_loop_counter = 0;
   334		int err = 0;
   335		unsigned long flags;
   336		unsigned int tuning_count = 0;
   337		bool hs400_tuning;
   338		int hit = 0;
   339	
   340		spin_lock_irqsave(&host->lock, flags);
   341	
   342		hs400_tuning = host->flags & SDHCI_HS400_TUNING;
   343		host->flags &= ~SDHCI_HS400_TUNING;
   344	
   345		if (host->tuning_mode == SDHCI_TUNING_MODE_1)
   346			tuning_count = host->tuning_count;
   347	
   348		switch (host->timing) {
   349		/* HS400 tuning is done in HS200 mode */
   350		case MMC_TIMING_MMC_HS400:
   351			err = -EINVAL;
   352			goto out_unlock;
   353	
   354		case MMC_TIMING_MMC_HS200:
   355			/*
   356			 * Periodic re-tuning for HS400 is not expected to be needed, so
   357			 * disable it here.
   358			 */
   359			if (hs400_tuning)
   360				tuning_count = 0;
   361			break;
   362	
   363		case MMC_TIMING_UHS_SDR104:
   364		case MMC_TIMING_UHS_DDR50:
   365			break;
   366	
   367		case MMC_TIMING_UHS_SDR50:
   368			if (host->flags & SDHCI_SDR50_NEEDS_TUNING)
   369				break;
   370	
   371		default:
   372			goto out_unlock;
   373		}
   374	
   375		ctrl = sdhci_readw(host, SDHCI_HOST_CONTROL2);
   376		ctrl |= SDHCI_CTRL_EXEC_TUNING;
   377	
   378		sdhci_writel(host, SDHCI_INT_DATA_AVAIL, SDHCI_INT_ENABLE);
   379		sdhci_writel(host, SDHCI_INT_DATA_AVAIL, SDHCI_SIGNAL_ENABLE);
   380	
   381		sdhci_writew(host, 0x704b | (0x3<<4) | (0x1<<3), SDHCI_HOST_CONTROL2);/*drv_strength | 1.8v*/
   382	
   383		sdhci_writel(host, 0, SDHCI_DMA_ADDRESS);/*sdmasa*/
   384		sdhci_writel(host, 0, SDHCI_MSHC_CTRL);
   385	
   386		sdhci_writel(host, 0x18, SDHCI_AT_CTRL);
   387	
   388		sdhci_writew(host, 0x0, SDHCI_BLOCK_COUNT);
   389		sdhci_writew(host, 0x1040, SDHCI_BLOCK_SIZE);
   390		sdhci_writew(host, SDHCI_TRNS_READ, SDHCI_TRANSFER_MODE);
   391	
   392		do {
   393			struct mmc_command cmd = {0};
   394			struct mmc_request mrq = {NULL};
   395	
   396			cmd.opcode = opcode;
   397			cmd.arg = 0;
   398			cmd.flags = MMC_RSP_R1 | MMC_CMD_ADTC;
   399			cmd.retries = 0;
   400			cmd.data = NULL;
   401			cmd.mrq = &mrq;
   402			cmd.error = 0;
   403	
   404			sdhci_writel(host, tuning_loop_counter, SDHCI_AT_STAT);
   405			mrq.cmd = &cmd;
   406			sdhci_send_command(host, &cmd);
   407	
   408			host->cmd = NULL;
   409			sdhci_del_timer(host, &mrq);
   410			spin_unlock_irqrestore(&host->lock, flags);
   411	
   412			/* Wait for Buffer Read Ready interrupt */
   413			wait_event_timeout(host->buf_ready_int,
   414						(host->tuning_done == 1),
   415						msecs_to_jiffies(10));
   416	
   417			spin_lock_irqsave(&host->lock, flags);
   418			if (host->tuning_done == 1) {
   419				u16 stat;
   420	
   421				stat = sdhci_readw(host, SDHCI_ERR_INT_STATUS) & 0x3F;
   422				if (stat == 0)
   423					hit = tuning_loop_counter;
   424			}
   425	
   426			host->tuning_done = 0;
   427			tuning_loop_counter++;
   428			sdhci_writeb(host, 0xFF, SDHCI_INT_STATUS);
   429			sdhci_writeb(host, 0xFF, SDHCI_ERR_INT_STATUS);
   430			sdhci_writeb(host, SDHCI_RESET_CMD | SDHCI_RESET_DATA, SDHCI_SOFTWARE_RESET);
   431		} while (tuning_loop_counter < MAX_TUNING_STEP);
   432	
   433		if (tuning_loop_counter >= MAX_TUNING_STEP) {
   434			ctrl &= ~(SDHCI_CTRL_TUNED_CLK | SDHCI_CTRL_EXEC_TUNING);
   435			sdhci_writew(host, ctrl, SDHCI_HOST_CONTROL2);
   436		}
   437	
   438		sdhci_writel(host, 0, SDHCI_AT_CTRL);
   439		sdhci_writeb(host, 0xFF, SDHCI_INT_STATUS);/*clear normal int*/
   440		sdhci_writeb(host, 0xFF, SDHCI_ERR_INT_STATUS);/*clear error int*/
   441		sdhci_writel(host, sdhci_readl(host, SDHCI_AT_CTRL) | (0x1<<4), SDHCI_AT_CTRL);/*en sw_tuning_en bit*/
   442		sdhci_writel(host, (sdhci_readl(host, SDHCI_AT_STAT) & (~0xFF)) | hit, SDHCI_AT_STAT);/*center_ph_code*/
   443		sdhci_writel(host, sdhci_readl(host, SDHCI_AT_CTRL) & (~(0x1<<4)), SDHCI_AT_CTRL);/*dis sw_tuning_en bit*/
   444		sdhci_writeb(host, SDHCI_RESET_CMD | SDHCI_RESET_DATA, SDHCI_SOFTWARE_RESET);
   445	
   446		if (tuning_count)
   447			err = 0;
   448	
   449		host->mmc->retune_period = err ? 0 : tuning_count;
   450	
   451		sdhci_writel(host, host->ier, SDHCI_INT_ENABLE);
   452		sdhci_writel(host, host->ier, SDHCI_SIGNAL_ENABLE);
   453	out_unlock:
   454		spin_unlock_irqrestore(&host->lock, flags);
   455		return err;
   456	}
   457	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
