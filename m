Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86441E526
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jun 2024 16:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717864270; cv=none; b=nPbKPemO2r8RSUGc1wOD5+g1kMZgyo2MQVwQ2rQv2u9idWUWGZ9ovD9Updt7MwURR2JzIgyAEN29BbB02n7q6o0e0FJRugsMtLtnGYTNAnKg+kLdM0Q5RN9SpfKTwP0wb/QBoMXBnvjWJ8oQv/v4JfPie+lDRx62CkMgcqhPqN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717864270; c=relaxed/simple;
	bh=U/YEcCjmfvDRcRVpt28AXgBSmvspLkU/stMYFtzo0WE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V+FDo0r3RnGvruXHbKni2yDuDXkiDnwLhtZJpiCHEFaDZqlmqLUwNfhgBuBJEyNcUXvWH1bP5gCs9hHh3N663JHWWVyqFAgVVGF4TdRMq7dpAOX/jKcAxSdVxmRaa0Mpkr9BwomACMyU1X2CJx21OV3mJpnL5IfiU/saM8vYJyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YZ2nVB1C; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YZ2nVB1C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717864268; x=1749400268;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U/YEcCjmfvDRcRVpt28AXgBSmvspLkU/stMYFtzo0WE=;
  b=YZ2nVB1Cx24yl9HZ8hWqnlJDD8LlGLDsVh8yNa6OMq0/dleP8IwLVW61
   dko0NBoOzvyBd9FrEAUKeBCRwWEkIXSMOHWZzr+MMf4Eg+RhnYHmWcRe4
   0U9+pU0NUQoOamnqTTs3Evh3ydnX/D8ImhejzxCdtfzMlxBcFkVyhEt6t
   HC7rJSocms4koPp/K+sFDTFOKmOBB4sWo+vjn3NkaoMdht539FwnGapnK
   ZSf6c5AK4OdfgFOOK9GE14v7CK3X2Vd7QZ99h/n/MEoN1RKJQa9rzxhFO
   03WqSNocSc/5jQsgdYL0S9wcALoaTJP4nBnsGVhiLe6wVoHJO8UA3dFNK
   w==;
X-CSE-ConnectionGUID: 8crrKQfmT6uYAWzdrrJtAA==
X-CSE-MsgGUID: 5cjCpCwmTZixKA8Opfh+fg==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="14696067"
X-IronPort-AV: E=Sophos;i="6.08,223,1712646000"; 
   d="scan'208";a="14696067"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 09:31:08 -0700
X-CSE-ConnectionGUID: 57aQhj+ZSDeL0nPFilHUbA==
X-CSE-MsgGUID: HlxIxFJARH6FgnorrQJGJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,223,1712646000"; 
   d="scan'208";a="38626497"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Jun 2024 09:31:06 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFyy8-0000Dx-2d;
	Sat, 08 Jun 2024 16:31:04 +0000
Date: Sun, 9 Jun 2024 00:30:34 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:block-limit-flags 43/52] drivers/block/rbd.c:4952:24:
 warning: variable 'q' set but not used
