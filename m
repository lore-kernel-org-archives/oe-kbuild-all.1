Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305542581
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 May 2024 17:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715449462; cv=none; b=ceiYStbNijw6FwdEuWJeQh8tJsmusIJLKwhNOeDGDyO8Xyl0Aw3Of5Ayz89HhmfGdGBVJ3affajFJEYuGqts/+PEgdHZ2LSu64lzH43FDtmnNoS3koduLuGH7Gu1fR2uxhQDrjw6hQL4cA+GiaUXxpv0ThsejZnhpIkWUXjQpFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715449462; c=relaxed/simple;
	bh=V/9/dKEHULLkDhBfY2biTuWxA9gVJRgz0N9q9nIDUqA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y2ov9OKgXBN5ex9zIeWyQGxI7FpNXuZY2sjB7TgDrwemQvORphiWoKEu2WoKEKIZXMUzmIAZKgD3qDK2x8cruMVytV+h5iCIojpTjNTdI3QCD5lVaR2eGwSNBSNH6ldYnvh14pe8Mvv65Bu1hLse3ctv2rsD+fdy0bt9TxDpoLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ONdAhd42; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ONdAhd42"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715449460; x=1746985460;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V/9/dKEHULLkDhBfY2biTuWxA9gVJRgz0N9q9nIDUqA=;
  b=ONdAhd429GS9pJq0NynDIee9m24QfXRCLk/SFXTrEZMSGDrdnNOLy5qi
   ZY4NPYvr2ndSQF1L/yRJrzr4WQmu8ITz+Aalt+AcEibmePgadA4Im1DGm
   0WS8bsV1cdvkZRTsrwzTrakJh8SuFLSay4asq9TpL4P7xTsi6oH5JeiEi
   oxibXmxt/7NDc2TG7axWVEjeaxpl1AK93rErnAapQQsj84uh0oH6yJ3t9
   1g92zLKFibU9SII5foHl1RO3gWAJBRbrhMFoq8ZsnKA32hkLXw9qKR5QR
   CCLcuOsKzYUN3mo+A/ouGg8sJw905vTBQ/H/xc07+xhAboVp8HJaL5+SI
   w==;
X-CSE-ConnectionGUID: MCOrRqYLRkygF8+vpn7Gyg==
X-CSE-MsgGUID: FUVPXf8hRRCbvPV1BVmUdg==
X-IronPort-AV: E=McAfee;i="6600,9927,11070"; a="33940018"
X-IronPort-AV: E=Sophos;i="6.08,154,1712646000"; 
   d="scan'208";a="33940018"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2024 10:44:19 -0700
X-CSE-ConnectionGUID: T8xtmVFyTy+5sVegxB7RnA==
X-CSE-MsgGUID: YWtBNkLPR9aSlk21B4U3lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,154,1712646000"; 
   d="scan'208";a="29887168"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 May 2024 10:44:19 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5qlc-0007hJ-1e;
	Sat, 11 May 2024 17:44:16 +0000
Date: Sun, 12 May 2024 01:43:48 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:improve-sched-cpufreq-interaction 1/1]
 kernel/sched/core.c:5169:31: warning: passing argument 1 of 'rt_policy'
 makes integer from pointer without a cast
Message-ID: <202405120127.CxRqfZ9a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux improve-sched-cpufreq-interaction
head:   7cf8a5268d5386ece305e160647503114338282b
commit: 7cf8a5268d5386ece305e160647503114338282b [1/1] sched: Consolidate cpufreq updates
config: arm-integrator_defconfig (https://download.01.org/0day-ci/archive/20240512/202405120127.CxRqfZ9a-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240512/202405120127.CxRqfZ9a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405120127.CxRqfZ9a-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/core.c: In function 'update_cpufreq_ctx_switch':
>> kernel/sched/core.c:5169:31: warning: passing argument 1 of 'rt_policy' makes integer from pointer without a cast [-Wint-conversion]
    5169 |                 if (rt_policy(prev)) {
         |                               ^~~~
         |                               |
         |                               struct task_struct *
   In file included from kernel/sched/core.c:87:
   kernel/sched/sched.h:193:33: note: expected 'int' but argument is of type 'struct task_struct *'
     193 | static inline int rt_policy(int policy)
         |                             ~~~~^~~~~~


vim +/rt_policy +5169 kernel/sched/core.c

  5136	
  5137	static inline void update_cpufreq_ctx_switch(struct rq *rq, struct task_struct *prev)
  5138	{
  5139	#ifdef CONFIG_CPU_FREQ
  5140		/*
  5141		 * RT and DL should always send a freq update. But we can do some
  5142		 * simple checks to avoid it when we know it's not necessary.
  5143		 *
  5144		 * iowait_boost will always trigger a freq update too.
  5145		 *
  5146		 * Fair tasks will only trigger an update if the root cfs_rq has
  5147		 * decayed.
  5148		 *
  5149		 * Everything else should do nothing.
  5150		 */
  5151		switch (current->policy) {
  5152		case SCHED_NORMAL:
  5153		case SCHED_BATCH:
  5154			if (unlikely(current->in_iowait)) {
  5155				cpufreq_update_util(rq, SCHED_CPUFREQ_IOWAIT | SCHED_CPUFREQ_FORCE_UPDATE);
  5156				return;
  5157			}
  5158	
  5159	#ifdef CONFIG_SMP
  5160			if (unlikely(rq->cfs.decayed)) {
  5161				rq->cfs.decayed = false;
  5162				cpufreq_update_util(rq, 0);
  5163				return;
  5164			}
  5165	#endif
  5166			return;
  5167		case SCHED_FIFO:
  5168		case SCHED_RR:
> 5169			if (rt_policy(prev)) {
  5170	#ifdef CONFIG_UCLAMP_TASK
  5171				unsigned long curr_uclamp_min = uclamp_eff_value(current, UCLAMP_MIN);
  5172				unsigned long prev_uclamp_min = uclamp_eff_value(prev, UCLAMP_MIN);
  5173	
  5174				if (curr_uclamp_min == prev_uclamp_min)
  5175	#endif
  5176					return;
  5177			}
  5178	#ifdef CONFIG_SMP
  5179			/* Stopper task masquerades as RT */
  5180			if (unlikely(current->sched_class == &stop_sched_class))
  5181				return;
  5182	#endif
  5183			cpufreq_update_util(rq, SCHED_CPUFREQ_FORCE_UPDATE);
  5184			return;
  5185		case SCHED_DEADLINE:
  5186			if (current->dl.flags & SCHED_FLAG_SUGOV) {
  5187				/* Ignore sugov kthreads, they're responding to our requests */
  5188				return;
  5189			}
  5190			cpufreq_update_util(rq, SCHED_CPUFREQ_FORCE_UPDATE);
  5191			return;
  5192		default:
  5193			return;
  5194		}
  5195	#endif
  5196	}
  5197	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
