Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3503479CF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 09:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765616547; cv=none; b=CBFx2BdXkXP5IBv/3DokVhBFL0XVU/yHhWwfp9t0qujNxcnY3tls9dwIElaoHfc6QuDJaoDDL1/2J+8YkNcieSgLFKIDCp/MQjmSSsUncz9wNOHFTTbUFMVrA3+sRabs/KGxLLTiFhZT2twUO+Npq2ySmk7SIFT3tDYgHmgCiMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765616547; c=relaxed/simple;
	bh=yRD/v4DwwV3APmwDPUAkcL2A/4xp8U1BFuQDcdD93U4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LhH7dNqxcrYKIDOaArUSUgLsPR02g0CsKIc+ExYZmT7oFB27UHbH78pT8r34VNQbnLB9ipWqGqN8G3j6u89YpjYEAviC4Aga3lCqAN++g/NPYQWeDoHL/cgNqs5oNWSWlu5xziMXbNZJ0o9TZTYxFlML5etC4WEOrmZe241Da/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=arTOlir1; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="arTOlir1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765616544; x=1797152544;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yRD/v4DwwV3APmwDPUAkcL2A/4xp8U1BFuQDcdD93U4=;
  b=arTOlir1O0OtB7nJyd1U3WTpH5wrQWlC7CTXYo/EHQyJtMCXjRElj0jH
   HXUDYj2mkERTqgDDPMvhy55yy18VAV810J8EtYRqZ7ELlHeAG32nSnHCx
   9NQet1pcJUSEBm6i+DtQq2kDb6QZzcyhB1RslD//S33Fgv5sbbz+fhHow
   MPN9UTWIbgG8IbWXaE+ok0xGQmJNS5aLq9DzLpmOhOrwobMqu/oSe/RCD
   tgmRsnCRYQ3A7DDfgf0IaKsL3S1LUGlFQPk6E1J97lXj91Er/ZnIxS316
   IdW/Ra1OiIMyaL+fhMq2FRABWX6y4rzGF34CfEJDk4+IAaBFJecgEMAAe
   Q==;
X-CSE-ConnectionGUID: YbcG3+jdR/inUPeN3SHDDQ==
X-CSE-MsgGUID: OfwDBk55S/afubymUm3nGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="55170023"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="55170023"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 01:02:23 -0800
X-CSE-ConnectionGUID: 55iwbf2xQdGn+WJOrJljhg==
X-CSE-MsgGUID: nUaIF9E3QBOZbneAScXxeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="197346482"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Dec 2025 01:02:22 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vULW8-000000007O7-0fPD;
	Sat, 13 Dec 2025 09:02:20 +0000
Date: Sat, 13 Dec 2025 17:02:15 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 50/50]
 drivers/block/virtio_blk.c:2602:25: warning: unused variable 'i'
Message-ID: <202512131656.uAxfyeqm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   7c285f40a964b427534f3dab33b104ee9cab6245
commit: 86ff9a5ab6a61894343af26f16f9439842b1bc5f [50/50] anolis: virtio-blk: add ring pair support
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20251213/202512131656.uAxfyeqm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131656.uAxfyeqm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131656.uAxfyeqm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/block/virtio_blk.c: In function 'virtblk_probe':
>> drivers/block/virtio_blk.c:2602:25: warning: unused variable 'i' [-Wunused-variable]
    2602 |         int err, index, i;
         |                         ^


