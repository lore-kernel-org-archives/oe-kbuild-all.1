Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197AC17E9
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 May 2024 02:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714788794; cv=none; b=pMueZDlu1oYlbn92TDLyYwtIe2To/tqpcpGBElS4fHKkFnkP8rg/A1yrtAWplMQeBdaenQWeapCUQsclL+3ncuqhRFeo8tVn09hYOwTSOXfXuEHcURZkhcP1bJgVxgiPxbzyEBevwvKn+qTWmOf2mi5QDvfIDBbH7LqfnLJQNkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714788794; c=relaxed/simple;
	bh=+l+bajjARFRkIHt8KNgi0oCyQ1yoF34Z1lFCCER1KrY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NtytDBEKpJqFIIuPpe6sKRYbJBYnsZBVyoPsDyiQAOktq8PfOeZbMG4QPKeLzdPI3casU8FZvyXnXxnTboIoyZcsZVbmfv/ifLiH/Ns976EecBeHh5v0ZylHEEBb4ny0C3jMTExozXtSmAmqqa/80Ljl92qhLM5KSxGTsyeDQ/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MpFgBqBo; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MpFgBqBo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714788792; x=1746324792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+l+bajjARFRkIHt8KNgi0oCyQ1yoF34Z1lFCCER1KrY=;
  b=MpFgBqBoxVvsfqiLZsUe7GdZ7nbxFaFNj7kpBMXS3SGMc2myyU713Z7Q
   6+cfnt7rgeAHGuCXctU58rzk7jTR41YIhSW4ilXDtBOTtTdMISa3or5gy
   QQtdoWcoNg8sFe8dAW70CsA6Rb+xXw73kiKsh0i0HjO72ox26lsIrrnBl
   Y0ER/xK2TXpqNd0Ja03phgGih+gI6sarfGKgliqc9uTjr4bbL1vcKHd9y
   yKAEV8BgD9kqUMJeF5Vi0lp5Kvlc9L2Fsn4p2s7X5dwIylBAqW6XtRgnc
   32tc4LLGlNVbbcSAp8HtUCz/ooQZWEe+cNXqdQUX+wK4P5CN5uT6AcvXn
   g==;
X-CSE-ConnectionGUID: D3IACroRS+y8Atp2WGlaMg==
X-CSE-MsgGUID: Mhr0ugH1Q0KE4UY8LwRBIw==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="35997111"
X-IronPort-AV: E=Sophos;i="6.07,252,1708416000"; 
   d="scan'208";a="35997111"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 19:13:11 -0700
X-CSE-ConnectionGUID: CYCjYYhESH2Lp+jDaPSEpw==
X-CSE-MsgGUID: sR5tlbeIQImAY8jZJ0e6yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,252,1708416000"; 
   d="scan'208";a="58818684"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 May 2024 19:13:10 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s34tg-000CLM-0Y;
	Sat, 04 May 2024 02:13:08 +0000
Date: Sat, 4 May 2024 10:12:59 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 566/1143]
 drivers/spi/spi-aspeed-txrx.c:239:22: warning: format '%d' expects argument
 of type 'int', but argument 4 has type 'u8 *' {aka 'unsigned char *'}
Message-ID: <202405041039.jwTjJGbk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: 0185b4985fffd883f0effa47910e87237c6cefb1 [566/1143] spi: aspeed: Add pure SPI controller driver
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240504/202405041039.jwTjJGbk-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405041039.jwTjJGbk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405041039.jwTjJGbk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:566,
                    from include/asm-generic/bug.h:22,
                    from ./arch/microblaze/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/microblaze/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from drivers/spi/spi-aspeed-txrx.c:8:
   drivers/spi/spi-aspeed-txrx.c: In function 'aspeed_spi_setup':
