Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC37745D9
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 May 2024 17:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715016479; cv=none; b=ixTw2RKcoxGppKHKLzt5/oTTxFCn76PNtzh7shBEoSCZeaxjt2tgZNBnuSL2jxLumPWyWOA4V4t9wpI0eBmCH2HexCMtz5pwXDpqumKff3qNZs6p5RnadnTP3fMIa7vzKrrVBDJ2FVKAt1OytJI/J/j9kJg3NeqjGP0oqf6Lmmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715016479; c=relaxed/simple;
	bh=3sWLEFfxD7/wLOyhrYekcDl19mx1uUgY2JO3me05b5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vp628AiK1+IqIJZfZf5/HcdjPz3G27SNkS1l2abUSiYQOz/P5ArS+pJnlOsHczcsBPr68iYGKgRCNYNJ8EvXWW12iV510egpz8IDwXlypgIiLO75B+h9+ZIGIp+767O9+wOlxNHmYeI7QzjosLrCBFvmvANz+8hWegMjS4sxZxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KjAeHNzs; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KjAeHNzs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715016477; x=1746552477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3sWLEFfxD7/wLOyhrYekcDl19mx1uUgY2JO3me05b5Q=;
  b=KjAeHNzscOtqVp2P+vhkmR6iDcnND4tOu4w8vtV55ucoQKl1+VS+q5Uz
   nGkPnJ7ff6QAhFKg0UhRGIjWAcFeshcCNOzwuOwIUCu17uH413KBTxaDa
   CD8rk0DVsYm5CjRBLsHf5X71Dsk/ONNWIqqAHjoG67xtiJ5AJu0MwIV2s
   wvTOQN5C8p+u5sALNvjc4iTTw4kHaxec6h/N9BsfItHkn9xBIeXsoCqOj
   1wRHtuVjilyGCKKAOBh2w/8LDSn4HJrcc5rwEazyrVmAPvprfa2hb587y
   Xwp3aYVVlzonOryrhhB5ZArHra3Is22aaNEmYm87JSYz2s24700D3O5N2
   w==;
X-CSE-ConnectionGUID: aW0udJioSc6w6C95zpsohQ==
X-CSE-MsgGUID: f1q32ipzTp2R0AcmnzvMyg==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10931408"
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; 
   d="scan'208";a="10931408"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 10:27:57 -0700
X-CSE-ConnectionGUID: jE/QkGtWSma8UuWTkeClzA==
X-CSE-MsgGUID: oB73KyKzTJWT/kBIMcrMTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; 
   d="scan'208";a="65698805"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 May 2024 10:27:56 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4281-0000r3-1K;
	Mon, 06 May 2024 17:27:53 +0000
Date: Tue, 7 May 2024 01:27:29 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 566/1143]
 drivers/spi/spi-aspeed-txrx.c:280:23: error: invalid operands to binary
 expression ('u8[16]' (aka 'unsigned char[16]') and 'int')
