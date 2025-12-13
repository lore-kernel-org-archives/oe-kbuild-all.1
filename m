Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E351DF72C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 09:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765617989; cv=none; b=NprZ5vc7aLDtzBgc2W6OeNSDjhbv9+luIUTUsD/5fp0EIfR0vD7M/gWSR1t3X0EbP2qNoAKaEOR7jXcg90Ma0fOcq7Ws81fQhJfgzVElkH2luLsod8cPtPANvol5jnqyuCdLLMH+zwgBasYaEa/XOoUYGNvqKjK8kPZUAe50fnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765617989; c=relaxed/simple;
	bh=9e5MVqsUCQ+P7OvLIog6jn46QN9CBu8YIqWOiuXYhmg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eu0b0yg4coXH4DcpTCSL9b15R7EObC3m0Bxm/Lx1kchkLdcVkF7H4AGBRoW0BVsKCoH5U1pqZoE/ZhVMtfig/KTdxtjPpfVZidMr/mlf9RVCUypKMbpafJfBYssWIepSu5LnKQMAZcvzet+4yiNXZg702mD4tt0Ptr01yrYUE5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M79QDD34; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M79QDD34"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765617987; x=1797153987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9e5MVqsUCQ+P7OvLIog6jn46QN9CBu8YIqWOiuXYhmg=;
  b=M79QDD34aHbjj0n/Gz4j1z7uVXm/66LFy3CG5178yi3GH+7yJzApnRMi
   2rGeATfomKNBbdTFMyyYxB7arvL/OiEt8GQXLdomLjDQqugV83sVGUtHI
   vdd2DyRhbrLkszEOLzZdVp2WQoUllydbY3VUS98vhIBni+D1Qq/Wyb6fY
   tZDJYuyiIN+Gx5VB2H4L1Pc237L6H55t6cG9AhXP1MCpFGeXqKV9ZrYqe
   iOhMm6r3Nz4eOZrhFfiVjIRd/BnEXNY/LH+ba2jTTHBFxkLh5vVin3qmJ
   zc/Ofgu208HkNv3KISFQe71tK2nf/TqpM/YFfUnuAeZaTf5X+DgNixuWg
   Q==;
X-CSE-ConnectionGUID: uBAb52ycRsmPS/F4oQmf9A==
X-CSE-MsgGUID: XWO3l/ERS4Gp1QQsJLLKqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71462993"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="71462993"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 01:26:27 -0800
X-CSE-ConnectionGUID: X4dApQcfSrak9BCBUFnubw==
X-CSE-MsgGUID: My9vEFubQNCrhS7sTSPmMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="201706052"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Dec 2025 01:26:25 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vULtO-000000007Q1-3fiA;
	Sat, 13 Dec 2025 09:26:22 +0000
Date: Sat, 13 Dec 2025 17:26:22 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 50/50]
 drivers/block/virtio_blk.c:2661:13: warning: 'virtblk_cdev_del' defined but
 not used
Message-ID: <202512131741.x5uyrEAH-lkp@intel.com>
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
commit: f01929f35dcf5da763713cebf30054c14fc0e3b5 [50/50] anolis: virtio-blk: make chardev only exposed to specific devices
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20251213/202512131741.x5uyrEAH-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131741.x5uyrEAH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131741.x5uyrEAH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/block/virtio_blk.c: In function 'virtblk_probe':
   drivers/block/virtio_blk.c:2845:25: warning: unused variable 'i' [-Wunused-variable]
    2845 |         int err, index, i;
         |                         ^
   drivers/block/virtio_blk.c: At top level:
   drivers/block/virtio_blk.c:2725:37: warning: 'virtblk_chr_fops' defined but not used [-Wunused-const-variable=]
    2725 | static const struct file_operations virtblk_chr_fops = {
         |                                     ^~~~~~~~~~~~~~~~
   drivers/block/virtio_blk.c:2667:12: warning: 'virtblk_cdev_add' defined but not used [-Wunused-function]
    2667 | static int virtblk_cdev_add(struct virtio_blk *vblk,
         |            ^~~~~~~~~~~~~~~~
>> drivers/block/virtio_blk.c:2661:13: warning: 'virtblk_cdev_del' defined but not used [-Wunused-function]
    2661 | static void virtblk_cdev_del(struct cdev *cdev, struct device *cdev_device)
         |             ^~~~~~~~~~~~~~~~


vim +/virtblk_cdev_del +2661 drivers/block/virtio_blk.c

364a78e08d3aa1 Ferry Meng 2025-05-10  2660  
364a78e08d3aa1 Ferry Meng 2025-05-10 @2661  static void virtblk_cdev_del(struct cdev *cdev, struct device *cdev_device)
364a78e08d3aa1 Ferry Meng 2025-05-10  2662  {
364a78e08d3aa1 Ferry Meng 2025-05-10  2663  	cdev_device_del(cdev, cdev_device);
364a78e08d3aa1 Ferry Meng 2025-05-10  2664  	put_device(cdev_device);
364a78e08d3aa1 Ferry Meng 2025-05-10  2665  }
364a78e08d3aa1 Ferry Meng 2025-05-10  2666  
364a78e08d3aa1 Ferry Meng 2025-05-10  2667  static int virtblk_cdev_add(struct virtio_blk *vblk,
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

:::::: The code at line 2661 was first introduced by commit
:::::: 364a78e08d3aa14559c1fb6ac5e34a60a0e27410 anolis: virtio-blk: add virtio-blk chardev support

:::::: TO: Ferry Meng <mengferry@linux.alibaba.com>
:::::: CC: winterddd <tianruidong@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