>> drivers/spi/spi-aspeed-txrx.c:239:22: warning: format '%d' expects argument of type 'int', but argument 4 has type 'u8 *' {aka 'unsigned char *'} [-Wformat=]
     239 |         dev_dbg(dev, "cs: %d, mode: %d, max_speed: %d, bits_per_word: %d.\n",
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/spi/spi-aspeed-txrx.c:239:9: note: in expansion of macro 'dev_dbg'
     239 |         dev_dbg(dev, "cs: %d, mode: %d, max_speed: %d, bits_per_word: %d.\n",
         |         ^~~~~~~
   drivers/spi/spi-aspeed-txrx.c:239:28: note: format string is defined here
     239 |         dev_dbg(dev, "cs: %d, mode: %d, max_speed: %d, bits_per_word: %d.\n",
         |                           ~^
         |                            |
         |                            int
         |                           %hhn
   drivers/spi/spi-aspeed-txrx.c:254:23: error: array subscript is not an integer
     254 |         host->ctrl_val[spi->chip_select] = SPI_CE_INACTIVE | SPI_CMD_USER_MODE;
         |                       ^
   drivers/spi/spi-aspeed-txrx.c:263:23: error: array subscript is not an integer
     263 |         host->ctrl_val[spi->chip_select] |= clk_div;
         |                       ^
   drivers/spi/spi-aspeed-txrx.c:266:31: error: array subscript is not an integer
     266 |                 host->ctrl_val[spi->chip_select] |= SPI_LSB_FIRST_CTRL;
         |                               ^
   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/spi/spi-aspeed-txrx.c:16:
   drivers/spi/spi-aspeed-txrx.c:269:50: error: array subscript is not an integer
     269 |                  spi->chip_select, host->ctrl_val[spi->chip_select]);
         |                                                  ^
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/spi/spi-aspeed-txrx.c:268:9: note: in expansion of macro 'dev_info'
     268 |         dev_info(dev, "cs: %d, ctrl_val: 0x%08x\n",
         |         ^~~~~~~~
   drivers/spi/spi-aspeed-txrx.c: In function 'aspeed_spi_start_user':
   drivers/spi/spi-aspeed-txrx.c:278:38: error: array subscript is not an integer
     278 |         u32 ctrl_val = host->ctrl_val[spi->chip_select];
         |                                      ^
   drivers/spi/spi-aspeed-txrx.c:280:51: error: invalid operands to binary * (have 'u8 *' {aka 'unsigned char *'} and 'int')
     279 |         void __iomem *ctrl_reg = host->ctrl_reg + SPI_CE0_CTRL +
         |                                                                ~
         |                                                                |
         |                                                                u8 * {aka unsigned char *}
     280 |                                  spi->chip_select * 4;
         |                                                   ^
   drivers/spi/spi-aspeed-txrx.c: In function 'aspeed_spi_stop_user':
   drivers/spi/spi-aspeed-txrx.c:293:38: error: array subscript is not an integer
     293 |         u32 ctrl_val = host->ctrl_val[spi->chip_select] | SPI_CE_INACTIVE;
         |                                      ^
   drivers/spi/spi-aspeed-txrx.c:295:51: error: invalid operands to binary * (have 'u8 *' {aka 'unsigned char *'} and 'int')
     294 |         void __iomem *ctrl_reg = host->ctrl_reg + SPI_CE0_CTRL +
         |                                                                ~
         |                                                                |
         |                                                                u8 * {aka unsigned char *}
     295 |                                  spi->chip_select * 4;
         |                                                   ^
   drivers/spi/spi-aspeed-txrx.c: In function 'aspeed_spi_transfer':
   drivers/spi/spi-aspeed-txrx.c:303:43: error: implicit declaration of function 'spi_master_get_devdata'; did you mean 'spi_controller_get_devdata'? [-Werror=implicit-function-declaration]
     303 |                 (struct aspeed_spi_host *)spi_master_get_devdata(spi->controller);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
         |                                           spi_controller_get_devdata
>> drivers/spi/spi-aspeed-txrx.c:315:12: warning: assignment to 'u32' {aka 'unsigned int'} from 'u8 *' {aka 'unsigned char *'} makes integer from pointer without a cast [-Wint-conversion]
     315 |         cs = spi->chip_select;
         |            ^
   cc1: some warnings being treated as errors


vim +239 drivers/spi/spi-aspeed-txrx.c

   231	
   232	static int aspeed_spi_setup(struct spi_device *spi)
   233	{
   234		struct aspeed_spi_host *host =
   235			(struct aspeed_spi_host *)spi_controller_get_devdata(spi->controller);
   236		struct device *dev = host->dev;
   237		u32 clk_div;
   238	
 > 239		dev_dbg(dev, "cs: %d, mode: %d, max_speed: %d, bits_per_word: %d.\n",
   240			spi->chip_select, spi->mode,
   241			spi->max_speed_hz, spi->bits_per_word);
   242	
   243		if (spi->mode & SPI_MODE_X_MASK) {
   244			dev_dbg(dev, "unsupported mode bits: %x\n",
   245				(u32)(spi->mode & SPI_MODE_X_MASK));
   246			return -EINVAL;
   247		}
   248	
   249		if (spi->mode & SPI_CS_HIGH) {
   250			dev_dbg(dev, "can't be active-high\n");
   251			return -EINVAL;
   252		}
   253	
   254		host->ctrl_val[spi->chip_select] = SPI_CE_INACTIVE | SPI_CMD_USER_MODE;
   255	
   256		if (spi->max_speed_hz) {
   257			clk_div = host->info->get_clk_div(host, spi->max_speed_hz);
   258		} else {
   259			/* speed zero means "as slow as possible" */
   260			clk_div = ~(host->info->hclk_mask);
   261		}
   262	
   263		host->ctrl_val[spi->chip_select] |= clk_div;
   264	
   265		if (spi->mode & SPI_LSB_FIRST)
   266			host->ctrl_val[spi->chip_select] |= SPI_LSB_FIRST_CTRL;
   267	
   268		dev_info(dev, "cs: %d, ctrl_val: 0x%08x\n",
   269			 spi->chip_select, host->ctrl_val[spi->chip_select]);
   270	
   271		return 0;
   272	}
   273	
   274	static void aspeed_spi_start_user(struct spi_device *spi)
   275	{
   276		struct aspeed_spi_host *host =
   277			(struct aspeed_spi_host *)spi_controller_get_devdata(spi->controller);
   278		u32 ctrl_val = host->ctrl_val[spi->chip_select];
   279		void __iomem *ctrl_reg = host->ctrl_reg + SPI_CE0_CTRL +
   280					 spi->chip_select * 4;
   281	
   282		ctrl_val |= SPI_CE_INACTIVE;
   283		writel(ctrl_val, ctrl_reg);
   284	
   285		ctrl_val &= ~SPI_CE_INACTIVE;
   286		writel(ctrl_val, ctrl_reg);
   287	}
   288	
   289	static void aspeed_spi_stop_user(struct spi_device *spi)
   290	{
   291		struct aspeed_spi_host *host =
   292			(struct aspeed_spi_host *)spi_controller_get_devdata(spi->controller);
   293		u32 ctrl_val = host->ctrl_val[spi->chip_select] | SPI_CE_INACTIVE;
   294		void __iomem *ctrl_reg = host->ctrl_reg + SPI_CE0_CTRL +
   295					 spi->chip_select * 4;
   296	
   297		writel(ctrl_val, ctrl_reg);
   298	}
   299	
   300	static int aspeed_spi_transfer(struct spi_device *spi, struct spi_message *msg)
   301	{
   302		struct aspeed_spi_host *host =
 > 303			(struct aspeed_spi_host *)spi_master_get_devdata(spi->controller);
   304		struct device *dev = host->dev;
   305		struct spi_transfer *xfer;
   306		const u8 *tx_buf;
   307		u8 *rx_buf;
   308		u32 cs;
   309		unsigned long flags;
   310		u32 i = 0;
   311		u32 j = 0;
   312	
   313		spin_lock_irqsave(&host->lock, flags);
   314	
 > 315		cs = spi->chip_select;
   316	
   317		aspeed_spi_start_user(spi);
   318		dev_dbg(dev, "cs: %d\n", cs);
   319	
   320		list_for_each_entry(xfer, &msg->transfers, transfer_list) {
   321			dev_dbg(dev,
   322				"xfer[%d]: width %d, len %u, tx %p, rx %p\n",
   323				j,
   324				xfer->bits_per_word, xfer->len,
   325				xfer->tx_buf, xfer->rx_buf);
   326	
   327			tx_buf = xfer->tx_buf;
   328			rx_buf = xfer->rx_buf;
   329	
   330			if (tx_buf != 0) {
   331	#if defined(SPI_ASPEED_TXRX_DBG)
   332				pr_info("tx : ");
   333				if (xfer->len > 10) {
   334					for (i = 0; i < 10; i++)
   335						pr_info("%x ", tx_buf[i]);
   336				} else {
   337					for (i = 0; i < xfer->len; i++)
   338						pr_info("%x ", tx_buf[i]);
   339				}
   340				pr_info("\n");
   341	#endif
   342	
   343				for (i = 0; i < xfer->len; i++)
   344					writeb(tx_buf[i], (void *)host->chip_ahb_base[cs]);
   345			}
   346	
   347			if (rx_buf != 0) {
   348				for (i = 0; i < xfer->len; i++)
   349					rx_buf[i] = readb((void *)host->chip_ahb_base[cs]);
   350	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
