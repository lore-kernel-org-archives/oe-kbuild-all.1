Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0B41FF5EC
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Aug 2025 19:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754508100; cv=none; b=WV/vgXxULmX4t3kmAieL/gEZl2sNjtn2tDHxr2d//7ch1IKaxjqL3jY0nLpt8fkCSr1ZpX5QuP1vIL4qDrjzF5NCfF+5Eb4VhddsKhRe3Rs/2XBXV2hm9PnonkuLdd0Vy3nWpFdjJrcKRF+L9QWj8nLGCL0y1eP6PGGuZMJdvUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754508100; c=relaxed/simple;
	bh=Drl/A4pGoe9vvE9VBCK3gnRBeR3/PSWSk8dg0P6q8LE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QhxmvoIdb+sW9DDEHEjuNY0s913YLERACxNuKkj31Bw8Z5GG3ydumw3LJGf73cRKbIdVOeuLulGAGLi3KuxJsoVxmz29ki6p7RVMVYSHMWfxew6oiV/oD426S0HGCq/4DOJQMOATj85ieAbtMI35XZYBOZ3EoHoy/r8Tx+RugJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X9JQPS+5; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X9JQPS+5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754508099; x=1786044099;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Drl/A4pGoe9vvE9VBCK3gnRBeR3/PSWSk8dg0P6q8LE=;
  b=X9JQPS+58rCN9s0aUwHmmGKjSOynBv/orIvnr3fvqkQkI/TPxV4N8fBQ
   BgjdAGXag9/VbSZfk/JQ2o/HRhXZwKblpeP2BvJl132D+50W9vKZSMslH
   /GN2R/FN3BiSdMqBQCsEvNpkbljSNOa/dda02RTUJPVI4InesWJ4A2bxp
   ndsnUnM6075Ti6v2YpK+DBc1e9r4pDr+Wa4imu95wiErZLW1Ap/KGf9Jy
   1FsQrlaOAD4yA8J6ytoUN66CuOALM7lo7AHdIUs9ZsL0zu98ikkJYNQjG
   9X5sDKc7uXEg/oVKh6AXT/ZphpZhKXGtR1ypZpIYbWMddQ3cYYDGnRBX1
   g==;
X-CSE-ConnectionGUID: oAgmeGvSRJa6TG7PNP3Qxg==
X-CSE-MsgGUID: j86j4cHrTTm/gusTkoOpPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="55873383"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="55873383"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 12:21:38 -0700
X-CSE-ConnectionGUID: mbBkJXL8RbaItjuJ1rAmpg==
X-CSE-MsgGUID: 4YTNkfkIQ5aqonLCJUg1CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="165194041"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 06 Aug 2025 12:21:37 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujjhe-00020m-2I;
	Wed, 06 Aug 2025 19:21:34 +0000
Date: Thu, 7 Aug 2025 03:21:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1753/1753] block/genhd.c:642:5:
 warning: no previous prototype for function 'disk_scan_partitions'
Message-ID: <202508070349.2ODYAkPf-lkp@intel.com>
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
head:   464c0bf980f96a307759f809825ab0a3b59f8b70
commit: cdfb5c11ad89867cd28c903369fbfebe3f36ca26 [1753/1753] block: fix kabi broken in ioctl.c
config: x86_64-buildonly-randconfig-006-20250806 (https://download.01.org/0day-ci/archive/20250807/202508070349.2ODYAkPf-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508070349.2ODYAkPf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508070349.2ODYAkPf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/genhd.c:642:5: warning: no previous prototype for function 'disk_scan_partitions' [-Wmissing-prototypes]
     642 | int disk_scan_partitions(struct gendisk *disk, fmode_t mode)
         |     ^
   block/genhd.c:642:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     642 | int disk_scan_partitions(struct gendisk *disk, fmode_t mode)
         | ^
         | static 
   1 warning generated.
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
