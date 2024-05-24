Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E26364BA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 May 2024 18:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716575200; cv=none; b=WxG/VYPjBql/CJRpiM+A+6qSJU3/YWBZpKTQiKZX8Y4TH92oAuT9H7ybcK/F8J6BqbkHMRFmv78bOGGpSMHasVqykw/bR/HFa8D68bpiNWRXAGlgcVtCLUOd11YoR59K/EWFgoceAJCsAaZvcb+5Buz8dZQ4T7zIQsdnlEWPa+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716575200; c=relaxed/simple;
	bh=VEVsgkkYEm0/mVFcC+UMZYcfiXSLLqs0u/i4fIOVLd0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d+ZSAU2vqBcauU/OckQZUIN3XVd91kNN4dQ4CYxoWJS/2I42bn/Y2Y0RN8jQH0DhfvC1u9KBfKfw2pWnt18VbB6CBN3Z3XQ0DqGQ1EDlUbxtphFYKzkC/S4gyq0RrehAaVFvLfkMwa6D48NuWQ+wT1eIg65ye7+TYOSBZwJ2m5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c074qopm; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c074qopm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716575199; x=1748111199;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VEVsgkkYEm0/mVFcC+UMZYcfiXSLLqs0u/i4fIOVLd0=;
  b=c074qopmZFfqvXoYq652YxaDgBzwJujGNeNvKToyED4/w0PYuwi5EW7D
   9AHDa8N7iW+GySYqXmOQOcgbDo+xiSHUnrdpAbR53p/nk51TJrQmQsdTE
   CfRs7F9+KcUrGH6H/MciUmg4YC651PK9nleA5hBruPHgcsr4BxGkIV/sL
   ycjVo9eO9f8WFbE/Uva5nKVdPcU9LUxfV+2/5pBcz7gXKU75lP8pvvGNr
   VeMkhhxjm35wK25voIE3isxvKrPqudW1PCnj+fUlnrbRdD+HMdDy7O1U3
   594Xm4BjYhZdguNRSB8+h+X0lBKq276OGGKPfxX0mktrswmc9HERPuG7p
   w==;
X-CSE-ConnectionGUID: 7V9TCqi0Rj2KYUVxmCoXWw==
X-CSE-MsgGUID: rv36+HlNSUCmMF6wq9cm+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="30474642"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; 
   d="scan'208";a="30474642"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 11:26:39 -0700
X-CSE-ConnectionGUID: +SLRd6cuS96pVSyC8Cwg6w==
X-CSE-MsgGUID: kzv46YxKT3qBIZqLthIlYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; 
   d="scan'208";a="34119462"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 24 May 2024 11:26:37 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAZcI-0005n5-2r;
	Fri, 24 May 2024 18:26:29 +0000
Date: Sat, 25 May 2024 02:25:18 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:uclamp-max-aggregation 8/13]
 kernel/sched/core.c:5154:37: error: 'struct cfs_rq' has no member named
 'decayed'
Message-ID: <202405250237.QAavVy5P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux uclamp-max-aggregation
head:   3173a853e6c16e1dcb09d392ef1e9b5a06448696
commit: 6bd11d636f6b37b0351907d35552fe9a1965e0a2 [8/13] sched: Consolidate cpufreq updates
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20240525/202405250237.QAavVy5P-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240525/202405250237.QAavVy5P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405250237.QAavVy5P-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/export.h:5,
                    from include/linux/linkage.h:7,
                    from include/linux/fs.h:5,
                    from include/linux/highmem.h:5,
                    from kernel/sched/core.c:9:
   kernel/sched/core.c: In function 'update_cpufreq_ctx_switch':
>> kernel/sched/core.c:5154:37: error: 'struct cfs_rq' has no member named 'decayed'
    5154 |                 if (unlikely(rq->cfs.decayed)) {
         |                                     ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   kernel/sched/core.c:5155:32: error: 'struct cfs_rq' has no member named 'decayed'
    5155 |                         rq->cfs.decayed = false;
         |                                ^


vim +5154 kernel/sched/core.c

  5137	
  5138	static inline void update_cpufreq_ctx_switch(struct rq *rq)
  5139	{
  5140		if (unlikely(current->sched_class == &stop_sched_class))
  5141			return;
  5142	
  5143		if (unlikely(current->sched_class == &idle_sched_class))
  5144			return;
  5145	
  5146		if (unlikely(task_has_idle_policy(current)))
  5147			return;
  5148	
  5149		if (likely(fair_policy(current->policy))) {
  5150	
  5151			/*
  5152			 * Allow cpufreq updates once for every update_load_avg() decay.
  5153			 */
> 5154			if (unlikely(rq->cfs.decayed)) {
  5155				rq->cfs.decayed = false;
  5156				goto force_update;
  5157			}
  5158	
  5159			if (unlikely(current->in_iowait))
  5160				goto force_update;
  5161	
  5162			return;
  5163		}
  5164	
  5165		/* RT and DL should always send a freq update */
  5166	
  5167		/* XXX ignore updates for sugov worker thread */
  5168	
  5169	force_update:
  5170	
  5171		/*
  5172		 * Request freq update after __balance_callbacks to take into account
  5173		 * any changes to rq.
  5174		 */
  5175		cpufreq_update_util(rq, current->in_iowait ? SCHED_CPUFREQ_IOWAIT : 0);
  5176	}
  5177	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
