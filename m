Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3844A5C4A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Sep 2026 15:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054899; cv=none; b=fCW9yjDZciPbgVce4DQ7h866bFNEe1h54ule/K+1LjTvymZVuUHxmCRZoT/e8VC4lXhB+1rjCqBwkSWjmFzPvUXpdhfS3egRxcF1xDOjCwVXuKiSscK02N4yOQu29onRgNT0wk1sW5911QuvNnEYm+8ig82QGUrr6XhxW0a+2WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054899; c=relaxed/simple;
	bh=aWBUWOL2JSFw86L0shreVBsdPmABhUf6e/ADRzlQelc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EpT8uXsh0ov2J0ZBNcppS1w2f3nNd61fd30UAPSAUEeOhpLF2EFmlpr8NNbtJSHrQRk1WaMRayDZ8SXXeiguUE05VyHFRHbGv3WGUgyBl3vIEJeve0aYwj7L4uQcrcAiGMwC1dH/cYL4xnjo3mFHxR+gzkdCYsbYnFkXM/upXus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nLB/PjG0; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nLB/PjG0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789054898; x=1820590898;
  h=date:from:to:cc:subject:message-id;
  bh=aWBUWOL2JSFw86L0shreVBsdPmABhUf6e/ADRzlQelc=;
  b=nLB/PjG0UDfyFpwaJjw/KE5WJwy2mA7SutnksTNtkF18+iantQcuyPe7
   CnF3tSd1YLJviiqm+cW5iV9Ujre/8ngkzWONryAFVofLLivPP/eSZrAcJ
   0jIKEN+ghQTv1EdOfFugUW/OvUv9GfSkTkAG2koppnNMN2IblwI9w5laz
   oO7eoyRoXrh1XwMBuxJ7UvYcj23oGZug3sOUNiRzE6DMP0UPqUEezMH1B
   ZhZQcQ8gJztyCLxnlzbHO4OiTKfy4oV0qE39kmJpf1iKP43LcyURPSa9i
   pBw4OmgOu3GaQOUb6j3/BW17GLr1toHus4JZBiC5yuDzdT1Iy89S7lLrk
   Q==;
X-CSE-ConnectionGUID: XIm1JpePRJCtDFHy0TNskQ==
X-CSE-MsgGUID: 1NwsBZNqQp2Wth0404rPlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="77066969"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="77066969"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:41:33 -0700
X-CSE-ConnectionGUID: vS7aVexnSW+BamBgF6yzuw==
X-CSE-MsgGUID: xpt4iNb+RAiIR2i8siw4DQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 10 Sep 2026 08:41:31 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4gu1-000000000Qm-1nw2;
	Thu, 10 Sep 2026 15:41:29 +0000
Date: Thu, 10 Sep 2026 17:41:00 +0200
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove-7.3 226/294]
 drivers/mtd/spi-nor/core.c:3394:12: error: static declaration of
 'spi_nor_scan' follows non-static declaration
Message-ID: <202609100538.2YmRyN5u-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove-7.3
head:   3ac93c1e700558259ea604f7d4f37e26820fba15
commit: 62e3b560c8fdcab6be5dce819f3b76df95cd95dc [226/294] mtd: spi-nor: remove controller_ops support
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260910/202609100538.2YmRyN5u-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609100538.2YmRyN5u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609100538.2YmRyN5u-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/mtd/spi-nor/core.c: In function 'spi_nor_read_id':
>> drivers/mtd/spi-nor/core.c:351:13: warning: unused variable 'ret' [-Wunused-variable]
     351 |         int ret;
         |             ^~~
   drivers/mtd/spi-nor/core.c: In function 'spi_nor_erase_sector':
>> drivers/mtd/spi-nor/core.c:1333:13: warning: unused variable 'i' [-Wunused-variable]
    1333 |         int i;
         |             ^
   drivers/mtd/spi-nor/core.c: In function 'spi_nor_setup':
>> drivers/mtd/spi-nor/core.c:2579:13: warning: unused variable 'ignored_mask' [-Wunused-variable]
    2579 |         u32 ignored_mask, shared_mask;
         |             ^~~~~~~~~~~~
   drivers/mtd/spi-nor/core.c: At top level:
