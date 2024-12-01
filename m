Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC3E70803
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 14:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733065075; cv=none; b=AijVHwvScSvFdXNqG2n596Lf6wUGABBmWPEbyUD4N0ncVPVEZPyNEc4mB3YhaOjsT9rFNM5qrY/ytyD3t4CmOADa47EC6sPHCR3aFKM2ceEkGUxJSvhgIEBgTH1E30w0k/YWHSUpEL92CxHkp6ExHi9JtQgCl1JvyN1jqibB/3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733065075; c=relaxed/simple;
	bh=n/g4jYS8xZp0DP1e5eouEXOqmsJ539KcvN78+upW5Fc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gKp/35COmZ3IxyJqahQQKYIyFsgJLZ3IfPRDgKvIxxfeZmQmicMVTZHNXgv8MrljWb5YhRZ/uLiDNIOP3Wv65ihRv4N2S8d7JJsbK4VkdAZFyriu8pETHuneNi/7rBrnNHJk054ojhMXANYkdhF7u/IENhgrtqjoSLtiGthJoDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IuwoUwLa; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IuwoUwLa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733065073; x=1764601073;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n/g4jYS8xZp0DP1e5eouEXOqmsJ539KcvN78+upW5Fc=;
  b=IuwoUwLaMHfBQvVM06iC6bYCx1hvOtnO9oSajA4CAOBOlTJz/0sFBvfR
   Ai/I7nB20jC1q8HTR251ojWfudxWRsvhfLVkLNowvl7NZkxOE71+qv4y8
   vv3aOtTA2G/p+IrOw0ngAaG9rvQkyX2ns3AOHQLUTeQRgFjhwvxUzHVkU
   Cx3uD7ywEsTtfkjavhUrZVqdEWTKJ/kad1jY7muDF/xqB5KIP6O5+oRYr
   USevNdWWDqrRm2ls7GMsz9WvGdhb0woBJYxCzVSMXOafxkaNNLdkYWVp5
   rtPweK3JoQKPSfIu4JkMthFPIh04yoJURNMKWQu0vX44iryeFWM1cVQOb
   Q==;
X-CSE-ConnectionGUID: IpDiAQD8Tda5WZcJ0ctIfA==
X-CSE-MsgGUID: TsuELtM/RymI3KGx9eNjMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="36902035"
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="36902035"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 06:57:52 -0800
X-CSE-ConnectionGUID: lKk4k3d1Sj2rapGOA3YmFw==
X-CSE-MsgGUID: Mr8aeOtPRT25b8F8Ehp7ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="92983478"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 01 Dec 2024 06:57:51 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHlOP-0001bh-09;
	Sun, 01 Dec 2024 14:57:49 +0000
Date: Sun, 1 Dec 2024 22:56:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1294/1294]
 drivers/misc/uacce/uacce.c:739:6: error: implicit declaration of function
 'module_refcount'
Message-ID: <202412012257.hGdfU2Vv-lkp@intel.com>
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
head:   b5504db0db8375a77340b5bb54c17cfb75d3c754
commit: 451823febcb610969f048556cedc41b5e08fafb1 [1294/1294] UACCE backport from mainline
config: x86_64-buildonly-randconfig-002-20241113 (https://download.01.org/0day-ci/archive/20241201/202412012257.hGdfU2Vv-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412012257.hGdfU2Vv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412012257.hGdfU2Vv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/misc/uacce/uacce.c:739:6: error: implicit declaration of function 'module_refcount' [-Werror,-Wimplicit-function-declaration]
     739 |         if (module_refcount(uacce->pdev->driver->owner) > 0)
         |             ^
   drivers/misc/uacce/uacce.c:1032:16: warning: unused variable 'uacce' [-Wunused-variable]
    1032 |         struct uacce *uacce = UACCE_FROM_CDEV_ATTR(dev);
         |                       ^~~~~
   drivers/misc/uacce/uacce.c:1046:16: warning: unused variable 'uacce' [-Wunused-variable]
    1046 |         struct uacce *uacce = UACCE_FROM_CDEV_ATTR(dev);
         |                       ^~~~~
   2 warnings and 1 error generated.


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
