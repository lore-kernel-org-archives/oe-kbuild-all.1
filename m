Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27771DF99C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Oct 2025 20:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761336227; cv=none; b=A1nPATc/f+DJ9xr9EnItCywyby0zlzrc++cDg6RJGIHFTglDv65kJjqWuFBIsCi74SXaRYH4ifKNnTGDJPQOH6JDg+QIYsQ0nSHIGRzTtPoxLxJYb9JFLP7qV7YG17ly3jqaZuhqcM3U4CuAAa1b5KdnHjJntnDESaPurV0NN3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761336227; c=relaxed/simple;
	bh=w/I/vzGLKsqMTfSK+T+h+CCJHBTnoRvvTaijEH8JyXw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pdOuuYcKWlwlFxwckAQGGc0lo3QFokCaPWqfAlLveU42Rmt6xgocc+xVcWas6MliTzKx9hx9pXaFYLum/1g4ahEistdKKJSltdXfm9+S+kKFvGXtXuK5kBCgt9hjgPDJGDtND6gt+r+FVaVbby1hqOvmDTWWkwKdnyDWm/18gAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YQYjkE0k; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YQYjkE0k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761336226; x=1792872226;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w/I/vzGLKsqMTfSK+T+h+CCJHBTnoRvvTaijEH8JyXw=;
  b=YQYjkE0krSTX92mhfusl/QHKO/xdXgoUZokxFCxjnaluvXGYVJ1IPd2E
   R23hG6zwg0YkXWm3mWPCefUHgME5L/FyxKhU8Tv7GJN8iHxKZE3awjXY5
   msWYtBLeQHfdafV8tBYA3Vvoe2EoVQIDUdJN1q0SsQpq52ARjofaYu4BO
   JSgQVaVBagTJH+1OFtjuyprnrSkMNKBW0gSuzPwfNzIhnOjb32j/WuOf7
   Hsqz1XZRqw+x2ryP+hkEyLhVbq3+pKZvpYUSeIYR3PVA9dUa+JJivJjxV
   fCvhN8M/Sxc+9kdHjn0LHEtEPmyJMMOEJEmq2IVMeRze7weND3uzEEABG
   g==;
X-CSE-ConnectionGUID: D5R/v7vhRuCP5kra9yPSbA==
X-CSE-MsgGUID: tJ5Bo+zNTVuC5knLI4goXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63616129"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="63616129"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 13:03:45 -0700
X-CSE-ConnectionGUID: Mt1JBB9PSfKlUyCP6PVGTA==
X-CSE-MsgGUID: QASgRoHISgipIesUGp5bhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="184120232"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 24 Oct 2025 13:03:44 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCO0j-000Eqh-1U;
	Fri, 24 Oct 2025 20:03:41 +0000
Date: Sat, 25 Oct 2025 04:02:53 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:gemini-pata-phyreset 1/1]
 drivers/ata/pata_ftide010.c:281:23: error: implicit declaration of function
 'gemini_sata_reset_bridge'; did you mean 'gemini_sata_start_bridge'?
Message-ID: <202510250406.04KadpK4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git gemini-pata-phyreset
head:   e38c5ad2b2c58db7b5f83d50abe3f7479d8888e4
commit: e38c5ad2b2c58db7b5f83d50abe3f7479d8888e4 [1/1] ata: pata_ftide010: introduce phys reset
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20251025/202510250406.04KadpK4-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510250406.04KadpK4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510250406.04KadpK4-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/ata/pata_ftide010.c: In function 'pata_ftide010_gemini_phy_hardreset':
>> drivers/ata/pata_ftide010.c:281:23: error: implicit declaration of function 'gemini_sata_reset_bridge'; did you mean 'gemini_sata_start_bridge'? [-Wimplicit-function-declaration]
     281 |                 ret = gemini_sata_reset_bridge(sg, 0);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~
         |                       gemini_sata_start_bridge
   drivers/ata/pata_ftide010.c: In function 'pata_ftide010_gemini_init':
>> drivers/ata/pata_ftide010.c:420:39: error: 'struct ata_port_operations' has no member named 'hardreset'
     420 |                 pata_ftide010_port_ops.hardreset =
         |                                       ^


