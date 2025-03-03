Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9989318B494
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Mar 2025 04:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740974677; cv=none; b=r0H4CJzfg6M4uQ/wmDqElsfVTMcdE/hJ98/XyQImCgpVzXTjAK97wahHRTnix9FOnbUPGMS2Bsj62v5kcPSdZFQ7l4/Hdcm0LAoOBoZHw5PNjPlo6eLYbH+6DwjFiQ/QbUH2IQbNyp9UJ1IVGpUE1TZJUs6+Uhc15pcdkrQcPWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740974677; c=relaxed/simple;
	bh=O8t81v+t3zErdDVgznqw67w5wP0XZ7VK+m02m3rJd4U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uJOX5xYRJquB7UrBEnf6pVe2bEZX5WYIQlANhaLfar2/x8E7I4EUXlj74NLo8DCltXKIt9HcSQt1P5SxABOp5kBsmoc3zhA9MbOTrxCzuA3FJofFTlSRwArByQT9hRTHjX0MjpRcsAEMDtMwzLYvuiWyqpQ3tC4aCHAvaj3E7Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H0KXU4wt; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H0KXU4wt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740974676; x=1772510676;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O8t81v+t3zErdDVgznqw67w5wP0XZ7VK+m02m3rJd4U=;
  b=H0KXU4wt3vzAJ+NGqPBpsxejeFuJC5RMNSMpMTMmGD3naPsudqM4AgA+
   GoheYhmRoVBKAv2cROW+DlfucWNMKD1pqmt423ajhx4Oddoh1O/67ZYuT
   X8t3j3pqv4gIU6Bd17aG5ZNpr2LbcQvp5o+iOjQvPYNl6TWx84Ec0uRKt
   gVGxNBW3VYPrCuTennroCDgZL4aD51Djvq0BCVDRsySjInanQ8pAGLI+Y
   hdwTo0Wn7PGtAGwBkz22EtohkAQS6h4By+MmIo9xlRywmQzkyTvrCMGCn
   GB0dlWnCEXjFJK8x7xM8eq06WOtOHb/wuxlkbEgbK5tJfcD+IxgLmV8+n
   g==;
X-CSE-ConnectionGUID: ywsi2X2NQAyhK44mkqRpmg==
X-CSE-MsgGUID: o/5L6gmYQymjzDYCjbMGqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="41011326"
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="41011326"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 20:04:35 -0800
X-CSE-ConnectionGUID: cVDUIX6RQIibMFpct89eDw==
X-CSE-MsgGUID: b49+Xso8QlWBClxDUz2uaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="117634927"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 02 Mar 2025 20:04:33 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tox2H-000Hv3-2I;
	Mon, 03 Mar 2025 04:04:17 +0000
Date: Mon, 3 Mar 2025 12:03:20 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 1/1] kernel/sched/fair.c:1679:22:
 warning: no previous prototype for '__pick_first_entity'
Message-ID: <202503031113.ykXCnEMv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   413645820de6d715e23ec6200a3e5a469ec69672
commit: 9372f9beab4213be5b70136fe15a6cdc3b034be3 [1/1] ck: sched: introduce group identity 'smt expeller'
config: x86_64-anolis-intel-cloud-devel-5.10 (https://download.01.org/0day-ci/archive/20250303/202503031113.ykXCnEMv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250303/202503031113.ykXCnEMv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503031113.ykXCnEMv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/fair.c:1679:22: warning: no previous prototype for '__pick_first_entity' [-Wmissing-prototypes]
    1679 | struct sched_entity *__pick_first_entity(struct cfs_rq *cfs_rq)
         |                      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'migrate_task_rq_fair':
   kernel/sched/fair.c:8052:21: warning: variable 'min_vruntime' set but not used [-Wunused-but-set-variable]
    8052 |                 u64 min_vruntime;
         |                     ^~~~~~~~~~~~


vim +/__pick_first_entity +1679 kernel/sched/fair.c

9372f9beab4213 kernel/sched/fair.c Michael Wang   2020-08-05  1678  
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra 2011-10-25 @1679  struct sched_entity *__pick_first_entity(struct cfs_rq *cfs_rq)
bf0f6f24a1ece8 kernel/sched_fair.c Ingo Molnar    2007-07-09  1680  {
b37e67a6c64803 kernel/sched/fair.c Michael Wang   2020-08-04  1681  	struct rb_node *left = id_rb_first_cached(cfs_rq);
f4b6755fb37595 kernel/sched_fair.c Peter Zijlstra 2008-11-04  1682  
f4b6755fb37595 kernel/sched_fair.c Peter Zijlstra 2008-11-04  1683  	if (!left)
f4b6755fb37595 kernel/sched_fair.c Peter Zijlstra 2008-11-04  1684  		return NULL;
f4b6755fb37595 kernel/sched_fair.c Peter Zijlstra 2008-11-04  1685  
1e922847e9c480 kernel/sched/fair.c Peter Zijlstra 2021-05-31  1686  	return __node_2_se(left);
bf0f6f24a1ece8 kernel/sched_fair.c Ingo Molnar    2007-07-09  1687  }
bf0f6f24a1ece8 kernel/sched_fair.c Ingo Molnar    2007-07-09  1688  

:::::: The code at line 1679 was first introduced by commit
:::::: 029632fbb7b7c9d85063cc9eb470de6c54873df3 sched: Make separate sched*.c translation units

:::::: TO: Peter Zijlstra <a.p.zijlstra@chello.nl>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
