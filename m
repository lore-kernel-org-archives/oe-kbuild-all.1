Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12641524C4
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jun 2024 15:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717861088; cv=none; b=IbQjyIBEB9Gsh1OgZEqqKLYsIUJoRJAgQefLbPnLCbC+YzmnBRYtqhFTbHtWFKsAzVUaVVt6gHfLSZlasF4PBJdRwr2addj0xGBDNAsAPoWPX/vPW/8nujTMLZo8vEuZXOc/iijPIqp66MeBFKJtrcugspByGDtme5MDe+78R+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717861088; c=relaxed/simple;
	bh=u/ffms4/D26a6Rf28K0h87OllVa7eK1nNW/s8QK1QHg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KKP/9riQx5wv0AAjLmwybu8LfAaI91YztzqkODbI9nk2+BL7SJXbsRRAj0+7IajVMBOuiNnpK8gvHhQCY7Tpx70CmKaYWZrWVCtIwyjmPmYer/z0gPXNilbRX/q4S2SUtkPUoQSyo68JdtjT+vOKK7yvd708PIoX/UPvY6IyqSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V43uazmS; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V43uazmS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717861086; x=1749397086;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u/ffms4/D26a6Rf28K0h87OllVa7eK1nNW/s8QK1QHg=;
  b=V43uazmSA1YnLNUc1mckhGrIYAG24uDoS97qp6ahbhXIADSfNWCkfuQv
   /pkAIETypXtbpzZRawBE40eHQst9rFMpKTG7faOYVZhF4dbCuu69yugNR
   E3hoxxt/127GUBBwi3gGE9gnZFGDQ4jEX8r6yro5dIWZbnOPy91MCZW2g
   6Fx7OIM5uU0ohal+NC42BiWWrHaZZXSAQHyO0ZxV9qfq7aOz+mStJJQwI
   FNZhjjpVu13L/WVXRBAxXGn0daEJTzdukDJWIc4lPTBBlXqAWJ1LrF4fb
   YuEnEfvmeiUfAM7qa/jMl4rC2s6QtFBJmt3i6lnzSlHAu7a00tAOC/jID
   g==;
X-CSE-ConnectionGUID: VpLb1s6KS+ydxvejdE2qcw==
X-CSE-MsgGUID: vAkCOchYTY+gG1fRZ3YYlg==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="25681217"
X-IronPort-AV: E=Sophos;i="6.08,223,1712646000"; 
   d="scan'208";a="25681217"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 08:38:03 -0700
X-CSE-ConnectionGUID: SaKVpXZ/TYGr6Ko3+3ozjg==
X-CSE-MsgGUID: wkx0pwd/SGSRcK3WxR58bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,223,1712646000"; 
   d="scan'208";a="76098104"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Jun 2024 08:38:01 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFy8l-000081-0o;
	Sat, 08 Jun 2024 15:37:59 +0000
Date: Sat, 8 Jun 2024 23:36:59 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:block-limit-flags 41/52]
 drivers/s390/block/scm_blk.c:442:24: warning: variable 'rq' set but not used
Message-ID: <202406082306.mWWBcJfc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/block.git block-limit-flags
head:   b8da03a6bf6868bc22e344df8b888a805a34d7fa
commit: 3babe94dbd1c63f2abb82d94e046c1672c405184 [41/52] block: move the add_random flag to queue_limits
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240608/202406082306.mWWBcJfc-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240608/202406082306.mWWBcJfc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406082306.mWWBcJfc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/s390/block/scm_blk.c:15:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/s390/block/scm_blk.c:17:
   In file included from include/linux/blk-mq.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/s390/block/scm_blk.c:17:
   In file included from include/linux/blk-mq.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/s390/block/scm_blk.c:17:
   In file included from include/linux/blk-mq.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/s390/block/scm_blk.c:442:24: warning: variable 'rq' set but not used [-Wunused-but-set-variable]
     442 |         struct request_queue *rq;
         |                               ^
   18 warnings generated.


vim +/rq +442 drivers/s390/block/scm_blk.c

