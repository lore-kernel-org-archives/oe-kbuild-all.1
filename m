Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3695A1FC7C5
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Dec 2024 10:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733135959; cv=none; b=VpNvjY02wGpc6m5nDwOInhSVzVstda7L1qEej4ThylbXfREytpR9V2l/4ZIZFFZjd8S/kH//+WZDurkjm1Q2YU2F+FZsfrmXA1u0uqsFN2qKpqTGDacrDoV34CvftaiX3uSGcUljdhR0NTT7VjPyJXB66sZAIn+Wrj819xvXzqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733135959; c=relaxed/simple;
	bh=+g1M5Ua9YLDdxYF2x6DwMSE2wHAQTzu5N1LrJAVtnhg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qCOPXxGIZC8ck+Q65giczeNHr6/akomzLIjUcXKtFEfNcPunxYA0uJ3frFRV6E0rg7WDLF47wCqYZCU6U9H1obIffLsd0cF7oDSNClr+V47NxPwx62QQGF1dkn59WXdPoi1JN/WT5oZFIGz99pKVtTUMtuxXBBCnJL1wl2iX0cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zq8jFNLL; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zq8jFNLL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733135958; x=1764671958;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+g1M5Ua9YLDdxYF2x6DwMSE2wHAQTzu5N1LrJAVtnhg=;
  b=Zq8jFNLL5FLAbZdKo8Ymu/eKUOFM+6cXNA+tL9qYivJK4ktyX8xjZgGy
   5BAQ362lhjYRMfsEW7RBs64Imiwb8dzP7QPB+aQKFf+kgZPMDpBqoJrHH
   WshU+F6hE82L1y4Z3SZ9qx/bsBdOEWeKVCLigUQFhEUWuMm5cXQ6b6g08
   4OC1noco+ldgdClo90zow9DCGe3y6KY8AKd+qdDF7t3aWP+3u4d0xRiqY
   DwR683RXJhKJn0vAy9KjBZZXa+EFB1LQCJ1oAzjzsUWRrnJBzkmjt1/Ze
   hThLSkY9fF/ipnq3NMbCSHw5FLOx17y6Nb36/sPElPGbEO5XW8VI0YcKc
   w==;
X-CSE-ConnectionGUID: rq02BSH/SDWYhyNlhqFQYg==
X-CSE-MsgGUID: Vl4K+DlOQNOJMFLFNdfwnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="36958770"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="36958770"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 02:39:17 -0800
X-CSE-ConnectionGUID: rCoDS4qVTtK8/nltPTMcqw==
X-CSE-MsgGUID: Y1qaVtW+Tx+wQas7BtyNAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="93908582"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 02 Dec 2024 02:39:16 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tI3pZ-0002Kt-12;
	Mon, 02 Dec 2024 10:39:12 +0000
Date: Mon, 2 Dec 2024 18:37:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wenyu Huang <huangwenyu5@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1455/1455] kernel/sched/fair.c:8325:9: error:
 call to undeclared function 'sched_idle_cpu'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202412021846.xYjhWfl0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   b3dd80fc71d804c0f15eb93352cf23452f7f2191
commit: 926b9b0cd97e640ee680347cf449c3dc152dddd2 [1455/1455] sched: Throttle qos cfs_rq when current cpu is running online task
config: x86_64-randconfig-005-20241112 (https://download.01.org/0day-ci/archive/20241202/202412021846.xYjhWfl0-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412021846.xYjhWfl0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412021846.xYjhWfl0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/fair.c:25:
   In file included from include/linux/hugetlb_inline.h:7:
   In file included from include/linux/mm.h:2174:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/sched/fair.c:8325:9: error: call to undeclared function 'sched_idle_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    8325 |                      !sched_idle_cpu(smp_processor_id()) &&
         |                       ^
   kernel/sched/fair.c:8325:9: note: did you mean 'sched_idle_rq'?
   kernel/sched/fair.c:6517:12: note: 'sched_idle_rq' declared here
    6517 | static int sched_idle_rq(struct rq *rq)
         |            ^
>> kernel/sched/fair.c:8328:23: error: no member named 'online' in 'struct rq'
    8328 |                 if (!rq_of(cfs_rq)->online)
         |                      ~~~~~~~~~~~~~  ^
>> kernel/sched/fair.c:8531:7: error: no member named 'idle_stamp' in 'struct rq'; did you mean 'idle_state'?
    8531 |                 rq->idle_stamp = 0;
         |                     ^~~~~~~~~~
         |                     idle_state
   kernel/sched/sched.h:1143:24: note: 'idle_state' declared here
    1143 |         struct cpuidle_state    *idle_state;
         |                                  ^
   1 warning and 3 errors generated.


vim +/sched_idle_cpu +8325 kernel/sched/fair.c

  8321	
  8322	static bool check_qos_cfs_rq(struct cfs_rq *cfs_rq)
  8323	{
  8324		if (unlikely(cfs_rq && cfs_rq->tg->qos_level < 0 &&
> 8325			     !sched_idle_cpu(smp_processor_id()) &&
  8326			     cfs_rq->h_nr_running == cfs_rq->idle_h_nr_running)) {
  8327	
> 8328			if (!rq_of(cfs_rq)->online)
  8329				return false;
  8330	
  8331			throttle_qos_cfs_rq(cfs_rq);
  8332			return true;
  8333		}
  8334	
  8335		return false;
  8336	}
  8337	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
