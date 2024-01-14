Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2221B17CA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jan 2024 03:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O8L4vHnf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705204412; x=1736740412;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o0EdXmH1gImSLNijiD1MoCp9s56pcy4QIcV9K8YrKQw=;
  b=O8L4vHnfiKPmbjK6fnGvhoKecQ04492kUjqu9v0YovX3YwsavhPEqAeK
   lkFsbA63HP8yyrgN++/nSxMIj2lQtGaDIznANKWQF0OvmhzpABi98LvQe
   XYjQ9W/ZZ0Bb0EyyjTaLBgN2GvRanJ7dtG0z1n1JgTwyAtDGNVoMhMjoI
   9TImq2QKKVmDswZPr/WgEV8P9+iyBoYmh0rs7kWRisIqyDVWnhfQs5UKL
   gTDuu+9d/TYuWvDhpLHtbW6DzlOij5n5T88mxVIHk4/Y2My7R7ZM8ADTP
   vybxxRvz3fxs41g50DwPtpJqkDdt6WmdJvLZEgy+/0adUNCfgaJ8jn09i
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="398295154"
X-IronPort-AV: E=Sophos;i="6.04,193,1695711600"; 
   d="scan'208";a="398295154"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 19:53:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,193,1695711600"; 
   d="scan'208";a="17807859"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 13 Jan 2024 19:53:30 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOrYt-000BAO-2c;
	Sun, 14 Jan 2024 03:53:27 +0000
Date: Sun, 14 Jan 2024 11:52:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 16810/21544]
 drivers/misc/uacce/uacce.c:739:13: error: implicit declaration of function
 'module_refcount'
Message-ID: <202401141109.vNlmyrX3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1f0983450549eeea71fb9333517330947a779262
commit: 451823febcb610969f048556cedc41b5e08fafb1 [16810/21544] UACCE backport from mainline
config: arm64-randconfig-002-20240112 (https://download.01.org/0day-ci/archive/20240114/202401141109.vNlmyrX3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240114/202401141109.vNlmyrX3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401141109.vNlmyrX3-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/misc/uacce/uacce.c: In function 'uacce_put_queue':
>> drivers/misc/uacce/uacce.c:739:13: error: implicit declaration of function 'module_refcount' [-Werror=implicit-function-declaration]
     739 |         if (module_refcount(uacce->pdev->driver->owner) > 0)
         |             ^~~~~~~~~~~~~~~
   drivers/misc/uacce/uacce.c: In function 'numa_distance_show':
   drivers/misc/uacce/uacce.c:1032:23: warning: unused variable 'uacce' [-Wunused-variable]
    1032 |         struct uacce *uacce = UACCE_FROM_CDEV_ATTR(dev);
         |                       ^~~~~
   drivers/misc/uacce/uacce.c: In function 'node_id_show':
   drivers/misc/uacce/uacce.c:1046:23: warning: unused variable 'uacce' [-Wunused-variable]
    1046 |         struct uacce *uacce = UACCE_FROM_CDEV_ATTR(dev);
         |                       ^~~~~
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
