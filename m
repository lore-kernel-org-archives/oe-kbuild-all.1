Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02E120E6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 08:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726300972; cv=none; b=T6YVwGZF7uuXb7mdq2afury8RMHMdWU2mrE6K4vgLScqMyOgXpJLi1i0gPdPRHUhMz3HazPmgycVbe8q3NdN0BDIApIgK/ZoirorkNkLxSsuwUut+kpjqjtzsMN41lC2UzH/kiyW0Hr8zqmRtcjPefieQP/+rhoAi72LxQ8X46M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726300972; c=relaxed/simple;
	bh=TTE9rufeA4Dbv3hiCYuxXg3YGKuNilUvNhE7u93wiK0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uT+pnH4jmdUM6UsAGwrQbWKBIIdEUHgI3XoW7iqM38EPqyWcn1+KNAx62yUCjjhv8W+4XxvFzj2wsnRZ8tcbCDsX5hJUOzVMTuDv1JjFAy6vZ+z2wRYtIDqHW1YfsA/UefjJNOymdS0BmBmqwyUZNqig8kKdItEX65gag6VyYok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mz8FOgUC; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mz8FOgUC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726300971; x=1757836971;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TTE9rufeA4Dbv3hiCYuxXg3YGKuNilUvNhE7u93wiK0=;
  b=Mz8FOgUC3leKdQLggxWbigkkNuPm8QgDzszCH0TREEI6HZNsE3lv4v+b
   O0B0VqOJADfoDJmozzyq52B8VZYalQyfY2N5mN5IepmE7qC+BiWGR4kIg
   QjhSnNMe24HDDY7HvXhU0hLGJDx5rYmmLPn6fyXIfh9zz0ctxXg8UVos6
   Z7khMoZ/eFdw7e4s+A+fIof7r3j3emTRrsMDpDjqqXsMa0/Qpl34T2N6O
   wB0HWLABHEREUFECq5qZD6L6wFcbFmTIjAjgPjncs+BJMkvo1fQnMWdem
   E2UU40AnbvxBICgQhvoEnSlrefHOPz6GB+AlWjixEwGGcDdUK+x0HRyey
   w==;
X-CSE-ConnectionGUID: Aep3GV3eRXakngiNVIAYLA==
X-CSE-MsgGUID: 2qYjKl8xRsKF3erG8ZVjYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="28951480"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="28951480"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 01:02:51 -0700
X-CSE-ConnectionGUID: Ru9knKB5T2aOvsQK7mzZjw==
X-CSE-MsgGUID: Y9wm3SJRQ3quoh0NVSlpUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="105788930"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Sep 2024 01:02:49 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spNjy-0007W9-2j;
	Sat, 14 Sep 2024 08:02:46 +0000
Date: Sat, 14 Sep 2024 16:02:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 16810/23712]
 drivers/misc/uacce/uacce.c:739:13: error: implicit declaration of function
 'module_refcount'
Message-ID: <202409141543.TAtQxl6W-lkp@intel.com>
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
head:   37aeb7e817053fbf532b214aa02858b3c23af0b1
commit: 451823febcb610969f048556cedc41b5e08fafb1 [16810/23712] UACCE backport from mainline
config: arm64-randconfig-003-20240913 (https://download.01.org/0day-ci/archive/20240914/202409141543.TAtQxl6W-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409141543.TAtQxl6W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141543.TAtQxl6W-lkp@intel.com/

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
