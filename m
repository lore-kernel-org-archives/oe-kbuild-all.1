Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648A21BF58
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Mar 2025 13:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743254248; cv=none; b=Z+rJ3+LBVuWGtIRDCMPL2GIQ47bPgp6fIFScBQe6WjjDOk0xKafR5h0ky6EQHdeLSeKf+DaZ0tEoSzIQoSKgyjgIzVMSanQ4T7JMhbnVfyH4BYvFxTrfY57InMuTEvyhTxy91f341eeQfVyX/e1oSGLWp9AQbs6xnNXrJ/MQSoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743254248; c=relaxed/simple;
	bh=ODzVtz15NY9geToa8nnZv4gFGpIrrf976j1zV3djXcw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qteva6OBaauNwzNLDgVgRDBm9fBRFWpIp1BwFZ0QAV9kexiUFbsIsDOwlxwwxt0LxIU7AwpsuyDdG9zlempWqin8qom8y6KEOVZU0habgzFVcsa/6UHJM3/qemzVzmDJMlATjkXPROt1NcSS+ChKHRU0Y17Ocmj/wxpPuzaQIZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DAs07xpZ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DAs07xpZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743254245; x=1774790245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ODzVtz15NY9geToa8nnZv4gFGpIrrf976j1zV3djXcw=;
  b=DAs07xpZIDkuRsGhl8gU2To5wThkRd7tkja+BZpnwzTxrhPawtEZmiVB
   q9l7ArFUaNyv6B3TzZLT6+0QJ3EGTthd+GEQIafZxyGX3bZl+OjZIfO6U
   7LmwZBCSE6NGuJ+FMoP2S5yalm7kfdz7zUhTm/6YCxpBG2P96cReqTQ2O
   15CoTx6IRY5g5bLJlEkay5VN0epxeM6vIdWP0d/0BWSTaFxksE2nw7Vdv
   HPDGpz/KCE5JhKXcWzNXneRR16cJESKuoj1eD/3HGhEaR6nb52gY2AWhn
   9jQ+RPu1MRMOGJfZ3RiWSxcMIi+X3o8Ap/MEGM1bGIldE//jaFDiGHSmx
   g==;
X-CSE-ConnectionGUID: nHXzsbHmTkiQVOK42rqBdQ==
X-CSE-MsgGUID: K8SkTShgTjuKGj+Y0dGeGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11388"; a="44707301"
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="44707301"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2025 06:17:24 -0700
X-CSE-ConnectionGUID: piqTAZ5XTiWtWNY4L8VxAw==
X-CSE-MsgGUID: J8Jva5/kTD6TfvNtScq5yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="130525019"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 29 Mar 2025 06:17:24 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyW3t-000878-24;
	Sat, 29 Mar 2025 13:17:21 +0000
Date: Sat, 29 Mar 2025 21:17:07 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 140/140]
 drivers/block/virtio_blk.c:2041:25: warning: unused variable 'i'