12d9076265398e Sebastian Ott     2017-01-25  435  
f30664e2c85c78 Sebastian Ott     2012-08-28  436  int scm_blk_dev_setup(struct scm_blk_dev *bdev, struct scm_device *scmdev)
f30664e2c85c78 Sebastian Ott     2012-08-28  437  {
066be10aef5a7d Christoph Hellwig 2024-02-15  438  	struct queue_limits lim = {
066be10aef5a7d Christoph Hellwig 2024-02-15  439  		.logical_block_size	= 1 << 12,
066be10aef5a7d Christoph Hellwig 2024-02-15  440  	};
066be10aef5a7d Christoph Hellwig 2024-02-15  441  	unsigned int devindex;
12d9076265398e Sebastian Ott     2017-01-25 @442  	struct request_queue *rq;
12d9076265398e Sebastian Ott     2017-01-25  443  	int len, ret;
f30664e2c85c78 Sebastian Ott     2012-08-28  444  
066be10aef5a7d Christoph Hellwig 2024-02-15  445  	lim.max_segments = min(scmdev->nr_max_block,
066be10aef5a7d Christoph Hellwig 2024-02-15  446  		(unsigned int) (PAGE_SIZE / sizeof(struct aidaw)));
066be10aef5a7d Christoph Hellwig 2024-02-15  447  	lim.max_hw_sectors = lim.max_segments << 3; /* 8 * 512 = blk_size */
066be10aef5a7d Christoph Hellwig 2024-02-15  448  
f30664e2c85c78 Sebastian Ott     2012-08-28  449  	devindex = atomic_inc_return(&nr_devices) - 1;
f30664e2c85c78 Sebastian Ott     2012-08-28  450  	/* scma..scmz + scmaa..scmzz */
f30664e2c85c78 Sebastian Ott     2012-08-28  451  	if (devindex > 701) {
f30664e2c85c78 Sebastian Ott     2012-08-28  452  		ret = -ENODEV;
f30664e2c85c78 Sebastian Ott     2012-08-28  453  		goto out;
f30664e2c85c78 Sebastian Ott     2012-08-28  454  	}
f30664e2c85c78 Sebastian Ott     2012-08-28  455  
f30664e2c85c78 Sebastian Ott     2012-08-28  456  	bdev->scmdev = scmdev;
4fa3c019640ef7 Sebastian Ott     2013-02-28  457  	bdev->state = SCM_OPER;
f30664e2c85c78 Sebastian Ott     2012-08-28  458  	spin_lock_init(&bdev->lock);
f30664e2c85c78 Sebastian Ott     2012-08-28  459  	atomic_set(&bdev->queued_reqs, 0);
f30664e2c85c78 Sebastian Ott     2012-08-28  460  
12d9076265398e Sebastian Ott     2017-01-25  461  	bdev->tag_set.ops = &scm_mq_ops;
c8b850241559d6 Sebastian Ott     2017-09-18  462  	bdev->tag_set.cmd_size = sizeof(blk_status_t);
9861dbd5b4a422 Sebastian Ott     2017-02-24  463  	bdev->tag_set.nr_hw_queues = nr_requests;
12d9076265398e Sebastian Ott     2017-01-25  464  	bdev->tag_set.queue_depth = nr_requests_per_io * nr_requests;
12d9076265398e Sebastian Ott     2017-01-25  465  	bdev->tag_set.flags = BLK_MQ_F_SHOULD_MERGE;
d642d6262f4fcf Vasily Gorbik     2018-06-25  466  	bdev->tag_set.numa_node = NUMA_NO_NODE;
12d9076265398e Sebastian Ott     2017-01-25  467  
12d9076265398e Sebastian Ott     2017-01-25  468  	ret = blk_mq_alloc_tag_set(&bdev->tag_set);
12d9076265398e Sebastian Ott     2017-01-25  469  	if (ret)
f30664e2c85c78 Sebastian Ott     2012-08-28  470  		goto out;
f30664e2c85c78 Sebastian Ott     2012-08-28  471  
066be10aef5a7d Christoph Hellwig 2024-02-15  472  	bdev->gendisk = blk_mq_alloc_disk(&bdev->tag_set, &lim, scmdev);
c06cf063b3e5d5 Christoph Hellwig 2021-06-02  473  	if (IS_ERR(bdev->gendisk)) {
c06cf063b3e5d5 Christoph Hellwig 2021-06-02  474  		ret = PTR_ERR(bdev->gendisk);
12d9076265398e Sebastian Ott     2017-01-25  475  		goto out_tag;
12d9076265398e Sebastian Ott     2017-01-25  476  	}
c06cf063b3e5d5 Christoph Hellwig 2021-06-02  477  	rq = bdev->rq = bdev->gendisk->queue;
f30664e2c85c78 Sebastian Ott     2012-08-28  478  	bdev->gendisk->private_data = scmdev;
f30664e2c85c78 Sebastian Ott     2012-08-28  479  	bdev->gendisk->fops = &scm_blk_devops;
f30664e2c85c78 Sebastian Ott     2012-08-28  480  	bdev->gendisk->major = scm_major;
f30664e2c85c78 Sebastian Ott     2012-08-28  481  	bdev->gendisk->first_minor = devindex * SCM_NR_PARTS;
c06cf063b3e5d5 Christoph Hellwig 2021-06-02  482  	bdev->gendisk->minors = SCM_NR_PARTS;
f30664e2c85c78 Sebastian Ott     2012-08-28  483  
f30664e2c85c78 Sebastian Ott     2012-08-28  484  	len = snprintf(bdev->gendisk->disk_name, DISK_NAME_LEN, "scm");
f30664e2c85c78 Sebastian Ott     2012-08-28  485  	if (devindex > 25) {
f30664e2c85c78 Sebastian Ott     2012-08-28  486  		len += snprintf(bdev->gendisk->disk_name + len,
f30664e2c85c78 Sebastian Ott     2012-08-28  487  				DISK_NAME_LEN - len, "%c",
f30664e2c85c78 Sebastian Ott     2012-08-28  488  				'a' + (devindex / 26) - 1);
f30664e2c85c78 Sebastian Ott     2012-08-28  489  		devindex = devindex % 26;
f30664e2c85c78 Sebastian Ott     2012-08-28  490  	}
f30664e2c85c78 Sebastian Ott     2012-08-28  491  	snprintf(bdev->gendisk->disk_name + len, DISK_NAME_LEN - len, "%c",
f30664e2c85c78 Sebastian Ott     2012-08-28  492  		 'a' + devindex);
f30664e2c85c78 Sebastian Ott     2012-08-28  493  
f30664e2c85c78 Sebastian Ott     2012-08-28  494  	/* 512 byte sectors */
f30664e2c85c78 Sebastian Ott     2012-08-28  495  	set_capacity(bdev->gendisk, scmdev->size >> 9);
f367c7d9fb3269 Luis Chamberlain  2021-09-27  496  	ret = device_add_disk(&scmdev->dev, bdev->gendisk, NULL);
f367c7d9fb3269 Luis Chamberlain  2021-09-27  497  	if (ret)
f367c7d9fb3269 Luis Chamberlain  2021-09-27  498  		goto out_cleanup_disk;
f367c7d9fb3269 Luis Chamberlain  2021-09-27  499  
f30664e2c85c78 Sebastian Ott     2012-08-28  500  	return 0;
f30664e2c85c78 Sebastian Ott     2012-08-28  501  
f367c7d9fb3269 Luis Chamberlain  2021-09-27  502  out_cleanup_disk:
8b9ab62662048a Christoph Hellwig 2022-06-19  503  	put_disk(bdev->gendisk);
12d9076265398e Sebastian Ott     2017-01-25  504  out_tag:
12d9076265398e Sebastian Ott     2017-01-25  505  	blk_mq_free_tag_set(&bdev->tag_set);
f30664e2c85c78 Sebastian Ott     2012-08-28  506  out:
f30664e2c85c78 Sebastian Ott     2012-08-28  507  	atomic_dec(&nr_devices);
f30664e2c85c78 Sebastian Ott     2012-08-28  508  	return ret;
f30664e2c85c78 Sebastian Ott     2012-08-28  509  }
f30664e2c85c78 Sebastian Ott     2012-08-28  510  

:::::: The code at line 442 was first introduced by commit
:::::: 12d9076265398eb2fec3c5dabe7b6713bca8bac9 s390/scm: convert to blk-mq

:::::: TO: Sebastian Ott <sebott@linux.vnet.ibm.com>
:::::: CC: Martin Schwidefsky <schwidefsky@de.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