vim +/i +2602 drivers/block/virtio_blk.c

  2597	
  2598	static int virtblk_probe(struct virtio_device *vdev)
  2599	{
  2600		struct virtio_blk *vblk;
  2601		struct request_queue *q;
> 2602		int err, index, i;
  2603	
  2604		u32 v, blk_size, max_size, sg_elems, opt_io_size;
  2605		u32 max_discard_segs = 0;
  2606		u32 discard_granularity = 0;
  2607		u16 min_io_size;
  2608		u8 physical_block_exp, alignment_offset;
  2609		unsigned int queue_depth;
  2610		size_t max_dma_size;
  2611	
  2612		if (!vdev->config->get) {
  2613			dev_err(&vdev->dev, "%s failure: config access disabled\n",
  2614				__func__);
  2615			return -EINVAL;
  2616		}
  2617	
  2618		err = ida_alloc_range(&vd_index_ida, 0,
  2619				      minor_to_index(1 << MINORBITS) - 1, GFP_KERNEL);
  2620		if (err < 0)
  2621			goto out;
  2622		index = err;
  2623	
  2624		/* We need to know how many segments before we allocate. */
  2625		err = virtio_cread_feature(vdev, VIRTIO_BLK_F_SEG_MAX,
  2626					   struct virtio_blk_config, seg_max,
  2627					   &sg_elems);
  2628	
  2629		/* We need at least one SG element, whatever they say. */
  2630		if (err || !sg_elems)
  2631			sg_elems = 1;
  2632	
  2633		/* Prevent integer overflows and honor max vq size */
  2634		sg_elems = min_t(u32, sg_elems, VIRTIO_BLK_MAX_SG_ELEMS - 2);
  2635	
  2636		vdev->priv = vblk = kzalloc(sizeof(*vblk), GFP_KERNEL);
  2637		if (!vblk) {
  2638			err = -ENOMEM;
  2639			goto out_free_index;
  2640		}
  2641	
  2642		mutex_init(&vblk->vdev_mutex);
  2643	
  2644		vblk->vdev = vdev;
  2645	
  2646		INIT_WORK(&vblk->config_work, virtblk_config_changed_work);
  2647	
  2648		err = init_vq(vblk);
  2649		if (err)
  2650			goto out_free_vblk;
  2651	
  2652		/* Default queue sizing is to fill the ring. */
  2653		if (!virtblk_queue_depth) {
  2654			queue_depth = vblk->vqs[0].vq->num_free;
  2655			/* ... but without indirect descs, we use 2 descs per req */
  2656			if (!virtio_has_feature(vdev, VIRTIO_RING_F_INDIRECT_DESC))
  2657				queue_depth /= 2;
  2658		} else {
  2659			queue_depth = virtblk_queue_depth;
  2660		}
  2661	
  2662		memset(&vblk->tag_set, 0, sizeof(vblk->tag_set));
  2663	#ifdef CONFIG_VIRTIO_BLK_RING_PAIR
  2664		vblk->tag_set.ops = vblk->ring_pair ? &virtio_mq_pair_ops :
  2665						      &virtio_mq_ops;
  2666		vblk->tag_set.nr_hw_queues = vblk->ring_pair ? vblk->num_vqs / VIRTBLK_RING_NUM :
  2667							vblk->num_vqs;
  2668	#else
  2669		vblk->tag_set.ops = &virtio_mq_ops;
  2670		vblk->tag_set.nr_hw_queues = vblk->num_vqs;
  2671	#endif
  2672		vblk->tag_set.queue_depth = queue_depth;
  2673		vblk->tag_set.numa_node = NUMA_NO_NODE;
  2674		vblk->tag_set.flags = BLK_MQ_F_SHOULD_MERGE;
  2675		/* For bidirectional passthrough vblk request, both WRITE and READ
  2676		 * operations need pre-alloc inline SGs. So we should prealloc twice
  2677		 * the size than original ways. Due to the inability to predict whether
  2678		 * a request is bidirectional, there may be memory wastage, but won't
  2679		 * be significant.
  2680		 */
  2681		vblk->tag_set.cmd_size =
  2682			sizeof(struct virtblk_req) +
  2683			sizeof(struct scatterlist) * 2 * VIRTIO_BLK_INLINE_SG_CNT;
  2684		vblk->tag_set.driver_data = vblk;
  2685		vblk->tag_set.nr_maps = 1;
  2686		if (vblk->io_queues[HCTX_TYPE_POLL])
  2687			vblk->tag_set.nr_maps = 3;
  2688	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
