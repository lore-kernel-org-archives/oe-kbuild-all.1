Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B251FCFE5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jan 2025 10:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737973490; cv=none; b=lP+EqP4KDHOq7iqYRfjEkLJgLaXpFr7CYsoQ0xx1LwvK6wcZsRiIEvveExJWvUMHMzeMaOE5PC7JRnaHdsTlpFKKj0YHEZYrooE0LKaAplCcxE2zyY8p7k0BiOV4OAaNdF0HpiaWUTN909YqYcTpPyFdeqyCzOYnIBt6LxjDFzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737973490; c=relaxed/simple;
	bh=QM5anTpqjM4NJUpIZUzd6cMYL+oZEMFWO0nk+sk4eGs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QNGt/EqMejwwOYA6GbTP8rT6nKJ9SA6XqjbWqXg65V558YbbOCvVqoqik4LGOLq9njURcnVcjq5PX3od90YmFirgahiDPVPjzm9dXwmPhemU9B0/vsJ9UasDNv8eyvjAiwaJxMtN8ruATzdrfgfb7cCtc1PGMcwo50+0iaIWXN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K9Olmbx2; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K9Olmbx2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737973489; x=1769509489;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QM5anTpqjM4NJUpIZUzd6cMYL+oZEMFWO0nk+sk4eGs=;
  b=K9Olmbx2SdmkvcWVUKgn4zuFi2oORpUdEarziYKQvX7cm6o1tLzQ98Oc
   WkC2woVkr/0qvz10uP+1xXvLZCG2JXfLEzepSARWy29ayNV1jyhbmx4x0
   y3+0JP0HT/gavJd57kQkHhkcR4IemmfRbcYud5DPKKtgr0KxWgNEmFtDd
   CItpbEWZYqwyL1Sosxb0P2ZiKcRMsq6fnesy/dU+KHKGzcMuy6pKJznlm
   nCbuzXkVBzQsGVV8caPPoU4R3bXPMhA6LZ4RF3BZ7Rlr595i6OTdxEBk4
   MCZvgeH+Bvq9ikymIKGJSN9kc4ri9JuaZaH8kIa73JhlGBNmMWQnZyHH4
   w==;
X-CSE-ConnectionGUID: sqFfs6oJRGKOehJuuAfDJA==
X-CSE-MsgGUID: Hd0TPgFaRYuARxSfZkCRuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="38337172"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; 
   d="scan'208";a="38337172"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 02:24:47 -0800
X-CSE-ConnectionGUID: sxSsJ5/HRaeVBBnGYQilPQ==
X-CSE-MsgGUID: e2GL5g/5Qc2OtMVWRlQMeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="131688394"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Jan 2025 02:24:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcMIN-000geZ-1b;
	Mon, 27 Jan 2025 10:24:43 +0000
Date: Mon, 27 Jan 2025 18:23:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20250124 1/15]
 kernel/sched/ext.c:3872:24: error: returning 'struct cgroup_hdr *' from a
 function with incompatible return type 'struct cgroup *'
Message-ID: <202501271831.aVHIfaqV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20250124
head:   54447c8c7cc239e559f3b58a7a70d9b776ed9b03
commit: 3cbd577a7864cca3fe87e22054d95e2238b6592b [1/15] cgroup: Avoid -Wflex-array-member-not-at-end warnings
config: arm-randconfig-002-20250127 (https://download.01.org/0day-ci/archive/20250127/202501271831.aVHIfaqV-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250127/202501271831.aVHIfaqV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501271831.aVHIfaqV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:63:
   kernel/sched/ext.c: In function 'tg_cgrp':
>> kernel/sched/ext.c:3872:24: error: returning 'struct cgroup_hdr *' from a function with incompatible return type 'struct cgroup *' [-Wincompatible-pointer-types]
    3872 |                 return &cgrp_dfl_root.cgrp;
         |                        ^~~~~~~~~~~~~~~~~~~
   kernel/sched/ext.c: In function 'scx_bpf_task_cgroup':
>> kernel/sched/ext.c:7648:31: error: initialization of 'struct cgroup *' from incompatible pointer type 'struct cgroup_hdr *' [-Wincompatible-pointer-types]
    7648 |         struct cgroup *cgrp = &cgrp_dfl_root.cgrp;
         |                               ^
   In file included from kernel/sched/build_policy.c:52:
   kernel/sched/rt.c: At top level:
   kernel/sched/rt.c:9:18: warning: 'max_rt_runtime' defined but not used [-Wunused-const-variable=]
       9 | static const u64 max_rt_runtime = MAX_BW;
         |                  ^~~~~~~~~~~~~~


vim +3872 kernel/sched/ext.c

f0e1a0643a59bf Tejun Heo 2024-06-18  3860  
8195136669661f Tejun Heo 2024-09-04  3861  #ifdef CONFIG_EXT_GROUP_SCHED
8195136669661f Tejun Heo 2024-09-04  3862  static struct cgroup *tg_cgrp(struct task_group *tg)
8195136669661f Tejun Heo 2024-09-04  3863  {
8195136669661f Tejun Heo 2024-09-04  3864  	/*
8195136669661f Tejun Heo 2024-09-04  3865  	 * If CGROUP_SCHED is disabled, @tg is NULL. If @tg is an autogroup,
8195136669661f Tejun Heo 2024-09-04  3866  	 * @tg->css.cgroup is NULL. In both cases, @tg can be treated as the
8195136669661f Tejun Heo 2024-09-04  3867  	 * root cgroup.
8195136669661f Tejun Heo 2024-09-04  3868  	 */
8195136669661f Tejun Heo 2024-09-04  3869  	if (tg && tg->css.cgroup)
8195136669661f Tejun Heo 2024-09-04  3870  		return tg->css.cgroup;
8195136669661f Tejun Heo 2024-09-04  3871  	else
8195136669661f Tejun Heo 2024-09-04 @3872  		return &cgrp_dfl_root.cgrp;
8195136669661f Tejun Heo 2024-09-04  3873  }
8195136669661f Tejun Heo 2024-09-04  3874  

:::::: The code at line 3872 was first introduced by commit
:::::: 8195136669661fdfe54e9a8923c33b31c92fc1da sched_ext: Add cgroup support

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
