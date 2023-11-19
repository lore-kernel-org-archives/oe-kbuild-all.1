Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6184107AC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Nov 2023 12:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UZqgBP8K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700398038; x=1731934038;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vs0swm36ROSy7BmHZwyuRgRe7Kbdd+Asc8j29V3IQZ4=;
  b=UZqgBP8KxbPg9nfpb2CkOgRsEifU74mukuhtBd9qLV8+jM73PHVqfdPa
   wdZqilPKw4IEWeXPDsICYYC04GC6I5IDFhNvZAliv0/XXd5/Dzp/x1VXo
   mmIDZdCjLZNinOa1z6ADeX8c1rQ3ofDwuigwAlvF9QwBJyKBcEBrLagqv
   60Awlfw+q1Y1Z5rH8Hi/EkiEGoh7kqbm0CVvAyGgxxnxmCCBjeoQ+w3WP
   tCAQfPIo22P6IR0xhCRTExBkqP9v/gpWaI4T/9hMq8GDKI2RI14I7SNc9
   L2FYs3u5LfguC7XHvm4l7oCtoueE+CpdzolTzSnBkAn5YpCemi8d2vz7I
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="455787622"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="455787622"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 04:47:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="715980383"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="715980383"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 19 Nov 2023 04:47:17 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4hCk-00056b-3C;
	Sun, 19 Nov 2023 12:47:14 +0000
Date: Sun, 19 Nov 2023 20:47:06 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/170-atcphy 5/10] drivers/phy/apple/dptx.c:318:5:
 warning: no previous prototype for 'dptx_phy_set_link_rate'
Message-ID: <202311192051.eo8q7osb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/170-atcphy
head:   8d5aa5ac58d74bbab31f6e180ad02d227b8bfeca
commit: 3ba9173a776695e19481d515c3c1135ca6d718d5 [5/10] phy: apple: Add DP TX phy driver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20231119/202311192051.eo8q7osb-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231119/202311192051.eo8q7osb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311192051.eo8q7osb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/phy/apple/dptx.c:318:5: warning: no previous prototype for 'dptx_phy_set_link_rate' [-Wmissing-prototypes]
     318 | int dptx_phy_set_link_rate(struct apple_dptx_phy *phy, u32 link_rate)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/apple/dptx.c: In function 'dptx_phy_set_link_rate':
>> drivers/phy/apple/dptx.c:320:19: warning: variable 'sts_1014' set but not used [-Wunused-but-set-variable]
     320 |     u32 sts_1008, sts_1014, val_100c, val_20b0, val_20b4;
         |                   ^~~~~~~~
>> drivers/phy/apple/dptx.c:320:9: warning: variable 'sts_1008' set but not used [-Wunused-but-set-variable]
     320 |     u32 sts_1008, sts_1014, val_100c, val_20b0, val_20b4;
         |         ^~~~~~~~


