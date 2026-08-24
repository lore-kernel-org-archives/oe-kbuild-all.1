Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E164353A73
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Aug 2026 19:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787598924; cv=none; b=NMxIT1T+KbUlCg/pP4/Jvl1/jzNjcY1HxQnFiB1FXq4N1ol+UkgY10hIOh3yuV5oj/5iw1GH4V6NOo4C+EiF1HNSQ0S2An8iiWOqo7Zq64YRCIpZKoAkS5u52o95jzxfGkE1RaoZEo9XxN3Ke3Vo+tDzP2Bg+M3vZe3PnzJYu9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787598924; c=relaxed/simple;
	bh=gsekJprGaXKAM7tM8FJNjyQjNV/9Z4HuwtcP34Q5/4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ThSbsQhDZn5Bq6e5blDRjoGr/9pNJgU0M9mE5r8MMHspPydm2lB7unVUJuyBf3LJrCC+lgN2I/MC3Iy2nVAtEZpwpsU++7/cbT2nOhPh3kHuwkPmTCnoGrFtQpHf5lZFl2xC+OLWxPiIGp/e6V3tb1LDW7e7ftklpay1+cuRsyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ny3X5huG; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ny3X5huG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787598922; x=1819134922;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gsekJprGaXKAM7tM8FJNjyQjNV/9Z4HuwtcP34Q5/4s=;
  b=ny3X5huG6eksYESGgFWF2kxTciHsCyEciHofffVnhQFLQZmFCy7kPK8S
   T/IGr/MrVgCynF0ZXldnuMdIauhc1Rvg62Lrn0n5FFVkjj3wN8U4/R+PE
   gsE7qVqQMYMpMJ/QsVeRHoO30QORQnKkEcW3Kb+JMgNEC/GwEdQX7f4BJ
   qLLZ5TPlUBduj1sbYtzFTf1xg/wQo1vdkd+L5R+rn17bEXBK8ROI5HIi0
   kodZYRPs0piQXAlWNCnkGjPHP1hyXTCocF5yLkHdR4kAEEWQ40RtPSXBD
   NI6q6NYd9/EqpzJqNQ0/H1dfD0PvepGWPoW5wdYzMOTKr3fkWmp/2gXCy
   A==;
X-CSE-ConnectionGUID: fSE6w8LMQXKY99+eqGqLYQ==
X-CSE-MsgGUID: tSuuj/MlS3SdlCRpY22loA==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88073492"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="88073492"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 12:15:22 -0700
X-CSE-ConnectionGUID: ff27bxXkSEGswYxlha5lvA==
X-CSE-MsgGUID: 7baDVX3rR8q/oa5sf18GTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="265771432"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Aug 2026 12:15:21 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wya8V-000000003rX-1Wm7;
	Mon, 24 Aug 2026 19:15:13 +0000
Date: Tue, 25 Aug 2026 03:12:13 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>, linux-mtd@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: ndfc: use devm_platform_ioremap_resource
Message-ID: <202608250359.cFwVUqgE-lkp@intel.com>
References: <20260822224150.198749-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260822224150.198749-1-rosenp@gmail.com>

