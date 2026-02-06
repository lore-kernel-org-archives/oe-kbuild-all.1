Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7272DEA9D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Feb 2026 12:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770380986; cv=none; b=WW3Kf5A9gLQZpVVtOvr0tZjmrTM7GKOA4/lAJSqctMnR7w8/rTE5dbKlkh6FSvujUNQlbFImKoMOBAUzxA2p5cHP2/p0bE2Sg5bnH+CBt9SMwm2Q4lHGBD9qHVvCcPjeBjzU0q0JxdZ9198Oyr9qAj4sjMm2DJwGagRbkncTD5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770380986; c=relaxed/simple;
	bh=Ljv9s+KVRNKdsd0LppYSlG66ZabVcpQAS+zSz1+ogQc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l8QYQCVpukfm48zLFVYZv7q0a0zZQmHtRK5vdlTmH2FXp/boIJr5HSvBN2uD1OAR/hdQZSOi5QEoyGnOZlKYAUcqzYXRx2DaILTUnvVPmzI6OmFpqgnpjWENjauBEbBFEJaTiYkCElvBX8e3+WgCHufjQ95xLGyNsWBb5/LcN4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cALyXcX+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cALyXcX+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770380986; x=1801916986;
  h=date:from:to:cc:subject:message-id;
  bh=Ljv9s+KVRNKdsd0LppYSlG66ZabVcpQAS+zSz1+ogQc=;
  b=cALyXcX+fp1XXNjwQJSqLDtc+tU7rdt5bsaSjqdiXCH+eyEw92UwE99H
   ovE6BdbJ+vyEJzSqsmkoTMcejSamtj5sGd6myv7kZgQsLDaH9WQ+DnoQ3
   cWIDRKuWnagB6gEkV+/nwfd1Yr+5vSeq1BPb/psMKSri/H3S8qE3UjlHO
   2dFcBq7UAclUJJUgPhePRtY6vbtQVFoy8/SRPXeGyBKmg44M/bVbLj5xS
   lAKrk/Wj5oDpGJ38kEKidjTUALNxpGdNVUj5GMl7Mp5iBonkReG9zxumZ
   HKBSo3FY/THMHbL8uuDucRq7mlW1UYBBmxN9JMyCFeG/Udez/2KrJj374
   A==;
X-CSE-ConnectionGUID: ovNFEkj2QDexpgbbeBLCEw==
X-CSE-MsgGUID: 8jYB0de+Rm2AeRi6OBRziw==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71487565"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="71487565"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 04:29:46 -0800
X-CSE-ConnectionGUID: u+WYn4kMTCaV3DHulDow6A==
X-CSE-MsgGUID: 29iiS2rFSRe7odPMEVFkaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="210137766"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 06 Feb 2026 04:29:44 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voKxx-000000004Z7-3Xpo;
	Fri, 06 Feb 2026 12:29:41 +0000
Date: Fri, 06 Feb 2026 13:29:12 +0100
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, Boqun Feng <boqun@kernel.org>,
 Lyude Paul <lyude@redhat.com>
Subject: [boqun:rust-sync 12/17] kernel/sched/core.c:8867:6: error:
 conflicting types for '__cant_sleep'
Message-ID: <202602061342.QHPWZ2nN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-sync
head:   3ef437b5dd8b13bd88b1512531391ad30c26d539
commit: 6969095afa2073e65ecc958bb5064ddf808309b3 [12/17] preempt: Introduce HARDIRQ_DISABLE_BITS and PREEMPT_LONG
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260206/202602061342.QHPWZ2nN-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260206/202602061342.QHPWZ2nN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602061342.QHPWZ2nN-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> kernel/softirq.c:635:11: warning: format specifies type 'unsigned int' but the argument has type 'long' [-Wformat]
     633 |                         pr_err("huh, entered softirq %u %s %p with preempt_count %08x, exited with %08x?\n",
         |                                                                                  ~~~~
         |                                                                                  %08lx
     634 |                                vec_nr, softirq_to_name[vec_nr], h->action,
     635 |                                prev_count, preempt_count());
         |                                ^~~~~~~~~~
   ./include/linux/printk.h:555:33: note: expanded from macro 'pr_err'
     555 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   ./include/linux/printk.h:512:60: note: expanded from macro 'printk'
     512 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   ./include/linux/printk.h:484:19: note: expanded from macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   1 warning generated.
--
>> kernel/sched/core.c:8867:6: error: conflicting types for '__cant_sleep'
    8867 | void __cant_sleep(const char *file, int line, long preempt_offset)
         |      ^
   ./include/linux/kernel.h:78:13: note: previous declaration is here
      78 | extern void __cant_sleep(const char *file, int line, int preempt_offset);
         |             ^
   1 error generated.
--
>> kernel/time/timer.c:1755:10: warning: format specifies type 'unsigned int' but the argument has type 'long' [-Wformat]
    1754 |                 WARN_ONCE(1, "timer: %pS preempt leak: %08x -> %08x\n",
         |                                                        ~~~~
         |                                                        %08lx
    1755 |                           fn, count, preempt_count());
         |                               ^~~~~
   ./include/asm-generic/bug.h:185:38: note: expanded from macro 'WARN_ONCE'
     185 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |                                             ^~~~~~
   ./include/linux/once_lite.h:31:9: note: expanded from macro 'DO_ONCE_LITE_IF'
      31 |                         func(__VA_ARGS__);                              \
         |                              ^~~~~~~~~~~
   ./include/asm-generic/bug.h:166:29: note: expanded from macro 'WARN'
     166 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                                           ^~~~~~
   ./include/asm-generic/bug.h:133:17: note: expanded from macro '__WARN_printf'
     133 |                 __warn_printk(arg);                                     \
         |                               ^~~
   1 warning generated.


vim +/__cant_sleep +8867 kernel/sched/core.c

  8866	
> 8867	void __cant_sleep(const char *file, int line, long preempt_offset)
  8868	{
  8869		static unsigned long prev_jiffy;
  8870	
  8871		if (irqs_disabled())
  8872			return;
  8873	
  8874		if (!IS_ENABLED(CONFIG_PREEMPT_COUNT))
  8875			return;
  8876	
  8877		if (preempt_count() > preempt_offset)
  8878			return;
  8879	
  8880		if (time_before(jiffies, prev_jiffy + HZ) && prev_jiffy)
  8881			return;
  8882		prev_jiffy = jiffies;
  8883	
  8884		printk(KERN_ERR "BUG: assuming atomic context at %s:%d\n", file, line);
  8885		printk(KERN_ERR "in_atomic(): %d, irqs_disabled(): %d, pid: %d, name: %s\n",
  8886				in_atomic(), irqs_disabled(),
  8887				current->pid, current->comm);
  8888	
  8889		debug_show_held_locks(current);
  8890		dump_stack();
  8891		add_taint(TAINT_WARN, LOCKDEP_STILL_OK);
  8892	}
  8893	EXPORT_SYMBOL_GPL(__cant_sleep);
  8894	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
