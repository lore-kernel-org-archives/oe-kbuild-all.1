Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A095FDA7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Dec 2024 22:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734645963; cv=none; b=kzUZmrKO/VeKClWiukGVEj2az7KHFWs94eTFVprMj8zkCWfo17AJ5EX/2Q3luGnuyxQQHUbYKBfjrBgzudSAtmLg4yGifkbEHgv+0aEmFZ8uFo+w+CDomJtt5uszyCrFBYOb5INbrVMownfuLF+6nzxI68l36TE/UfsIlTsDyvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734645963; c=relaxed/simple;
	bh=BWaBs+j96pF77mTFdHKkI6C0BFzpKDBJ5eQEByUPgVs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D37kwSkn72sUvayUOrphsYZo61Llb2Mh3jkWC1a0DR32hBVWD3UclMaHl4HrOYXccGRIT5X398dvgFvilvUpwNRW4h2qxT6yYsrVOFttXOVmSCelQy9YsAlx1lG4Pue4HXAoURORZwD+LFhb7xNnkhTMhTGPmAP3FoPWxLOnyx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nKim0BYx; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nKim0BYx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734645961; x=1766181961;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BWaBs+j96pF77mTFdHKkI6C0BFzpKDBJ5eQEByUPgVs=;
  b=nKim0BYxJxboNc+a5yGK8DCmBoybraQt6fa18UdFL0Z4HwZBxFrZhwOO
   3oeRq/i+vOBDsntx5L+pemMa46GpVoISs+5vMimkaPFDCg1xA0KNaL/nc
   nnl/vsXVLg3L1QhRZCv85jyWHOThF8pFqmuCVvA3YVwmieOQKU1ocLmJo
   b3D5fqvu5jxYLtU7NDU6LDuMz9CHKW2v+IJ3LL23dGymQArY1ajpYHuwb
   Ko846RfkAf2Bluq7wOF4A+0OdLIz/DCdeSjo/145eOi+MDLJ1ujd/dyqx
   jxkeQZJ8Po8WCSgdsDak6QG5Fd88wZdMQWMS26PSDLkCrv47Ou8S5s7m+
   A==;
X-CSE-ConnectionGUID: 43GWWT+yT0m1PxamKSHksw==
X-CSE-MsgGUID: WMISIVovQOOi1WUyBU3ljQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35216624"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="35216624"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 14:06:00 -0800
X-CSE-ConnectionGUID: k7ZFvRweSPSqlL03HjlTfg==
X-CSE-MsgGUID: DqgA7H6QRq2wR6hIqcS7Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="135654621"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Dec 2024 14:05:59 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOOea-0000Zf-2T;
	Thu, 19 Dec 2024 22:05:56 +0000
Date: Fri, 20 Dec 2024 06:04:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1327/1327]
 drivers/misc/uacce/uacce.c:739:13: error: implicit declaration of function
 'module_refcount'
Message-ID: <202412200558.NXqsPzsS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yu'an,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   8fbcff0074ff9f93ea927547e99e1dde27ddc7c5
commit: 451823febcb610969f048556cedc41b5e08fafb1 [1327/1327] UACCE backport from mainline
config: arm64-randconfig-001-20241216 (https://download.01.org/0day-ci/archive/20241220/202412200558.NXqsPzsS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412200558.NXqsPzsS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412200558.NXqsPzsS-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/misc/uacce/uacce.c: In function 'uacce_put_queue':
>> drivers/misc/uacce/uacce.c:739:13: error: implicit declaration of function 'module_refcount' [-Werror=implicit-function-declaration]
     739 |         if (module_refcount(uacce->pdev->driver->owner) > 0)
         |             ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/module_refcount +739 drivers/misc/uacce/uacce.c

1998d80a018804 drivers/uacce/uacce.c Mingqiang Ling 2019-04-23  717  
8bf65d5558d0bd drivers/uacce/uacce.c Mingqiang Ling 2019-07-11  718  /*
8bf65d5558d0bd drivers/uacce/uacce.c Mingqiang Ling 2019-07-11  719   * While user space releases a queue, all the relatives on the queue
76dbd49be7fc95 drivers/uacce/uacce.c xuzaibo        2019-07-11  720   * should be released imediately by this putting.
1998d80a018804 drivers/uacce/uacce.c Mingqiang Ling 2019-04-23  721   */
f7acb5166348bf drivers/uacce/uacce.c Yu'an Wang     2020-02-20  722  static void uacce_put_queue(struct uacce_queue *q)
1998d80a018804 drivers/uacce/uacce.c Mingqiang Ling 2019-04-23  723  {
8bf65d5558d0bd drivers/uacce/uacce.c Mingqiang Ling 2019-07-11  724  	struct uacce *uacce = q->uacce;
e3234bd66f0c97 drivers/uacce/uacce.c xuzaibo        2019-05-13  725  
8bf65d5558d0bd drivers/uacce/uacce.c Mingqiang Ling 2019-07-11  726  	/*
8bf65d5558d0bd drivers/uacce/uacce.c Mingqiang Ling 2019-07-11  727  	 * To do: we should vm_munmap mmio and dus regions, currently we munmap
8bf65d5558d0bd drivers/uacce/uacce.c Mingqiang Ling 2019-07-11  728  	 * mmio and dus region before put queue.
8bf65d5558d0bd drivers/uacce/uacce.c Mingqiang Ling 2019-07-11  729  	 */
8bf65d5558d0bd drivers/uacce/uacce.c Mingqiang Ling 2019-07-11  730  	if (uacce->ops->stop_queue)
8bf65d5558d0bd drivers/uacce/uacce.c Mingqiang Ling 2019-07-11  731  		uacce->ops->stop_queue(q);
299b4bc20a682a drivers/uacce/uacce.c lingmingqiang  2019-05-06  732  
8bf65d5558d0bd drivers/uacce/uacce.c Mingqiang Ling 2019-07-11  733  	if (uacce->ops->put_queue)
8bf65d5558d0bd drivers/uacce/uacce.c Mingqiang Ling 2019-07-11  734  		uacce->ops->put_queue(q);
8bf65d5558d0bd drivers/uacce/uacce.c Mingqiang Ling 2019-07-11  735  
8bf65d5558d0bd drivers/uacce/uacce.c Mingqiang Ling 2019-07-11  736  	q->state = UACCE_Q_ZOMBIE;
f7acb5166348bf drivers/uacce/uacce.c Yu'an Wang     2020-02-20  737  	q->filep->private_data = NULL;
f7acb5166348bf drivers/uacce/uacce.c Yu'an Wang     2020-02-20  738  	uacce_queue_drain(q);
f7acb5166348bf drivers/uacce/uacce.c Yu'an Wang     2020-02-20 @739  	if (module_refcount(uacce->pdev->driver->owner) > 0)
f7acb5166348bf drivers/uacce/uacce.c Yu'an Wang     2020-02-20  740  		module_put(uacce->pdev->driver->owner);
1998d80a018804 drivers/uacce/uacce.c Mingqiang Ling 2019-04-23  741  }
1998d80a018804 drivers/uacce/uacce.c Mingqiang Ling 2019-04-23  742  

:::::: The code at line 739 was first introduced by commit
:::::: f7acb5166348bf6c75ac40c5e6e14726bc3ca578 uacce: Remove uacce mode 1 relatives

:::::: TO: Yu'an Wang <wangyuan46@huawei.com>
:::::: CC: Yang Yingliang <yangyingliang@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
