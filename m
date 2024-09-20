Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03721E4B2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Sep 2024 12:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726836233; cv=none; b=njK5/ePdof9iI3ZX9d2JsBgnPKb0CjPSYwZBgfBlpcGWbHIQfaKa+yXnWMNYWCMNzpdCGjyUGPsYISBAulmVZjekIzlGW6DmxnnyeEzS8WdZhVrBTEAMv+mvqe+n/Z+fISGyS236rBdJ4zPavMoUVfq9mWchWHu7K/wnX/pDlX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726836233; c=relaxed/simple;
	bh=KehmAoXVb6AT5l8lFfXYrscINeLqjEtrS4l91h6F0rU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bJuAeLFhsjFpuhB1dVKVUYBqpRpL3bCIDS8MkxRIKNbeb1VAfJ58Z5kNCsHJ6W1cQMGjz69TJFgS2ExIOxUcHuVsXhX46bG1PgroYJKpw2hebsRuopiF6faKvRrhUyCTf4wlGNcfwkzdfDDs9INjXMUaAlaUoBgh8/G4XswtU1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XPTxM+UW; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XPTxM+UW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726836231; x=1758372231;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KehmAoXVb6AT5l8lFfXYrscINeLqjEtrS4l91h6F0rU=;
  b=XPTxM+UWb0P1UdrxvsOb1X+ailzMhy9Hn4z6CNRw19PksC+GoXkolw0f
   sUcfpBqF4m1iUeCFWnzqu2Bvg+N5fVw5BzSOsukLYxhtgeQ6dTvQvPk1J
   d7EoGnpg4/FmKTzVpzEkNlVuzgtPDBEu95InZEezLuf/i+LYkWIDX1o5B
   Di63dz/20lXRzHWEYT9dUixIX2Yd3FAGOSphQqZ6JfKWKfse2ppms1hDX
   jiLYeasbSyrXF+QVKbOQH9gEJshKzuiWVZpcjj9Pf55AsEBHU1/B+DXe8
   TWf+hd0Z8ksMUbgi72ni0/B7td3PnMK2vwO1UtZs4OyNOT5rVWbFQNGmX
   Q==;
X-CSE-ConnectionGUID: 1tGwzSrfT2eorn7SagLN1Q==
X-CSE-MsgGUID: srkzmpaTTW2X+FXKpuQ4AQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25359197"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="25359197"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 05:43:50 -0700
X-CSE-ConnectionGUID: zfkJ2lV0SnGWUrkN9BW/qQ==
X-CSE-MsgGUID: +McLckhLQX6QzFyUisFAlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="70599438"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 20 Sep 2024 05:43:49 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srczC-000EPh-2V;
	Fri, 20 Sep 2024 12:43:46 +0000
Date: Fri, 20 Sep 2024 20:43:01 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:nr_irqs 12/12] drivers/net/hamradio/scc.c:1472:25:
 error: 'nr_irqs' undeclared
Message-ID: <202409202038.zWJ7E8gP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux nr_irqs
head:   319971397427327d8ea6e80d3bbe8a669655450d
commit: 319971397427327d8ea6e80d3bbe8a669655450d [12/12] genirq: Unexport 'nr_irqs'
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240920/202409202038.zWJ7E8gP-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240920/202409202038.zWJ7E8gP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409202038.zWJ7E8gP-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/hamradio/scc.c: In function 'z8530_init':
>> drivers/net/hamradio/scc.c:1472:25: error: 'nr_irqs' undeclared (first use in this function)
    1472 |         for (k = 0; k < nr_irqs; k++)
         |                         ^~~~~~~
   drivers/net/hamradio/scc.c:1472:25: note: each undeclared identifier is reported only once for each function it appears in
   drivers/net/hamradio/scc.c: In function 'scc_net_siocdevprivate':
   drivers/net/hamradio/scc.c:1738:59: error: 'nr_irqs' undeclared (first use in this function)
    1738 |                         if (hwcfg.irq < 0 || hwcfg.irq >= nr_irqs)
         |                                                           ^~~~~~~
   drivers/net/hamradio/scc.c: In function 'scc_cleanup_driver':
   drivers/net/hamradio/scc.c:2143:25: error: 'nr_irqs' undeclared (first use in this function)
    2143 |         for (k = 0; k < nr_irqs ; k++)
         |                         ^~~~~~~