>> drivers/mtd/spi-nor/core.c:3394:12: error: static declaration of 'spi_nor_scan' follows non-static declaration
    3394 | static int spi_nor_scan(struct spi_nor *nor, const char *name,
         |            ^~~~~~~~~~~~
   In file included from drivers/mtd/spi-nor/core.c:18:
   include/linux/mtd/spi-nor.h:419:5: note: previous declaration of 'spi_nor_scan' with type 'int(struct spi_nor *, const char *, const struct spi_nor_hwcaps *)'
     419 | int spi_nor_scan(struct spi_nor *nor, const char *name,
         |     ^~~~~~~~~~~~
--
   drivers/mtd/spi-nor/spansion.c: In function 'spansion_nor_clear_sr':
>> drivers/mtd/spi-nor/spansion.c:100:23: error: implicit declaration of function 'spi_nor_controller_ops_write_reg' [-Wimplicit-function-declaration]
     100 |                 ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_CLSR,
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/mtd/spi-nor/winbond.c: In function 'winbond_nor_select_die':
>> drivers/mtd/spi-nor/winbond.c:122:23: error: implicit declaration of function 'spi_nor_controller_ops_write_reg' [-Wimplicit-function-declaration]
     122 |                 ret = spi_nor_controller_ops_write_reg(nor,
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/spi_nor_scan +3394 drivers/mtd/spi-nor/core.c

  3393	
> 3394	static int spi_nor_scan(struct spi_nor *nor, const char *name,
  3395				const struct spi_nor_hwcaps *hwcaps)
  3396	{
  3397		const struct flash_info *info;
  3398		struct device *dev = nor->dev;
  3399		int ret;
  3400	
  3401		/* Reset SPI protocol for all commands. */
  3402		nor->reg_proto = SNOR_PROTO_1_1_1;
  3403		nor->read_proto = SNOR_PROTO_1_1_1;
  3404		nor->write_proto = SNOR_PROTO_1_1_1;
  3405	
  3406		/*
  3407		 * We need the bounce buffer early to read/write registers when going
  3408		 * through the spi-mem layer (buffers have to be DMA-able).
  3409		 * For spi-mem drivers, we'll reallocate a new buffer if
  3410		 * nor->params->page_size turns out to be greater than PAGE_SIZE (which
  3411		 * shouldn't happen before long since NOR pages are usually less
  3412		 * than 1KB) after spi_nor_scan() returns.
  3413		 */
  3414		nor->bouncebuf_size = PAGE_SIZE;
  3415		nor->bouncebuf = devm_kmalloc(dev, nor->bouncebuf_size,
  3416					      GFP_KERNEL);
  3417		if (!nor->bouncebuf)
  3418			return -ENOMEM;
  3419	
  3420		ret = spi_nor_hw_reset(nor);
  3421		if (ret)
  3422			return ret;
  3423	
  3424		info = spi_nor_get_flash_info(nor, name);
  3425		if (IS_ERR(info))
  3426			return PTR_ERR(info);
  3427	
  3428		nor->info = info;
  3429	
  3430		mutex_init(&nor->lock);
  3431	
  3432		/* Init flash parameters based on flash_info struct and SFDP */
  3433		ret = spi_nor_init_params(nor);
  3434		if (ret)
  3435			return ret;
  3436	
  3437		if (spi_nor_use_parallel_locking(nor))
  3438			init_waitqueue_head(&nor->rww.wait);
  3439	
  3440		/*
  3441		 * Configure the SPI memory:
  3442		 * - select op codes for (Fast) Read, Page Program and Sector Erase.
  3443		 * - set the number of dummy cycles (mode cycles + wait states).
  3444		 * - set the SPI protocols for register and memory accesses.
  3445		 * - set the number of address bytes.
  3446		 */
  3447		ret = spi_nor_setup(nor, hwcaps);
  3448		if (ret)
  3449			return ret;
  3450	
  3451		/* Send all the required SPI flash commands to initialize device */
  3452		ret = spi_nor_init(nor);
  3453		if (ret)
  3454			return ret;
  3455	
  3456		/* No mtd_info fields should be used up to this point. */
  3457		ret = spi_nor_set_mtd_info(nor);
  3458		if (ret)
  3459			return ret;
  3460	
  3461		dev_dbg(dev, "Manufacturer and device ID: %*phN\n",
  3462			SPI_NOR_MAX_ID_LEN, nor->id);
  3463	
  3464		return 0;
  3465	}
  3466	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
