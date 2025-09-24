Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64E0293B75
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Sep 2025 22:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758752959; cv=none; b=Y2W2CmVXIU9KreHg7rX/hv5TBqLBVosL3lKe9Dk+SVVUBSbx5e+ABVMKsR9SXbanmbD3LYtw5LyxGuGYSSHpyKJSYoYRcG5/wGVm7rIfypurJbyLT9LWkTspE2Oc1XXfCvUZqkrcGETc0QGvP30ilYuAH4nR3ZILExO4hIC++V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758752959; c=relaxed/simple;
	bh=rB8/Ns/tIeYBICMDioAP1AI5ky9UODvokm1C5/RMAN8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K0yVa41gJzcg2a6PDfQCssQXdOHz5EAeXuJ5qUEloYzWpcDCejZaMfL225Rb+5iA1tB8diXZxxzfY6GhWPGTwVkU4YEiSpT/dQc0cmOwWAy8Uwr+frk9YxDxHhYh9D09Wv/DIrQNle8+lxNZB3JVQSykZ8NB3/+gYlkXUG7wfRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XMfvEwur; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XMfvEwur"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758752958; x=1790288958;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rB8/Ns/tIeYBICMDioAP1AI5ky9UODvokm1C5/RMAN8=;
  b=XMfvEwur8cVtf3l6+66NmoqF4MhkWzuR0msatow/OxJkm0S3SBKMRlhS
   EfDZbsZt2QqT0Y5gbPHTyZqJ29b6aS4H5oVcHkK2zROj95scWq8KSChE7
   APUEc7349A24muzczL74lxZLddTgMXCZXwCvtfQc3vrCYuuiXtoBSi4kj
   RgpBjORVTBg1zBJcA8zCa9Yt6+PkgvlP2ErhwxXbE5s1xGcb1WmA646on
   x7bOx20znlipyqIvCyQFZ33nrrpeiJIT3PTkzxMJ3qLgBrxvDiQIp+GGT
   MIvmTuX8Cht4W4bhLy1FKWJ/8SxuRMce8iDfy6AHUR5bv+6IWkVFBBdA3
   Q==;
X-CSE-ConnectionGUID: +qqYD6sASWqUkjsVojzqTg==
X-CSE-MsgGUID: AnF0SofxSsCW1abr4KS8SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="60764829"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="60764829"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 15:29:18 -0700
X-CSE-ConnectionGUID: ZJFV9QFOTcGvj+lCUVc32Q==
X-CSE-MsgGUID: rE6xZJBiReSFuuMPPEpnlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="214277403"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 24 Sep 2025 15:29:16 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1Xz7-0004c9-2y;
	Wed, 24 Sep 2025 22:29:13 +0000
Date: Thu, 25 Sep 2025 06:28:50 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [glemco:staging_mm_cid_batches_rebased 2/4]
 include/linux/rseq.h:71:6: error: call to undeclared function
 'mm_cid_needs_scan'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202509250642.jctDs4XW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gmonaco/linux.git staging_mm_cid_batches_rebased
head:   24c26371786d14151f048bd5a5cbeb5d94c0b4f1
commit: 1acdeaba787d05a2b3508a21c4eddcdf55486f5d [2/4] rseq: Schedule the mm_cid_compaction from rseq_sched_switch_event()
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20250925/202509250642.jctDs4XW-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project cafc064fc7a96b3979a023ddae1da2b499d6c954)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250925/202509250642.jctDs4XW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509250642.jctDs4XW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/kernel/signal.c:15:
>> include/linux/rseq.h:71:6: error: call to undeclared function 'mm_cid_needs_scan'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      71 |         if (mm_cid_needs_scan(t->mm))
         |             ^
   In file included from arch/s390/kernel/signal.c:16:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
>> include/linux/mm_types.h:1444:20: error: static declaration of 'mm_cid_needs_scan' follows non-static declaration
    1444 | static inline bool mm_cid_needs_scan(struct mm_struct *mm)
         |                    ^
   include/linux/rseq.h:71:6: note: previous implicit declaration is here
      71 |         if (mm_cid_needs_scan(t->mm))
         |             ^
   In file included from arch/s390/kernel/signal.c:16:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/signal.c:16:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/signal.c:16:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/signal.c:16:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/signal.c:16:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/signal.c:16:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/signal.c:16:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/signal.c:16:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/signal.c:16:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:116:5: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     116 |                         (set1->sig[1] == set2->sig[1]) &&
         |                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/signal.c:16:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:116:21: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]


vim +/mm_cid_needs_scan +71 include/linux/rseq.h

    45	
    46	/* Invoked from context switch to force evaluation on exit to user */
    47	static __always_inline void rseq_sched_switch_event(struct task_struct *t)
    48	{
    49		struct rseq_event *ev = &t->rseq.event;
    50	
    51		if (IS_ENABLED(CONFIG_GENERIC_IRQ_ENTRY)) {
    52			/*
    53			 * Avoid a boat load of conditionals by using simple logic
    54			 * to determine whether NOTIFY_RESUME needs to be raised.
    55			 *
    56			 * It's required when the CPU or MM CID has changed or
    57			 * the entry was from user space.
    58			 */
    59			bool raise = (ev->user_irq | ev->ids_changed) & ev->has_rseq;
    60	
    61			if (raise) {
    62				ev->sched_switch = true;
    63				rseq_raise_notify_resume(t);
    64			}
    65		} else {
    66			if (ev->has_rseq) {
    67				t->rseq.event.sched_switch = true;
    68				rseq_raise_notify_resume(t);
    69			}
    70		}
  > 71		if (mm_cid_needs_scan(t->mm))
    72			task_add_mm_cid(t);
    73	}
    74	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