Message-ID: <202405070120.VOjRUPuO-lkp@intel.com>
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
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20240507/202405070120.VOjRUPuO-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240507/202405070120.VOjRUPuO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405070120.VOjRUPuO-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/spi/spi-aspeed-txrx.c:21:
   In file included from include/linux/spi/spi.h:9:
   In file included from include/linux/acpi.h:39:
   In file included from include/acpi/acpi_io.h:7:
   In file included from arch/arm64/include/asm/acpi.h:14:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/spi/spi-aspeed-txrx.c:240:3: warning: format specifies type 'int' but the argument has type 'u8 *' (aka 'unsigned char *') [-Wformat]
     239 |         dev_dbg(dev, "cs: %d, mode: %d, max_speed: %d, bits_per_word: %d.\n",
         |                           ~~
         |                           %s
     240 |                 spi->chip_select, spi->mode,
         |                 ^~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                      ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:274:19: note: expanded from macro 'dynamic_dev_dbg'
     274 |                            dev, fmt, ##__VA_ARGS__)
         |                                 ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   drivers/spi/spi-aspeed-txrx.c:254:16: error: array subscript is not an integer
     254 |         host->ctrl_val[spi->chip_select] = SPI_CE_INACTIVE | SPI_CMD_USER_MODE;
         |                       ^~~~~~~~~~~~~~~~~
   drivers/spi/spi-aspeed-txrx.c:263:16: error: array subscript is not an integer
     263 |         host->ctrl_val[spi->chip_select] |= clk_div;
         |                       ^~~~~~~~~~~~~~~~~
   drivers/spi/spi-aspeed-txrx.c:266:17: error: array subscript is not an integer
     266 |                 host->ctrl_val[spi->chip_select] |= SPI_LSB_FIRST_CTRL;
         |                               ^~~~~~~~~~~~~~~~~
   drivers/spi/spi-aspeed-txrx.c:269:36: error: array subscript is not an integer
     269 |                  spi->chip_select, host->ctrl_val[spi->chip_select]);
         |                                                  ^~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:150:67: note: expanded from macro 'dev_info'
     150 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                          ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/spi/spi-aspeed-txrx.c:278:31: error: array subscript is not an integer
     278 |         u32 ctrl_val = host->ctrl_val[spi->chip_select];
         |                                      ^~~~~~~~~~~~~~~~~
>> drivers/spi/spi-aspeed-txrx.c:280:23: error: invalid operands to binary expression ('u8[16]' (aka 'unsigned char[16]') and 'int')
     280 |                                  spi->chip_select * 4;
         |                                  ~~~~~~~~~~~~~~~~ ^ ~
   drivers/spi/spi-aspeed-txrx.c:293:31: error: array subscript is not an integer
     293 |         u32 ctrl_val = host->ctrl_val[spi->chip_select] | SPI_CE_INACTIVE;
         |                                      ^~~~~~~~~~~~~~~~~
   drivers/spi/spi-aspeed-txrx.c:295:23: error: invalid operands to binary expression ('u8[16]' (aka 'unsigned char[16]') and 'int')
     295 |                                  spi->chip_select * 4;
         |                                  ~~~~~~~~~~~~~~~~ ^ ~
>> drivers/spi/spi-aspeed-txrx.c:303:29: error: call to undeclared function 'spi_master_get_devdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     303 |                 (struct aspeed_spi_host *)spi_master_get_devdata(spi->controller);
         |                                           ^
   drivers/spi/spi-aspeed-txrx.c:303:29: note: did you mean 'spi_controller_get_devdata'?
   include/linux/spi/spi.h:780:21: note: 'spi_controller_get_devdata' declared here
     780 | static inline void *spi_controller_get_devdata(struct spi_controller *ctlr)
         |                     ^
>> drivers/spi/spi-aspeed-txrx.c:303:3: warning: cast to 'struct aspeed_spi_host *' from smaller integer type 'int' [-Wint-to-pointer-cast]
     303 |                 (struct aspeed_spi_host *)spi_master_get_devdata(spi->controller);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/spi/spi-aspeed-txrx.c:315:5: error: incompatible pointer to integer conversion assigning to 'u32' (aka 'unsigned int') from 'u8[16]' (aka 'unsigned char[16]') [-Wint-conversion]
     315 |         cs = spi->chip_select;
         |            ^ ~~~~~~~~~~~~~~~~
   7 warnings and 10 errors generated.


vim +280 drivers/spi/spi-aspeed-txrx.c

   231	
   232	static int aspeed_spi_setup(struct spi_device *spi)
   233	{
   234		struct aspeed_spi_host *host =
   235			(struct aspeed_spi_host *)spi_controller_get_devdata(spi->controller);
   236		struct device *dev = host->dev;
   237		u32 clk_div;
   238	
   239		dev_dbg(dev, "cs: %d, mode: %d, max_speed: %d, bits_per_word: %d.\n",
 > 240			spi->chip_select, spi->mode,
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
 > 280					 spi->chip_select * 4;
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
