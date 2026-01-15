Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F6E2EB10
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 12:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768481106; cv=none; b=I0W6rUHieDXVHmK4uRHwQs/OhRWtQWAnKFxfVvAsZeZVK7abEdQH0W76B76FUlkRFx2cThmWEJpCT8lEH66WLqM/Vo4IFTwhamsp9e/uuOR8KQcWu+grZ19V1d3jUdcN5ytXv5fgLL5PefklWcyUW9u60zg4iv4/mEQFfLHMjlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768481106; c=relaxed/simple;
	bh=NCsEQshptRvwWgmGrbshuhWnaCe9OeY7RtWIK7p1BYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QG0pYqK4VvYI2V83Yz7S43aZSPA7ImmUB2FiEkHsGswkFGQKdkiMYaByne1GUNIQ5BowejsihZgBn2r2TQ0nnfmG2zPoE5mBKjhdtYxLzP1grjdvgQvzk8nKgQwqOx6m1Fyo5eJ35GwnsVwnSQd9qAJTtTfg3QO4eaIpJoKi1uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IGkHynxN; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IGkHynxN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768481105; x=1800017105;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NCsEQshptRvwWgmGrbshuhWnaCe9OeY7RtWIK7p1BYs=;
  b=IGkHynxN2rTy++1xUqfANML+tkH04M0toqdzO6e/b/yhDQyJNznasrJo
   MlH11DKuIMg3bh+5Ubado3n6Qx+r9RDlxCRXtLOGzQISt1g0BHeUqhzxF
   OOMYq4zc0QK1nk7oRZRuaE95UastIcOP9dG/CGKX6aGMpY8YiCrF34zKu
   PKyR9iCnx4U4a/wql2mqs7C1g4DcBNEV+o9XUz2cAtH97HClDtJ4gAZUS
   3j6o3JZX9VihRbymmdf3d8Bb6iMyZZaEq/DIj3Un6oLiBRLnjsk2BEGIo
   cnyTpMGXJONuQih9arFCFSv+/e/serElppjQW8/wAv7MiNQGbTxbWfhsj
   g==;
X-CSE-ConnectionGUID: Tcku1y95TpKvSZ1Dfp0SvA==
X-CSE-MsgGUID: fw2gLnEiQ16vnD6fQf0BrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69692841"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="69692841"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 04:45:04 -0800
X-CSE-ConnectionGUID: wm1S6lJUToSnS3z3uVX/fw==
X-CSE-MsgGUID: KvCstCq9ToO2JoO2vMNEoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="209806944"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 Jan 2026 04:45:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgMij-00000000Hxo-01Z7;
	Thu, 15 Jan 2026 12:45:01 +0000
Date: Thu, 15 Jan 2026 20:44:38 +0800
From: kernel test robot <lkp@intel.com>
To: Qi Zheng <qi.zheng@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 24/30] mm: memcontrol: prepare for reparenting LRU
 pages for lruvec lock
Message-ID: <202601152015.1a3y2IHZ-lkp@intel.com>
References: <0252f9acc29d4b1e9b8252dc003aff065c8ac1f6.1768389889.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0252f9acc29d4b1e9b8252dc003aff065c8ac1f6.1768389889.git.zhengqi.arch@bytedance.com>

Hi Qi,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20260114]
[cannot apply to akpm-mm/mm-everything brauner-vfs/vfs.all trace/for-next linus/master dennis-percpu/for-next v6.19-rc5 v6.19-rc4 v6.19-rc3 v6.19-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qi-Zheng/mm-memcontrol-remove-dead-code-of-checking-parent-memory-cgroup/20260114-193921
base:   next-20260114
patch link:    https://lore.kernel.org/r/0252f9acc29d4b1e9b8252dc003aff065c8ac1f6.1768389889.git.zhengqi.arch%40bytedance.com
patch subject: [PATCH v3 24/30] mm: memcontrol: prepare for reparenting LRU pages for lruvec lock
config: mips-randconfig-r071-20260115 (https://download.01.org/0day-ci/archive/20260115/202601152015.1a3y2IHZ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601152015.1a3y2IHZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601152015.1a3y2IHZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/core.c:16:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:96:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:53:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:32:
>> include/linux/memcontrol.h:1507:13: error: use of undeclared identifier 'rcu'
    1507 |         __acquires(rcu)
         |                    ^~~
   include/linux/memcontrol.h:1515:13: error: use of undeclared identifier 'rcu'
    1515 |         __releases(rcu)
         |                    ^~~
   include/linux/memcontrol.h:1523:13: error: use of undeclared identifier 'rcu'
    1523 |         __releases(rcu)
         |                    ^~~
   include/linux/memcontrol.h:1532:13: error: use of undeclared identifier 'rcu'
    1532 |         __releases(rcu)
         |                    ^~~
   In file included from kernel/sched/core.c:83:
   In file included from arch/mips/include/asm/tlb.h:24:
   In file included from include/asm-generic/tlb.h:15:
>> include/linux/swap.h:333:14: error: use of undeclared identifier 'rcu'
     333 |                 __releases(rcu)
         |                            ^~~
   kernel/sched/core.c:7764:12: warning: array index -1 is before the beginning of the array [-Warray-bounds]
    7764 |                                        preempt_modes[preempt_dynamic_mode] : "undef",
         |                                        ^             ~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:7739:1: note: array 'preempt_modes' declared here
    7739 | const char *preempt_modes[] = {
         | ^
   1 warning and 5 errors generated.
--
   In file included from kernel/sched/fair.c:57:
   In file included from kernel/sched/sched.h:47:
>> include/linux/memcontrol.h:1507:13: error: use of undeclared identifier 'rcu'
    1507 |         __acquires(rcu)
         |                    ^~~
   include/linux/memcontrol.h:1515:13: error: use of undeclared identifier 'rcu'
    1515 |         __releases(rcu)
         |                    ^~~
   include/linux/memcontrol.h:1523:13: error: use of undeclared identifier 'rcu'
    1523 |         __releases(rcu)
         |                    ^~~
   include/linux/memcontrol.h:1532:13: error: use of undeclared identifier 'rcu'
    1532 |         __releases(rcu)
         |                    ^~~
   4 errors generated.


vim +/rcu +1507 include/linux/memcontrol.h

  1504	
  1505	static inline void lruvec_lock_irq(struct lruvec *lruvec)
  1506		__acquires(&lruvec->lru_lock)
> 1507		__acquires(rcu)
  1508	{
  1509		rcu_read_lock();
  1510		spin_lock_irq(&lruvec->lru_lock);
  1511	}
  1512	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
