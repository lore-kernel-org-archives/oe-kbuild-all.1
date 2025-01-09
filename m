Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964C142070
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jan 2025 18:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736446553; cv=none; b=t5iIdDoJhW7y3kLtrZC6crI7KMASKhblcHtzUa2x+NiUJj44tFJ4IIS8CJlIH66uY42++18Ni0ci9evS6c9EhpIBgIFtPO8R1xjWdrPllrnhcMPzphksiuWvE2eBPE3kbYNiS9+U1zMjRNF1giis99PAv0qYQqFAIERJS/kJkQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736446553; c=relaxed/simple;
	bh=7W5yAC/GzJERMhO/XflesGkApvDYIiI6ZL/ykReLCl4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gCrGKgJMHKoX/Fb5PAhhLsN5P9H8FbMo49gbECswCEaN3jJfHYkG4FwgxQZUcMu2mR220SIeJsP4bD68JRmh5n1DgBaY20e+EpkT2cIIvuEak79U501JOE/i30zElrQm9xSVLpT9CHSsH48HCebsgeU06jLgAcfP1HN1tZSe7Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GuAXPBvO; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GuAXPBvO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736446551; x=1767982551;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7W5yAC/GzJERMhO/XflesGkApvDYIiI6ZL/ykReLCl4=;
  b=GuAXPBvOSCX9L36EPjsW4ehD4UXOOSH+Hq1DTsPLiPbA7obSYFqZEMwB
   rKh8Ukk30P32OK/6q65sGWdnewJpKMe4mgs8n4urmFF3fQUZ27LyGsvqL
   R9RDkig9ySK78/ZkiphnFVPHBKIQhG+ZmQZUn/unLi+792kyS80ZMhWmE
   CT55LuFy50krapykWW6B8jeKQxYfGsB7/oUY5+FTblytGe+8dE8nlO1yJ
   IC5PTx1xPtMCI3iCiSXllzXu0zS8zsgIfc9yC9q//5V4ySj8OgysFm/RE
   BiLNasBOdSMxF75u2WIHyfvkqoI6QosD/Bq8k7hzxN/2KQfJonW/OEVK3
   w==;
X-CSE-ConnectionGUID: P3PER+b2QOCDRBIg+HFtDA==
X-CSE-MsgGUID: u9KBExo+RymN6jpF7eUPIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="39548104"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="39548104"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 10:15:50 -0800
X-CSE-ConnectionGUID: fxSudysfTkquWyewuZsmkA==
X-CSE-MsgGUID: Ei0sgSU1QQahmE8WXxrmAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="103286349"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Jan 2025 10:15:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVx4M-000Hyv-2S;
	Thu, 09 Jan 2025 18:15:46 +0000
Date: Fri, 10 Jan 2025 02:15:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1402/1402] block/genhd.c:642:5:
 warning: no previous prototype for 'disk_scan_partitions'
Message-ID: <202501100221.KRTzS1xl-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-006-20250109 (https://download.01.org/0day-ci/archive/20250110/202501100221.KRTzS1xl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501100221.KRTzS1xl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501100221.KRTzS1xl-lkp@intel.com/

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