vim +/dptx_phy_set_link_rate +318 drivers/phy/apple/dptx.c

   317	
 > 318	int dptx_phy_set_link_rate(struct apple_dptx_phy *phy, u32 link_rate)
   319	{
 > 320	    u32 sts_1008, sts_1014, val_100c, val_20b0, val_20b4;
   321	
   322		dev_dbg(phy->dev, "set_link_rate(%u)\n", link_rate);
   323	
   324	    // MMIO: R.4   0x23c544004 (dptx-phy[0], offset 0x4004) = 0x49
   325	    // MMIO: W.4   0x23c544004 (dptx-phy[0], offset 0x4004) = 0x49
   326	    set32(phy->regs.dptx + 0x4004, 0x08);
   327	
   328	    // MMIO: R.4   0x23c544000 (dptx-phy[0], offset 0x4000) = 0x41021ac
   329	    // MMIO: W.4   0x23c544000 (dptx-phy[0], offset 0x4000) = 0x41021ac
   330	    clear32(phy->regs.dptx + 0x4000, 0x0000040);
   331	
   332	    // MMIO: R.4   0x23c544004 (dptx-phy[0], offset 0x4004) = 0x49
   333	    // MMIO: W.4   0x23c544004 (dptx-phy[0], offset 0x4004) = 0x41
   334	    clear32(phy->regs.dptx + 0x4004, 0x08);
   335	
   336	    // MMIO: R.4   0x23c544000 (dptx-phy[0], offset 0x4000) = 0x41021ac
   337	    // MMIO: W.4   0x23c544000 (dptx-phy[0], offset 0x4000) = 0x41021ac
   338	    clear32(phy->regs.dptx + 0x4000, 0x2000000);
   339	    // MMIO: R.4   0x23c544000 (dptx-phy[0], offset 0x4000) = 0x41021ac
   340	    // MMIO: W.4   0x23c544000 (dptx-phy[0], offset 0x4000) = 0x41021ac
   341	    set32(phy->regs.dptx + 0x4000, 0x1000000);
   342	
   343	    // MMIO: R.4   0x23c542200 (dptx-phy[0], offset 0x2200) = 0x2002
   344	    // MMIO: R.4   0x23c542200 (dptx-phy[0], offset 0x2200) = 0x2002
   345	    // MMIO: W.4   0x23c542200 (dptx-phy[0], offset 0x2200) = 0x2000
   346	    /* TODO: what is this read checking for? */
   347	    readl(phy->regs.dptx + 0x2200);
   348	    clear32(phy->regs.dptx + 0x2200, 0x0002);
   349	
   350	    // MMIO: R.4   0x23c54100c (dptx-phy[0], offset 0x100c) = 0xf000
   351	    // MMIO: W.4   0x23c54100c (dptx-phy[0], offset 0x100c) = 0xf000
   352	    // MMIO: R.4   0x23c54100c (dptx-phy[0], offset 0x100c) = 0xf000
   353	    // MMIO: W.4   0x23c54100c (dptx-phy[0], offset 0x100c) = 0xf008
   354	    /* TODO: what is the setting/clearing? */
   355	    val_100c = readl(phy->regs.dptx + 0x100c);
   356	    writel(val_100c, phy->regs.dptx + 0x100c);
   357	    set32(phy->regs.dptx + 0x100c, 0x0008);
   358	
   359	    // MMIO: R.4   0x23c541014 (dptx-phy[0], offset 0x1014) = 0x1
   360	    sts_1014 = readl(phy->regs.dptx + 0x1014);
   361	    /* TODO: assert(sts_1014 == 0x1); */
   362	
   363	    // MMIO: R.4   0x23c54100c (dptx-phy[0], offset 0x100c) = 0xf008
   364	    // MMIO: W.4   0x23c54100c (dptx-phy[0], offset 0x100c) = 0xf000
   365	    clear32(phy->regs.dptx + 0x100c, 0x0008);
   366	
   367	    // MMIO: R.4   0x23c541008 (dptx-phy[0], offset 0x1008) = 0x1
   368	    sts_1008 = readl(phy->regs.dptx + 0x1008);
   369	    /* TODO: assert(sts_1008 == 0x1); */
   370	
   371	    // MMIO: R.4   0x23c542220 (dptx-phy[0], offset 0x2220) = 0x11090a0
   372	    // MMIO: W.4   0x23c542220 (dptx-phy[0], offset 0x2220) = 0x1109020
   373	    clear32(phy->regs.dptx + 0x2220, 0x0000080);
   374	
   375	    // MMIO: R.4   0x23c5420b0 (dptx-phy[0], offset 0x20b0) = 0x1e0e01c2
   376	    // MMIO: W.4   0x23c5420b0 (dptx-phy[0], offset 0x20b0) = 0x1e0e01c2
   377	    val_20b0 = readl(phy->regs.dptx + 0x20b0);
   378	    /* TODO: what happens on dptx-phy */
   379	    if (phy->hw.type == DPTX_PHY_T6020)
   380		val_20b0 = (val_20b0 & ~0x3ff) | 0x2a3;
   381	    writel(val_20b0, phy->regs.dptx + 0x20b0);
   382	
   383	    // MMIO: R.4   0x23c5420b4 (dptx-phy[0], offset 0x20b4) = 0x7fffffe
   384	    // MMIO: W.4   0x23c5420b4 (dptx-phy[0], offset 0x20b4) = 0x7fffffe
   385	    val_20b4 = readl(phy->regs.dptx + 0x20b4);
   386	    /* TODO: what happens on dptx-phy */
   387	    if (phy->hw.type == DPTX_PHY_T6020)
   388		val_20b4 = (val_20b4 | 0x4000000) & ~0x0008000;
   389	    writel(val_20b4, phy->regs.dptx + 0x20b4);
   390	
   391	    // MMIO: R.4   0x23c5420b4 (dptx-phy[0], offset 0x20b4) = 0x7fffffe
   392	    // MMIO: W.4   0x23c5420b4 (dptx-phy[0], offset 0x20b4) = 0x7fffffe
   393	    val_20b4 = readl(phy->regs.dptx + 0x20b4);
   394	    /* TODO: what happens on dptx-phy */
   395	    if (phy->hw.type == DPTX_PHY_T6020)
   396		val_20b4 = (val_20b4 | 0x0000001) & ~0x0000004;
   397	    writel(val_20b4, phy->regs.dptx + 0x20b4);
   398	
   399	    // MMIO: R.4   0x23c5420b8 (dptx-phy[0], offset 0x20b8) = 0x654800
   400	    // MMIO: W.4   0x23c5420b8 (dptx-phy[0], offset 0x20b8) = 0x654800
   401	    /* TODO: unclear */
   402	    set32(phy->regs.dptx + 0x20b8, 0);
   403	    // MMIO: R.4   0x23c5420b8 (dptx-phy[0], offset 0x20b8) = 0x654800
   404	    // MMIO: W.4   0x23c5420b8 (dptx-phy[0], offset 0x20b8) = 0x654800
   405	    /* TODO: unclear */
   406	    set32(phy->regs.dptx + 0x20b8, 0);
   407	    // MMIO: R.4   0x23c5420b8 (dptx-phy[0], offset 0x20b8) = 0x654800
   408	    // MMIO: W.4   0x23c5420b8 (dptx-phy[0], offset 0x20b8) = 0x654800
   409	    /* TODO: unclear */
   410	    if (phy->hw.type == DPTX_PHY_T6020)
   411		set32(phy->regs.dptx + 0x20b8, 0x010000);
   412	    else
   413		set32(phy->regs.dptx + 0x20b8, 0);
   414	    // MMIO: R.4   0x23c5420b8 (dptx-phy[0], offset 0x20b8) = 0x654800
   415	    // MMIO: W.4   0x23c5420b8 (dptx-phy[0], offset 0x20b8) = 0x454800
   416	    clear32(phy->regs.dptx + 0x20b8, 0x200000);
   417	
   418	    // MMIO: R.4   0x23c5420b8 (dptx-phy[0], offset 0x20b8) = 0x454800
   419	    // MMIO: W.4   0x23c5420b8 (dptx-phy[0], offset 0x20b8) = 0x454800
   420	    /* TODO: unclear */
   421	    set32(phy->regs.dptx + 0x20b8, 0);
   422	
   423	    // MMIO: R.4   0x23c5000a0 (dptx-phy[1], offset 0xa0) = 0x0
   424	    // MMIO: W.4   0x23c5000a0 (dptx-phy[1], offset 0xa0) = 0x8
   425	    // MMIO: R.4   0x23c5000a0 (dptx-phy[1], offset 0xa0) = 0x8
   426	    // MMIO: W.4   0x23c5000a0 (dptx-phy[1], offset 0xa0) = 0xc
   427	    // MMIO: R.4   0x23c5000a0 (dptx-phy[1], offset 0xa0) = 0xc
   428	    // MMIO: W.4   0x23c5000a0 (dptx-phy[1], offset 0xa0) = 0x4000c
   429	    // MMIO: R.4   0x23c5000a0 (dptx-phy[1], offset 0xa0) = 0x4000c
   430	    // MMIO: W.4   0x23c5000a0 (dptx-phy[1], offset 0xa0) = 0xc
   431	    // MMIO: R.4   0x23c5000a0 (dptx-phy[1], offset 0xa0) = 0xc
   432	    // MMIO: W.4   0x23c5000a0 (dptx-phy[1], offset 0xa0) = 0x8000c
   433	    // MMIO: R.4   0x23c5000a0 (dptx-phy[1], offset 0xa0) = 0x8000c
   434	    // MMIO: W.4   0x23c5000a0 (dptx-phy[1], offset 0xa0) = 0xc
   435	    // MMIO: R.4   0x23c5000a0 (dptx-phy[1], offset 0xa0) = 0xc
   436	    // MMIO: W.4   0x23c5000a0 (dptx-phy[1], offset 0xa0) = 0x8
   437	    // MMIO: R.4   0x23c5000a0 (dptx-phy[1], offset 0xa0) = 0x8
   438	    // MMIO: W.4   0x23c5000a0 (dptx-phy[1], offset 0xa0) = 0x0
   439	    set32(phy->regs.core + 0xa0, 0x8);
   440	    set32(phy->regs.core + 0xa0, 0x4);
   441	    set32(phy->regs.core + 0xa0, 0x40000);
   442	    clear32(phy->regs.core + 0xa0, 0x40000);
   443	    set32(phy->regs.core + 0xa0, 0x80000);
   444	    clear32(phy->regs.core + 0xa0, 0x80000);
   445	    clear32(phy->regs.core + 0xa0, 0x4);
   446	    clear32(phy->regs.core + 0xa0, 0x8);
   447	
   448	    // MMIO: R.4   0x23c542000 (dptx-phy[0], offset 0x2000) = 0x2
   449	    // MMIO: W.4   0x23c542000 (dptx-phy[0], offset 0x2000) = 0x2
   450	    /* TODO: unclear */
   451	    set32(phy->regs.dptx + 0x2000, 0x0);
   452	
   453	    // MMIO: R.4   0x23c542018 (dptx-phy[0], offset 0x2018) = 0x0
   454	    // MMIO: W.4   0x23c542018 (dptx-phy[0], offset 0x2018) = 0x0
   455	    clear32(phy->regs.dptx + 0x2018, 0x0);
   456	
   457	    // MMIO: R.4   0x23c54100c (dptx-phy[0], offset 0x100c) = 0xf000
   458	    // MMIO: W.4   0x23c54100c (dptx-phy[0], offset 0x100c) = 0xf007
   459	    set32(phy->regs.dptx + 0x100c, 0x0007);
   460	    // MMIO: R.4   0x23c54100c (dptx-phy[0], offset 0x100c) = 0xf007
   461	    // MMIO: W.4   0x23c54100c (dptx-phy[0], offset 0x100c) = 0xf00f
   462	    set32(phy->regs.dptx + 0x100c, 0x0008);
   463	
   464	    // MMIO: R.4   0x23c541014 (dptx-phy[0], offset 0x1014) = 0x38f
   465	    sts_1014 = readl(phy->regs.dptx + 0x1014);
   466	    /* TODO: assert(sts_1014 == 0x38f); */
   467	
   468	    // MMIO: R.4   0x23c54100c (dptx-phy[0], offset 0x100c) = 0xf00f
   469	    // MMIO: W.4   0x23c54100c (dptx-phy[0], offset 0x100c) = 0xf007
   470	    clear32(phy->regs.dptx + 0x100c, 0x0008);
   471	
   472	    // MMIO: R.4   0x23c541008 (dptx-phy[0], offset 0x1008) = 0x9
   473	    sts_1008 = readl(phy->regs.dptx + 0x1008);
   474	    /* TODO: assert(sts_1008 == 0x9); */
   475	
   476	    // MMIO: R.4   0x23c542200 (dptx-phy[0], offset 0x2200) = 0x2000
   477	    // MMIO: W.4   0x23c542200 (dptx-phy[0], offset 0x2200) = 0x2002
   478	    set32(phy->regs.dptx + 0x2200, 0x0002);
   479	
   480	    // MMIO: R.4   0x23c545010 (dptx-phy[0], offset 0x5010) = 0x18003000
   481	    // MMIO: W.4   0x23c545010 (dptx-phy[0], offset 0x5010) = 0x18003000
   482	    // MMIO: R.4   0x23c546010 (dptx-phy[0], offset 0x6010) = 0x18003000
   483	    // MMIO: W.4   0x23c546010 (dptx-phy[0], offset 0x6010) = 0x18003000
   484	    // MMIO: R.4   0x23c547010 (dptx-phy[0], offset 0x7010) = 0x18003000
   485	    // MMIO: W.4   0x23c547010 (dptx-phy[0], offset 0x7010) = 0x18003000
   486	    // MMIO: R.4   0x23c548010 (dptx-phy[0], offset 0x8010) = 0x18003000
   487	    // MMIO: W.4   0x23c548010 (dptx-phy[0], offset 0x8010) = 0x18003000
   488	    writel(0x18003000, phy->regs.dptx + 0x8010);
   489	    for (u32 loff = DPTX_LANE0_OFFSET; loff < DPTX_LANE_END; loff += DPTX_LANE_STRIDE) {
   490		u32 val_l010 = readl(phy->regs.dptx + loff + 0x10);
   491		writel(val_l010, phy->regs.dptx + loff + 0x10);
   492	    }
   493	
   494	    // MMIO: R.4   0x23c544000 (dptx-phy[0], offset 0x4000) = 0x41021ac
   495	    // MMIO: W.4   0x23c544000 (dptx-phy[0], offset 0x4000) = 0x51021ac
   496	    set32(phy->regs.dptx + 0x4000, 0x1000000);
   497	    // MMIO: R.4   0x23c544000 (dptx-phy[0], offset 0x4000) = 0x51021ac
   498	    // MMIO: W.4   0x23c544000 (dptx-phy[0], offset 0x4000) = 0x71021ac
   499	    set32(phy->regs.dptx + 0x4000, 0x2000000);
   500	
   501	    // MMIO: R.4   0x23c544004 (dptx-phy[0], offset 0x4004) = 0x41
   502	    // MMIO: W.4   0x23c544004 (dptx-phy[0], offset 0x4004) = 0x49
   503	    set32(phy->regs.dptx + 0x4004, 0x08);
   504	
   505	    // MMIO: R.4   0x23c544000 (dptx-phy[0], offset 0x4000) = 0x71021ac
   506	    // MMIO: W.4   0x23c544000 (dptx-phy[0], offset 0x4000) = 0x71021ec
   507	    set32(phy->regs.dptx + 0x4000, 0x0000040);
   508	
   509	    // MMIO: R.4   0x23c544004 (dptx-phy[0], offset 0x4004) = 0x49
   510	    // MMIO: W.4   0x23c544004 (dptx-phy[0], offset 0x4004) = 0x48
   511	    clear32(phy->regs.dptx + 0x4004, 0x01);
   512	
   513	    return 0;
   514	}
   515	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
