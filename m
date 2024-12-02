Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9061FBC84
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Dec 2024 10:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733135296; cv=none; b=gQCBcgfSMMXIu5A4U4+JwFEFBKivEznc9E5+vJG4HiuU8rlU0/I9iU1RvnpK326u7DYTkKa8+lOXNDwIXznuTrnYRsUre2llybrckgrpieN4d4rp/UA0uRLvKp1ZtxMNbCS8zd5PhEnAATuC5p4u03U1CwCgdspxXnVSiJjVVZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733135296; c=relaxed/simple;
	bh=M0CHUkuBfExU8tyF5um/t/lYOHvUmuo0hrRTspIMV9A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KkWDvZ8YMTE+mZRjhCF6K77ihWk2fDisrYKOo23mImK4+5gwbEL8AocNGzRnXcCQJ6ebsRado3MThfMx39x2ODaeB3szsdWZdoJnYau74JnraciluUSkYu1B7WsFW1b7IIjS8diWhzKJCFmiZv3CdoZjGyVeRVbw5OfW6XhUCiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EmDcCQrD; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EmDcCQrD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733135294; x=1764671294;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M0CHUkuBfExU8tyF5um/t/lYOHvUmuo0hrRTspIMV9A=;
  b=EmDcCQrD59FjE7h8EXwgp1kkS9iPZeGS2B4YOZRlJtUO0+N9djwQskSf
   qGV4nA6DLGhefp3tta/pOFsCSRU02eRNYstTjF1y4yM7o7VqfQPZfcMT4
   bjaLHUUn13JGXWU+wPYEHmI0KqZmdcTUikfHcEdWzeKsMMwkfTpo1ZrRz
   WnnfRm/ypN1lFpODm1Wlc92in119ZYgn3K+9txZUKSHYNsPJuT6E0FjQg
   msl42B6iyiuPMp3qvszF4/duoO6DvG6nEk6tzC+/JGJ4co5JJvLvDs/jJ
   31vb3jJCd2c8T5QqVdU2raNCPSuWA5qMpF2FaX97iK5MEo06cYtinp4uF
   w==;
X-CSE-ConnectionGUID: P5MIXwojQJysI2v3HKayXw==
X-CSE-MsgGUID: LC51WdKoQ2Gfm2mh6Kj0FA==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="33217227"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="33217227"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 02:28:13 -0800
X-CSE-ConnectionGUID: lwpneWvjSpanxtdAn2WkdA==
X-CSE-MsgGUID: 70RqHCdmT1ywu/PeBSvEsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="93542906"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 02 Dec 2024 02:28:12 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tI3f0-0002KE-0j;
	Mon, 02 Dec 2024 10:28:10 +0000
Date: Mon, 2 Dec 2024 18:27:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yanhaitao <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1455/1455] kernel/sched/psi.c:387:1: error:
 function definition is not allowed here