Message-ID: <202406090028.Q2Aa3yNr-lkp@intel.com>
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
commit: 8fb5b6d0197e2e4922e4b17ce13c8618969ce05b [43/52]  block: move the stable_write flag to queue_limits
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240609/202406090028.Q2Aa3yNr-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240609/202406090028.Q2Aa3yNr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406090028.Q2Aa3yNr-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   In file included from drivers/block/rbd.c:31:
   In file included from include/linux/ceph/libceph.h:21:
   In file included from include/linux/ceph/messenger.h:13:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
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
   In file included from drivers/block/rbd.c:31:
   In file included from include/linux/ceph/libceph.h:21:
   In file included from include/linux/ceph/messenger.h:13:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
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
   In file included from drivers/block/rbd.c:31:
   In file included from include/linux/ceph/libceph.h:21:
   In file included from include/linux/ceph/messenger.h:13:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
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
>> drivers/block/rbd.c:4952:24: warning: variable 'q' set but not used [-Wunused-but-set-variable]
    4952 |         struct request_queue *q;
         |                               ^
   drivers/block/rbd.c:6095:17: warning: result of comparison of constant 2305843009213693948 with expression of type 'u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
    6095 |         if (snap_count > (SIZE_MAX - sizeof (struct ceph_snap_context))
         |             ~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    6096 |                                  / sizeof (u64)) {
         |                                  ~~~~~~~~~~~~~~
   19 warnings generated.


vim +/q +4952 drivers/block/rbd.c

7ad18afad02f98 Christoph Hellwig 2015-01-13  4948  
602adf40020163 Yehuda Sadeh      2010-08-12  4949  static int rbd_init_disk(struct rbd_device *rbd_dev)
602adf40020163 Yehuda Sadeh      2010-08-12  4950  {
602adf40020163 Yehuda Sadeh      2010-08-12  4951  	struct gendisk *disk;
602adf40020163 Yehuda Sadeh      2010-08-12 @4952  	struct request_queue *q;
420efbdf4d2358 Ilya Dryomov      2018-04-16  4953  	unsigned int objset_bytes =
420efbdf4d2358 Ilya Dryomov      2018-04-16  4954  	    rbd_dev->layout.object_size * rbd_dev->layout.stripe_count;
24f30b770c0f45 Christoph Hellwig 2024-02-15  4955  	struct queue_limits lim = {
24f30b770c0f45 Christoph Hellwig 2024-02-15  4956  		.max_hw_sectors		= objset_bytes >> SECTOR_SHIFT,
2175fd35d2e994 Christoph Hellwig 2024-05-31  4957  		.io_opt			= objset_bytes,
24f30b770c0f45 Christoph Hellwig 2024-02-15  4958  		.io_min			= rbd_dev->opts->alloc_size,
24f30b770c0f45 Christoph Hellwig 2024-02-15  4959  		.max_segments		= USHRT_MAX,
24f30b770c0f45 Christoph Hellwig 2024-02-15  4960  		.max_segment_size	= UINT_MAX,
24f30b770c0f45 Christoph Hellwig 2024-02-15  4961  	};
7ad18afad02f98 Christoph Hellwig 2015-01-13  4962  	int err;
602adf40020163 Yehuda Sadeh      2010-08-12  4963  
7ad18afad02f98 Christoph Hellwig 2015-01-13  4964  	memset(&rbd_dev->tag_set, 0, sizeof(rbd_dev->tag_set));
7ad18afad02f98 Christoph Hellwig 2015-01-13  4965  	rbd_dev->tag_set.ops = &rbd_mq_ops;
b55841807fb864 Ilya Dryomov      2015-06-23  4966  	rbd_dev->tag_set.queue_depth = rbd_dev->opts->queue_depth;
7ad18afad02f98 Christoph Hellwig 2015-01-13  4967  	rbd_dev->tag_set.numa_node = NUMA_NO_NODE;
56d18f62f556b8 Ming Lei          2019-02-15  4968  	rbd_dev->tag_set.flags = BLK_MQ_F_SHOULD_MERGE;
f9b6b98d24f7ce Hannes Reinecke   2020-01-31  4969  	rbd_dev->tag_set.nr_hw_queues = num_present_cpus();
59e542c869895f Ilya Dryomov      2020-02-12  4970  	rbd_dev->tag_set.cmd_size = sizeof(struct rbd_img_request);
7ad18afad02f98 Christoph Hellwig 2015-01-13  4971  
7ad18afad02f98 Christoph Hellwig 2015-01-13  4972  	err = blk_mq_alloc_tag_set(&rbd_dev->tag_set);
7ad18afad02f98 Christoph Hellwig 2015-01-13  4973  	if (err)
195b1956b85bae Christoph Hellwig 2021-06-02  4974  		return err;
029bcbd8b076fd Josh Durgin       2011-07-22  4975  
24f30b770c0f45 Christoph Hellwig 2024-02-15  4976  	if (rbd_dev->opts->trim) {
24f30b770c0f45 Christoph Hellwig 2024-02-15  4977  		lim.discard_granularity = rbd_dev->opts->alloc_size;
24f30b770c0f45 Christoph Hellwig 2024-02-15  4978  		lim.max_hw_discard_sectors = objset_bytes >> SECTOR_SHIFT;
24f30b770c0f45 Christoph Hellwig 2024-02-15  4979  		lim.max_write_zeroes_sectors = objset_bytes >> SECTOR_SHIFT;
24f30b770c0f45 Christoph Hellwig 2024-02-15  4980  	}
24f30b770c0f45 Christoph Hellwig 2024-02-15  4981  
8fb5b6d0197e2e Christoph Hellwig 2024-06-08  4982  	if (!ceph_test_opt(rbd_dev->rbd_client->client, NOCRC))
8fb5b6d0197e2e Christoph Hellwig 2024-06-08  4983  		lim.features |= BLK_FEAT_STABLE_WRITES;
8fb5b6d0197e2e Christoph Hellwig 2024-06-08  4984  
24f30b770c0f45 Christoph Hellwig 2024-02-15  4985  	disk = blk_mq_alloc_disk(&rbd_dev->tag_set, &lim, rbd_dev);
195b1956b85bae Christoph Hellwig 2021-06-02  4986  	if (IS_ERR(disk)) {
195b1956b85bae Christoph Hellwig 2021-06-02  4987  		err = PTR_ERR(disk);
7ad18afad02f98 Christoph Hellwig 2015-01-13  4988  		goto out_tag_set;
7ad18afad02f98 Christoph Hellwig 2015-01-13  4989  	}
195b1956b85bae Christoph Hellwig 2021-06-02  4990  	q = disk->queue;
195b1956b85bae Christoph Hellwig 2021-06-02  4991  
195b1956b85bae Christoph Hellwig 2021-06-02  4992  	snprintf(disk->disk_name, sizeof(disk->disk_name), RBD_DRV_NAME "%d",
195b1956b85bae Christoph Hellwig 2021-06-02  4993  		 rbd_dev->dev_id);
195b1956b85bae Christoph Hellwig 2021-06-02  4994  	disk->major = rbd_dev->major;
195b1956b85bae Christoph Hellwig 2021-06-02  4995  	disk->first_minor = rbd_dev->minor;
1ebe2e5f9d68e9 Christoph Hellwig 2021-11-22  4996  	if (single_major)
195b1956b85bae Christoph Hellwig 2021-06-02  4997  		disk->minors = (1 << RBD_SINGLE_MAJOR_PART_SHIFT);
1ebe2e5f9d68e9 Christoph Hellwig 2021-11-22  4998  	else
195b1956b85bae Christoph Hellwig 2021-06-02  4999  		disk->minors = RBD_MINORS_PER_MAJOR;
195b1956b85bae Christoph Hellwig 2021-06-02  5000  	disk->fops = &rbd_bd_ops;
0077a50082729c Ilya Dryomov      2021-07-21  5001  	disk->private_data = rbd_dev;
602adf40020163 Yehuda Sadeh      2010-08-12  5002  	rbd_dev->disk = disk;
602adf40020163 Yehuda Sadeh      2010-08-12  5003  
602adf40020163 Yehuda Sadeh      2010-08-12  5004  	return 0;
7ad18afad02f98 Christoph Hellwig 2015-01-13  5005  out_tag_set:
7ad18afad02f98 Christoph Hellwig 2015-01-13  5006  	blk_mq_free_tag_set(&rbd_dev->tag_set);
7ad18afad02f98 Christoph Hellwig 2015-01-13  5007  	return err;
602adf40020163 Yehuda Sadeh      2010-08-12  5008  }
602adf40020163 Yehuda Sadeh      2010-08-12  5009  

:::::: The code at line 4952 was first introduced by commit
:::::: 602adf400201636e95c3fed9f31fba54a3d7e844 rbd: introduce rados block device (rbd), based on libceph

:::::: TO: Yehuda Sadeh <yehuda@hq.newdream.net>
:::::: CC: Sage Weil <sage@newdream.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