Message-ID: <202503292107.jZYOWAxM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   cead3662bf284665fff11a4f7e429b457d2608ca
commit: f082416f33f41a37461d5a82cadd77ba475eee2e [140/140] anolis: virtio-blk: add ring pair support
config: x86_64-anolis-intel-cloud-devel-5.10 (https://download.01.org/0day-ci/archive/20250329/202503292107.jZYOWAxM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503292107.jZYOWAxM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503292107.jZYOWAxM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/block/virtio_blk.c:1955:5: warning: no previous prototype for 'virtblk_chr_uring_cmd_iopoll' [-Wmissing-prototypes]
    1955 | int virtblk_chr_uring_cmd_iopoll(struct io_uring_cmd *ioucmd,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/virtio_blk.c: In function 'virtblk_probe':
>> drivers/block/virtio_blk.c:2041:25: warning: unused variable 'i' [-Wunused-variable]
    2041 |         int err, index, i;
         |                         ^


vim +/i +2041 drivers/block/virtio_blk.c

  2036	
  2037	static int virtblk_probe(struct virtio_device *vdev)
  2038	{
  2039		struct virtio_blk *vblk;
  2040		struct request_queue *q;
> 2041		int err, index, i;
  2042	
  2043		u32 v, blk_size, max_size, sg_elems, opt_io_size;
  2044		u16 min_io_size;
  2045		u8 physical_block_exp, alignment_offset;
  2046		unsigned int queue_depth;
  2047	
  2048		if (!vdev->config->get) {
  2049			dev_err(&vdev->dev, "%s failure: config access disabled\n",
  2050				__func__);
  2051			return -EINVAL;
  2052		}
  2053	
  2054		err = ida_simple_get(&vd_index_ida, 0, minor_to_index(1 << MINORBITS),
  2055				     GFP_KERNEL);
  2056		if (err < 0)
  2057			goto out;
  2058		index = err;
  2059	
  2060		/* We need to know how many segments before we allocate. */
  2061		err = virtio_cread_feature(vdev, VIRTIO_BLK_F_SEG_MAX,
  2062					   struct virtio_blk_config, seg_max,
  2063					   &sg_elems);
  2064	
  2065		/* We need at least one SG element, whatever they say. */
  2066		if (err || !sg_elems)
  2067			sg_elems = 1;
  2068	
  2069		/* Prevent integer overflows and honor max vq size */
  2070		sg_elems = min_t(u32, sg_elems, VIRTIO_BLK_MAX_SG_ELEMS - 2);
  2071	
  2072		vdev->priv = vblk = kzalloc(sizeof(*vblk), GFP_KERNEL);
  2073		if (!vblk) {
  2074			err = -ENOMEM;
  2075			goto out_free_index;
  2076		}
  2077	
  2078		/* This reference is dropped in virtblk_remove(). */
  2079		refcount_set(&vblk->refs, 1);
  2080		mutex_init(&vblk->vdev_mutex);
  2081	
  2082		vblk->vdev = vdev;
  2083	
  2084		INIT_WORK(&vblk->config_work, virtblk_config_changed_work);
  2085	
  2086		err = init_vq(vblk);
  2087		if (err)
  2088			goto out_free_vblk;
  2089	
  2090		/* FIXME: How many partitions?  How long is a piece of string? */
  2091		vblk->disk = alloc_disk(1 << PART_BITS);
  2092		if (!vblk->disk) {
  2093			err = -ENOMEM;
  2094			goto out_free_vq;
  2095		}
  2096	
  2097		/* Default queue sizing is to fill the ring. */
  2098		if (likely(!virtblk_queue_depth)) {
  2099			queue_depth = vblk->vqs[0].vq->num_free;
  2100			/* ... but without indirect descs, we use 2 descs per req */
  2101			if (!virtio_has_feature(vdev, VIRTIO_RING_F_INDIRECT_DESC))
  2102				queue_depth /= 2;
  2103		} else {
  2104			queue_depth = virtblk_queue_depth;
  2105		}
  2106	
  2107		memset(&vblk->tag_set, 0, sizeof(vblk->tag_set));
  2108	#ifdef CONFIG_VIRTIO_BLK_RING_PAIR
  2109		vblk->tag_set.ops = vblk->ring_pair ? &virtio_mq_pair_ops :
  2110						      &virtio_mq_ops;
  2111		vblk->tag_set.nr_hw_queues = vblk->ring_pair ? vblk->num_vqs / VIRTBLK_RING_NUM :
  2112							vblk->num_vqs;
  2113	#else
  2114		vblk->tag_set.ops = &virtio_mq_ops;
  2115		vblk->tag_set.nr_hw_queues = vblk->num_vqs;
  2116	#endif
  2117		vblk->tag_set.queue_depth = queue_depth;
  2118		vblk->tag_set.numa_node = NUMA_NO_NODE;
  2119		vblk->tag_set.flags = BLK_MQ_F_SHOULD_MERGE;
  2120		/* For bidirectional passthrough vblk request, both WRITE and READ
  2121		 * operations need pre-alloc inline SGs. So we should prealloc twice
  2122		 * the size than original ways. Due to the inability to predict whether
  2123		 * a request is bidirectional, there may be memory wastage, but won't
  2124		 * be significant.
  2125		 */
  2126		vblk->tag_set.cmd_size =
  2127			sizeof(struct virtblk_req) +
  2128			sizeof(struct scatterlist) * 2 * VIRTIO_BLK_INLINE_SG_CNT;
  2129		vblk->tag_set.driver_data = vblk;
  2130		vblk->tag_set.nr_maps = 1;
  2131		if (vblk->io_queues[HCTX_TYPE_POLL])
  2132			vblk->tag_set.nr_maps = 3;
  2133	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
