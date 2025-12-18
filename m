Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFB2239E7D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 08:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766047932; cv=none; b=C0SrT2n+aIAi/8SlrWSWQ3Yb1cibKszPbQ/jQCiZioMLOFME/FCZZk71Vj02VZePyIyQyBFmuEWBf6hTX1sA3ypdWYNSWJthV6HszweoOfnzx/fnILiXE4MVuJK7q4lhgqsNH8HzibQyZZRhwn8o51j6HS1kl9NrCsPPK9zUurk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766047932; c=relaxed/simple;
	bh=rZccnaX3oN7oryRrIKcAgNfyOBDWa3nGR30+R9yU9rQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VggB85J1vtfiDDxXKrUdBVPuhYBcD34qOql0ZPuMCjrpRgFkEvnR7eO5GOKj5Kg+x7rlv1LiHVQEerD2CEgjFCC2r2LR0ZYZMArAQfdrkkexP9yrZhDw+ZuVdl1CtmptyHJmH2tpDzM1I9JS374Nt6y2+4NgaemJdZTPE3rZ+A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mYBKQDUo; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mYBKQDUo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766047930; x=1797583930;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rZccnaX3oN7oryRrIKcAgNfyOBDWa3nGR30+R9yU9rQ=;
  b=mYBKQDUoR+5ZN2EyqHnligmxP3DiEuMYobCzfNFs9qohMccw+iV26L7V
   2pksgSJgiMOdnO/Ud5I0uVXk0qm6d69LFkF21+39la1DfVSb5Gbw6oE4I
   CJvxL89LL0heNR6NxO/nYUMOlN74WmJUK5MIzy9pkwRwiKnhDBHeojDnd
   QKIrJl7eGT2Ui7UZrDQoUzLhs09OqCqmJH14+QM8WLa8U3WyaOIFDQ1fy
   8k3zzizjjPI2B+iWKuooc/5rrqs/uV2gV/oCMMZCjhe+owwLQG2IUlErh
   TC0OT8danzwLXYN/ALCqFpzHM5EIk9Ttew4iFPmFYou871wdPcvtnT/gY
   Q==;
X-CSE-ConnectionGUID: /kVWOQOVRmWsZRvxcgnihw==
X-CSE-MsgGUID: dLZ8Rr+eSU2mnVJ+hlO/EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="90655578"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="90655578"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 00:52:08 -0800
X-CSE-ConnectionGUID: 3/2rLdXXT9iITFnSFT5U0A==
X-CSE-MsgGUID: lYkrsadbQWO8WavTUcBbQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="197682818"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 18 Dec 2025 00:52:07 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vW9jw-000000003tA-3Oi9;
	Thu, 18 Dec 2025 08:52:04 +0000
Date: Thu, 18 Dec 2025 09:51:31 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 50/50]
 drivers/block/virtio_blk.c:2725:37: warning: 'virtblk_chr_fops' defined but
 not used
Message-ID: <202512180907.dTrkvNTE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   5d719013902eb006756873427de3fc5cc5566531
commit: f01929f35dcf5da763713cebf30054c14fc0e3b5 [50/50] anolis: virtio-blk: make chardev only exposed to specific devices
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251218/202512180907.dTrkvNTE-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512180907.dTrkvNTE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512180907.dTrkvNTE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/block/virtio_blk.c: In function 'virtblk_probe':
   drivers/block/virtio_blk.c:2845:25: warning: unused variable 'i' [-Wunused-variable]
    2845 |         int err, index, i;
         |                         ^
   drivers/block/virtio_blk.c: At top level:
>> drivers/block/virtio_blk.c:2725:37: warning: 'virtblk_chr_fops' defined but not used [-Wunused-const-variable=]
    2725 | static const struct file_operations virtblk_chr_fops = {
         |                                     ^~~~~~~~~~~~~~~~
>> drivers/block/virtio_blk.c:2667:12: warning: 'virtblk_cdev_add' defined but not used [-Wunused-function]
    2667 | static int virtblk_cdev_add(struct virtio_blk *vblk,
         |            ^~~~~~~~~~~~~~~~
>> drivers/block/virtio_blk.c:2661:13: warning: 'virtblk_cdev_del' defined but not used [-Wunused-function]
    2661 | static void virtblk_cdev_del(struct cdev *cdev, struct device *cdev_device)
         |             ^~~~~~~~~~~~~~~~


vim +/virtblk_chr_fops +2725 drivers/block/virtio_blk.c

364a78e08d3aa1 Ferry Meng 2025-05-10  2660  
364a78e08d3aa1 Ferry Meng 2025-05-10 @2661  static void virtblk_cdev_del(struct cdev *cdev, struct device *cdev_device)
364a78e08d3aa1 Ferry Meng 2025-05-10  2662  {
364a78e08d3aa1 Ferry Meng 2025-05-10  2663  	cdev_device_del(cdev, cdev_device);
364a78e08d3aa1 Ferry Meng 2025-05-10  2664  	put_device(cdev_device);
364a78e08d3aa1 Ferry Meng 2025-05-10  2665  }
364a78e08d3aa1 Ferry Meng 2025-05-10  2666  
364a78e08d3aa1 Ferry Meng 2025-05-10 @2667  static int virtblk_cdev_add(struct virtio_blk *vblk,
364a78e08d3aa1 Ferry Meng 2025-05-10  2668  		const struct file_operations *fops)
364a78e08d3aa1 Ferry Meng 2025-05-10  2669  {
364a78e08d3aa1 Ferry Meng 2025-05-10  2670  	struct cdev *cdev = &vblk->cdev;
364a78e08d3aa1 Ferry Meng 2025-05-10  2671  	struct device *cdev_device = &vblk->cdev_device;
364a78e08d3aa1 Ferry Meng 2025-05-10  2672  	int minor, ret;
364a78e08d3aa1 Ferry Meng 2025-05-10  2673  
364a78e08d3aa1 Ferry Meng 2025-05-10  2674  	minor = ida_alloc(&vd_chr_minor_ida, GFP_KERNEL);
364a78e08d3aa1 Ferry Meng 2025-05-10  2675  	if (minor < 0)
364a78e08d3aa1 Ferry Meng 2025-05-10  2676  		return minor;
364a78e08d3aa1 Ferry Meng 2025-05-10  2677  
364a78e08d3aa1 Ferry Meng 2025-05-10  2678  	cdev_device->parent = &vblk->vdev->dev;
364a78e08d3aa1 Ferry Meng 2025-05-10  2679  	cdev_device->devt = MKDEV(MAJOR(vd_chr_devt), minor);
364a78e08d3aa1 Ferry Meng 2025-05-10  2680  	cdev_device->class = vd_chr_class;
364a78e08d3aa1 Ferry Meng 2025-05-10  2681  	cdev_device->release = virtblk_cdev_rel;
364a78e08d3aa1 Ferry Meng 2025-05-10  2682  	device_initialize(cdev_device);
364a78e08d3aa1 Ferry Meng 2025-05-10  2683  
364a78e08d3aa1 Ferry Meng 2025-05-10  2684  	ret = dev_set_name(cdev_device, "%sc0", vblk->disk->disk_name);
364a78e08d3aa1 Ferry Meng 2025-05-10  2685  	if (ret)
364a78e08d3aa1 Ferry Meng 2025-05-10  2686  		goto fail;
364a78e08d3aa1 Ferry Meng 2025-05-10  2687  
364a78e08d3aa1 Ferry Meng 2025-05-10  2688  	cdev_init(cdev, fops);
364a78e08d3aa1 Ferry Meng 2025-05-10  2689  	ret = cdev_device_add(cdev, cdev_device);
364a78e08d3aa1 Ferry Meng 2025-05-10  2690  	if (ret)
364a78e08d3aa1 Ferry Meng 2025-05-10  2691  		goto fail;
364a78e08d3aa1 Ferry Meng 2025-05-10  2692  
364a78e08d3aa1 Ferry Meng 2025-05-10  2693  	return 0;
364a78e08d3aa1 Ferry Meng 2025-05-10  2694  
364a78e08d3aa1 Ferry Meng 2025-05-10  2695  fail:
364a78e08d3aa1 Ferry Meng 2025-05-10  2696  	put_device(cdev_device);
364a78e08d3aa1 Ferry Meng 2025-05-10  2697  	return ret;
364a78e08d3aa1 Ferry Meng 2025-05-10  2698  }
364a78e08d3aa1 Ferry Meng 2025-05-10  2699  
364a78e08d3aa1 Ferry Meng 2025-05-10  2700  static int virtblk_chr_open(struct inode *inode, struct file *file)
364a78e08d3aa1 Ferry Meng 2025-05-10  2701  {
364a78e08d3aa1 Ferry Meng 2025-05-10  2702  	int ret = 0;
364a78e08d3aa1 Ferry Meng 2025-05-10  2703  	struct virtio_blk *vblk = container_of(inode->i_cdev, struct virtio_blk, cdev);
364a78e08d3aa1 Ferry Meng 2025-05-10  2704  
364a78e08d3aa1 Ferry Meng 2025-05-10  2705  	if (vblk->disk)
364a78e08d3aa1 Ferry Meng 2025-05-10  2706  		get_device(disk_to_dev(vblk->disk));
364a78e08d3aa1 Ferry Meng 2025-05-10  2707  	else
364a78e08d3aa1 Ferry Meng 2025-05-10  2708  		ret = -ENXIO;
364a78e08d3aa1 Ferry Meng 2025-05-10  2709  
364a78e08d3aa1 Ferry Meng 2025-05-10  2710  	return ret;
364a78e08d3aa1 Ferry Meng 2025-05-10  2711  }
364a78e08d3aa1 Ferry Meng 2025-05-10  2712  
364a78e08d3aa1 Ferry Meng 2025-05-10  2713  static int virtblk_chr_release(struct inode *inode, struct file *file)
364a78e08d3aa1 Ferry Meng 2025-05-10  2714  {
364a78e08d3aa1 Ferry Meng 2025-05-10  2715  	struct virtio_blk *vblk = container_of(inode->i_cdev, struct virtio_blk, cdev);
364a78e08d3aa1 Ferry Meng 2025-05-10  2716  
364a78e08d3aa1 Ferry Meng 2025-05-10  2717  	if (!vblk->disk)
364a78e08d3aa1 Ferry Meng 2025-05-10  2718  		WARN_ON(1);
364a78e08d3aa1 Ferry Meng 2025-05-10  2719  	else
364a78e08d3aa1 Ferry Meng 2025-05-10  2720  		put_device(disk_to_dev(vblk->disk));
364a78e08d3aa1 Ferry Meng 2025-05-10  2721  
364a78e08d3aa1 Ferry Meng 2025-05-10  2722  	return 0;
364a78e08d3aa1 Ferry Meng 2025-05-10  2723  }
364a78e08d3aa1 Ferry Meng 2025-05-10  2724  
364a78e08d3aa1 Ferry Meng 2025-05-10 @2725  static const struct file_operations virtblk_chr_fops = {
364a78e08d3aa1 Ferry Meng 2025-05-10  2726  	.owner		= THIS_MODULE,
364a78e08d3aa1 Ferry Meng 2025-05-10  2727  	.open		= virtblk_chr_open,
364a78e08d3aa1 Ferry Meng 2025-05-10  2728  	.release	= virtblk_chr_release,
49eb362969139b Ferry Meng 2025-05-10  2729  	.uring_cmd	= virtblk_chr_uring_cmd,
578eefc3994904 Ferry Meng 2025-05-10  2730  	.uring_cmd_iopoll = virtblk_chr_uring_cmd_iopoll,
364a78e08d3aa1 Ferry Meng 2025-05-10  2731  };
364a78e08d3aa1 Ferry Meng 2025-05-10  2732  

:::::: The code at line 2725 was first introduced by commit
:::::: 364a78e08d3aa14559c1fb6ac5e34a60a0e27410 anolis: virtio-blk: add virtio-blk chardev support

:::::: TO: Ferry Meng <mengferry@linux.alibaba.com>
:::::: CC: winterddd <tianruidong@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
