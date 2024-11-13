Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D270249EB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 15:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731510952; cv=none; b=uSfET99APQu0+mE7OOPu6/4Xuq+N0xt9t9q5cHlyZTjAMz0vRGaTNd6n9YRiPY0GjFuazj/1mjYPPq+WtFpSMJ9+R7lGdhLaJmVmgckOgXQZc6OrOV6t/N9nMfEfbLOWg5OIt9UA5QOhPLwade/AVg6g3mNfbDEzZMnoe5I+5V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731510952; c=relaxed/simple;
	bh=JhrXWLVz5TqDi4En0Q75Dc2ws2MZm6MJ9SaBdLtEnew=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F30g8Evbe2/8ju1yaj6JFSV2XL1RJnqZqV+TdMoFvYvfVdKuR7zGfCDnTZrPqLyp7TehREvdpT7+t93b/IW/5lr4uesD0W2qO+PtF/nxX4/n23eTJleRrQYmpFsaaoEOZ64cRvdQX4ZkRA5nOsHQr61ux8cH+O2mSlapBUNsL1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QZNHJwQU; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QZNHJwQU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731510949; x=1763046949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JhrXWLVz5TqDi4En0Q75Dc2ws2MZm6MJ9SaBdLtEnew=;
  b=QZNHJwQUvAiplIGY4tqhYmN+5WoMpjKI8Pe6WorGjt1/IJ64iPw50gym
   vikO3ZDptrZklG/TlilC8lp0phC40rcn3uSYmi02du+HG9uft5CffcSxV
   1aGsB17rlTpBN2Dhj/3sKjmEXQX/D0Wd+FywGXabFMhmuogvoxfNW6kdh
   Ts9sY3WeLdcGIS1TKC0lllF8RwCcix9h8/+R+N1vw24WhIvEnWQQpX8Hc
   PYpreCe9FZ3uGiW/aBzCzYFXH2eZ34J28OcQFDJSQT5lmSjVq6jSr7TPS
   o0jajCklsSlcTo8EhIM5KjVY8rDrTZnHU6ftRVRr5FZk46mYeXI+oZPwi
   g==;
X-CSE-ConnectionGUID: IQ6h2kTMS1WL4N3PvbQAPw==
X-CSE-MsgGUID: VVs0uLXTS3ezwGYkti0EUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="42798075"
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; 
   d="scan'208";a="42798075"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 07:15:48 -0800
X-CSE-ConnectionGUID: tYXLNLpWTIiOWLLJqzlZZA==
X-CSE-MsgGUID: dBAWsRlPSNOPjg4ktmatJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; 
   d="scan'208";a="118725341"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Nov 2024 07:15:47 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBF5s-0000UG-2W;
	Wed, 13 Nov 2024 15:15:44 +0000
Date: Wed, 13 Nov 2024 23:14:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1294/1294]
 drivers/misc/uacce/uacce.c:739:6: error: implicit declaration of function
 'module_refcount'
Message-ID: <202411132335.bYokl2ag-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a81d020c58c2c6a55ebaf15846470a9ecb69bd1a
commit: 451823febcb610969f048556cedc41b5e08fafb1 [1294/1294] UACCE backport from mainline
config: x86_64-buildonly-randconfig-002-20241113 (https://download.01.org/0day-ci/archive/20241113/202411132335.bYokl2ag-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411132335.bYokl2ag-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411132335.bYokl2ag-lkp@intel.com/

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
