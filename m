Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47801624D5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 01:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745889575; cv=none; b=GR8HIO4t8yZduftXtCYlaP/uaxwPQC/7ifqmvNCN3f+GCo15cDbnAoUJkdkKZvQOTxWBumf55W6twQxZf9/FIZz+j8u8GLHFFz1+0sXg3SyrUVrEy32GLXkpLRavgKwJUBxtuEVxYXh84bVXT2OQNMQ2eAAxND0R5GB2YO6c1Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745889575; c=relaxed/simple;
	bh=JQjxq1jb6qgXLviWl6BmUlqvZr+dREK2CR8AjmoXU/s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZTSRp609N49AcWDImVT0zbKRqX15cwjmsYANp8fc0LDiThR9pP47e7UTQJoLe6JxQjzSvj/fMGY2X4WWKbM1N7LPrFsU1gpPtCvUiqU8AET8ZbVX4RM0ALchXwSBIMYObXtYhHLaaZ4Tyw7sOBBBKDrv13v6ijHKRE1AQQb8oZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZsR6kNJt; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZsR6kNJt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745889574; x=1777425574;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JQjxq1jb6qgXLviWl6BmUlqvZr+dREK2CR8AjmoXU/s=;
  b=ZsR6kNJt/O7O1pDdbZfYsJMHXzL1V0hwCdTAw9ysWq2nWvsurKi9+SkB
   5lmarRLPlR6Hd9wCnsQjDhRmXSqmTksqKZwLEHgNpT7fMBFVz+0VcrIaZ
   89ZMvjiDoQZ/r8GoEjlkxn/QabMU8dSVD2MIbhFpnVGDtMiFMmVLgVPyo
   2/4Wn9VNSrDUDTK5nzM2HGR/HKUppKJylbeBdVRznZFg2Tp1lYZ7S0YYK
   CfqKlrjQai/rtYIZ4ADkrVxKTbOC9wLUtF68IGoCD43q73xleBcZKO/+I
   /mBl23snn/etGXSMHurPN3oqIoY2qe0eUUICzdVOU3A4agXomg+XPkGn9
   g==;
X-CSE-ConnectionGUID: s+IyKOLTTgyGl+v5EribLA==
X-CSE-MsgGUID: LvOdrxhUSQ2U6flJ6QtZZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="72874012"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="72874012"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 18:19:31 -0700
X-CSE-ConnectionGUID: BVarodqHSaS5bPTBC0CfOg==
X-CSE-MsgGUID: 1cKEkSUOT76V9+gh+1DnUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="133581471"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Apr 2025 18:19:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9Zd9-00005J-23;
	Tue, 29 Apr 2025 01:19:27 +0000
Date: Tue, 29 Apr 2025 07:05:00 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 31/31]
 drivers/block/virtio_blk.c:1709:5: warning: no previous prototype for
 'blk_mq_virtio_map_queues_rpair'
Message-ID: <202504290621.EbimVptc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   05c0f79ba45bc003b2599ccfbd5029f8111012eb
commit: 9fd5d75f3163e8f7d84797083524425df03bc46b [31/31] anolis: virtio-blk: choose right vq in map_queues for ring pair mode
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250429/202504290621.EbimVptc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504290621.EbimVptc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504290621.EbimVptc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/block/virtio_blk.c:1298:5: warning: no previous prototype for 'check_ext_feature' [-Wmissing-prototypes]
    1298 | int check_ext_feature(struct virtio_blk *vblk, void __iomem *ioaddr,
         |     ^~~~~~~~~~~~~~~~~
>> drivers/block/virtio_blk.c:1709:5: warning: no previous prototype for 'blk_mq_virtio_map_queues_rpair' [-Wmissing-prototypes]
    1709 | int blk_mq_virtio_map_queues_rpair(struct blk_mq_queue_map *qmap,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/virtio_blk.c:2099:5: warning: no previous prototype for 'virtblk_chr_uring_cmd_iopoll' [-Wmissing-prototypes]
    2099 | int virtblk_chr_uring_cmd_iopoll(struct io_uring_cmd *ioucmd,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/blk_mq_virtio_map_queues_rpair +1709 drivers/block/virtio_blk.c

  1707	
  1708	#ifdef CONFIG_VIRTIO_BLK_RING_PAIR
> 1709	int blk_mq_virtio_map_queues_rpair(struct blk_mq_queue_map *qmap,
  1710		struct virtio_device *vdev, int first_vec)
  1711	{
  1712		const struct cpumask *mask;
  1713		unsigned int queue, cpu;
  1714	
  1715		if (!vdev->config->get_vq_affinity)
  1716			goto fallback;
  1717	
  1718		for (queue = 0; queue < qmap->nr_queues; queue++) {
  1719			mask = vdev->config->get_vq_affinity(vdev, first_vec +
  1720							virtblk_qid_to_cq_qid(queue));
  1721			if (!mask)
  1722				goto fallback;
  1723	
  1724			for_each_cpu(cpu, mask)
  1725				qmap->mq_map[cpu] = qmap->queue_offset + queue;
  1726		}
  1727	
  1728		return 0;
  1729	fallback:
  1730		return blk_mq_map_queues(qmap);
  1731	}
  1732	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