Hi Rosen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v7.2]
[also build test WARNING on linus/master next-20260821]
[cannot apply to mtd/nand/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/mtd-rawnand-ndfc-use-devm_platform_ioremap_resource/20260822-154150
base:   v7.2
patch link:    https://lore.kernel.org/r/20260822224150.198749-1-rosenp%40gmail.com
patch subject: [PATCH] mtd: rawnand: ndfc: use devm_platform_ioremap_resource
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260825/202608250359.cFwVUqgE-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260825/202608250359.cFwVUqgE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608250359.cFwVUqgE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mtd/nand/raw/ndfc.c: In function 'ndfc_probe':
>> drivers/mtd/nand/raw/ndfc.c:192:13: warning: unused variable 'err' [-Wunused-variable]
     192 |         int err, len = 0;
         |             ^~~


vim +/err +192 drivers/mtd/nand/raw/ndfc.c

ce4c61f1848649 drivers/mtd/nand/ndfc.c     Thomas Gleixner 2006-05-23  184  
06f25510692385 drivers/mtd/nand/ndfc.c     Bill Pemberton  2012-11-19  185  static int ndfc_probe(struct platform_device *ofdev)
ce4c61f1848649 drivers/mtd/nand/ndfc.c     Thomas Gleixner 2006-05-23  186  {
410fe2f02630fa drivers/mtd/nand/ndfc.c     Felix Radensky  2011-04-26  187  	struct ndfc_controller *ndfc;
dcd80db3efa82b drivers/mtd/nand/raw/ndfc.c Rosen Penev     2026-08-22  188  	void __iomem *ndfcbase;
766f271a63d1ee drivers/mtd/nand/ndfc.c     Ian Munsie      2010-10-01  189  	const __be32 *reg;
a808ad3b0d2841 drivers/mtd/nand/ndfc.c     Sean MacLennan  2008-12-10  190  	u32 ccr;
5828c60826e942 drivers/mtd/nand/ndfc.c     Dan Carpenter   2014-07-31  191  	u32 cs;
cceca8cb776b03 drivers/mtd/nand/raw/ndfc.c Rosen Penev     2026-06-13 @192  	int err, len = 0;
a808ad3b0d2841 drivers/mtd/nand/ndfc.c     Sean MacLennan  2008-12-10  193  
dcd80db3efa82b drivers/mtd/nand/raw/ndfc.c Rosen Penev     2026-08-22  194  	ndfcbase = devm_platform_ioremap_resource(ofdev, 0);
dcd80db3efa82b drivers/mtd/nand/raw/ndfc.c Rosen Penev     2026-08-22  195  	if (IS_ERR(ndfcbase))
dcd80db3efa82b drivers/mtd/nand/raw/ndfc.c Rosen Penev     2026-08-22  196  		return PTR_ERR(ndfcbase);
dcd80db3efa82b drivers/mtd/nand/raw/ndfc.c Rosen Penev     2026-08-22  197  
a808ad3b0d2841 drivers/mtd/nand/ndfc.c     Sean MacLennan  2008-12-10  198  	/* Read the reg property to get the chip select */
61c7a080a5a061 drivers/mtd/nand/ndfc.c     Grant Likely    2010-04-13  199  	reg = of_get_property(ofdev->dev.of_node, "reg", &len);
a808ad3b0d2841 drivers/mtd/nand/ndfc.c     Sean MacLennan  2008-12-10  200  	if (reg == NULL || len != 12) {
a808ad3b0d2841 drivers/mtd/nand/ndfc.c     Sean MacLennan  2008-12-10  201  		dev_err(&ofdev->dev, "unable read reg property (%d)\n", len);
a808ad3b0d2841 drivers/mtd/nand/ndfc.c     Sean MacLennan  2008-12-10  202  		return -ENOENT;
a808ad3b0d2841 drivers/mtd/nand/ndfc.c     Sean MacLennan  2008-12-10  203  	}
410fe2f02630fa drivers/mtd/nand/ndfc.c     Felix Radensky  2011-04-26  204  
410fe2f02630fa drivers/mtd/nand/ndfc.c     Felix Radensky  2011-04-26  205  	cs = be32_to_cpu(reg[0]);
410fe2f02630fa drivers/mtd/nand/ndfc.c     Felix Radensky  2011-04-26  206  	if (cs >= NDFC_MAX_CS) {
410fe2f02630fa drivers/mtd/nand/ndfc.c     Felix Radensky  2011-04-26  207  		dev_err(&ofdev->dev, "invalid CS number (%d)\n", cs);
410fe2f02630fa drivers/mtd/nand/ndfc.c     Felix Radensky  2011-04-26  208  		return -EINVAL;
410fe2f02630fa drivers/mtd/nand/ndfc.c     Felix Radensky  2011-04-26  209  	}
410fe2f02630fa drivers/mtd/nand/ndfc.c     Felix Radensky  2011-04-26  210  
410fe2f02630fa drivers/mtd/nand/ndfc.c     Felix Radensky  2011-04-26  211  	ndfc = &ndfc_ctrl[cs];
410fe2f02630fa drivers/mtd/nand/ndfc.c     Felix Radensky  2011-04-26  212  	ndfc->chip_select = cs;
410fe2f02630fa drivers/mtd/nand/ndfc.c     Felix Radensky  2011-04-26  213  
7da45139d264f3 drivers/mtd/nand/raw/ndfc.c Miquel Raynal   2018-07-17  214  	nand_controller_init(&ndfc->ndfc_control);
410fe2f02630fa drivers/mtd/nand/ndfc.c     Felix Radensky  2011-04-26  215  	ndfc->ofdev = ofdev;
410fe2f02630fa drivers/mtd/nand/ndfc.c     Felix Radensky  2011-04-26  216  	dev_set_drvdata(&ofdev->dev, ndfc);
a808ad3b0d2841 drivers/mtd/nand/ndfc.c     Sean MacLennan  2008-12-10  217  
dcd80db3efa82b drivers/mtd/nand/raw/ndfc.c Rosen Penev     2026-08-22  218  	ndfc->ndfcbase = ndfcbase;
ce4c61f1848649 drivers/mtd/nand/ndfc.c     Thomas Gleixner 2006-05-23  219  
a808ad3b0d2841 drivers/mtd/nand/ndfc.c     Sean MacLennan  2008-12-10  220  	ccr = NDFC_CCR_BS(ndfc->chip_select);
ce4c61f1848649 drivers/mtd/nand/ndfc.c     Thomas Gleixner 2006-05-23  221  
a808ad3b0d2841 drivers/mtd/nand/ndfc.c     Sean MacLennan  2008-12-10  222  	/* It is ok if ccr does not exist - just default to 0 */
61c7a080a5a061 drivers/mtd/nand/ndfc.c     Grant Likely    2010-04-13  223  	reg = of_get_property(ofdev->dev.of_node, "ccr", NULL);
a808ad3b0d2841 drivers/mtd/nand/ndfc.c     Sean MacLennan  2008-12-10  224  	if (reg)
766f271a63d1ee drivers/mtd/nand/ndfc.c     Ian Munsie      2010-10-01  225  		ccr |= be32_to_cpup(reg);
ce4c61f1848649 drivers/mtd/nand/ndfc.c     Thomas Gleixner 2006-05-23  226  
4f2692a5383e4b drivers/mtd/nand/raw/ndfc.c Rosen Penev     2026-06-01  227  	iowrite32be(ccr, ndfc->ndfcbase + NDFC_CCR);
ce4c61f1848649 drivers/mtd/nand/ndfc.c     Thomas Gleixner 2006-05-23  228  
a808ad3b0d2841 drivers/mtd/nand/ndfc.c     Sean MacLennan  2008-12-10  229  	/* Set the bank settings if given */
61c7a080a5a061 drivers/mtd/nand/ndfc.c     Grant Likely    2010-04-13  230  	reg = of_get_property(ofdev->dev.of_node, "bank-settings", NULL);
a808ad3b0d2841 drivers/mtd/nand/ndfc.c     Sean MacLennan  2008-12-10  231  	if (reg) {
a808ad3b0d2841 drivers/mtd/nand/ndfc.c     Sean MacLennan  2008-12-10  232  		int offset = NDFC_BCFG0 + (ndfc->chip_select << 2);
4f2692a5383e4b drivers/mtd/nand/raw/ndfc.c Rosen Penev     2026-06-01  233  		iowrite32be(be32_to_cpup(reg), ndfc->ndfcbase + offset);
a808ad3b0d2841 drivers/mtd/nand/ndfc.c     Sean MacLennan  2008-12-10  234  	}
a808ad3b0d2841 drivers/mtd/nand/ndfc.c     Sean MacLennan  2008-12-10  235  
dcd80db3efa82b drivers/mtd/nand/raw/ndfc.c Rosen Penev     2026-08-22  236  	return ndfc_chip_init(ndfc, ofdev->dev.of_node);
ce4c61f1848649 drivers/mtd/nand/ndfc.c     Thomas Gleixner 2006-05-23  237  }
ce4c61f1848649 drivers/mtd/nand/ndfc.c     Thomas Gleixner 2006-05-23  238  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
