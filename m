Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7757017597
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Apr 2025 03:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745552853; cv=none; b=LI3ZVtrXuoNhXbT3cltb5qOuaAEJCLBeksAZ/XZpqVBM78NRsCPpJZadshiDMytvyM0GQsf6/KlvhuYkirw7K9+oX50s97p+P4bVNW+fU7zNWCvDu258fL8R4hjI3HPflvCzEJAihalt5NCOWdhEbXSceAAXyB/ubDvci/NO+Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745552853; c=relaxed/simple;
	bh=JulVXFos8RdJdGgC0d6EdiyUrod8iVZ+BNI5eP2sWoE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E74a/ZvFSQQoZQtMOExzflL/o7eAQHCasYNCO9QbSr8CuAT9RJsuc+P+n7Qk/xWdqLeTh9JgLpzYWtukAVJHl4G2c4bCu/pEmKm+PW/8fpu5JWv52Mo9tLeJl0iPZk58t2wWmtAhsFetUT6qTZcpnOE8EwYmOGeQFJEB2QUH0rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E81E/Ogl; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E81E/Ogl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745552850; x=1777088850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JulVXFos8RdJdGgC0d6EdiyUrod8iVZ+BNI5eP2sWoE=;
  b=E81E/OglYYFzIK+w4A8Kuh8PNgXm1lFeDFh6V8w8INAkez0iW7Hlf+4b
   79x8uacq7/onQOxRmz0wTOAKJnCgeQVTKATO+bWs1AU0OuZVZWZKGTpWz
   AsYJzUNccKzEEzoMiX6KFziB+1ZNctB4BzL/H6ZAB7vr/8WFJra4fS4ta
   I+ReYPB7Nt3P/grIhRWxFCZjlZ5/uRXgP71UC19RRw69eqTLsWtK18mHa
   yeCKF4ajog874s23XvYIxI5ELsQqxcUhjh9FACB21kP8jMNGND1bUvfg0
   JU66W6BvywPcr/zj9NDOcfE4Ei8Sb/GHWMRW1emsGuzOwtC7v7AxZ+8oJ
   w==;
X-CSE-ConnectionGUID: 6SKzY186SaCh+z0BtaU4Ow==
X-CSE-MsgGUID: 0zk3YKMjSN+LcRT5bZ6ezQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="46918055"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="46918055"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 20:47:30 -0700
X-CSE-ConnectionGUID: XihMl34rTw+g8Zx6SHS7Ng==
X-CSE-MsgGUID: xsl6VZFyRbe87o+Y7jw4FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="137637594"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 Apr 2025 20:47:29 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8A2A-0004oj-2D;
	Fri, 25 Apr 2025 03:47:26 +0000
Date: Fri, 25 Apr 2025 11:47:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1593/1593] block/genhd.c:642:5:
 warning: no previous prototype for 'disk_scan_partitions'
Message-ID: <202504251109.LNg7C0pb-lkp@intel.com>
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
head:   08111f03f1ec65598372cfe9bf64f366d575671e
commit: cdfb5c11ad89867cd28c903369fbfebe3f36ca26 [1593/1593] block: fix kabi broken in ioctl.c
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250425/202504251109.LNg7C0pb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504251109.LNg7C0pb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504251109.LNg7C0pb-lkp@intel.com/

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
