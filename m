Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6100412C549
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 14:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720709621; cv=none; b=FTfx+ENYauwDBP/7pDe3+/dBtch/YTXjoU49I+Y4H7o7KFw8Wb5PShf9eb9jCZOGYUbzj5NziMtxKs8oCg0mZh3usWxF3mMfRM0wnzf8L2fyR8KTA4NJJVdu3FipUzs84/WmR7CQP+2Uj0Z8JyuvWtAjTdYuJ3Ka+J22Tztv7nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720709621; c=relaxed/simple;
	bh=Xdo6KzK+BwhkuZtE0crdhVRZS8OZuhd/d3ki85RmBik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bvh70oxbQrBaU/2AbP8elbiALPQy+1JDfiF5ZVZZm4254csmV23bRZGlfuhOHveamH7GP6Iodc66yRPkrtgrhDfs+hEjcInDIk1k/wDU4SGxrGLDpLjctE2qDOJSWv0MQA4jjVLBX8mY7Zb8FoJ9J8b/5JGdskAR/nY9khj8gSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S7hN3hZL; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S7hN3hZL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720709618; x=1752245618;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xdo6KzK+BwhkuZtE0crdhVRZS8OZuhd/d3ki85RmBik=;
  b=S7hN3hZLI2bFa/WzB8LNCKZh1iX1qh71GaFVWD2LRlQwIABw96FtY95G
   SQIEa1R5zZDgzYgfbq1Z2LXajYTxFzLAWReWIK+l7TmwtR8rHlh/+Giz4
   xUU1PoQDWwtRBG189WvMx4pAgP1mZ0VI7EjQ845VBx50Lr/fwSkXQwEbK
   zUVTAI3cT1j0tFQYIyOjZOnvyv+u2D+H87kClaLL2AdVVlDPp1L5hUKJC
   i/mgO6I6XZkSQIPA5Pc03tts2RCNwzVZfvBzVul8sHIl9yMHqDOo89eZA
   IIT9XFdAQWX1oJyEvoiUoiYNyptd9jA+ARtlLNSZ+Cxry9Ngmp2cKOyEe
   w==;
X-CSE-ConnectionGUID: QyuiE3eERryYjjPoPRIFJg==
X-CSE-MsgGUID: 1aZi1wwuT96E7jvnJxySDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="21003767"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="21003767"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 07:53:30 -0700
X-CSE-ConnectionGUID: Qi9VD8+tTHu3dmzozC9Jgw==
X-CSE-MsgGUID: myuoAFsKQce+4/LR+J4jBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="48467001"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Jul 2024 07:53:29 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRvAk-000ZP8-1a;
	Thu, 11 Jul 2024 14:53:26 +0000
Date: Thu, 11 Jul 2024 22:52:57 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [linux-next:master 12059/12643] drivers/ptp/ptp_pch.c:224:undefined
 reference to `ioread64_lo_hi'
Message-ID: <202407112236.XxoETdP5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f477dd6eede3ecedc8963478571d99ec3bf3f762
commit: e435f39b57d5fb97b6df67c3d6ce2400e907a69c [12059/12643] asm-generic/iomap.h: don't check for readq/writeq
config: alpha-randconfig-r016-20220501 (https://download.01.org/0day-ci/archive/20240711/202407112236.XxoETdP5-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407112236.XxoETdP5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407112236.XxoETdP5-lkp@intel.com/

All errors (new ones prefixed by >>):

   alpha-linux-ld: drivers/ptp/ptp_pch.o: in function `pch_rx_snap_read':
>> drivers/ptp/ptp_pch.c:224:(.text+0x25c): undefined reference to `ioread64_lo_hi'
>> alpha-linux-ld: drivers/ptp/ptp_pch.c:224:(.text+0x270): undefined reference to `ioread64_lo_hi'
   alpha-linux-ld: drivers/ptp/ptp_pch.o: in function `pch_tx_snap_read':
   drivers/ptp/ptp_pch.c:235:(.text+0x2ac): undefined reference to `ioread64_lo_hi'
   alpha-linux-ld: drivers/ptp/ptp_pch.c:235:(.text+0x2c0): undefined reference to `ioread64_lo_hi'
   alpha-linux-ld: drivers/ptp/ptp_pch.o: in function `pch_set_station_address':
