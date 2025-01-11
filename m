Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC38634
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 23:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736639347; cv=none; b=H9JszbZU9l6LBNA4hW5uwEIlznYa+kbmEDVIn9tsjPjkHG+DDMUuDW3kPpaSqcyR5Zttn7txdE9gNwgP6FKtsRsi0Gxw8SSY9+uQilW0g/4kughMIIaFErs7uWksQ+e+j2CFxAfZpW0cPYnmve98vFq6VO+u7urKDP/PCsov8Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736639347; c=relaxed/simple;
	bh=UHrX9hh2B0VUW/QI2ybP5wRjnLhaRjKFjnp1fmaHar8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GcsjGe2Uail3XV8RZn6hgZFpjwuvynKAH0y3OfHy2RvNoi3Zm8+MS5ig0Pu+GC4W9JfO/kpSXF9knJk8DUUpYJEOV2ARyidSeHT24nWxVN77+NLBrdLcMpDZgDjTASHoOsGnOYrptIJPW/85upiIULVlsWToR4Fdood56V1QhCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OymchtBg; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OymchtBg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736639345; x=1768175345;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UHrX9hh2B0VUW/QI2ybP5wRjnLhaRjKFjnp1fmaHar8=;
  b=OymchtBgwfT6/bvTFtlm3yi6NRum+8otXsBgJSPQ3S7Mj4a6mGlWK+8G
   L9dA1gv/Ama6D2pEz4l78g9juWqKOIPRd6Vd20r6s5Ooq4629b/LBhz0Y
   ZG+lQQWXjtbRJWQ7B+dWlRpio20QVmkHIxWiblgn1VQkfdH3FAr3Iw82i
   /of577aLhy4y15SQo2f77A1IebntYekC5rlEvbS/70Q1wbvn5eEUX2CWc
   PmjhUU9EB3DR+f0BUT1o0Fh2cjAiMTc2kscauwglcHYe/bUNcca8RYkWb
   nd76spPMIbP1wOq87sIK704w/Z4KaoK6YHaGq914DPz4mRlk87yUjOfU1
   w==;
X-CSE-ConnectionGUID: ZIvtkCwyR4a8svx+n29Eag==
X-CSE-MsgGUID: sYqKhbsoTpKXQoQTw9CAxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="24508014"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="24508014"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 15:49:05 -0800
X-CSE-ConnectionGUID: pB0jJH1aTsG5ui3Ou6gzLQ==
X-CSE-MsgGUID: pLn7i4mzRVq3KNTqsgPnwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104584194"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Jan 2025 15:49:03 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWlDx-000LKn-0z;
	Sat, 11 Jan 2025 23:49:01 +0000
Date: Sun, 12 Jan 2025 07:48:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1402/1402] block/genhd.c:642:5:
 warning: no previous prototype for function 'disk_scan_partitions'
Message-ID: <202501120735.0h1eqZAy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   97f98c391a1fd153ae010a2faf73f9e03270da6e
commit: cdfb5c11ad89867cd28c903369fbfebe3f36ca26 [1402/1402] block: fix kabi broken in ioctl.c
config: x86_64-buildonly-randconfig-004-20250109 (https://download.01.org/0day-ci/archive/20250112/202501120735.0h1eqZAy-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250112/202501120735.0h1eqZAy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501120735.0h1eqZAy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from block/genhd.c:10:
   In file included from include/linux/blkdev.h:16:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> block/genhd.c:642:5: warning: no previous prototype for function 'disk_scan_partitions' [-Wmissing-prototypes]
     642 | int disk_scan_partitions(struct gendisk *disk, fmode_t mode)
         |     ^
   block/genhd.c:642:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     642 | int disk_scan_partitions(struct gendisk *disk, fmode_t mode)
         | ^
         | static 
   2 warnings generated.
   block/genhd.c:533: warning: Function parameter or member 'devt' not described in 'blk_invalidate_devt'


vim +/disk_scan_partitions +642 block/genhd.c

d2bf1b6723ed0ea Tejun Heo         2010-12-08  641  
efc73feb2901d27 Christoph Hellwig 2023-04-07 @642  int disk_scan_partitions(struct gendisk *disk, fmode_t mode)
b9484a857f600ca Yu Kuai           2022-08-09  643  {
b9484a857f600ca Yu Kuai           2022-08-09  644  	struct block_device *bdev;
efc73feb2901d27 Christoph Hellwig 2023-04-07  645  	int ret;
b9484a857f600ca Yu Kuai           2022-08-09  646  
efc73feb2901d27 Christoph Hellwig 2023-04-07  647  	if (!disk_part_scan_enabled(disk))
efc73feb2901d27 Christoph Hellwig 2023-04-07  648  		return -EINVAL;
b9484a857f600ca Yu Kuai           2022-08-09  649  
b9484a857f600ca Yu Kuai           2022-08-09  650  	bdev = bdget_disk(disk, 0);
b9484a857f600ca Yu Kuai           2022-08-09  651  	if (!bdev)
efc73feb2901d27 Christoph Hellwig 2023-04-07  652  		return -ENOMEM;
b9484a857f600ca Yu Kuai           2022-08-09  653  
b9484a857f600ca Yu Kuai           2022-08-09  654  	bdev->bd_invalidated = 1;
efc73feb2901d27 Christoph Hellwig 2023-04-07  655  
efc73feb2901d27 Christoph Hellwig 2023-04-07  656  	ret = blkdev_get(bdev, mode, NULL);
efc73feb2901d27 Christoph Hellwig 2023-04-07  657  	if (!ret)
efc73feb2901d27 Christoph Hellwig 2023-04-07  658  		blkdev_put(bdev, mode);
efc73feb2901d27 Christoph Hellwig 2023-04-07  659  
efc73feb2901d27 Christoph Hellwig 2023-04-07  660  	return ret;
fbbec472351c994 Christoph Hellwig 2023-04-07  661  }
fbbec472351c994 Christoph Hellwig 2023-04-07  662  

:::::: The code at line 642 was first introduced by commit
:::::: efc73feb2901d27dcd01fa859d1378aee42850aa block: merge disk_scan_partitions and blkdev_reread_part

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Yongqiang Liu <duanzi@zju.edu.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
