Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802EF2BE02B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 05:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766120637; cv=none; b=Oa0vNVTc5+Nr49TvzfAC3adGyCdRYgsNOfOcy+Y1fRPPpnsRQ46AeWRO66aySTFM5Wnciae8SipeSuD6rnPFUEtq4pknjSQQxAothUlzRV4bpkVm7OXx5+qVXvGQQkmqn8eA5SVjIuGBRZO2NZDikIpUBzWuN8dsVDx/pfwxcCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766120637; c=relaxed/simple;
	bh=Ocxpvoe8XnSZhYq8X8XXICHdixHUD/5yK9hlNR2KkJc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JilAt/bXEt5i6h4XEDDKYBvdTqNqp05RhtJM2efduA0faS80UI50eliAtt1NJqHJDqTXB5MdUm3vkNiw+h89GL47hloZF0O7/+ae1lcV4URWuLYLYq0igztxaBCF/Eq37RblBxRz5fOsaMZT2b73oujLGWlgxsfD9heJ9+OlV+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OXZRDsRD; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OXZRDsRD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766120632; x=1797656632;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ocxpvoe8XnSZhYq8X8XXICHdixHUD/5yK9hlNR2KkJc=;
  b=OXZRDsRD2cHv+Dvt0Q2Li41NpqCIi6AqnlF1bjjOwt9cKX7EfLlvgz5U
   CIenKfvMB6X2634zvmxXX9NLpqvbyn61BGNaVm6uw/Mz9SWCQI8MmV51f
   yQs6hbKM1zZC7caJQc/0gbCLGYhQSru4mLuYo7LFPUB1czyhr5vx1CK9l
   C/nDn2EZ/jQjwi0HRCRAPFkLzzHz2PAcHfChENaL+bA9+GKQTdN+0lRaJ
   bWVuN70/k0LS+bq0uXcRJDS7WkTBx8eYoFm8L67Yx7iahs2ws3r4fOo52
   B90W8c5DHBGssacOEJ3pFD1N3GhCjh0r0PL4yBjKzrPMI1oCl+vFsS4rp
   w==;
X-CSE-ConnectionGUID: Cz/ruLQdSG+VbBAB6eQyOQ==
X-CSE-MsgGUID: X0ZriLr8RSqc+GVupn5neA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68158193"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="68158193"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 21:03:51 -0800
X-CSE-ConnectionGUID: 9lzsgJ3oTZemM0FWeLmIVw==
X-CSE-MsgGUID: 7Z5UA8DESQG2JLlt5LhGnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="199246943"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 18 Dec 2025 21:03:50 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWSeZ-0000000032H-2Cml;
	Fri, 19 Dec 2025 05:03:47 +0000
Date: Fri, 19 Dec 2025 13:03:43 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-PLR-ANBZ26486 11/11]
 drivers/block/virtio_blk.c:2236:6: warning: no previous prototype for
 'blk_mq_virtio_map_queues_rpair'
Message-ID: <202512191320.138QOjhb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-PLR-ANBZ26486
head:   0bcb74c919819123b737554f5d35edefa0555d65
commit: 2c3c7ee76ab63d70704930b0875ce8b49ecc660f [11/11] anolis: virtio-blk: choose right vq in map_queues for ring pair mode
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251219/202512191320.138QOjhb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512191320.138QOjhb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512191320.138QOjhb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/block/virtio_blk.c:26:
   drivers/block/virtio_blk_ext.c:113:5: warning: no previous prototype for 'virtblk_get_ext_feature_bar' [-Wmissing-prototypes]
     113 | int virtblk_get_ext_feature_bar(struct virtio_device *vdev, u32 *bar_offset)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/virtio_blk_ext.c:157:5: warning: no previous prototype for 'virtblk_get_ext_feature' [-Wmissing-prototypes]
     157 | int virtblk_get_ext_feature(void __iomem *ioaddr, u32 *host_features)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/virtio_blk_ext.c:172:6: warning: no previous prototype for 'virtblk_set_ext_feature' [-Wmissing-prototypes]
     172 | void virtblk_set_ext_feature(void __iomem *ioaddr, u32 guest_ext_features)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/virtio_blk.c:1821:5: warning: no previous prototype for 'check_ext_feature' [-Wmissing-prototypes]
    1821 | int check_ext_feature(struct virtio_blk *vblk, void __iomem *ioaddr,
         |     ^~~~~~~~~~~~~~~~~
>> drivers/block/virtio_blk.c:2236:6: warning: no previous prototype for 'blk_mq_virtio_map_queues_rpair' [-Wmissing-prototypes]
    2236 | void blk_mq_virtio_map_queues_rpair(struct blk_mq_queue_map *qmap,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/blk_mq_virtio_map_queues_rpair +2236 drivers/block/virtio_blk.c

  2234	
  2235	#ifdef CONFIG_VIRTIO_BLK_RING_PAIR
> 2236	void blk_mq_virtio_map_queues_rpair(struct blk_mq_queue_map *qmap,
  2237		struct virtio_device *vdev, int first_vec)
  2238	{
  2239		const struct cpumask *mask;
  2240		unsigned int queue, cpu;
  2241	
  2242		if (!vdev->config->get_vq_affinity)
  2243			goto fallback;
  2244	
  2245		for (queue = 0; queue < qmap->nr_queues; queue++) {
  2246			mask = vdev->config->get_vq_affinity(vdev, first_vec +
  2247							virtblk_qid_to_cq_qid(queue));
  2248			if (!mask)
  2249				goto fallback;
  2250	
  2251			for_each_cpu(cpu, mask)
  2252				qmap->mq_map[cpu] = qmap->queue_offset + queue;
  2253		}
  2254	
  2255		return;
  2256	fallback:
  2257		blk_mq_map_queues(qmap);
  2258	}
  2259	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