vim +281 drivers/ata/pata_ftide010.c

   268	
   269	static int pata_ftide010_gemini_phy_hardreset(struct ata_link *link,
   270						      unsigned int *class,
   271						      unsigned long deadline)
   272	{
   273		struct ata_port *ap = link->ap;
   274		struct ftide010 *ftide = ap->host->private_data;
   275		struct device *dev = ftide->dev;
   276		struct sata_gemini *sg = ftide->sg;
   277		int ret;
   278	
   279		if (ftide->master_to_sata0) {
   280			dev_info(dev, "SATA0 (master) hardreset\n");
 > 281			ret = gemini_sata_reset_bridge(sg, 0);
   282			if (ret)
   283				return ret;
   284		}
   285		if (ftide->master_to_sata1) {
   286			dev_info(dev, "SATA1 (master) hardreset\n");
   287			ret = gemini_sata_reset_bridge(sg, 1);
   288			if (ret)
   289				return ret;
   290		}
   291		/* Avoid double-resetting */
   292		if (ftide->slave_to_sata0 && !ftide->master_to_sata0) {
   293			dev_info(dev, "SATA0 (slave) hardreset\n");
   294			ret = gemini_sata_reset_bridge(sg, 0);
   295			if (ret)
   296				return ret;
   297		}
   298		/* Avoid double-resetting */
   299		if (ftide->slave_to_sata1 && !ftide->master_to_sata1) {
   300			dev_info(dev, "SATA1 (slave) hardreset\n");
   301			ret = gemini_sata_reset_bridge(sg, 1);
   302			if (ret)
   303				return ret;
   304		}
   305	
   306		return 0;
   307	}
   308	
   309	static int pata_ftide010_gemini_port_start(struct ata_port *ap)
   310	{
   311		struct ftide010 *ftide = ap->host->private_data;
   312		struct device *dev = ftide->dev;
   313		struct sata_gemini *sg = ftide->sg;
   314		int bridges = 0;
   315		int ret;
   316	
   317		ret = ata_bmdma_port_start(ap);
   318		if (ret)
   319			return ret;
   320	
   321		if (ftide->master_to_sata0) {
   322			dev_info(dev, "SATA0 (master) start\n");
   323			ret = gemini_sata_start_bridge(sg, 0);
   324			if (!ret)
   325				bridges++;
   326		}
   327		if (ftide->master_to_sata1) {
   328			dev_info(dev, "SATA1 (master) start\n");
   329			ret = gemini_sata_start_bridge(sg, 1);
   330			if (!ret)
   331				bridges++;
   332		}
   333		/* Avoid double-starting */
   334		if (ftide->slave_to_sata0 && !ftide->master_to_sata0) {
   335			dev_info(dev, "SATA0 (slave) start\n");
   336			ret = gemini_sata_start_bridge(sg, 0);
   337			if (!ret)
   338				bridges++;
   339		}
   340		/* Avoid double-starting */
   341		if (ftide->slave_to_sata1 && !ftide->master_to_sata1) {
   342			dev_info(dev, "SATA1 (slave) start\n");
   343			ret = gemini_sata_start_bridge(sg, 1);
   344			if (!ret)
   345				bridges++;
   346		}
   347	
   348		dev_info(dev, "brought %d bridges online\n", bridges);
   349		return (bridges > 0) ? 0 : -EINVAL; // -ENODEV;
   350	}
   351	
   352	static void pata_ftide010_gemini_port_stop(struct ata_port *ap)
   353	{
   354		struct ftide010 *ftide = ap->host->private_data;
   355		struct device *dev = ftide->dev;
   356		struct sata_gemini *sg = ftide->sg;
   357	
   358		if (ftide->master_to_sata0) {
   359			dev_info(dev, "SATA0 (master) stop\n");
   360			gemini_sata_stop_bridge(sg, 0);
   361		}
   362		if (ftide->master_to_sata1) {
   363			dev_info(dev, "SATA1 (master) stop\n");
   364			gemini_sata_stop_bridge(sg, 1);
   365		}
   366		/* Avoid double-stopping */
   367		if (ftide->slave_to_sata0 && !ftide->master_to_sata0) {
   368			dev_info(dev, "SATA0 (slave) stop\n");
   369			gemini_sata_stop_bridge(sg, 0);
   370		}
   371		/* Avoid double-stopping */
   372		if (ftide->slave_to_sata1 && !ftide->master_to_sata1) {
   373			dev_info(dev, "SATA1 (slave) stop\n");
   374			gemini_sata_stop_bridge(sg, 1);
   375		}
   376	}
   377	
   378	static int pata_ftide010_gemini_cable_detect(struct ata_port *ap)
   379	{
   380		struct ftide010 *ftide = ap->host->private_data;
   381	
   382		/*
   383		 * Return the master cable, I have no clue how to return a different
   384		 * cable for the slave than for the master.
   385		 */
   386		return ftide->master_cbl;
   387	}
   388	
   389	static int pata_ftide010_gemini_init(struct ftide010 *ftide,
   390					     struct ata_port_info *pi,
   391					     bool is_ata1)
   392	{
   393		struct device *dev = ftide->dev;
   394		struct sata_gemini *sg;
   395		enum gemini_muxmode muxmode;
   396	
   397		/* Look up SATA bridge */
   398		sg = gemini_sata_bridge_get();
   399		if (IS_ERR(sg))
   400			return PTR_ERR(sg);
   401		ftide->sg = sg;
   402	
   403		muxmode = gemini_sata_get_muxmode(sg);
   404	
   405		/* Special ops */
   406		pata_ftide010_port_ops.port_start =
   407			pata_ftide010_gemini_port_start;
   408		pata_ftide010_port_ops.port_stop =
   409			pata_ftide010_gemini_port_stop;
   410		pata_ftide010_port_ops.cable_detect =
   411			pata_ftide010_gemini_cable_detect;
   412	
   413		/* Flag port as SATA-capable */
   414		if (gemini_sata_bridge_enabled(sg, is_ata1)) {
   415			pi->flags |= ATA_FLAG_SATA;
   416			/*
   417			 * Register hard reset operation in the ATA port the core will
   418			 * call this right after probe
   419			 */
 > 420			pata_ftide010_port_ops.hardreset =
   421				pata_ftide010_gemini_phy_hardreset;
   422		}
   423	
   424		/* This device has broken DMA, only PIO works */
   425		if (of_machine_is_compatible("itian,sq201")) {
   426			pi->mwdma_mask = 0;
   427			pi->udma_mask = 0;
   428		}
   429	
   430		/*
   431		 * We assume that a simple 40-wire cable is used in the PATA mode.
   432		 * if you're adding a system using the PATA interface, make sure
   433		 * the right cable is set up here, it might be necessary to use
   434		 * special hardware detection or encode the cable type in the device
   435		 * tree with special properties.
   436		 */
   437		if (!is_ata1) {
   438			switch (muxmode) {
   439			case GEMINI_MUXMODE_0:
   440				ftide->master_cbl = ATA_CBL_SATA;
   441				ftide->slave_cbl = ATA_CBL_PATA40;
   442				ftide->master_to_sata0 = true;
   443				break;
   444			case GEMINI_MUXMODE_1:
   445				ftide->master_cbl = ATA_CBL_SATA;
   446				ftide->slave_cbl = ATA_CBL_NONE;
   447				ftide->master_to_sata0 = true;
   448				break;
   449			case GEMINI_MUXMODE_2:
   450				ftide->master_cbl = ATA_CBL_PATA40;
   451				ftide->slave_cbl = ATA_CBL_PATA40;
   452				break;
   453			case GEMINI_MUXMODE_3:
   454				ftide->master_cbl = ATA_CBL_SATA;
   455				ftide->slave_cbl = ATA_CBL_SATA;
   456				ftide->master_to_sata0 = true;
   457				ftide->slave_to_sata1 = true;
   458				break;
   459			}
   460		} else {
   461			switch (muxmode) {
   462			case GEMINI_MUXMODE_0:
   463				ftide->master_cbl = ATA_CBL_SATA;
   464				ftide->slave_cbl = ATA_CBL_NONE;
   465				ftide->master_to_sata1 = true;
   466				break;
   467			case GEMINI_MUXMODE_1:
   468				ftide->master_cbl = ATA_CBL_SATA;
   469				ftide->slave_cbl = ATA_CBL_PATA40;
   470				ftide->master_to_sata1 = true;
   471				break;
   472			case GEMINI_MUXMODE_2:
   473				ftide->master_cbl = ATA_CBL_SATA;
   474				ftide->slave_cbl = ATA_CBL_SATA;
   475				ftide->slave_to_sata0 = true;
   476				ftide->master_to_sata1 = true;
   477				break;
   478			case GEMINI_MUXMODE_3:
   479				ftide->master_cbl = ATA_CBL_PATA40;
   480				ftide->slave_cbl = ATA_CBL_PATA40;
   481				break;
   482			}
   483		}
   484		dev_info(dev, "set up Gemini PATA%d\n", is_ata1);
   485	
   486		return 0;
   487	}
   488	#else
   489	static int pata_ftide010_gemini_init(struct ftide010 *ftide,
   490					     struct ata_port_info *pi,
   491					     bool is_ata1)
   492	{
   493		return -ENOTSUPP;
   494	}
   495	#endif
   496	
   497	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
