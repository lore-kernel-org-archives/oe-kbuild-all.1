Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A481799D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Mar 2024 09:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710669502; cv=none; b=cgoEbaNvJOJOs3/R87Yg4AZ15iJD9h3B+dx/a0w+HSMzR5t+b74wwkxiftLDc4EBjAG4WUyxUrqjQqm4bRG/LGvt8HLHmGnVMLWVQCgLTTwWBXKPp4fnq9ZPZWwsSrJV2j43d9DsY9FsvppF8JzCzGL1X/qqilHXcqEJgkiiQwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710669502; c=relaxed/simple;
	bh=9jMvCtKx/Rq7t/b1SpI1zxChvUdv/w4bs64SH+wV5wI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fEDLNJaOjN6NQMy668C+OM/9tCDoRMyVGaqHRyMdsNwIDd2DiMyVF8v4eKhzWHYQgSBD7xDS92eDWOeS5ML1pEui99xretxF1qs2DTTLjlXOEr7ego+SwLcw9+FxscVLlqXOFucvynjqEyfJStS101cuqatsGFQBnjvyCVFm54E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RnpkQuKm; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RnpkQuKm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710669500; x=1742205500;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9jMvCtKx/Rq7t/b1SpI1zxChvUdv/w4bs64SH+wV5wI=;
  b=RnpkQuKmFxeOuDEgx5JZ6wZlG1uS7UPBYMbJ//Z63jY9p+9w7e29tLqR
   MP2PHwfpK0Xjk+5jyDbEwaUSmv75ADUc2ITywTl6hCCJ8+dFz/CYa2pA4
   9fXYLDZKLc98DyubFKuI0iU21yiq50Yyc4+ou3dUC4p8iawKsdbReO4PI
   0EIQ1aT0+f8W5ryIdNoa+e4NX8fpSBwqQO4ywq6sTtZ2nT0AGs7xiPInv
   OVdWdjGAMXS2iPffZdpDUZkelfX6gsAJ/ILGR9sT6x3I1OkD1/t2TB2Nv
   OULK283mnlY+5Q/Wn4y1o7ZDFLeNTXhSpAKB+FTECGbvlLrLl97jaavBN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11015"; a="9267554"
X-IronPort-AV: E=Sophos;i="6.07,132,1708416000"; 
   d="scan'208";a="9267554"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2024 02:58:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,132,1708416000"; 
   d="scan'208";a="13214229"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Mar 2024 02:58:16 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlnHR-000GAD-2S;
	Sun, 17 Mar 2024 09:58:13 +0000
Date: Sun, 17 Mar 2024 17:57:31 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 26621/27507]
 kernel/./sched/sched.h:1564:15: warning: cast from 'void (*)(struct rq *)'
 to 'void (*)(struct callback_head *)' converts to incompatible function type
Message-ID: <202403171739.cXvfWRy8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   fdd5d0bfc620bd5147ff5b260822c7645aeddad6
commit: 8c349ffc51023fda37f53e5e5589fb823cf59778 [26621/27507] rue/cpu: Add basic rue module support for SCHED_BT
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240317/202403171739.cXvfWRy8-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240317/202403171739.cXvfWRy8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403171739.cXvfWRy8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/rue.c:8:
>> kernel/./sched/sched.h:1564:15: warning: cast from 'void (*)(struct rq *)' to 'void (*)(struct callback_head *)' converts to incompatible function type [-Wcast-function-type-strict]
    1564 |         head->func = (void (*)(struct callback_head *))func;
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +1564 kernel/./sched/sched.h

518cd62341786a Peter Zijlstra 2011-12-07  1553  
e3fca9e7cbfb72 Peter Zijlstra 2015-06-11  1554  static inline void
e3fca9e7cbfb72 Peter Zijlstra 2015-06-11  1555  queue_balance_callback(struct rq *rq,
e3fca9e7cbfb72 Peter Zijlstra 2015-06-11  1556  		       struct callback_head *head,
e3fca9e7cbfb72 Peter Zijlstra 2015-06-11  1557  		       void (*func)(struct rq *rq))
e3fca9e7cbfb72 Peter Zijlstra 2015-06-11  1558  {
e3fca9e7cbfb72 Peter Zijlstra 2015-06-11  1559  	lockdep_assert_held(&rq->lock);
e3fca9e7cbfb72 Peter Zijlstra 2015-06-11  1560  
e3fca9e7cbfb72 Peter Zijlstra 2015-06-11  1561  	if (unlikely(head->next))
e3fca9e7cbfb72 Peter Zijlstra 2015-06-11  1562  		return;
e3fca9e7cbfb72 Peter Zijlstra 2015-06-11  1563  
e3fca9e7cbfb72 Peter Zijlstra 2015-06-11 @1564  	head->func = (void (*)(struct callback_head *))func;
e3fca9e7cbfb72 Peter Zijlstra 2015-06-11  1565  	head->next = rq->balance_callback;
e3fca9e7cbfb72 Peter Zijlstra 2015-06-11  1566  	rq->balance_callback = head;
e3fca9e7cbfb72 Peter Zijlstra 2015-06-11  1567  }
e3fca9e7cbfb72 Peter Zijlstra 2015-06-11  1568  

:::::: The code at line 1564 was first introduced by commit
:::::: e3fca9e7cbfb72694a21c886fcdf9f059cfded9c sched: Replace post_schedule with a balance callback list

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