>> drivers/ptp/ptp_pch.c:286:(.text+0x350): undefined reference to `iowrite64_lo_hi'
>> alpha-linux-ld: drivers/ptp/ptp_pch.c:286:(.text+0x358): undefined reference to `iowrite64_lo_hi'
   alpha-linux-ld: drivers/ptp/ptp_pch.o: in function `pch_systime_write':
   drivers/ptp/ptp_pch.c:157:(.text+0x430): undefined reference to `iowrite64_lo_hi'
   alpha-linux-ld: drivers/ptp/ptp_pch.c:157:(.text+0x43c): undefined reference to `iowrite64_lo_hi'
   alpha-linux-ld: drivers/ptp/ptp_pch.o: in function `pch_systime_read':
   drivers/ptp/ptp_pch.c:150:(.text+0x4cc): undefined reference to `ioread64_lo_hi'
   alpha-linux-ld: drivers/ptp/ptp_pch.c:150:(.text+0x4d4): undefined reference to `ioread64_lo_hi'
   alpha-linux-ld: drivers/ptp/ptp_pch.o: in function `pch_systime_write':
   drivers/ptp/ptp_pch.c:157:(.text+0x4e8): undefined reference to `iowrite64_lo_hi'
   alpha-linux-ld: drivers/ptp/ptp_pch.c:157:(.text+0x4f4): undefined reference to `iowrite64_lo_hi'
   alpha-linux-ld: drivers/ptp/ptp_pch.o: in function `isr':
