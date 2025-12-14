Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71DF13AD05
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 01:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765675121; cv=none; b=kgHxBvVreJoxmBl/MVc9HAooGfcMkdz/T2EfBoEreDEE1m+Hdj9+cTdxrQxUWNdMMIu8x4bMTwtQKbp0EO7RgOKVuVMc/Wqwxtzzfx9rfw3YmeZ5bZt7e0VfUg/ybVriKiXdxdVRcJFP4U2L4jwTyz903N6ZD6bapyrwgjU0nYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765675121; c=relaxed/simple;
	bh=hS67huBdOXZmZjjI8/2Ibt+Q/JqnJTBQANk8UF6fh5I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AcwVOALQTJ7XjUU3GtmWrr9FinpAWJLD4hX6RIFiGRSGmtqfv4JblxaUeLlxRX8UbO6ecSR3HpQX04B9kp4uHZAWL/fhuf9HwFhCqWgC+MTRLGAQsbsIfWfHhJubc1Ew5zDVpZb7gjVQ+hq8iSmReMYXt4A97l3KBKu51/HEDSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sn360Ebc; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sn360Ebc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765675120; x=1797211120;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hS67huBdOXZmZjjI8/2Ibt+Q/JqnJTBQANk8UF6fh5I=;
  b=Sn360EbcihqyRL+qEnqatX+A05VFpChmupI0HGjD+kJkNjxVr+GHgns2
   X1nKzSoVBM0e9JZHfUXaQUMplQm/50ND9h1os51DHMOqkxunBmdHr9Kaz
   e1tNvn1RVQPDjM+Pkgx2oxffUc9t1bjAz1WAlsCKdQeKSu2bQJVi27l2W
   ByC6BvkPz6DuitiIGM1tauM9Dob7bLKuPCmUFhtOuPf63ZeAvjn8HhLlN
   LhQ2gemjhoBw5LsY+jCVyWyDy6YnCHMXUAPIXx3JiI2OB8fORCaFuxTKd
   9A1dz8fJimXyU0ix5oJVnemMXVGvO/Ki2d1H3/EH6ly0YhQ9L3RjzFtlX
   g==;
X-CSE-ConnectionGUID: 62HWZI1KRdCWYuIO3X2UyA==
X-CSE-MsgGUID: VXR0bVZSRaO1xeijEGWc0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="90280441"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="90280441"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 17:18:40 -0800
X-CSE-ConnectionGUID: F9wzU70OSzSi8KglUA0/GA==
X-CSE-MsgGUID: bLUmFT+BRWeWt0Vsxt07Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="202508387"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 13 Dec 2025 17:18:39 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUaku-000000002Em-1E4B;
	Sun, 14 Dec 2025 01:18:36 +0000
Date: Sun, 14 Dec 2025 02:17:53 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1941/1941] block/genhd.c:642:5:
 warning: no previous prototype for 'disk_scan_partitions'
Message-ID: <202512140221.GVjDgRQq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yu,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5a399b91821faeec2466751db2d714b24f8eb17c
commit: cdfb5c11ad89867cd28c903369fbfebe3f36ca26 [1941/1941] block: fix kabi broken in ioctl.c
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251214/202512140221.GVjDgRQq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140221.GVjDgRQq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140221.GVjDgRQq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/genhd.c:642:5: warning: no previous prototype for 'disk_scan_partitions' [-Wmissing-prototypes]
     642 | int disk_scan_partitions(struct gendisk *disk, fmode_t mode)
         |     ^~~~~~~~~~~~~~~~~~~~
   block/genhd.c:533: warning: Function parameter or member 'devt' not described in 'blk_invalidate_devt'


vim +/disk_scan_partitions +642 block/genhd.c

d2bf1b6723ed0e Tejun Heo         2010-12-08  641  
efc73feb2901d2 Christoph Hellwig 2023-04-07 @642  int disk_scan_partitions(struct gendisk *disk, fmode_t mode)
b9484a857f600c Yu Kuai           2022-08-09  643  {
b9484a857f600c Yu Kuai           2022-08-09  644  	struct block_device *bdev;
efc73feb2901d2 Christoph Hellwig 2023-04-07  645  	int ret;
b9484a857f600c Yu Kuai           2022-08-09  646  
efc73feb2901d2 Christoph Hellwig 2023-04-07  647  	if (!disk_part_scan_enabled(disk))
efc73feb2901d2 Christoph Hellwig 2023-04-07  648  		return -EINVAL;
b9484a857f600c Yu Kuai           2022-08-09  649  
b9484a857f600c Yu Kuai           2022-08-09  650  	bdev = bdget_disk(disk, 0);
b9484a857f600c Yu Kuai           2022-08-09  651  	if (!bdev)
efc73feb2901d2 Christoph Hellwig 2023-04-07  652  		return -ENOMEM;
b9484a857f600c Yu Kuai           2022-08-09  653  
b9484a857f600c Yu Kuai           2022-08-09  654  	bdev->bd_invalidated = 1;
efc73feb2901d2 Christoph Hellwig 2023-04-07  655  
efc73feb2901d2 Christoph Hellwig 2023-04-07  656  	ret = blkdev_get(bdev, mode, NULL);
efc73feb2901d2 Christoph Hellwig 2023-04-07  657  	if (!ret)
efc73feb2901d2 Christoph Hellwig 2023-04-07  658  		blkdev_put(bdev, mode);
efc73feb2901d2 Christoph Hellwig 2023-04-07  659  
efc73feb2901d2 Christoph Hellwig 2023-04-07  660  	return ret;
fbbec472351c99 Christoph Hellwig 2023-04-07  661  }
fbbec472351c99 Christoph Hellwig 2023-04-07  662  

:::::: The code at line 642 was first introduced by commit
:::::: efc73feb2901d27dcd01fa859d1378aee42850aa block: merge disk_scan_partitions and blkdev_reread_part

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Yongqiang Liu <duanzi@zju.edu.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
