Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EAD1B96E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Feb 2024 06:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708928642; cv=none; b=GZvHsyX/5pnXb/TwK+LBtMR5bNavEXGG13ojPXI4GtQ+3lW3glgZVhJrlQFPwkl1XeFfR99kmpGzWWXy1IkbVGVUyapL7x23TtNQ5Ch035OO10xB1t5S2w1NEc542JPWl7COw+anP7OfD1gauEOptmV+V824RT6iSSPr+oFJRxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708928642; c=relaxed/simple;
	bh=LKruKCLHQFSu3DDWshBMiFwNPxapNNd3RWWtDiOHtGE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j+kHnsMved2EQH77+R1TcmqMoBpBOAa3UWoTUuiGyPrqq7mbREDQ/5AAKgATQGSgPTgvaiioMZ2TePnudfezhkv90XOVbMjLYOu8FDzAGTuybSLQxdmWo9wQA06GD5MfbyTyem+zYunKHHhGczslqklvEZYbcnL+kFgr1HRMoL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=htBkAQky; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="htBkAQky"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708928640; x=1740464640;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LKruKCLHQFSu3DDWshBMiFwNPxapNNd3RWWtDiOHtGE=;
  b=htBkAQkys00kjauA/pUTf7fTCJxCa0/jOY0nlBdwMR70QrVGGfEf5er0
   x9Zi5Sx1aMrGJxfrOzbjQ837aLyaju/QzmQ2J3mmSEr3pD8SkccLfvCqo
   jVcAWnVPEgb81e/BLQVD17Q9sCZZ0KPtYh2YBSOX5mkzRrYKdghVYUnhY
   lsC9lKvqDp0s2hFerxJx4tlYtQz6KldkH3uICowPga6MHdIyi+VwP8XS/
   44F2dPRY4ngDw5EaqfWj45IZdGgSZoCGWPXbNCY5bTIbJxnlCtwYVoaMf
   IlOw2TtuifCkmrYwNRtrVN99StYwmk2qHKnWaNCb8sWeF5yb8ijvIl4ZQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="14326561"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="14326561"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2024 22:24:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6766420"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 25 Feb 2024 22:23:58 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1reUOz-000A8J-0l;
	Mon, 26 Feb 2024 06:23:53 +0000
Date: Mon, 26 Feb 2024 14:23:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 14777/21632]
 drivers/scsi/huawei/hifc/hifc_hwif.c:517:65: sparse: sparse: incorrect type
 in argument 4 (different base types)
