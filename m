Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB2D27466A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 06:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765693364; cv=none; b=MMdXR3/lBa3rzkPMa6tIEC9uLq6WqPw3inRLjW2R4nlnWK4XKuxCTcV2HpQA27dsXtuf18QmxmaD2nJVdKXAR8VijgYkrIYVxQmAQMXQRlcCqDY0GEW2g8lAvOFP+YZvpqpg3LF0DzkYFnIsSi3e63bWAlphDlHJkPSrnJzLyy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765693364; c=relaxed/simple;
	bh=h9iZQMKqY8XCWgGVrtrNpYpVCSuI9z1Fj/wuunGD11c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E8qKce46OlnY/R1mv+HdpIc5PrQZMhIiJUN4KrlR7+0I0AN+LKELKIJy/N7MBPCTh+qG9oDfsZTyh7QwgL7oMcUwOtqZ/eV7FiIt2NloQQXXA5FdO67ziPGHzh9Vh+HjhjHrrbF9O3RhtWR0RYf9xxjUsdBnXhr+vxnloMnBJ64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RmL7XNTS; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RmL7XNTS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765693363; x=1797229363;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h9iZQMKqY8XCWgGVrtrNpYpVCSuI9z1Fj/wuunGD11c=;
  b=RmL7XNTSMKT7v4UYwak3NLun0b4eB7MzprmIAbZQFXjJ7kH2WsC/AIN8
   6waKN93CahoOuVclkVwqUf8cixn/czKXLioreJ9QCOh2nRWOYfb0HNlXV
   i0DUK0JrAjTrDr7OyqsZdlwCt58RVh3SfcFfc/g0IVcnAkernvSfbgcuC
   3zZBtwqLkElxPxa1n5dy02syfgYAaFk0Ga76iCsfkaZIkvc7+EwSVHf9Q
   1GFOrQg909DEuq3C3twj7zp/0MqC7OpIL3vmmn5YaDSpDPkbX+zO8B8Sr
   Tf2z6AGsM6E+BliQB91Yboigh/LRqR6DUJc4Z7ZMhIbKq5584lZblIfFc
   Q==;
X-CSE-ConnectionGUID: smJkgRQRTMmDUFdgoUPd2g==
X-CSE-MsgGUID: N0ehIF60QCa6ultURbwixQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="66621361"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="66621361"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 22:22:42 -0800
X-CSE-ConnectionGUID: nfGRhfiLQsu6Z6uOOYT9TA==
X-CSE-MsgGUID: Ynko0XcTQfqTEcLxMn+zjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="202543376"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 13 Dec 2025 22:22:41 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUfV8-000000002IK-3hUe;
	Sun, 14 Dec 2025 06:22:38 +0000
Date: Sun, 14 Dec 2025 07:22:05 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 50/50]
 drivers/block/virtio_blk.c:2602:25: warning: unused variable 'i'
Message-ID: <202512140736.PDJQBtNA-lkp@intel.com>
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
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251214/202512140736.PDJQBtNA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140736.PDJQBtNA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140736.PDJQBtNA-lkp@intel.com/

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