Message-ID: <202412021807.OmlvOFCb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lu,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   b3dd80fc71d804c0f15eb93352cf23452f7f2191
commit: 654944510822988390470cbc5b6f914c19dd9b88 [1455/1455] sched/psi: add cpu fine grained stall tracking in pressure.stat
config: x86_64-buildonly-randconfig-001-20241112 (https://download.01.org/0day-ci/archive/20241202/202412021807.OmlvOFCb-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412021807.OmlvOFCb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412021807.OmlvOFCb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:24:
   In file included from include/linux/cpuset.h:17:
   In file included from include/linux/mm.h:2181:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from kernel/sched/build_utility.c:97:
>> kernel/sched/psi.c:387:1: error: function definition is not allowed here
     387 | {
         | ^
   kernel/sched/psi.c:421:1: error: function definition is not allowed here
     421 | {
         | ^
   kernel/sched/psi.c:449:1: error: function definition is not allowed here
     449 | {
         | ^
   kernel/sched/psi.c:471:1: error: function definition is not allowed here
     471 | {
         | ^
   kernel/sched/psi.c:517:17: error: function definition is not allowed here
     517 |                                         bool next) {}
         |                                                    ^
   kernel/sched/psi.c:523:1: error: function definition is not allowed here
     523 | {
         | ^
   kernel/sched/psi.c:590:1: error: function definition is not allowed here
     590 | {
         | ^
   kernel/sched/psi.c:608:1: error: function definition is not allowed here
     608 | {
         | ^
   kernel/sched/psi.c:635:1: error: function definition is not allowed here
     635 | {
         | ^
   kernel/sched/psi.c:707:1: error: function definition is not allowed here
     707 | {
         | ^
   kernel/sched/psi.c:772:1: error: function definition is not allowed here
     772 | {
         | ^
   kernel/sched/psi.c:808:1: error: function definition is not allowed here
     808 | {
         | ^
   kernel/sched/psi.c:822:1: error: function definition is not allowed here
     822 | {
         | ^
   kernel/sched/psi.c:848:1: error: function definition is not allowed here
     848 | {
         | ^
   kernel/sched/psi.c:932:1: error: function definition is not allowed here
     932 | {
         | ^
   kernel/sched/psi.c:950:1: error: function definition is not allowed here
     950 | {
         | ^
   kernel/sched/psi.c:958:1: error: function definition is not allowed here
     958 | {
         | ^
   kernel/sched/psi.c:993:1: error: function definition is not allowed here
     993 | {
         | ^
   kernel/sched/psi.c:1107:1: error: function definition is not allowed here
    1107 | {
         | ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   1 warning and 20 errors generated.


vim +387 kernel/sched/psi.c

a65983d90bfb5e0 Lu Jialin 2024-01-04  383  
a65983d90bfb5e0 Lu Jialin 2024-01-04  384  static bool test_fine_grained_stat(unsigned int *stat_tasks,
a65983d90bfb5e0 Lu Jialin 2024-01-04  385  				   unsigned int nr_running,
a65983d90bfb5e0 Lu Jialin 2024-01-04  386  				   enum psi_stat_states state)
a65983d90bfb5e0 Lu Jialin 2024-01-04 @387  {
a65983d90bfb5e0 Lu Jialin 2024-01-04  388  	switch (state) {
a65983d90bfb5e0 Lu Jialin 2024-01-04  389  	case PSI_MEMCG_RECLAIM_SOME:
a65983d90bfb5e0 Lu Jialin 2024-01-04  390  		return unlikely(stat_tasks[NR_MEMCG_RECLAIM]);
a65983d90bfb5e0 Lu Jialin 2024-01-04  391  	case PSI_MEMCG_RECLAIM_FULL:
a65983d90bfb5e0 Lu Jialin 2024-01-04  392  		return unlikely(stat_tasks[NR_MEMCG_RECLAIM] &&
a65983d90bfb5e0 Lu Jialin 2024-01-04  393  		       nr_running == stat_tasks[NR_MEMCG_RECLAIM_RUNNING]);
25d00f6853c3c6c Lu Jialin 2024-01-04  394  	case PSI_GLOBAL_RECLAIM_SOME:
25d00f6853c3c6c Lu Jialin 2024-01-04  395  		return unlikely(stat_tasks[NR_GLOBAL_RECLAIM]);
25d00f6853c3c6c Lu Jialin 2024-01-04  396  	case PSI_GLOBAL_RECLAIM_FULL:
25d00f6853c3c6c Lu Jialin 2024-01-04  397  		return unlikely(stat_tasks[NR_GLOBAL_RECLAIM] &&
25d00f6853c3c6c Lu Jialin 2024-01-04  398  		       nr_running == stat_tasks[NR_GLOBAL_RECLAIM_RUNNING]);
25d00f6853c3c6c Lu Jialin 2024-01-04  399  	case PSI_COMPACT_SOME:
25d00f6853c3c6c Lu Jialin 2024-01-04  400  		return unlikely(stat_tasks[NR_COMPACT]);
25d00f6853c3c6c Lu Jialin 2024-01-04  401  	case PSI_COMPACT_FULL:
25d00f6853c3c6c Lu Jialin 2024-01-04  402  		return unlikely(stat_tasks[NR_COMPACT] &&
25d00f6853c3c6c Lu Jialin 2024-01-04  403  		       nr_running == stat_tasks[NR_COMPACT_RUNNING]);
25d00f6853c3c6c Lu Jialin 2024-01-04  404  	case PSI_ASYNC_MEMCG_RECLAIM_SOME:
25d00f6853c3c6c Lu Jialin 2024-01-04  405  		return unlikely(stat_tasks[NR_ASYNC_MEMCG_RECLAIM]);
25d00f6853c3c6c Lu Jialin 2024-01-04  406  	case PSI_ASYNC_MEMCG_RECLAIM_FULL:
25d00f6853c3c6c Lu Jialin 2024-01-04  407  		return unlikely(stat_tasks[NR_ASYNC_MEMCG_RECLAIM] &&
25d00f6853c3c6c Lu Jialin 2024-01-04  408  		      nr_running == stat_tasks[NR_ASYNC_MEMCG_RECLAIM_RUNNING]);
25d00f6853c3c6c Lu Jialin 2024-01-04  409  	case PSI_SWAP_SOME:
25d00f6853c3c6c Lu Jialin 2024-01-04  410  		return unlikely(stat_tasks[NR_SWAP]);
25d00f6853c3c6c Lu Jialin 2024-01-04  411  	case PSI_SWAP_FULL:
25d00f6853c3c6c Lu Jialin 2024-01-04  412  		return unlikely(stat_tasks[NR_SWAP] &&
25d00f6853c3c6c Lu Jialin 2024-01-04  413  		       nr_running == stat_tasks[NR_SWAP_RUNNING]);
a65983d90bfb5e0 Lu Jialin 2024-01-04  414  	default:
a65983d90bfb5e0 Lu Jialin 2024-01-04  415  		return false;
a65983d90bfb5e0 Lu Jialin 2024-01-04  416  	}
a65983d90bfb5e0 Lu Jialin 2024-01-04  417  }
a65983d90bfb5e0 Lu Jialin 2024-01-04  418  

:::::: The code at line 387 was first introduced by commit
:::::: a65983d90bfb5e031444fea492b32f931c83ffcf sched/psi: Introduce fine grained stall time collect for cgroup reclaim

:::::: TO: Lu Jialin <lujialin4@huawei.com>
:::::: CC: yanhaitao <yanhaitao2@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