>> drivers/ptp/ptp_pch.c:308:(.text+0x674): undefined reference to `ioread64_hi_lo'
>> alpha-linux-ld: drivers/ptp/ptp_pch.c:308:(.text+0x680): undefined reference to `ioread64_hi_lo'
   alpha-linux-ld: drivers/ptp/ptp_pch.c:319:(.text+0x6e4): undefined reference to `ioread64_hi_lo'
   alpha-linux-ld: drivers/ptp/ptp_pch.c:319:(.text+0x6f8): undefined reference to `ioread64_hi_lo'
   alpha-linux-ld: drivers/ptp/ptp_pch.o: in function `pch_systime_read':
   drivers/ptp/ptp_pch.c:150:(.text+0x7e0): undefined reference to `ioread64_lo_hi'
   alpha-linux-ld: drivers/ptp/ptp_pch.c:150:(.text+0x7e8): undefined reference to `ioread64_lo_hi'
   alpha-linux-ld: drivers/ptp/ptp_pch.o: in function `pch_probe':
   drivers/ptp/ptp_pch.c:496:(.text+0xc80): undefined reference to `iowrite64_lo_hi'
   alpha-linux-ld: drivers/ptp/ptp_pch.c:496:(.text+0xc90): undefined reference to `iowrite64_lo_hi'
   alpha-linux-ld: drivers/ptp/ptp_pch.o: in function `pch_set_station_address':
   drivers/ptp/ptp_pch.c:286:(.text+0xd58): undefined reference to `iowrite64_lo_hi'
   alpha-linux-ld: drivers/ptp/ptp_pch.c:286:(.text+0xd60): undefined reference to `iowrite64_lo_hi'


vim +224 drivers/ptp/ptp_pch.c

863d08ece9bf11 Takahiro Shimizu 2012-03-07  218  
863d08ece9bf11 Takahiro Shimizu 2012-03-07  219  u64 pch_rx_snap_read(struct pci_dev *pdev)
863d08ece9bf11 Takahiro Shimizu 2012-03-07  220  {
863d08ece9bf11 Takahiro Shimizu 2012-03-07  221  	struct pch_dev *chip = pci_get_drvdata(pdev);
863d08ece9bf11 Takahiro Shimizu 2012-03-07  222  	u64 ns;
863d08ece9bf11 Takahiro Shimizu 2012-03-07  223  
8664d49a815e34 Andy Shevchenko  2022-02-07 @224  	ns = ioread64_lo_hi(&chip->regs->rx_snap_lo);
863d08ece9bf11 Takahiro Shimizu 2012-03-07  225  
8664d49a815e34 Andy Shevchenko  2022-02-07  226  	return ns << TICKS_NS_SHIFT;
863d08ece9bf11 Takahiro Shimizu 2012-03-07  227  }
863d08ece9bf11 Takahiro Shimizu 2012-03-07  228  EXPORT_SYMBOL(pch_rx_snap_read);
863d08ece9bf11 Takahiro Shimizu 2012-03-07  229  
863d08ece9bf11 Takahiro Shimizu 2012-03-07  230  u64 pch_tx_snap_read(struct pci_dev *pdev)
863d08ece9bf11 Takahiro Shimizu 2012-03-07  231  {
863d08ece9bf11 Takahiro Shimizu 2012-03-07  232  	struct pch_dev *chip = pci_get_drvdata(pdev);
863d08ece9bf11 Takahiro Shimizu 2012-03-07  233  	u64 ns;
863d08ece9bf11 Takahiro Shimizu 2012-03-07  234  
8664d49a815e34 Andy Shevchenko  2022-02-07  235  	ns = ioread64_lo_hi(&chip->regs->tx_snap_lo);
863d08ece9bf11 Takahiro Shimizu 2012-03-07  236  
8664d49a815e34 Andy Shevchenko  2022-02-07  237  	return ns << TICKS_NS_SHIFT;
863d08ece9bf11 Takahiro Shimizu 2012-03-07  238  }
863d08ece9bf11 Takahiro Shimizu 2012-03-07  239  EXPORT_SYMBOL(pch_tx_snap_read);
863d08ece9bf11 Takahiro Shimizu 2012-03-07  240  
863d08ece9bf11 Takahiro Shimizu 2012-03-07  241  /* This function enables all 64 bits in system time registers [high & low].
863d08ece9bf11 Takahiro Shimizu 2012-03-07  242  This is a work-around for non continuous value in the SystemTime Register*/
863d08ece9bf11 Takahiro Shimizu 2012-03-07  243  static void pch_set_system_time_count(struct pch_dev *chip)
863d08ece9bf11 Takahiro Shimizu 2012-03-07  244  {
863d08ece9bf11 Takahiro Shimizu 2012-03-07  245  	iowrite32(0x01, &chip->regs->stl_max_set_en);
863d08ece9bf11 Takahiro Shimizu 2012-03-07  246  	iowrite32(0xFFFFFFFF, &chip->regs->stl_max_set);
863d08ece9bf11 Takahiro Shimizu 2012-03-07  247  	iowrite32(0x00, &chip->regs->stl_max_set_en);
863d08ece9bf11 Takahiro Shimizu 2012-03-07  248  }
863d08ece9bf11 Takahiro Shimizu 2012-03-07  249  
863d08ece9bf11 Takahiro Shimizu 2012-03-07  250  static void pch_reset(struct pch_dev *chip)
863d08ece9bf11 Takahiro Shimizu 2012-03-07  251  {
863d08ece9bf11 Takahiro Shimizu 2012-03-07  252  	/* Reset Hardware Assist */
863d08ece9bf11 Takahiro Shimizu 2012-03-07  253  	pch_block_reset(chip);
863d08ece9bf11 Takahiro Shimizu 2012-03-07  254  
863d08ece9bf11 Takahiro Shimizu 2012-03-07  255  	/* enable all 32 bits in system time registers */
863d08ece9bf11 Takahiro Shimizu 2012-03-07  256  	pch_set_system_time_count(chip);
863d08ece9bf11 Takahiro Shimizu 2012-03-07  257  }
863d08ece9bf11 Takahiro Shimizu 2012-03-07  258  
863d08ece9bf11 Takahiro Shimizu 2012-03-07  259  /**
863d08ece9bf11 Takahiro Shimizu 2012-03-07  260   * pch_set_station_address() - This API sets the station address used by
863d08ece9bf11 Takahiro Shimizu 2012-03-07  261   *				    IEEE 1588 hardware when looking at PTP
863d08ece9bf11 Takahiro Shimizu 2012-03-07  262   *				    traffic on the  ethernet interface
863d08ece9bf11 Takahiro Shimizu 2012-03-07  263   * @addr:	dress which contain the column separated address to be used.
287f93ded67f48 Lee Jones        2021-03-12  264   * @pdev:	PCI device.
863d08ece9bf11 Takahiro Shimizu 2012-03-07  265   */
17cdedf3b3649a Takahiro Shimizu 2012-04-20  266  int pch_set_station_address(u8 *addr, struct pci_dev *pdev)
863d08ece9bf11 Takahiro Shimizu 2012-03-07  267  {
863d08ece9bf11 Takahiro Shimizu 2012-03-07  268  	struct pch_dev *chip = pci_get_drvdata(pdev);
4e76b5c11d2511 Andy Shevchenko  2022-02-07  269  	bool valid;
4e76b5c11d2511 Andy Shevchenko  2022-02-07  270  	u64 mac;
863d08ece9bf11 Takahiro Shimizu 2012-03-07  271  
863d08ece9bf11 Takahiro Shimizu 2012-03-07  272  	/* Verify the parameter */
7d3ac5c7799152 Sahara           2013-03-26  273  	if ((chip->regs == NULL) || addr == (u8 *)NULL) {
863d08ece9bf11 Takahiro Shimizu 2012-03-07  274  		dev_err(&pdev->dev,
863d08ece9bf11 Takahiro Shimizu 2012-03-07  275  			"invalid params returning PCH_INVALIDPARAM\n");
863d08ece9bf11 Takahiro Shimizu 2012-03-07  276  		return PCH_INVALIDPARAM;
863d08ece9bf11 Takahiro Shimizu 2012-03-07  277  	}
863d08ece9bf11 Takahiro Shimizu 2012-03-07  278  
4e76b5c11d2511 Andy Shevchenko  2022-02-07  279  	valid = mac_pton(addr, (u8 *)&mac);
4e76b5c11d2511 Andy Shevchenko  2022-02-07  280  	if (!valid) {
4e76b5c11d2511 Andy Shevchenko  2022-02-07  281  		dev_err(&pdev->dev, "invalid params returning PCH_INVALIDPARAM\n");
863d08ece9bf11 Takahiro Shimizu 2012-03-07  282  		return PCH_INVALIDPARAM;
863d08ece9bf11 Takahiro Shimizu 2012-03-07  283  	}
863d08ece9bf11 Takahiro Shimizu 2012-03-07  284  
863d08ece9bf11 Takahiro Shimizu 2012-03-07  285  	dev_dbg(&pdev->dev, "invoking pch_station_set\n");
8664d49a815e34 Andy Shevchenko  2022-02-07 @286  	iowrite64_lo_hi(mac, &chip->regs->ts_st);
863d08ece9bf11 Takahiro Shimizu 2012-03-07  287  	return 0;
863d08ece9bf11 Takahiro Shimizu 2012-03-07  288  }
17cdedf3b3649a Takahiro Shimizu 2012-04-20  289  EXPORT_SYMBOL(pch_set_station_address);
863d08ece9bf11 Takahiro Shimizu 2012-03-07  290  
863d08ece9bf11 Takahiro Shimizu 2012-03-07  291  /*
863d08ece9bf11 Takahiro Shimizu 2012-03-07  292   * Interrupt service routine
863d08ece9bf11 Takahiro Shimizu 2012-03-07  293   */
863d08ece9bf11 Takahiro Shimizu 2012-03-07  294  static irqreturn_t isr(int irq, void *priv)
863d08ece9bf11 Takahiro Shimizu 2012-03-07  295  {
863d08ece9bf11 Takahiro Shimizu 2012-03-07  296  	struct pch_dev *pch_dev = priv;
7d3ac5c7799152 Sahara           2013-03-26  297  	struct pch_ts_regs __iomem *regs = pch_dev->regs;
863d08ece9bf11 Takahiro Shimizu 2012-03-07  298  	struct ptp_clock_event event;
d09adf61002fd3 Andy Shevchenko  2022-02-07  299  	u32 ack = 0, val;
863d08ece9bf11 Takahiro Shimizu 2012-03-07  300  
863d08ece9bf11 Takahiro Shimizu 2012-03-07  301  	val = ioread32(&regs->event);
863d08ece9bf11 Takahiro Shimizu 2012-03-07  302  
863d08ece9bf11 Takahiro Shimizu 2012-03-07  303  	if (val & PCH_TSE_SNS) {
863d08ece9bf11 Takahiro Shimizu 2012-03-07  304  		ack |= PCH_TSE_SNS;
863d08ece9bf11 Takahiro Shimizu 2012-03-07  305  		if (pch_dev->exts0_enabled) {
863d08ece9bf11 Takahiro Shimizu 2012-03-07  306  			event.type = PTP_CLOCK_EXTTS;
863d08ece9bf11 Takahiro Shimizu 2012-03-07  307  			event.index = 0;
d09adf61002fd3 Andy Shevchenko  2022-02-07 @308  			event.timestamp = ioread64_hi_lo(&regs->asms_hi);
863d08ece9bf11 Takahiro Shimizu 2012-03-07  309  			event.timestamp <<= TICKS_NS_SHIFT;
863d08ece9bf11 Takahiro Shimizu 2012-03-07  310  			ptp_clock_event(pch_dev->ptp_clock, &event);
863d08ece9bf11 Takahiro Shimizu 2012-03-07  311  		}
863d08ece9bf11 Takahiro Shimizu 2012-03-07  312  	}
863d08ece9bf11 Takahiro Shimizu 2012-03-07  313  
863d08ece9bf11 Takahiro Shimizu 2012-03-07  314  	if (val & PCH_TSE_SNM) {
863d08ece9bf11 Takahiro Shimizu 2012-03-07  315  		ack |= PCH_TSE_SNM;
863d08ece9bf11 Takahiro Shimizu 2012-03-07  316  		if (pch_dev->exts1_enabled) {
863d08ece9bf11 Takahiro Shimizu 2012-03-07  317  			event.type = PTP_CLOCK_EXTTS;
863d08ece9bf11 Takahiro Shimizu 2012-03-07  318  			event.index = 1;
d09adf61002fd3 Andy Shevchenko  2022-02-07  319  			event.timestamp = ioread64_hi_lo(&regs->asms_hi);
863d08ece9bf11 Takahiro Shimizu 2012-03-07  320  			event.timestamp <<= TICKS_NS_SHIFT;
863d08ece9bf11 Takahiro Shimizu 2012-03-07  321  			ptp_clock_event(pch_dev->ptp_clock, &event);
863d08ece9bf11 Takahiro Shimizu 2012-03-07  322  		}
863d08ece9bf11 Takahiro Shimizu 2012-03-07  323  	}
863d08ece9bf11 Takahiro Shimizu 2012-03-07  324  
863d08ece9bf11 Takahiro Shimizu 2012-03-07  325  	if (val & PCH_TSE_TTIPEND)
863d08ece9bf11 Takahiro Shimizu 2012-03-07  326  		ack |= PCH_TSE_TTIPEND; /* this bit seems to be always set */
863d08ece9bf11 Takahiro Shimizu 2012-03-07  327  
863d08ece9bf11 Takahiro Shimizu 2012-03-07  328  	if (ack) {
863d08ece9bf11 Takahiro Shimizu 2012-03-07  329  		iowrite32(ack, &regs->event);
863d08ece9bf11 Takahiro Shimizu 2012-03-07  330  		return IRQ_HANDLED;
863d08ece9bf11 Takahiro Shimizu 2012-03-07  331  	} else
863d08ece9bf11 Takahiro Shimizu 2012-03-07  332  		return IRQ_NONE;
863d08ece9bf11 Takahiro Shimizu 2012-03-07  333  }
863d08ece9bf11 Takahiro Shimizu 2012-03-07  334  

:::::: The code at line 224 was first introduced by commit
:::::: 8664d49a815e34f8e88489efb72c23826167adbe ptp_pch: Use ioread64_lo_hi() / iowrite64_lo_hi()

:::::: TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