Message-ID: <202402261420.bgeVvnXn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   b97b63500af297c36f80416fd1f1193d227cf51a
commit: 7fc993d55d1b54ae40e29dfac825a18d04d644c6 [14777/21632] scsi/hifc: add hifc driver FC service module
config: x86_64-randconfig-122-20240218 (https://download.01.org/0day-ci/archive/20240226/202402261420.bgeVvnXn-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240226/202402261420.bgeVvnXn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402261420.bgeVvnXn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/scsi/huawei/hifc/hifc_hwif.c:27:16: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_hwif.c:32:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int val @@     got restricted __be32 [usertype] @@
   drivers/scsi/huawei/hifc/hifc_hwif.c:32:16: sparse:     expected unsigned int val
   drivers/scsi/huawei/hifc/hifc_hwif.c:32:16: sparse:     got restricted __be32 [usertype]
   drivers/scsi/huawei/hifc/hifc_hwif.c:453:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __iomem *cfg_regs_base @@     got void *cfg_reg_base @@
   drivers/scsi/huawei/hifc/hifc_hwif.c:453:29: sparse:     expected unsigned char [noderef] [usertype] __iomem *cfg_regs_base
   drivers/scsi/huawei/hifc/hifc_hwif.c:453:29: sparse:     got void *cfg_reg_base
   drivers/scsi/huawei/hifc/hifc_hwif.c:454:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __iomem *intr_regs_base @@     got void *intr_reg_base @@
   drivers/scsi/huawei/hifc/hifc_hwif.c:454:30: sparse:     expected unsigned char [noderef] [usertype] __iomem *intr_regs_base
   drivers/scsi/huawei/hifc/hifc_hwif.c:454:30: sparse:     got void *intr_reg_base
   drivers/scsi/huawei/hifc/hifc_hwif.c:457:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __iomem *db_base @@     got void *db_base @@
   drivers/scsi/huawei/hifc/hifc_hwif.c:457:23: sparse:     expected unsigned char [noderef] [usertype] __iomem *db_base
   drivers/scsi/huawei/hifc/hifc_hwif.c:457:23: sparse:     got void *db_base
>> drivers/scsi/huawei/hifc/hifc_hwif.c:517:65: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted gfp_t [usertype] flag @@     got unsigned int flag @@
   drivers/scsi/huawei/hifc/hifc_hwif.c:517:65: sparse:     expected restricted gfp_t [usertype] flag
   drivers/scsi/huawei/hifc/hifc_hwif.c:517:65: sparse:     got unsigned int flag
   drivers/scsi/huawei/hifc/hifc_hwif.c:532:65: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted gfp_t [usertype] flag @@     got unsigned int flag @@
   drivers/scsi/huawei/hifc/hifc_hwif.c:532:65: sparse:     expected restricted gfp_t [usertype] flag
   drivers/scsi/huawei/hifc/hifc_hwif.c:532:65: sparse:     got unsigned int flag
   In file included from drivers/scsi/huawei/hifc/hifc_hwif.c:14:
   In file included from drivers/scsi/huawei/hifc/hifc_knl_adp.h:30:
   In file included from include/scsi/scsi_host.h:12:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:16:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   drivers/scsi/huawei/hifc/hifc_hwif.c:442: warning: Function parameter or member 'intr_reg_base' not described in 'hifc_init_hwif'
   drivers/scsi/huawei/hifc/hifc_hwif.c:442: warning: Function parameter or member 'db_base_phy' not described in 'hifc_init_hwif'
   drivers/scsi/huawei/hifc/hifc_hwif.c:442: warning: Function parameter or member 'db_base' not described in 'hifc_init_hwif'
   drivers/scsi/huawei/hifc/hifc_hwif.c:442: warning: Function parameter or member 'dwqe_mapping' not described in 'hifc_init_hwif'

vim +517 drivers/scsi/huawei/hifc/hifc_hwif.c

218105be120513 Chenguangli 2020-11-16  508  
218105be120513 Chenguangli 2020-11-16  509  int hifc_dma_zalloc_coherent_align(void *dev_hdl, u64 size, u64 align,
218105be120513 Chenguangli 2020-11-16  510  				   unsigned flag,
218105be120513 Chenguangli 2020-11-16  511  				   struct hifc_dma_addr_align *mem_align)
218105be120513 Chenguangli 2020-11-16  512  {
218105be120513 Chenguangli 2020-11-16  513  	void *vaddr, *align_vaddr;
218105be120513 Chenguangli 2020-11-16  514  	dma_addr_t paddr, align_paddr;
218105be120513 Chenguangli 2020-11-16  515  	u64 real_size = size;
218105be120513 Chenguangli 2020-11-16  516  
218105be120513 Chenguangli 2020-11-16 @517  	vaddr = dma_zalloc_coherent(dev_hdl, real_size, &paddr, flag);
218105be120513 Chenguangli 2020-11-16  518  	if (!vaddr)
218105be120513 Chenguangli 2020-11-16  519  		return -ENOMEM;
218105be120513 Chenguangli 2020-11-16  520  
218105be120513 Chenguangli 2020-11-16  521  	align_paddr = ALIGN(paddr, align);
218105be120513 Chenguangli 2020-11-16  522  	/* align */
218105be120513 Chenguangli 2020-11-16  523  	if (align_paddr == paddr) {
218105be120513 Chenguangli 2020-11-16  524  		align_vaddr = vaddr;
218105be120513 Chenguangli 2020-11-16  525  		goto out;
218105be120513 Chenguangli 2020-11-16  526  	}
218105be120513 Chenguangli 2020-11-16  527  
218105be120513 Chenguangli 2020-11-16  528  	dma_free_coherent(dev_hdl, real_size, vaddr, paddr);
218105be120513 Chenguangli 2020-11-16  529  
218105be120513 Chenguangli 2020-11-16  530  	/* realloc memory for align */
218105be120513 Chenguangli 2020-11-16  531  	real_size = size + align;
218105be120513 Chenguangli 2020-11-16  532  	vaddr = dma_zalloc_coherent(dev_hdl, real_size, &paddr, flag);
218105be120513 Chenguangli 2020-11-16  533  	if (!vaddr)
218105be120513 Chenguangli 2020-11-16  534  		return -ENOMEM;
218105be120513 Chenguangli 2020-11-16  535  
218105be120513 Chenguangli 2020-11-16  536  	align_paddr = ALIGN(paddr, align);
218105be120513 Chenguangli 2020-11-16  537  	align_vaddr = (void *)((u64)vaddr + (align_paddr - paddr));
218105be120513 Chenguangli 2020-11-16  538  
218105be120513 Chenguangli 2020-11-16  539  out:
218105be120513 Chenguangli 2020-11-16  540  	mem_align->real_size = (u32)real_size;
218105be120513 Chenguangli 2020-11-16  541  	mem_align->ori_vaddr = vaddr;
218105be120513 Chenguangli 2020-11-16  542  	mem_align->ori_paddr = paddr;
218105be120513 Chenguangli 2020-11-16  543  	mem_align->align_vaddr = align_vaddr;
218105be120513 Chenguangli 2020-11-16  544  	mem_align->align_paddr = align_paddr;
218105be120513 Chenguangli 2020-11-16  545  
218105be120513 Chenguangli 2020-11-16  546  	return 0;
218105be120513 Chenguangli 2020-11-16  547  }
218105be120513 Chenguangli 2020-11-16  548  

:::::: The code at line 517 was first introduced by commit
:::::: 218105be120513109ae9ea5418c10586913274d4 scsi/hifc: add hifc driver chip resource module

:::::: TO: Chenguangli <chenguangli2@huawei.com>
:::::: CC: Yang Yingliang <yangyingliang@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
