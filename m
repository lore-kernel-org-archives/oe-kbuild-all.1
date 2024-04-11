Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FDD134D1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 17:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712858363; cv=none; b=fBs9wq/9eWy1G92HuwKtnlHetWd6FdRi/XtkdQj8WxTayOpB7HnkzCxL+A+MXwVvPrgUjcfJyOB1BKIRBQGAWFUO88a//JdqgWzQ8I0QcxaWwtkegSt00pXdrMsxuu0qoCYdOFHIr2Yjm3YKBr9SEpWRBIaOXEi1CG/nOGJfmOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712858363; c=relaxed/simple;
	bh=pUbULx1QuE/X5GBUuz+Q1l0a/sg3EN8jZOq2tZxx+Rs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kvtHl0IiFK00qcO7LXJFDpXlg+JSWAgzHL6ucn5tNZ4AD5e2b+L4cli9Zc6ZtSgD48n9zJx7dk4YLn2OGlEu4ZFzqZP+ID5X5KcTpzg8ZZ7tO83pEQh3qwWhXIGIVOUQPEGPFfOpsM2+165tEjvKogJHCYjrRNcxN5v5cOw6/4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ihAeVjav; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ihAeVjav"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712858362; x=1744394362;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pUbULx1QuE/X5GBUuz+Q1l0a/sg3EN8jZOq2tZxx+Rs=;
  b=ihAeVjavrKA7TDOhGAHw9pA0KOpC7Pf+lrlJm/eI+3GFq3QdqT1qbHtO
   O2egbuNSx43PfV0Mmzj4cHP6MnIbnuxq5QVQ+b92/m6YMGUI9V3nFZain
   plmQGFJSHfEAsGP2ZmjBRHVMUKs2NE944d7kWOVVSLRF7qa2LmJ+pGxmx
   Id1JKSwLb8/ak+DB37eV/qKcWTNNiMY1PXzGbmtePAY/zwgPnjCDm86ys
   njA7mO/SC2vGvAsiMGIKlkUJGu0DLWBzr+LJ9nRyAEEaojiesT33gSbPj
   Rl30qk1QpgdE0To+L9klxHqwJld5RGVflGRivmUueFzemeL3cBvvOlfWe
   Q==;
X-CSE-ConnectionGUID: BVGcFmJGT8KqDn94UD/WyA==
X-CSE-MsgGUID: dnEQOgSNSFC+JihDN503Xg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8142313"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8142313"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 10:59:22 -0700
X-CSE-ConnectionGUID: +x3pxMM/Rxau7MpRzCg8+w==
X-CSE-MsgGUID: fMgMGm2RQlCR+ur9kbZdyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="21575716"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Apr 2024 10:59:21 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruyhi-0008rh-0m;
	Thu, 11 Apr 2024 17:59:18 +0000
Date: Fri, 12 Apr 2024 01:58:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wenyu Huang <huangwenyu5@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1657/7374] kernel/sched/fair.c:8325:9: error:
 implicit declaration of function 'sched_idle_cpu'; did you mean
 'sched_idle_rq'?
Message-ID: <202404120103.YG6kXg4w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8f7c77eb69ee331fb66fad8eec5ca81b8843eaf3
commit: 926b9b0cd97e640ee680347cf449c3dc152dddd2 [1657/7374] sched: Throttle qos cfs_rq when current cpu is running online task
config: x86_64-randconfig-123-20240412 (https://download.01.org/0day-ci/archive/20240412/202404120103.YG6kXg4w-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240412/202404120103.YG6kXg4w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404120103.YG6kXg4w-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/export.h:5,
                    from include/linux/linkage.h:7,
                    from include/linux/kernel.h:17,
                    from include/linux/cpumask.h:10,
                    from include/linux/energy_model.h:4,
                    from kernel/sched/fair.c:23:
   kernel/sched/fair.c: In function 'check_qos_cfs_rq':
>> kernel/sched/fair.c:8325:9: error: implicit declaration of function 'sched_idle_cpu'; did you mean 'sched_idle_rq'? [-Werror=implicit-function-declaration]
    8325 |        !sched_idle_cpu(smp_processor_id()) &&
         |         ^~~~~~~~~~~~~~
   include/linux/compiler.h:77:42: note: in definition of macro 'unlikely'
      77 | # define unlikely(x) __builtin_expect(!!(x), 0)
         |                                          ^
>> kernel/sched/fair.c:8328:21: error: 'struct rq' has no member named 'online'
    8328 |   if (!rq_of(cfs_rq)->online)
         |                     ^~
   kernel/sched/fair.c: In function 'pick_next_task_fair':
>> kernel/sched/fair.c:8531:7: error: 'struct rq' has no member named 'idle_stamp'; did you mean 'idle_state'?
    8531 |   rq->idle_stamp = 0;
         |       ^~~~~~~~~~
         |       idle_state
   kernel/sched/fair.c: At top level:
   kernel/sched/fair.c:8166:13: warning: 'start_qos_hrtimer' used but never defined
    8166 | static void start_qos_hrtimer(int cpu);
         |             ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +8325 kernel/sched/fair.c

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
