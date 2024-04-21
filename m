Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BE61BC58
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Apr 2024 23:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713742904; cv=none; b=IhR8vXdTRFlHgyqQTM91LfqL4wQlqABzXjsRrzcZQn8tvkooPow0IRwt1feUnfxeXpi09Tr/6DB+D0XaeG2qJOHyJ37Zdi+jG4obNndeJPug4wUtE3COFDqNVQFTS6jFeaOuEzhjvjNLcJD/coR/DUrC9kKexHcZ15zsy41oKJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713742904; c=relaxed/simple;
	bh=41jkQ8CWmOkSLOPLvCxNewPjUP1T37keQA6ZH8G+3ow=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dWNEJM7x6z9BSJvbhcRYGqPL1BsFPswtjn7AhWG9iyybFXlAze6wCheSzB/YuKjQgVZAx9Wg8p+ia1ayzqOUZ5Mv5RozcDF+0Zipr33wT4vUdpHPeXdvcnlxXkwnGgI2ySE7hmQjKbs3YfjnqB5TQhjkL221PIYSaf6xTK2+ikE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U9bCK61v; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U9bCK61v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713742903; x=1745278903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=41jkQ8CWmOkSLOPLvCxNewPjUP1T37keQA6ZH8G+3ow=;
  b=U9bCK61vJ9lOGFb9phh1GlTue43pZVSwAhgroF377TF44YJ77WESD957
   rq7/JgIYBNjqdkonxuZNyuqUyGC/VUG0rpbiBNGWg7ULK4vJRov8WDk40
   lKHyRfSSbY4HEoaG0qh15jEcg6ibRHxzL2cMOiEPjuDk+EIUBzjT/IyJl
   4oFP+Vs0Q3iuAt/wizJPx8TOJVlNozIBttxsHj/HdR+LCJznsCk/W4gSj
   BDfhXLwD9UKRIPw3E8lyCPAlBHjke9GO9SHcMR/brX+vtFNPzlcy5GxV5
   eeK10CXOV766HgKW0zOZHUKZvTsCPTbIfvCWqT4eUyt3hhRB/E0oDcRJG
   g==;
X-CSE-ConnectionGUID: Uh5a12rYTuCryYIt/GwKfw==
X-CSE-MsgGUID: mCVAcj07RQ6F5J+ZLal6TQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="9185215"
X-IronPort-AV: E=Sophos;i="6.07,219,1708416000"; 
   d="scan'208";a="9185215"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2024 16:41:42 -0700
X-CSE-ConnectionGUID: 9Put9vdARrib+y199cWtFg==
X-CSE-MsgGUID: 3jTuaWALRxy11jP2Z4wk4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,219,1708416000"; 
   d="scan'208";a="23871862"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 21 Apr 2024 16:41:41 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rygoV-000CDQ-0R;
	Sun, 21 Apr 2024 23:41:39 +0000
Date: Mon, 22 Apr 2024 07:40:42 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:task/work 5/6]
 include/linux/sched/isolation.h:88:1: warning: no return statement in
 function returning non-void
Message-ID: <202404220710.wqES8hfs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git task/work
head:   4bf6e6afb803e5862efb2cc8f2585d10e2f597f2
commit: b5ed7ff8dcb5e3c63e9e3efd32f62ee871ba3f1e [5/6] sched/isolation: Introduce isolated task work
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240422/202404220710.wqES8hfs-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240422/202404220710.wqES8hfs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404220710.wqES8hfs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/net/ip_vs.h:32,
                    from net/netfilter/xt_ipvs.c:23:
   include/linux/sched/isolation.h: In function 'isolated_task_work_queue':
>> include/linux/sched/isolation.h:88:1: warning: no return statement in function returning non-void [-Wreturn-type]
      88 | static inline int isolated_task_work_queue(void) { }
         | ^~~~~~


vim +88 include/linux/sched/isolation.h

    85	
    86	extern void isolated_task_work_init(struct task_struct *tsk);
    87	#else
  > 88	static inline int isolated_task_work_queue(void) { }
    89	static inline void isolated_task_work_init(struct task_struct *tsk) { }
    90	#endif /* CONFIG_NO_HZ_FULL && CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK */
    91	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
