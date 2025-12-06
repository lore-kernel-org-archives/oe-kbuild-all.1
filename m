Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAA414A60C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 06:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765003486; cv=none; b=qbUoZ7YZezx6QLk/8SmwcgDbfOfLKkG1wu8is4ZKD7K2m+SRA//1csxelB3bkwE49yvJP2yvJJz6VTga0RnxBbVxt39UGSWVLMj6mNSKzp2s3CIbuxqjVoOwGHmyo/lDfOPqDalDta2lIidKvklP8s91gn3mr8seYpBaSPSqApg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765003486; c=relaxed/simple;
	bh=0IKVO9HgxpscAw10BhqjH4GolS9OaDWY4H+2DaTm+Hc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZuZFNLs+UhHW64aUjPd1QK+nrp1Htnyg3j1NIJfRarksE48exk6UoNXgLpLhAeSaRz1/EP0G8pLZXsXV7H4HscuHL6nlfRM/5x76zPXTye1TNXG7IjqYFpdbmYVFA1hr95KzQ5bVlgH6276pfUyDVyPeS6yCyzxRoRmx8H/sXcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O9jGr6IE; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O9jGr6IE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765003485; x=1796539485;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0IKVO9HgxpscAw10BhqjH4GolS9OaDWY4H+2DaTm+Hc=;
  b=O9jGr6IEv7dE2jbev8d1fwZfLtykDHSXReoey/dY9p9W/dr+8oP31cXA
   MA+wjxXBeP9zp4x4m/zdkJhmMVlCAeqilnXZURIKuVQK/idfWc9rtBHzn
   J4vxHjMVYnrs4NLJmuCEEI1BOryglGYvXOC/IRV33FWPPEk4cZh7pc5Of
   M2zVW0hm1nCMqZ3wDjhjJLAqqPR1YIZQyk+Q5EQeYysskzxwv7XJohB1k
   9q2H+dMAc12iqTfOYIREnT8efR2Sd/eAecgd76OnD6AE9VeixU0q9cX97
   M5mJInLUMYQ+FiFENRhKyER75O8WfWT0Jvvb8Z5dRZojlGWvkptx+e38a
   g==;
X-CSE-ConnectionGUID: IYV+IPKYSw+LjXplWQGaUw==
X-CSE-MsgGUID: 91jt5SXDS4CngaQTVnSvqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="66993159"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="66993159"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 22:44:44 -0800
X-CSE-ConnectionGUID: oklaumcZR5eJ1R6RZmRKKg==
X-CSE-MsgGUID: Z8Zr/e4rRT2ACVjF7/AsGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="195721514"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Dec 2025 22:44:42 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRm24-00000000Fwf-2niA;
	Sat, 06 Dec 2025 06:44:40 +0000
Date: Sat, 6 Dec 2025 14:44:22 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [glemco:staging_rv_hybrid_automata 21/21]
 kernel/trace/rv/monitors/boost/boost.c:143:13: error: conflicting types for
 'handle_syscall'; have 'void(void *, struct pt_regs *, long int)'
Message-ID: <202512061442.QCS58bku-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gmonaco/linux.git staging_rv_hybrid_automata
head:   b0f3d844e192c90aac9dc773e82b8ee2b00e431b
commit: b0f3d844e192c90aac9dc773e82b8ee2b00e431b [21/21] rv: Add dl_server specific monitors
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20251206/202512061442.QCS58bku-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061442.QCS58bku-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512061442.QCS58bku-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/rv/monitors/boost/boost.c:143:13: error: conflicting types for 'handle_syscall'; have 'void(void *, struct pt_regs *, long int)'
     143 | static void handle_syscall(void *data, struct pt_regs *regs, long id)
         |             ^~~~~~~~~~~~~~
   In file included from arch/x86/um/asm/elf.h:9,
                    from arch/um/include/asm/uaccess.h:10,
                    from include/linux/uaccess.h:13,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/mm.h:36,
                    from include/linux/kallsyms.h:13,
                    from include/linux/ftrace.h:13,
                    from kernel/trace/rv/monitors/boost/boost.c:2:
   arch/um/include/shared/skas/skas.h:14:13: note: previous declaration of 'handle_syscall' with type 'void(struct uml_pt_regs *)'
      14 | extern void handle_syscall(struct uml_pt_regs *regs);
         |             ^~~~~~~~~~~~~~


vim +143 kernel/trace/rv/monitors/boost/boost.c

   142	
 > 143	static void handle_syscall(void *data, struct pt_regs *regs, long id)
   144	{
   145		struct sched_dl_entity *dl_se;
   146		struct task_struct *p;
   147		int new_policy = -1;
   148	
   149		new_policy = extract_params(regs, id, &p);
   150		if (new_policy < 0 || new_policy == p->policy)
   151			return;
   152		dl_se = get_fair_server(p);
   153		if (!dl_se || !p->on_rq)
   154			return;
   155		/*
   156		 * Note: this attaches to the syscall entry and is unstable:
   157		 * - the syscall may fail
   158		 * - the task may be preempted before changing the policy
   159		 * A more robust solution can be written using enqueue/dequeue events.
   160		 */
   161		if (p->policy == SCHED_NORMAL)
   162			da_handle_event(EXPAND_ID(dl_se, task_cpu(p)), sched_switch_out_boost);
   163		else if (new_policy == SCHED_NORMAL)
   164			da_handle_event(EXPAND_ID(dl_se, task_cpu(p)), dl_server_resume_boost);
   165	}
   166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