vim +/nr_irqs +1472 drivers/net/hamradio/scc.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  1456  
^1da177e4c3f41 Linus Torvalds 2005-04-16  1457  /*
^1da177e4c3f41 Linus Torvalds 2005-04-16  1458   * Reset the Z8530s and setup special hardware
^1da177e4c3f41 Linus Torvalds 2005-04-16  1459   */
^1da177e4c3f41 Linus Torvalds 2005-04-16  1460  
^1da177e4c3f41 Linus Torvalds 2005-04-16  1461  static void z8530_init(void)
^1da177e4c3f41 Linus Torvalds 2005-04-16  1462  {
^1da177e4c3f41 Linus Torvalds 2005-04-16  1463  	struct scc_channel *scc;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1464  	int chip, k;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1465  	unsigned long flags;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1466  	char *flag;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1467  
^1da177e4c3f41 Linus Torvalds 2005-04-16  1468  
^1da177e4c3f41 Linus Torvalds 2005-04-16  1469  	printk(KERN_INFO "Init Z8530 driver: %u channels, IRQ", Nchips*2);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1470  	
^1da177e4c3f41 Linus Torvalds 2005-04-16  1471  	flag=" ";
60e4ad7a72fd7c Yinghai Lu     2008-08-19 @1472  	for (k = 0; k < nr_irqs; k++)
^1da177e4c3f41 Linus Torvalds 2005-04-16  1473  		if (Ivec[k].used) 
^1da177e4c3f41 Linus Torvalds 2005-04-16  1474  		{
^1da177e4c3f41 Linus Torvalds 2005-04-16  1475  			printk("%s%d", flag, k);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1476  			flag=",";
^1da177e4c3f41 Linus Torvalds 2005-04-16  1477  		}
^1da177e4c3f41 Linus Torvalds 2005-04-16  1478  	printk("\n");
^1da177e4c3f41 Linus Torvalds 2005-04-16  1479  
^1da177e4c3f41 Linus Torvalds 2005-04-16  1480  
^1da177e4c3f41 Linus Torvalds 2005-04-16  1481  	/* reset and pre-init all chips in the system */
^1da177e4c3f41 Linus Torvalds 2005-04-16  1482  	for (chip = 0; chip < Nchips; chip++)
^1da177e4c3f41 Linus Torvalds 2005-04-16  1483  	{
^1da177e4c3f41 Linus Torvalds 2005-04-16  1484  		scc=&SCC_Info[2*chip];
^1da177e4c3f41 Linus Torvalds 2005-04-16  1485  		if (!scc->ctrl) continue;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1486  
^1da177e4c3f41 Linus Torvalds 2005-04-16  1487  		/* Special SCC cards */
^1da177e4c3f41 Linus Torvalds 2005-04-16  1488  
^1da177e4c3f41 Linus Torvalds 2005-04-16  1489  		if(scc->brand & EAGLE)			/* this is an EAGLE card */
^1da177e4c3f41 Linus Torvalds 2005-04-16  1490  			Outb(scc->special,0x08);	/* enable interrupt on the board */
^1da177e4c3f41 Linus Torvalds 2005-04-16  1491  			
^1da177e4c3f41 Linus Torvalds 2005-04-16  1492  		if(scc->brand & (PC100 | PRIMUS))	/* this is a PC100/PRIMUS card */
^1da177e4c3f41 Linus Torvalds 2005-04-16  1493  			Outb(scc->special,scc->option);	/* set the MODEM mode (0x22) */
^1da177e4c3f41 Linus Torvalds 2005-04-16  1494  
^1da177e4c3f41 Linus Torvalds 2005-04-16  1495  			
^1da177e4c3f41 Linus Torvalds 2005-04-16  1496  		/* Reset and pre-init Z8530 */
^1da177e4c3f41 Linus Torvalds 2005-04-16  1497  
^1da177e4c3f41 Linus Torvalds 2005-04-16  1498  		spin_lock_irqsave(&scc->lock, flags);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1499  				
^1da177e4c3f41 Linus Torvalds 2005-04-16  1500  		Outb(scc->ctrl, 0);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1501  		OutReg(scc->ctrl,R9,FHWRES);		/* force hardware reset */
^1da177e4c3f41 Linus Torvalds 2005-04-16  1502  		udelay(100);				/* give it 'a bit' more time than required */
^1da177e4c3f41 Linus Torvalds 2005-04-16  1503  		wr(scc, R2, chip*16);			/* interrupt vector */
^1da177e4c3f41 Linus Torvalds 2005-04-16  1504  		wr(scc, R9, VIS);			/* vector includes status */
^1da177e4c3f41 Linus Torvalds 2005-04-16  1505  		spin_unlock_irqrestore(&scc->lock, flags);		
^1da177e4c3f41 Linus Torvalds 2005-04-16  1506          }
^1da177e4c3f41 Linus Torvalds 2005-04-16  1507  
^1da177e4c3f41 Linus Torvalds 2005-04-16  1508   
^1da177e4c3f41 Linus Torvalds 2005-04-16  1509  	Driver_Initialized = 1;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1510  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  1511  

:::::: The code at line 1472 was first introduced by commit
:::::: 60e4ad7a72fd7ce562cdf8dd850289e1e76bc1b1 drivers/net: use nr_irqs

:::::: TO: Yinghai Lu <yhlu.kernel@gmail.com>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
