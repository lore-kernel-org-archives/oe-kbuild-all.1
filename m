Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3142755E3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Feb 2025 20:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740602415; cv=none; b=HglkxG3+7KFRmwsypQarh6DThJ4CxyL0qL729rqcAbCRCe2u9vRn7+LjHykEhgvbEAWpwCk37HqM8l31SCIhFsjP/CYqPLMxSL7R7GhkdRGXPGdmb0ruLeifETxcB6MommGbGLsvPV30KupH8/kAht+nuEKJsvlug3PguIz4ntM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740602415; c=relaxed/simple;
	bh=Gdd2Qz27BWvgsSB7r9zBUCDMjvFMHlvm9XuPqLqYUEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KCQNOlx/hlSPlENV7LY7zVoUo3rgtUUOGireps6N7zHXjVYRbnznXjlLGYuSWVT2ZVznO9TOPFp8XKw4qOpAeerghd1YLuJ1wXoJB7MHIJBwfsC+L/pXKtcv6qZAcSjVw/CcWDAl0gSyBcKlNv0L1LnaTdBWAd5kpj/mRJ7BGF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NteXnqZF; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NteXnqZF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740602413; x=1772138413;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gdd2Qz27BWvgsSB7r9zBUCDMjvFMHlvm9XuPqLqYUEQ=;
  b=NteXnqZFoUBaOvWj5CaNCeUw/Us8KTRSzFIwz+fgvOAfr+gGJtrdxpvU
   RZxGJ9kpBc2oOgsGQPA+2qZwdJ0L0J6Xv58Y+rxlOAND8qCoDnCI6DgSy
   R1aYZwggXyXQZDSPtNIm6bfRxIx7yB1N71lUU6XqxnWUaWhpSDOsJmL2J
   wqvDGl5qfI936+SwgOKj0mpHu7nDVb+2wwUMsrlOe1+qwz8WA8LINyjgc
   3kq/P/kLFbjoEfP9L5X+c0oekBABMADs+ZgTkh0vnhyk7wyMjes/ZCbaO
   ZOKIhniNeE2/DaFnTzqeZY8q+J7CGJJYzScM9XPy2CFa08r85F4FHY852
   A==;
X-CSE-ConnectionGUID: r4MtLxoESm+nR9Iz63UXPA==
X-CSE-MsgGUID: lHxT7KArRxK8PLuJ/vh6iA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="40647485"
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; 
   d="scan'208";a="40647485"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 12:40:12 -0800
X-CSE-ConnectionGUID: /rVphQK9QEaDoUutMok57A==
X-CSE-MsgGUID: gzMa/QcSTWCWIKBQ+Z19jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116680525"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 26 Feb 2025 12:40:12 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnOCP-000CRO-0m;
	Wed, 26 Feb 2025 20:40:09 +0000
Date: Thu, 27 Feb 2025 04:40:04 +0800
From: kernel test robot <lkp@intel.com>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlelli:upstream/deadline/domains-suspend 2/4]
 kernel/sched/rt.c:2913:21: error: 'sched_domains_mutex' undeclared; did you
 mean 'sched_domain_attr'?
Message-ID: <202502270405.Ylqqb1rO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jlelli/linux.git upstream/deadline/domains-suspend
head:   78c2e4083eeedc3526f07bedfca514eefbe45e38
commit: dfdff94e7f88b77e61e6cf8ec6aeea320fa12e7e [2/4] sched/deadline: Generalize unique visiting of root domains
config: riscv-randconfig-002-20250227 (https://download.01.org/0day-ci/archive/20250227/202502270405.Ylqqb1rO-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502270405.Ylqqb1rO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502270405.Ylqqb1rO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/seqlock.h:19,
                    from include/linux/mmzone.h:17,
                    from arch/riscv/include/asm/pgtable.h:9,
                    from arch/riscv/include/asm/uaccess.h:13,
                    from include/linux/uaccess.h:12,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/sched/cputime.h:5,
                    from kernel/sched/build_policy.c:17:
   kernel/sched/rt.c: In function 'sched_rt_handler':
>> kernel/sched/rt.c:2913:21: error: 'sched_domains_mutex' undeclared (first use in this function); did you mean 'sched_domain_attr'?
    2913 |         mutex_lock(&sched_domains_mutex);
         |                     ^~~~~~~~~~~~~~~~~~~
   include/linux/mutex.h:166:44: note: in definition of macro 'mutex_lock'
     166 | #define mutex_lock(lock) mutex_lock_nested(lock, 0)
         |                                            ^~~~
   kernel/sched/rt.c:2913:21: note: each undeclared identifier is reported only once for each function it appears in
    2913 |         mutex_lock(&sched_domains_mutex);
         |                     ^~~~~~~~~~~~~~~~~~~
   include/linux/mutex.h:166:44: note: in definition of macro 'mutex_lock'
     166 | #define mutex_lock(lock) mutex_lock_nested(lock, 0)
         |                                            ^~~~


vim +2913 kernel/sched/rt.c

  2904	
  2905	static int sched_rt_handler(const struct ctl_table *table, int write, void *buffer,
  2906			size_t *lenp, loff_t *ppos)
  2907	{
  2908		int old_period, old_runtime;
  2909		static DEFINE_MUTEX(mutex);
  2910		int ret;
  2911	
  2912		mutex_lock(&mutex);
> 2913		mutex_lock(&sched_domains_mutex);
  2914		old_period = sysctl_sched_rt_period;
  2915		old_runtime = sysctl_sched_rt_runtime;
  2916	
  2917		ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
  2918	
  2919		if (!ret && write) {
  2920			ret = sched_rt_global_validate();
  2921			if (ret)
  2922				goto undo;
  2923	
  2924			ret = sched_dl_global_validate();
  2925			if (ret)
  2926				goto undo;
  2927	
  2928			ret = sched_rt_global_constraints();
  2929			if (ret)
  2930				goto undo;
  2931	
  2932			sched_rt_do_global();
  2933			sched_dl_do_global();
  2934		}
  2935		if (0) {
  2936	undo:
  2937			sysctl_sched_rt_period = old_period;
  2938			sysctl_sched_rt_runtime = old_runtime;
  2939		}
  2940		mutex_unlock(&sched_domains_mutex);
  2941		mutex_unlock(&mutex);
  2942	
  2943		return ret;
  2944	}
  2945	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
